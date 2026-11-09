#!/usr/bin/env python3
# coding=utf-8

#
# Copyright (c) 2021-2026 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
"""Install-module collector: the image install manifest, attributed to components.

system_module_info.json is the only bridge from an image path back to the source
component that produced it. Three tables: one row per declaration, one per
install target (a row may install several), one per innerapi tag.
"""
from .models import InstallModuleScanRequest, InstallModuleResult
from .ownership import attribute
from .records import SHAPE
from . import quality, targets
from .lookup import InstallIndex
from ...core.framework import (READ_ERRORS, ElementCollector, ScanContext, register)
from ...core.provenance import strip_label
from ...core.models import RequestError, ScanFatalError
from oskm_schema.install_modules import INSTALL_MODULES, INSTALL_MODULE_TAGS, INSTALL_TARGETS

MANIFEST = 'system_module_info.json'

# column, declared key, how the column holds it. part_name / subsystem_name are
# deliberately absent: attribution is component_id alone (see ownership.py).
# `label` is absent too -- its column holds the stripped value, not the
# declaration, so enrich() sets it and OVERLAY restores it on export.
FIELDS = (('label_name', 'label_name', 'text'), ('type', 'type', 'text'),
          ('source', 'source', 'text'), ('install_enable', 'install_enable', 'bool'),
          ('shlib_type', 'shlib_type', 'text'))


class InstallModulesContext(ScanContext):
    def setup(self):
        if not self.package.is_dir():
            raise RequestError('INPUT_ROOT_MISSING')
        self.manifest = self.package / MANIFEST


@register
class InstallModulesCollector(ElementCollector):
    NAME = 'install_modules'
    DESCRIPTION = 'Extract the OpenHarmony image install manifest and attribute it'
    DEPENDS_ON = ('components',)
    SCHEMA_VERSION = '1.0.0'
    TABLES = (INSTALL_MODULES, INSTALL_TARGETS, INSTALL_MODULE_TAGS)
    CONTEXT_TYPE = InstallModulesContext
    REQUEST_TYPE = InstallModuleScanRequest
    REQUEST_TYPE_ERROR = 'EXPECTED_SCAN_REQUEST'
    RESULT_TYPE = InstallModuleResult
    RESULT_FIELD = 'install_modules'
    ROLE = 'install_index'
    COMPONENT_COLUMN = 'component_id'
    EXPORT_ORDER = 'ordinal'
    # Attribution findings need their severity and both disputed values to be
    # actionable, so this domain publishes the full issue shape like components.
    ISSUE_FIELDS = ('component', 'path', 'pointer', 'code', 'severity', 'advisory', 'details')
    SHAPE = SHAPE
    FIELDS = FIELDS
    LINK_COLUMNS = ('component_id',)
    OVERLAY = ('label',)
    # Attribution gaps do not make the install inventory itself incomplete: a
    # module whose owning component cannot be named is still a known install.
    # Everything else non-advisory does -- an unreadable manifest or a row that
    # could not be expanded means entries are missing, and consumers that match
    # by path must be told rather than shown a hole.
    ATTRIBUTION_PREFIXES = ('COMPONENT_',)

    def sources(self, ctx):
        return [ctx.manifest]

    def elements(self, ctx, path):
        try:
            rows = ctx.read_json(path, ctx.package)
        except READ_ERRORS as exc:
            # The manifest is the collector's only input: unreadable means no
            # inventory at all, so this degrades the scan rather than crashing
            # it, and every consumer sees an empty, explicitly incomplete index.
            ctx.issue(path, 'MODULE_INFO_UNAVAILABLE',
                      details=dict(reason=getattr(exc, 'code', type(exc).__name__)))
            return
        if not isinstance(rows, list):
            ctx.issue(path, 'MODULE_INFO_NOT_ARRAY')
            return
        if len(rows) > ctx.limits.input_files:
            raise ScanFatalError('MODULE_INPUT_LIMIT')
        for ordinal, raw in enumerate(rows):
            ctx.progress('modules', ordinal, len(rows))
            if not isinstance(raw, dict):
                ctx.issue(path, 'MODULE_ROW_INVALID', f'/{ordinal}')
                continue
            yield (ordinal,), {}, raw, f'/{ordinal}'

    def enrich(self, ctx, records):
        index = ctx.component_index(location=ctx.manifest)
        attribute(ctx, records, None if index is False else index, ctx.manifest)
        targets.expand(ctx, records, ctx.manifest)
        self.expand_tags(ctx, records)

    def expand_tags(self, ctx, records):
        """innerapi_tags names the release class of a built artifact. Expanded
        because json_each can never use an index and "every chipsetsdk module"
        is a real query."""
        for position, (record, _) in enumerate(records):
            tags = (record.get('config') or {}).get('innerapi_tags')
            if not isinstance(tags, list):
                continue
            for index, value in enumerate(tags):
                if isinstance(value, str) and value:
                    ctx.emit('install_module_tags', dict(
                        module_position=position, source_index=index, value=value))

    def columns(self, ctx, record):
        """The label column holds the *stripped* GN label, which is derived, so
        it cannot come from FIELDS -- that would store the declaration's
        toolchain suffix. The record keeps the declaration untouched; a label
        that will not parse leaves the column NULL rather than being indexed as
        though it were a target."""
        label = record.get('label')
        return {'label': strip_label(label) if isinstance(label, str) else None}

    def quality(self, ctx, records):
        quality.check(ctx, records, ctx.manifest)

    @classmethod
    def lookup(cls, connection, scan_id):
        """Index consumers join against: one build per scan, shared by all."""
        def rows(table): return [dict(r) for r in connection.execute(
            f'SELECT * FROM {table} WHERE scan_id = ?', (scan_id,))]
        return InstallIndex(rows('install_modules'), rows('install_targets'))

    @classmethod
    def resolve_rows(cls, table, rows, keys):
        """Child rows carry the parent's array position; swap it for the real id
        once install_modules has been inserted and its ids exist."""
        if table == 'install_modules':
            return rows
        index = keys.get('install_modules', {})
        return [dict({k: v for k, v in row.items() if k != 'module_position'},
                     module_id=index[row['module_position']]) for row in rows]

    @classmethod
    def post_insert(cls, connection, scan_id):
        """After all install_targets rows are inserted, resolve link_target_id
        by matching link_target_path against dest in the same scan."""
        connection.execute(
            'UPDATE install_targets SET link_target_id = '
            '(SELECT t2.id FROM install_targets t2 '
            ' WHERE t2.scan_id = ? AND t2.dest = install_targets.link_target_path) '
            'WHERE scan_id = ? AND link_target_path IS NOT NULL',
            (scan_id, scan_id))

    def scope(self, ctx):
        return [MANIFEST]
