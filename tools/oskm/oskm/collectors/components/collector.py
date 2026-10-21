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
"""Component collector: the product component index and its source manifests.

Root of the dependency graph -- nothing to read from upstream. Every other domain
resolves ownership against the rows this collector writes.
"""
from pathlib import Path

from .manifests import extract
from .quality import check_deps
from .models import ComponentScanRequest, ComponentResult
from ...core.framework import BaseCollector, ScanContext, register
from ...core.io import InputFailure, parse_json, pointer
from ...core.models import ScanFatalError
from ...core.schema import Column, Index, Table

COMPONENTS = Table(
    'components',
    columns=(
        Column('name', nullable=False),
        Column('subsystem'),
        Column('manifest'),
        Column('repo_id', 'INTEGER', references='repos(id)'),
        Column('deps', 'JSON'),
        # No features/syscap columns: `record` already holds the manifest's own
        # arrays verbatim, and the expanded values live in the features/syscaps
        # tables, which are what every query actually wants (json_each can never
        # use an index). A column would be a third copy of the same fact.
        Column('record', 'JSON'),
    ),
    primary_key=('name',),
    surrogate=True,
    indexes=(Index('idx_components_subsystem', ('scan_id', 'subsystem')),
             Index('idx_components_repo', ('scan_id', 'repo_id'))),
)

# A component publishes 0..N inner APIs for other components to consume through
# GN external_deps. The consumable name is <component>:<target>, where target is
# the part of the GN label after the colon.
INNERAPIS = Table(
    'innerapis',
    columns=(
        Column('component_id', 'INTEGER', nullable=False, references='components(id)'),
        Column('field', nullable=False),            # inner_kits | inner_api
        Column('source_index', 'INTEGER', nullable=False),
        Column('name', nullable=False),             # GN label, as declared
        Column('external_name'),                    # what external_deps refers to
        Column('install_module_id', 'INTEGER',
               references='install_modules(id)', on_delete='SET NULL'),  # component_links fills
        Column('record', 'JSON', nullable=False),   # the element verbatim
    ),
    surrogate=True,
    indexes=(Index('idx_innerapis_external', ('scan_id', 'external_name')),
             Index('idx_innerapis_component', ('scan_id', 'component_id')),
             Index('idx_innerapis_module', ('scan_id', 'install_module_id'))),
)

INNERAPI_FIELDS = ('inner_kits', 'inner_api')


def _value_table(name):
    """A component's declared string list, one row per element.

    syscap and features are near one-to-one with components (measured: 304
    distinct values for 306 syscap entries, 1351 for 1351 features), so this is
    not normalisation for sharing. It exists because json_each can never use an
    index, and because comparing two scans becomes a plain EXCEPT.
    """
    return Table(
        name,
        columns=(
            Column('component_id', 'INTEGER', nullable=False, references='components(id)'),
            Column('source_index', 'INTEGER', nullable=False),
            Column('value', nullable=False),
        ),
        surrogate=True,
        indexes=(Index(f'idx_{name}_value', ('scan_id', 'value')),
                 Index(f'idx_{name}_component', ('scan_id', 'component_id'))),
    )


SYSCAPS = _value_table('syscaps')
FEATURES = Table(
    'features',
    columns=(
        Column('component_id', 'INTEGER', nullable=False, references='components(id)'),
        Column('source_index', 'INTEGER', nullable=False),
        Column('value', nullable=False),
        Column('gn_arg_id', 'INTEGER',
               references='gn_args(id)', on_delete='SET NULL'),  # component_links fills
    ),
    surrogate=True,
    indexes=(Index('idx_features_value', ('scan_id', 'value')),
             Index('idx_features_component', ('scan_id', 'component_id')),
             Index('idx_features_gn_arg', ('scan_id', 'gn_arg_id'))),
)

# field in the record -> table holding its expanded elements
VALUE_TABLES = (('syscap', 'syscaps'), ('features', 'features'))

# Keys copied verbatim from the manifest; absent and present-null are distinct.
RAW_KEYS = ('deps', 'build', 'features', 'syscap')


class ComponentsContext(ScanContext):
    """Adds the build index, the manifest cache and source-tree read confinement."""

    def setup(self):
        self.out = self.workspace / 'out'
        self.index = self.out / self.request.product / 'build_configs/parts_info/components.json'
        self.inputs.add(str(self.index))
        self.cache = {}

    def read_source(self, path):
        """Read a manifest, refusing anything outside the source tree."""
        try:
            allowed = self.source_allowed(path)
        except (OSError, ValueError, RuntimeError):
            allowed = False
        if not allowed:
            raise InputFailure('OUTSIDE_ALLOWED_ROOT', path)
        return self.read_bytes(path, self.workspace)

    def read_index(self):
        self.check()
        try:
            # Resolve parents too: an out symlink cannot escape this workspace.
            if (not self.index.parent.resolve().is_relative_to(self.workspace)
                    or not self.index.resolve().is_relative_to(self.index.parent.resolve())):
                raise InputFailure('OUTSIDE_ALLOWED_ROOT', self.index)
            data = self.read_bytes(self.index, self.workspace)
        except (InputFailure, OSError, ValueError, RuntimeError) as exc:
            raise ScanFatalError('INDEX_UNREADABLE: ' + str(exc)) from exc
        try:
            obj, duplicates = parse_json(data)
        except (ValueError, UnicodeError, RecursionError) as exc:
            raise ScanFatalError('INDEX_JSON') from exc
        if duplicates:
            raise ScanFatalError('INDEX_DUPLICATE_KEY')
        if not isinstance(obj, dict) or any(not name for name in obj):
            raise ScanFatalError('INDEX_JSON')
        return obj

    def source_allowed(self, path):
        resolved = path.resolve()
        return (resolved.is_relative_to(self.workspace)
                and not path.is_relative_to(self.out)
                and not resolved.is_relative_to(self.out.resolve()))

    def locate(self, name, entry):
        ptr = '/' + pointer(name) + '/path'
        value = entry.get('path')
        try:
            if (not isinstance(value, str) or not value or '\x00' in value
                    or '\\' in value or Path(value).is_absolute() or '..' in Path(value).parts):
                raise ValueError()
            directory = self.workspace / value
            if not self.source_allowed(directory):
                raise ValueError()
            candidates = [directory / filename for filename in ('bundle.json', 'ohos.build')]
            self.inputs.update(str(p) for p in candidates)
            if not all(self.source_allowed(p) for p in candidates):
                raise ValueError()
        except (ValueError, OSError, RuntimeError):
            self.issue(self.index, 'SOURCE_PATH_INVALID', ptr, component=name)
            return None
        present = []
        for path in candidates:
            try:
                path.stat()
                present.append(path)
            except FileNotFoundError:
                if path.is_symlink():
                    self.issue(path, 'MANIFEST_UNREADABLE', component=name)
                    return None
            except OSError:
                self.issue(path, 'MANIFEST_UNREADABLE', component=name)
                return None
        if len(present) != 1:
            self.issue(self.index, 'MANIFEST_AMBIGUOUS' if present else 'MANIFEST_MISSING',
                       ptr, component=name)
            return None
        return present[0]


@register
class ComponentsCollector(BaseCollector):
    NAME = 'components'
    DESCRIPTION = 'Extract OpenHarmony component declarations'
    DEPENDS_ON = ('repos',)
    SCHEMA_VERSION = '2.1.0'
    TABLES = (COMPONENTS, INNERAPIS, SYSCAPS, FEATURES)
    CONTEXT_TYPE = ComponentsContext
    REQUEST_TYPE = ComponentScanRequest
    REQUEST_TYPE_ERROR = 'EXPECTED_COMPONENT_SCAN_REQUEST'
    RESULT_TYPE = ComponentResult
    RESULT_FIELD = 'components'
    ROLE = 'component'
    EXPORT_ORDER = 'name'
    # components is the one domain that publishes severity and the owning
    # component on every issue, and sorts them by component first.
    ISSUE_FIELDS = ('component', 'path', 'pointer', 'code', 'severity', 'advisory', 'details')
    ISSUE_ORDER = ('component', 'path', 'pointer', 'code')

    def collect(self, ctx):
        self.declared = {field: {} for field, _ in VALUE_TABLES}
        repo_index = self._repo_index(ctx)
        ctx.progress('index', 0, 1)
        entries = ctx.read_index()
        ctx.progress('index', 1, 1)
        if len(entries) > ctx.limits.input_files:
            raise ScanFatalError('INPUT_LIMIT')
        for i, (name, entry) in enumerate(sorted(entries.items())):
            ctx.progress('manifests', i, len(entries), name)
            record = dict(name=name)
            if not isinstance(entry, dict):
                ctx.issue(ctx.index, 'INDEX_ENTRY_TYPE', '/' + pointer(name), component=name)
                ctx.emit('components', record)
                continue
            subsystem = entry.get('subsystem')
            if isinstance(subsystem, str) and subsystem:
                record['subsystem'] = subsystem
            else:
                ctx.issue(ctx.index, 'INDEX_FIELD_TYPE',
                          '/' + pointer(name) + '/subsystem', component=name)
            path = ctx.locate(name, entry)
            if path is not None:
                extract(ctx, record, path)
            if repo_index:
                manifest_path = record.get('manifest')
                if manifest_path:
                    record['repo_id'] = self._match_repo(repo_index, manifest_path)
            source = record.pop('source', None)
            if source is not None:          # absent, not null: see db._encode
                record['record'] = source
            build = record.pop('build', None)   # no column: it lives in `record`
            if path is not None:
                prefix = '/component' if path.name == 'bundle.json' else '/parts/' + pointer(name)
                self.emit_innerapis(ctx, name, build, path, prefix)
                self.emit_values(ctx, name, record, path, prefix)
                check_deps(ctx, name, record, path, prefix, entries.keys())
            # Same as build: no column of their own. emit_values has already
            # expanded them into the syscaps/features tables, and `record` keeps
            # the declaration verbatim -- so dropping them here removes a copy,
            # not a fact.
            for key in ('features', 'syscap'):
                record.pop(key, None)
            ctx.emit('components', record)
        ctx.progress('manifests', len(entries), len(entries))
        self.report_duplicates(ctx)

    @staticmethod
    def _repo_index(ctx):
        """Sorted (path, id) pairs for longest-prefix matching, or None/False.

        False: repos not selected (skip silently).  None: repos ran but failed.
        """
        if not ctx.upstream.ran('repos'):
            return False
        if ctx.upstream.failed('repos'):
            ctx.issue(ctx.index, 'REPO_INDEX_UNAVAILABLE')
            return None
        repos = ctx.upstream.rows('repos')
        return sorted([(r['path'], r['id']) for r in repos if r.get('path')],
                      key=lambda pair: len(pair[0]), reverse=True)

    @staticmethod
    def _match_repo(repo_index, manifest_path):
        """Longest repo path that is a prefix of the manifest's directory."""
        directory = manifest_path.rsplit('/', 1)[0] if '/' in manifest_path else manifest_path
        for repo_path, repo_id in repo_index:
            if directory == repo_path or directory.startswith(repo_path + '/'):
                return repo_id
        return None

    def emit_values(self, ctx, component, record, path, prefix):
        """Expand the declared string lists into addressable rows."""
        for field, table in VALUE_TABLES:
            items = record.get(field)
            if not isinstance(items, list):
                continue
            for index, value in enumerate(items):
                if not isinstance(value, str):
                    continue        # already reported by check_fields
                ctx.emit(table, dict(component_name=component, source_index=index, value=value))
                self.declared[field].setdefault(value, []).append(
                    (component, path, f'{prefix}/{field}/{index}'))

    def report_duplicates(self, ctx):
        """Advisory: a syscap or feature names one capability, so declaring it
        twice -- in one component or across two -- leaves its provider ambiguous.
        The manifests read fine, so this is a judgement about the product, not a
        gap in the scan. Every declaration is kept; each involved component gets
        the full list."""
        for field, where in self.declared.items():
            for value, places in where.items():
                if len(places) < 2:
                    continue
                details = dict(value=value, declarations=[
                    dict(component=c, pointer=p) for c, _, p in places])
                for component in dict.fromkeys(c for c, _, _ in places):
                    path = next(q for c, q, _ in places if c == component)
                    pointer_of = next(p for c, _, p in places if c == component)
                    ctx.issue(path, f'{field.upper().rstrip("S")}_DUPLICATE', pointer_of,
                              severity='warning', component=component, advisory=True,
                              details=details)

    def emit_innerapis(self, ctx, component, build, path, prefix):
        """Expand build.inner_kits / build.inner_api into addressable rows."""
        if not isinstance(build, dict):
            return
        seen = {}
        for field in INNERAPI_FIELDS:
            items = build.get(field)
            if not isinstance(items, list):
                continue
            for index, item in enumerate(items):
                if not isinstance(item, dict) or not isinstance(item.get('name'), str):
                    continue
                label = item['name']
                target = label.rsplit(':', 1)[-1] if ':' in label else None
                external = f'{component}:{target}' if target else None
                if external is not None:
                    seen.setdefault(external, []).append(f'{prefix}/build/{field}/{index}')
                ctx.emit('innerapis', dict(
                    component_name=component, field=field, source_index=index,
                    name=label, external_name=external,
                    record=item))
        for external, where in seen.items():
            if len(where) > 1:
                # external_deps resolves by this name alone, so a repeat makes the
                # reference ambiguous. Kept verbatim; reported with every location.
                ctx.issue(path, 'INNERAPI_EXTERNAL_NAME_CONFLICT', where[0],
                          severity='warning', component=component, advisory=True,
                          details=dict(external_name=external, declarations=where))

    @classmethod
    def resolve_rows(cls, table, rows, keys):
        if table == 'components':
            return rows
        index = keys.get('components', {})
        return [dict({k: v for k, v in row.items() if k != 'component_name'},
                     component_id=index[row['component_name']]) for row in rows]

    def scope(self, ctx):
        return 'components'

    @classmethod
    def export_record(cls, row, connection, scan_id):
        """Verbatim component object, with the index-derived fields on top.

        name/subsystem come from the build index (authoritative), manifest is
        derived; everything else is whatever the manifest declared.
        """
        published = parse_json(row['record'].encode())[0] if row['record'] else {}
        if not isinstance(published, dict):
            published = {}
        for column in ('deps',):
            if row[column] is not None and column not in published:
                published[column] = parse_json(row[column].encode())[0]
        published['name'] = row['name']
        if row['subsystem'] is not None:
            published['subsystem'] = row['subsystem']
        else:
            published.pop('subsystem', None)
        if row['manifest'] is not None:
            published['manifest'] = row['manifest']
        if row['repo_id'] is not None:
            published['repo_id'] = row['repo_id']
        return published
