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
"""ELF module collector.

The install manifest is read only through install_modules. This collector adds
the second, physical dimension: which installed targets really are ELF modules,
what they need, and which installed ELF deps_guard would load for that name.
"""
from collections import defaultdict, deque
import struct
from pathlib import Path

from .elf import BoundedReader, ElfFormatError, read_elf
from .models import ElfModuleScanRequest, ElfModuleResult
from .resolution import candidate_index, resolve_needed
from ...core.export import rejoin_component, rejoin_install
from ...core.framework import BaseCollector, ScanContext, register
from ...core.io import parse_json
from ...core.models import ScanFatalError
from ...core.schema import Column, Index, Table


ELF_MODULES = Table(
    'elf_modules',
    columns=(
        Column('position', 'INTEGER', nullable=False),
        Column('install_target_id', 'INTEGER', nullable=False,
               references='install_targets(id)'),
        Column('install_module_id', 'INTEGER', nullable=False,
               references='install_modules(id)'),
        Column('component_id', 'INTEGER', references='components(id)'),
        Column('partition', nullable=False),
        Column('file_name', nullable=False),
        Column('soname'),
        Column('format'),
        Column('api_type', nullable=False,
               check="api_type IN ('public_api', 'inner_api', 'internal_api')"),
        Column('category', 'JSON', nullable=False,
               check="json_valid(category) AND json_type(category) = 'array'"),
        Column('type'),
        Column('machine', 'INTEGER'),
        Column('dynamic', 'INTEGER', nullable=False),
        Column('needed', 'JSON', nullable=False),
    ),
    primary_key=('position',),
    surrogate=True,
    indexes=(Index('idx_elf_modules_target', ('scan_id', 'install_target_id'),
                   unique=True),
             Index('idx_elf_modules_name', ('scan_id', 'file_name')),
             Index('idx_elf_modules_install', ('scan_id', 'install_module_id')),
             Index('idx_elf_modules_component', ('scan_id', 'component_id')),
             Index('idx_elf_modules_api_type', ('scan_id', 'api_type'))),
)

ELF_MODULE_DEPENDENCIES = Table(
    'elf_module_dependencies',
    columns=(
        Column('caller_id', 'INTEGER', nullable=False, references='elf_modules(id)'),
        Column('needed_ordinal', 'INTEGER', nullable=False),
        Column('needed_name', nullable=False),
        Column('callee_id', 'INTEGER', references='elf_modules(id)'),
    ),
    primary_key=('caller_id', 'needed_ordinal'),
    surrogate=True,
    indexes=(Index('idx_elf_module_dependencies_callee', ('scan_id', 'callee_id')),
             Index('idx_elf_module_dependencies_name', ('scan_id', 'needed_name'))),
)


class ElfModulesContext(ScanContext):
    def setup(self):
        self.elf_module_scope = []
        self.sdk_scope = []

    def read_elf(self, path):
        """Read one installed file under the framework's byte budgets."""
        self.check()
        try:
            resolved = path.resolve()
            if not resolved.is_relative_to(self.package.resolve()):
                raise ElfFormatError('ELF_OUTSIDE_PACKAGE')
            stat = path.stat()
            if stat.st_size > self.limits.file_bytes:
                raise ElfFormatError('ELF_SIZE_LIMIT')
            handle = path.open('rb')
        except ElfFormatError:
            raise
        except (OSError, RuntimeError) as exc:
            raise ElfFormatError('ELF_UNREADABLE') from exc

        self.track((path,))
        self.scan_directories.add(str(path.parent))
        reader = BoundedReader(handle, self.limits.file_bytes,
                               self.limits.total_bytes, self.used_bytes)
        try:
            return read_elf(reader)
        except OSError as exc:
            raise ElfFormatError('ELF_UNREADABLE') from exc
        finally:
            self.used_bytes = reader.used
            handle.close()

    def sdk_library_names(self):
        """Return NDK library basenames without pinning an SDK version."""
        configured = self.request.option('elf_modules', 'ndk_sysroot_lib_dir')
        if configured is not None:
            if not isinstance(configured, (str, Path)):
                self.issue(self.workspace, 'SDK_INDEX_INVALID', advisory=True,
                           details={'reason': 'not a path'})
                return set()
            directory = Path(configured)
            if not directory.is_absolute():
                directory = self.workspace / directory
            directory = directory.resolve()
            if not directory.is_relative_to(self.workspace):
                self.issue(self.workspace, 'SDK_INDEX_OUTSIDE_WORKSPACE', advisory=True)
                return set()
            if not directory.is_dir():
                self.issue(directory, 'SDK_INDEX_UNAVAILABLE', advisory=True)
                return set()
            candidates = (directory,)
        else:
            root = self.workspace / 'prebuilts/ohos-sdk/linux'
            candidates = tuple(sorted(
                path for path in root.glob(
                    '*/native/sysroot/usr/lib/x86_64-linux-ohos')
                if path.is_dir() and path.resolve().is_relative_to(self.workspace)
            ))
            if not candidates:
                self.issue(root, 'SDK_INDEX_UNAVAILABLE', advisory=True)
                return set()
            if len(candidates) > 1:
                best = max(candidates, key=self._version_key)
                if sum(self._version_key(path) == self._version_key(best)
                       for path in candidates) > 1:
                    self.issue(root, 'SDK_INDEX_AMBIGUOUS', advisory=True,
                               details={'candidates': [str(path) for path in candidates]})
                    return set()
                candidates = (best,)

        names = set()
        for directory in candidates:
            self.scan_directories.add(str(directory))
            for path in directory.iterdir():
                if path.is_file() and path.suffix == '.so':
                    names.add(path.name)
                    self.sdk_scope.append(self.relative(path))
                    self.track((path,))
        return names

    @staticmethod
    def _version_key(path):
        version = path.parents[4].name
        parts = version.split('.')
        if parts and all(part.isdigit() for part in parts):
            return (1, tuple(int(part) for part in parts), path.name)
        return (0, version, path.name)


@register
class ElfModulesCollector(BaseCollector):
    NAME = 'elf_modules'
    DESCRIPTION = 'Extract module information from installed ELF files'
    DEPENDS_ON = ('component_links', 'services', 'hdi', 'sas')
    SCHEMA_VERSION = '3.0.0'
    TABLES = (ELF_MODULES, ELF_MODULE_DEPENDENCIES)
    CONTEXT_TYPE = ElfModulesContext
    REQUEST_TYPE = ElfModuleScanRequest
    REQUEST_TYPE_ERROR = 'EXPECTED_SCAN_REQUEST'
    RESULT_TYPE = ElfModuleResult
    RESULT_FIELD = 'elf_modules'
    EXPORT_ORDER = 'position'
    COMPONENT_COLUMN = 'component_id'
    INSTALL_COLUMN = 'install_module_id'
    ISSUE_FIELDS = ('path', 'pointer', 'code', 'severity', 'advisory', 'details')

    NON_ELF_MODULE_TYPES = frozenset({'app', 'etc'})

    CATEGORY_ORDER = (
        'napi', 'ndk', 'ani', 'cangjie', 'extension',
        'platform_sdk', 'platform_sdk_indirect',
        'chipset_sdk', 'chipset_sdk_indirect',
        'sa', 'hdi', 'hdi_proxy', 'hdi_stub', 'anco', 'other',
    )
    PUBLIC_CATEGORY_TAGS = frozenset({
        'napi', 'ndk', 'ani', 'cangjie', 'extension',
    })

    @classmethod
    def classify_direct_categories(cls, dest, module, info, subsystem,
                                   sdk_names, sa_modules, hdi_modules):
        categories = set()
        if module['file_name'] in sdk_names:
            categories.add('ndk')
        else:
            if (not info['ani_constructor']
                    and dest.startswith(('system/lib/module/', 'system/lib64/module/'))
                    and not dest.startswith(('system/lib/module/ani/',
                                             'system/lib64/module/ani/'))):
                categories.add('napi')
            if info['ani_constructor']:
                categories.add('ani')
            if info['cangjie']:
                categories.add('cangjie')
            if dest.startswith(('system/lib/extensionability/',
                                'system/lib64/extensionability/')):
                categories.add('extension')
        if module['install_module_id'] in sa_modules:
            categories.add('sa')
        if module['install_module_id'] in hdi_modules:
            categories.add('hdi')
        if module['shlib_type'] == 'hdi_proxy':
            categories.add('hdi_proxy')
        if module['shlib_type'] == 'hdi_stub':
            categories.add('hdi_stub')
        if (subsystem == 'virt_service'
                or (module['partition'] == 'vendor'
                    and dest.startswith('vendor/anco_spec/'))):
            categories.add('anco')
        return tuple(category for category in cls.CATEGORY_ORDER
                     if category in categories)

    @classmethod
    def classify_api_type(cls, categories, install_module_id, inner_api_modules):
        if cls.PUBLIC_CATEGORY_TAGS.intersection(categories):
            return 'public_api'
        if install_module_id in inner_api_modules:
            return 'inner_api'
        return 'internal_api'

    @staticmethod
    def propagate_sdk_categories(rows, adjacency):
        public = {
            position for position, row in rows.items()
            if ElfModulesCollector.PUBLIC_CATEGORY_TAGS.intersection(
                row['_categories'])
        }
        platform = {
            callee for caller in public for callee in adjacency.get(caller, ())
            if rows[callee]['partition'] == 'system' and callee not in public
        }
        platform_indirect = ElfModulesCollector._reachable(platform, adjacency) - platform
        chipset = {
            callee for caller, row in rows.items()
            if row['partition'] == 'vendor'
            for callee in adjacency.get(caller, ())
            if rows[callee]['partition'] == 'system'
        }
        chipset_indirect = ElfModulesCollector._reachable(chipset, adjacency) - chipset
        for position in platform:
            rows[position]['_categories'].add('platform_sdk')
        for position in platform_indirect:
            rows[position]['_categories'].add('platform_sdk_indirect')
        for position in chipset:
            rows[position]['_categories'].add('chipset_sdk')
        for position in chipset_indirect:
            rows[position]['_categories'].add('chipset_sdk_indirect')

    @staticmethod
    def _reachable(seeds, adjacency):
        found = set(seeds)
        queue = deque(seeds)
        while queue:
            caller = queue.popleft()
            for callee in adjacency.get(caller, ()):
                if callee not in found:
                    found.add(callee)
                    queue.append(callee)
        return found

    def collect(self, ctx):
        """Scan ELF files from install targets and resolve dependencies."""
        manifest = ctx.package / 'system_module_info.json'
        if not self._check_upstream(ctx, manifest):
            return
        indexes = self._build_indexes(ctx)
        parsed = self._parse_targets(ctx, indexes)
        self._resolve_edges(ctx, parsed, indexes)
        self._emit_rows(ctx, parsed, indexes)

    def _check_upstream(self, ctx, manifest):
        """Verify upstream collectors ran successfully. Returns False if blocked."""
        if not ctx.upstream.ran('install_modules'):
            ctx.issue(manifest, 'INSTALL_INDEX_NOT_SELECTED')
            return False
        if (ctx.upstream.failed('install_modules')
                or not ctx.upstream.inventory_complete('install_modules')):
            ctx.issue(manifest, 'INSTALL_INDEX_INCOMPLETE')
            return False
        for dependency in ('component_links', 'services', 'hdi', 'sas'):
            status = ctx.upstream.status(dependency)
            if status is None:
                ctx.issue(manifest, f'{dependency.upper()}_NOT_SELECTED')
                return False
            if status == 'failed' or not ctx.upstream.inventory_complete(
                    dependency):
                ctx.issue(manifest, f'{dependency.upper()}_INDEX_INCOMPLETE',
                          severity='warning', advisory=True)
        return True

    def _build_indexes(self, ctx):
        """Collect upstream data into lookup structures."""
        module_rows = {row['id']: row
                       for row in ctx.upstream.rows('install_modules')}
        component_subsystems = {
            row['id']: row['subsystem']
            for row in ctx.upstream.rows('components')
        }
        sa_modules = {
            row['install_module_id'] for row in ctx.upstream.rows('sas')
            if row['install_module_id'] is not None
        }
        hdi_modules = {
            row['install_module_id'] for row in ctx.upstream.rows('hdis')
            if row['install_module_id'] is not None
        }
        inner_api_modules = {
            row['install_module_id'] for row in ctx.upstream.rows('innerapis')
            if row['install_module_id'] is not None
        }
        sdk_names = ctx.sdk_library_names()
        exact_targets = defaultdict(list)
        symlink_targets = []
        for target in ctx.upstream.rows('install_targets'):
            if target['link_target_path'] is not None:
                symlink_targets.append(target)
                continue
            if not target['directory']:
                exact_targets[target['dest']].append(target)
        targets = [max(rows, key=lambda row: row['id'])
                   for _, rows in exact_targets.items()]
        targets.sort(key=lambda row: row['dest'])
        return dict(
            module_rows=module_rows,
            component_subsystems=component_subsystems,
            sa_modules=sa_modules,
            hdi_modules=hdi_modules,
            inner_api_modules=inner_api_modules,
            sdk_names=sdk_names,
            symlink_targets=symlink_targets,
            targets=targets,
        )

    def _parse_targets(self, ctx, indexes):
        """Parse ELF files from install targets and build parsed list."""
        parsed = []
        module_rows = indexes['module_rows']
        for position, target in enumerate(indexes['targets']):
            row = self._try_parse_elf(ctx, target, module_rows, indexes)
            if row:
                row['position'] = position
                parsed.append(row)
                ctx.elf_module_scope.append(ctx.relative(
                    ctx.package / target['dest']))
                ctx.progress('elf_modules', len(parsed), None,
                             ctx.relative(ctx.package / target['dest']))
        return parsed

    def _try_parse_elf(self, ctx, target, module_rows, indexes):
        """Attempt to parse one ELF target. Returns row dict or None."""
        path = ctx.package / target['dest']
        module = module_rows[target['module_id']]
        if module['type'] in self.NON_ELF_MODULE_TYPES:
            return None
        if not path.exists() or path.is_dir():
            return None
        try:
            info = ctx.read_elf(path)
        except (ElfFormatError, struct.error, OverflowError) as exc:
            if str(exc) == 'ELF_TOTAL_LIMIT':
                raise ScanFatalError('INPUT_LIMIT') from exc
            ctx.issue(path, 'ELF_PARSE_FAILED', severity='warning',
                      details={'reason': str(exc)})
            return None
        if info is None:
            return None
        return self._build_elf_row(target, module, info, indexes)

    def _build_elf_row(self, target, module, info, indexes):
        """Construct a parsed ELF row from target, module, and ELF info."""
        return dict(
            position=None,  # set by caller
            install_target_id=target['id'],
            install_module_id=target['module_id'],
            component_id=module['component_id'],
            dest=target['dest'],
            partition=target['partition'],
            file_name=target['file_name'],
            soname=info['soname'],
            format=info['format'],
            type=info['type'],
            machine=info['machine'],
            dynamic=int(info['dynamic']),
            needed=tuple(info['needed']),
            _dependencies=tuple(info['needed']),
            _categories=set(self.classify_direct_categories(
                target['dest'],
                dict(module, file_name=target['file_name'],
                     install_module_id=target['module_id'],
                     partition=target['partition']),
                info,
                indexes['component_subsystems'].get(
                    module['component_id']),
                indexes['sdk_names'],
                indexes['sa_modules'],
                indexes['hdi_modules'])),
        )

    def _resolve_edges(self, ctx, parsed, indexes):
        """Resolve DT_NEEDED dependencies and emit dependency edges."""
        by_name = candidate_index(parsed, indexes['symlink_targets'])
        by_position = {row['position']: row for row in parsed}
        adjacency = defaultdict(set)
        for row in parsed:
            for ordinal, needed_name in enumerate(row['_dependencies']):
                winner = resolve_needed(needed_name, by_name)
                if winner is not None:
                    adjacency[row['position']].add(winner['position'])
                ctx.emit('elf_module_dependencies', dict(
                    caller_position=row['position'],
                    needed_ordinal=ordinal,
                    needed_name=needed_name,
                    callee_position=(None if winner is None
                                     else winner['position']),
                ))
                if winner is None:
                    ctx.issue(ctx.package / row['dest'],
                              'ELF_DEPENDENCY_UNRESOLVED',
                              pointer=f'/needed/{ordinal}', severity='warning',
                              advisory=True,
                              details={'needed_name': needed_name})
        self.propagate_sdk_categories(by_position, adjacency)
        indexes['by_position'] = by_position
        indexes['adjacency'] = adjacency

    def _emit_rows(self, ctx, parsed, indexes):
        """Finalize categories and emit elf_modules rows."""
        inner_api_modules = indexes['inner_api_modules']
        for row in parsed:
            if not row['_categories']:
                row['_categories'].add('other')
            row['category'] = tuple(
                category for category in self.CATEGORY_ORDER
                if category in row['_categories'])
            row['api_type'] = self.classify_api_type(
                row['category'], row['install_module_id'],
                inner_api_modules)
            ctx.emit('elf_modules', {key: value for key, value in row.items()
                                     if key != 'dest'
                                     and not key.startswith('_')})

    def scope(self, ctx):
        return sorted(ctx.elf_module_scope + ctx.sdk_scope)

    @classmethod
    def resolve_rows(cls, table, rows, keys):
        if table == 'elf_modules':
            return rows
        elf_ids = keys['elf_modules']
        resolved = []
        for row in rows:
            item = dict(row)
            caller_position = item.pop('caller_position')
            callee_position = item.pop('callee_position', None)
            item['caller_id'] = elf_ids[caller_position]
            if callee_position is not None:
                item['callee_id'] = elf_ids[callee_position]
            resolved.append(item)
        return resolved

    @classmethod
    def export_record(cls, row, connection, scan_id):
        target = connection.execute(
            'SELECT dest FROM install_targets '
            'WHERE scan_id = ? AND id = ?',
            (scan_id, row['install_target_id'])).fetchone()
        record = {
            'position': row['position'],
            'dest': target['dest'],
            'partition': row['partition'],
            'file_name': row['file_name'],
            'soname': row['soname'],
            'format': row['format'],
            'api_type': row['api_type'],
            'category': parse_json(row['category'].encode())[0],
            'type': row['type'],
            'machine': row['machine'],
            'dynamic': bool(row['dynamic']),
            'needed': parse_json(row['needed'].encode())[0],
            'dependencies': [],
        }
        edges = connection.execute(
            'SELECT d.needed_ordinal, d.needed_name, t.dest AS callee_dest '
            'FROM elf_module_dependencies d '
            'LEFT JOIN elf_modules callee '
            'ON callee.scan_id = d.scan_id AND callee.id = d.callee_id '
            'LEFT JOIN install_targets t '
            'ON t.scan_id = callee.scan_id AND t.id = callee.install_target_id '
            'WHERE d.scan_id = ? AND d.caller_id = ? '
            'ORDER BY d.needed_ordinal', (scan_id, row['id']))
        for edge in edges:
            record['dependencies'].append({
                'needed_name': edge['needed_name'],
                'needed_ordinal': edge['needed_ordinal'],
                'target': edge['callee_dest'],
            })
        rejoin_install(record, row, cls, connection, scan_id)
        rejoin_component(record, row, cls, connection, scan_id)
        return record
