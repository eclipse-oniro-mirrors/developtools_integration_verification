"""Small synthetic knowledge.db fixture for standalone/query-layer tests."""
from __future__ import annotations

import json
import sqlite3
from pathlib import Path


def create_fixture_db(path) -> Path:
    path = Path(path)
    connection = sqlite3.connect(path)
    connection.executescript("""
        CREATE TABLE scans (
            id INTEGER PRIMARY KEY, product TEXT, zone TEXT, cpu_arch TEXT,
            workspace_root TEXT, started_at TEXT, finished_at TEXT
        );
        CREATE TABLE collector_runs (
            scan_id INTEGER, collector TEXT, schema_version TEXT, status TEXT,
            scope TEXT, record_count INTEGER, error TEXT
        );
        CREATE TABLE collector_tables (
            scan_id INTEGER, collector TEXT, table_name TEXT, is_primary INTEGER,
            component_column TEXT, service_column TEXT, schema_version TEXT
        );
        CREATE TABLE repos (
            id INTEGER PRIMARY KEY, scan_id INTEGER, name TEXT, path TEXT,
            remote_url TEXT, revision TEXT, head_commit TEXT
        );
        CREATE TABLE components (
            id INTEGER PRIMARY KEY, scan_id INTEGER, name TEXT, subsystem TEXT,
            manifest TEXT, repo_id INTEGER, deps TEXT, record TEXT
        );
        CREATE TABLE install_modules (
            id INTEGER PRIMARY KEY, scan_id INTEGER, ordinal INTEGER, label TEXT,
            label_name TEXT, type TEXT, source TEXT, install_enable INTEGER,
            component_id INTEGER, record TEXT
        );
        CREATE TABLE install_targets (
            id INTEGER PRIMARY KEY, scan_id INTEGER, module_id INTEGER,
            dest_index INTEGER, dest TEXT, directory INTEGER
        );
        CREATE TABLE install_module_tags (
            id INTEGER PRIMARY KEY, scan_id INTEGER, module_id INTEGER,
            source_index INTEGER, value TEXT
        );
        CREATE TABLE services (
            id INTEGER PRIMARY KEY, scan_id INTEGER, position INTEGER, cfg TEXT,
            name TEXT, type TEXT, executable TEXT, uid TEXT, start_mode TEXT,
            ondemand INTEGER, args TEXT, gid TEXT, secon TEXT, sandbox INTEGER,
            importance INTEGER, component_id INTEGER, install_module_id INTEGER,
            record TEXT
        );
    """)
    connection.execute(
        'INSERT INTO scans VALUES (1, ?, ?, ?, ?, ?, ?)',
        ('synthetic', 'blue', 'arm64', '/src',
         '2026-11-02T00:00:00Z', '2026-11-02T00:00:01Z'))
    connection.execute(
        "INSERT INTO collector_runs VALUES "
        "(1, 'components', '4.0.0', 'complete', '{}', 2, NULL)")
    connection.execute(
        'INSERT INTO repos VALUES '
        "(1, 1, 'ace', 'foundation/ace/ace_engine', "
        "'https://gitcode.com/openharmony/ace_engine', 'rev1', 'head1')")
    components = [
        (1, 1, 'ace_engine', 'graphics', 'foundation/ace/ace_engine', 1,
         json.dumps({'components': ['init']}),
         json.dumps({'manifest': 'foundation/ace/ace_engine',
                     'features': ['feature_a']})),
        (2, 1, 'init', 'startup', 'base/startup/init', None,
         json.dumps({'components': []}), json.dumps({'features': ['init_a']})),
    ]
    connection.executemany(
        'INSERT INTO components VALUES (?, ?, ?, ?, ?, ?, ?, ?)', components)

    modules = [
        (1, 1, 0, '//base/foo:foo', 'foo', 'shared_library',
         'foundation/base/foo', 1, 1, json.dumps({
             'label': '//base/foo:foo', 'label_name': 'foo',
             'part_name': 'ace_engine', 'type': 'shared_library',
             'source': 'foundation/base/foo', 'install_enable': True,
             'dest': ['system/lib/libfoo.so'], 'shlib_type': 'shared_library'})),
        (2, 1, 1, '//base/bar:bar', 'bar', 'executable',
         'foundation/base/bar', 1, 2, json.dumps({
             'label': '//base/bar:bar', 'label_name': 'bar',
             'part_name': 'init', 'type': 'executable',
             'source': 'foundation/base/bar', 'install_enable': True,
             'dest': ['system/app/Bar/'], 'shlib_type': 'none'})),
        (3, 1, 2, '//base/deep:deep', 'deep', 'data',
         'foundation/base/deep', 1, 2, json.dumps({
             'label': '//base/deep:deep', 'label_name': 'deep',
             'part_name': 'init', 'type': 'data',
             'source': 'foundation/base/deep', 'install_enable': True,
             'dest': ['system/app/Bar/deep/'], 'shlib_type': 'none'})),
    ]
    connection.executemany(
        'INSERT INTO install_modules VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        modules)
    connection.executemany(
        'INSERT INTO install_targets VALUES (?, ?, ?, ?, ?, ?)', [
            (1, 1, 1, 0, 'system/lib/libfoo.so', 0),
            (2, 1, 2, 0, 'system/app/Bar', 1),
            (3, 1, 3, 0, 'system/app/Bar/deep', 1),
        ])
    connection.executemany(
        'INSERT INTO install_module_tags VALUES (?, ?, ?, ?, ?)', [
            (1, 1, 1, 0, 'innerapi'),
            (2, 1, 1, 1, 'chipsetsdk'),
        ])
    service_record = json.dumps({
        'name': 'foo', 'uid': '1000',
        'path': ['/system/bin/sa_main', '-x'],
        'secon': 'u:r:foo:s0', 'sandbox': 1,
    })
    connection.execute(
        'INSERT INTO services VALUES '
        '(1, 1, 0, ?, ?, ?, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '
        'NULL, 1, 1, ?)',
        ('/etc/init/foo.cfg', 'foo', 'sa', service_record))
    connection.commit()
    connection.close()
    return path
