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
"""SA collector: installed SystemAbility profile declarations, joined to their
host service and owning component.

Both dependencies arrive through the database; neither is re-scanned.
"""
from .discovery import profile_paths, profile_elements
from .records import SHAPE
from .linking import link_services
from .ownership import Ownership, link_installs
from . import quality
from .models import SAScanRequest, SAResult
from ...core.framework import ElementCollector, ScanContext, register
from ...core.models import RequestError
from ...core.schema import Column, Index, Table

# column, declared key, how the column holds it. Keys resolve against the
# record first and its config bucket second, so one table covers both levels.
FIELDS = (('profile', 'profile', 'text'), ('sa_id', 'name', 'int'),
          ('libpath', 'libpath', 'text'),
          ('run_on_create', 'run-on-create', 'bool'),
          ('distributed', 'distributed', 'bool'),
          ('dump_level', 'dump_level', 'int'), ('auto_restart', 'auto-restart', 'bool'))

SAS = Table(
    'sas',
    columns=(
        Column('position', 'INTEGER', nullable=False),
        # Projections of the verbatim record: they make filtering and joining
        # cheap, but `record` stays authoritative (see core.framework.projection).
        Column('profile', nullable=False),
        Column('sa_id', 'INTEGER'),
        Column('libpath'),
        Column('run_on_create', 'INTEGER'),
        Column('distributed', 'INTEGER'),
        Column('dump_level', 'INTEGER'),
        Column('auto_restart', 'INTEGER'),
        Column('service_id', 'INTEGER', references='services(id)'),
        Column('component_id', 'INTEGER', references='components(id)'),
        # Which build target installed `libpath`, the SA's implementation
        # library. Not the profile's installer: that is a label-less sa_info
        # aggregate, so it could never be reached by label (see ownership.py).
        Column('install_module_id', 'INTEGER', references='install_modules(id)'),
        # The systemability element's own fields, exactly as declared. The
        # columns above only project it; the profile's file-level process
        # is resolved from the linked service via service_id.
        Column('record', 'JSON', nullable=False),
    ),
    primary_key=('position',),
    surrogate=True,
    indexes=(Index('idx_sas_component', ('scan_id', 'component_id')),
             Index('idx_sas_install', ('scan_id', 'install_module_id')),
             Index('idx_sas_host', ('scan_id', 'service_id')),
             Index('idx_sas_identity', ('scan_id', 'sa_id'))),
)


class SAContext(ScanContext):
    def setup(self):
        self.directory = self.package / 'system/profile'
        if not self.directory.is_dir():
            raise RequestError('INPUT_ROOT_MISSING')
        if (self.package / 'system').is_symlink() or self.directory.is_symlink():
            raise RequestError('PROFILE_DIRECTORY_SYMLINK')
        self.scan_directories = {str(self.directory)}


@register
class SACollector(ElementCollector):
    NAME = 'sas'
    DESCRIPTION = 'Extract OpenHarmony SystemAbility declarations'
    DEPENDS_ON = ('services', 'components', 'install_modules')
    SCHEMA_VERSION = '2.1.0'
    TABLES = (SAS,)
    CONTEXT_TYPE = SAContext
    REQUEST_TYPE = SAScanRequest
    REQUEST_TYPE_ERROR = 'EXPECTED_SA_SCAN_REQUEST'
    RESULT_TYPE = SAResult
    RESULT_FIELD = 'sas'
    COMPONENT_COLUMN = 'component_id'
    SERVICE_COLUMN = 'service_id'
    INSTALL_COLUMN = 'install_module_id'
    EXPORT_ORDER = 'position'
    SHAPE = SHAPE
    FIELDS = FIELDS
    LINK_COLUMNS = ('service_id', 'component_id', 'install_module_id')

    def sources(self, ctx):
        return profile_paths(ctx)

    def elements(self, ctx, path):
        return profile_elements(ctx, path)

    def enrich(self, ctx, records):
        link_services(ctx, records, ctx.states)
        if not records:
            return
        # Explicit: an empty index means "ran, found nothing" and must still
        # report unregistered names; only False (deselected) becomes None.
        index = ctx.component_index(location=ctx.package)
        ownership = Ownership(ctx, None if index is False else index)
        for i, (record, pointer) in enumerate(records):
            ctx.progress('sa-ownership', i, len(records), record['profile'])
            ownership.apply(record, pointer)
        link_installs(ctx, records)

    def quality(self, ctx, records):
        quality.check(ctx, records)

    def scope(self, ctx):
        return ['system/profile']
