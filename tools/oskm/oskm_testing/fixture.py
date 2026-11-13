"""Synthetic knowledge.db fixture generated from the published schema."""
from __future__ import annotations

import importlib
import json
import sqlite3
from pathlib import Path

from oskm_schema import FRAMEWORK_TABLES


SCHEMA_MODULES = (
    'args', 'arkts', 'components', 'elf_modules', 'hdi', 'install_modules',
    'links', 'native', 'repos', 'sas', 'services',
)
SCHEMA_TABLES = tuple(
    table
    for module_name in SCHEMA_MODULES
    for table in importlib.import_module(f'oskm_schema.{module_name}').TABLES
)
_PREFIXES = {
    'components': 'components',
    'features': 'components',
    'innerapis': 'components',
    'syscaps': 'components',
    'gn_args': 'args',
    'arkts_modules': 'arkts',
    'arkts_kits': 'arkts',
    'arkts_sources': 'arkts',
    'arkts_kit_relations': 'arkts',
    'elf_modules': 'elf_modules',
    'elf_module_dependencies': 'elf_modules',
    'hdis': 'hdi',
    'install_modules': 'install_modules',
    'install_module_tags': 'install_modules',
    'install_targets': 'install_modules',
    'arkts_links_run': 'links',
    'component_links_run': 'links',
    'native_headers': 'native',
    'repos': 'repos',
    'sas': 'sas',
    'services': 'services',
}
_PRIMARY = {
    'components', 'gn_args', 'arkts_modules', 'elf_modules', 'hdis',
    'install_modules', 'repos', 'sas', 'services',
}


def create_schema(connection: sqlite3.Connection) -> None:
    """Create every table the current query layer requires."""
    for table in FRAMEWORK_TABLES + SCHEMA_TABLES:
        connection.execute(table.ddl())
        for statement in table.index_ddl():
            connection.execute(statement)


def create_empty_db(path) -> Path:
    """Create an empty, schema-complete database and return its path."""
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    connection = sqlite3.connect(path)
    create_schema(connection)
    connection.commit()
    connection.close()
    return path


def _insert_collector_catalog(connection, scan_id):
    for table in SCHEMA_TABLES:
        collector = _PREFIXES[table.name]
        component_column = None
        service_column = None
        if table.name in {'elf_modules', 'hdis', 'install_modules', 'sas', 'services'}:
            component_column = 'component_id'
        if table.name in {'hdis', 'sas'}:
            service_column = 'service_id'
        connection.execute(
            'INSERT INTO collector_tables '
            '(scan_id, collector, table_name, is_primary, component_column, '
            'service_column, schema_version) VALUES (?, ?, ?, ?, ?, ?, ?)',
            (scan_id, collector, table.name,
             int(table.name in _PRIMARY), component_column, service_column, '4.0.0'))


def _insert_repo_components(connection):
    connection.execute(
        'INSERT INTO repos '
        '(scan_id, id, name, path, remote, remote_url, revision, groups, '
        'clone_depth, head_commit) VALUES (1, 1, ?, ?, ?, ?, ?, ?, ?, ?)',
        ('ace', 'foundation/ace/ace_engine', 'origin',
         'https://gitcode.com/openharmony/ace_engine', 'rev1', '[]', 1, 'head1'))
    components = [
        (1, 1, 'ace_engine', 'graphics', 'foundation/ace/ace_engine', 1,
         json.dumps({'components': ['init']}),
         json.dumps({'manifest': 'foundation/ace/ace_engine',
                     'features': ['feature_a']})),
        (1, 2, 'init', 'startup', 'base/startup/init', None,
         json.dumps({'components': []}), json.dumps({'features': ['init_a']})),
    ]
    connection.executemany(
        'INSERT INTO components '
        '(scan_id, id, name, subsystem, manifest, repo_id, deps, record) '
        'VALUES (?, ?, ?, ?, ?, ?, ?, ?)', components)
    connection.execute(
        'INSERT INTO features '
        '(scan_id, component_id, source_index, value, gn_arg_id) '
        'VALUES (1, 1, 0, ?, 1)', (json.dumps('feature_a'),))
    connection.execute(
        'INSERT INTO gn_args '
        '(scan_id, name, component_id, decl_file, decl_line, default_value, '
        'has_override, current_value, comment, value_type) '
        'VALUES (1, ?, 1, ?, 1, ?, 0, ?, ?, ?)',
        ('ace_engine_feature_a', 'foundation/ace/ace_engine/BUILD.gn',
         'false', 'true', '', 'bool'))


def _insert_install_modules(connection):
    modules = [
        (1, 1, 0, '//base/foo:foo', 'foo', 'shared_library', 'shared_library',
         'foundation/base/foo', 1, 1, json.dumps({
             'label': '//base/foo:foo', 'label_name': 'foo',
             'part_name': 'ace_engine', 'type': 'shared_library',
             'source': 'foundation/base/foo', 'install_enable': True,
             'dest': ['system/lib/libfoo.so'], 'shlib_type': 'shared_library'})),
        (1, 2, 1, '//base/bar:bar', 'bar', 'executable', 'none',
         'foundation/base/bar', 1, 2, json.dumps({
             'label': '//base/bar:bar', 'label_name': 'bar',
             'part_name': 'init', 'type': 'executable',
             'source': 'foundation/base/bar', 'install_enable': True,
             'dest': ['system/app/Bar/'], 'shlib_type': 'none'})),
        (1, 3, 2, '//base/deep:deep', 'deep', 'data', 'none',
         'foundation/base/deep', 1, 2, json.dumps({
             'label': '//base/deep:deep', 'label_name': 'deep',
             'part_name': 'init', 'type': 'data',
             'source': 'foundation/base/deep', 'install_enable': True,
             'dest': ['system/app/Bar/deep/'], 'shlib_type': 'none'})),
    ]
    connection.executemany(
        'INSERT INTO install_modules '
        '(scan_id, id, ordinal, label, label_name, type, shlib_type, source, '
        'install_enable, component_id, record) '
        'VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', modules)
    targets = [
        (1, 0, 'system/lib/libfoo.so', 0, 'system', 'libfoo.so'),
        (2, 0, 'system/app/Bar', 1, 'system', 'Bar'),
        (3, 0, 'system/app/Bar/deep', 1, 'system', 'deep'),
    ]
    connection.executemany(
        'INSERT INTO install_targets '
        '(scan_id, module_id, dest_index, dest, directory, partition, file_name, '
        'size, link_target_path, link_target_id) '
        'VALUES (1, ?, ?, ?, ?, ?, ?, NULL, NULL, NULL)', targets)
    connection.executemany(
        'INSERT INTO install_module_tags '
        '(scan_id, module_id, source_index, value) VALUES (?, ?, ?, ?)',
        [(1, 1, 0, 'innerapi'), (1, 1, 1, 'chipsetsdk')])


def _insert_services_hdis(connection):
    first = json.dumps({
        'name': 'foo', 'uid': '1000', 'path': ['/system/bin/sa_main', '-x'],
        'secon': 'u:r:foo:s0', 'sandbox': 1})
    second = json.dumps({
        'name': 'host_service', 'uid': '1001', 'path': ['/system/bin/sa_main', '-y'],
        'secon': 'u:r:host_service:s0', 'sandbox': 0})
    connection.executemany(
        'INSERT INTO services '
        '(scan_id, id, position, cfg, name, type, uid, start_mode, ondemand, '
        'args, gid, secon, sandbox, importance, component_id, '
        'install_module_id, record) '
        'VALUES (1, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL, ?, ?, NULL, 1, 1, ?)',
        [(1, 0, '/etc/init/foo.cfg', 'foo', 'sa', '1000', 'boot', 0,
          json.dumps(['-x']), 'u:r:foo:s0', 1, first),
         (2, 1, '/etc/init/foo.cfg', 'host_service', 'sa', '1001', 'boot', 0,
          json.dumps(['-y']), 'u:r:host_service:s0', 0, second)])
    connection.execute(
        'INSERT INTO hdis '
        '(scan_id, id, position, hcb, node, service_name, module_name, library, '
        'service_id, component_id, install_module_id, record) '
        'VALUES (1, 1, 0, ?, ?, ?, ?, ?, 2, 1, 1, ?)',
        ('foo.hcb', '/dev/foo', 'HDI_NAME', 'hdi_foo',
         'foundation/ace/ace_engine/libhdi_foo.so',
         json.dumps({'node': '/dev/foo', 'serviceName': 'HDI_NAME'})))


def create_fixture_db(path) -> Path:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.unlink(missing_ok=True)
    connection = sqlite3.connect(path)
    create_schema(connection)
    connection.execute(
        'INSERT INTO scans '
        '(id, product, cpu_arch, workspace_root, started_at, finished_at) '
        "VALUES (1, ?, 'arm64', ?, ?, ?)",
        ('synthetic', '/src', '2026-11-02T00:00:00Z', '2026-11-02T00:00:01Z'))
    connection.executemany(
        'INSERT INTO collector_runs '
        '(scan_id, collector, schema_version, status, scope, record_count, error) '
        'VALUES (?, ?, ?, ?, ?, ?, ?)',
        [(1, collector, '4.0.0', 'complete', '{}', 1, None)
         for collector in sorted(set(_PREFIXES.values()))])
    _insert_collector_catalog(connection, 1)
    _insert_repo_components(connection)
    _insert_install_modules(connection)
    _insert_services_hdis(connection)
    connection.commit()
    connection.close()
    return path


def write_minimal_pyz(path) -> Path:
    """写一个**结构合法**的 zipapp，用来验证"归档里带没带 CLI"。

    `cli_install.verify_pyz` 只校结构（shebang + 有效 zip + CRC + 必需条目），
    不校行为，所以测试打包/解包/落盘时用它，不必真构建那个 84 KB 的产物——
    构建一次要 0.1 s，而这类用例有十几条。

    真 CLI 的可运行性由 `cli/tests/test_cli_bundle.py::PyzRunsStandalone` 覆盖，
    那边用的是 `build_cli.build_pyz()` 真产物。
    """
    import io
    import zipfile
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    members = {
        '__main__.py': 'raise SystemExit(0)\n',
        'oskm_cli/__init__.py': "__version__ = 'test'\n",
        'oskm_cli/cli.py': 'def main(argv=None):\n    return 0\n',
    }
    buffer = io.BytesIO()
    with zipfile.ZipFile(buffer, 'w', zipfile.ZIP_DEFLATED) as archive:
        for name, body in sorted(members.items()):
            archive.writestr(name, body)
    path.write_bytes(b'#!/usr/bin/env python3\n' + buffer.getvalue())
    path.chmod(0o755)
    return path
