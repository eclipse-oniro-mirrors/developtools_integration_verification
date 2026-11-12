"""Regression coverage for security and contract findings in MR 380."""
from __future__ import annotations
# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
for _p in (str(_HERE.parents[0]), str(_HERE.parents[1])):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)

import json
import sqlite3
import tempfile
import unittest
from pathlib import Path

from oskm_cli.query.gitlink import reset_cache
from oskm_cli.query.session import SessionManager
from oskm_testing.fixture import (
    _insert_collector_catalog,
    create_fixture_db,
)
from oskm_cli.query.tools import dispatch


class SqlSnapshotIsolationTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.db = create_fixture_db(Path(self.temp.name) / 'knowledge.db')
        connection = sqlite3.connect(self.db)
        connection.execute(
            'INSERT INTO scans '
            '(id, product, cpu_arch, workspace_root, started_at, finished_at) '
            "VALUES (2, ?, 'arm64', ?, ?, ?)",
            ('synthetic', '/src',
             '2026-11-03T00:00:00Z', '2026-11-03T00:00:01Z'))
        connection.execute(
            'INSERT INTO components '
            '(scan_id, id, name, subsystem, manifest, repo_id, deps, record) '
            'VALUES (2, 99, ?, ?, ?, 2, ?, ?)',
            ('current', 'graphics', 'foundation/current', json.dumps({}),
             json.dumps({})))
        _insert_collector_catalog(connection, 2)
        connection.execute(
            'INSERT INTO collector_runs '
            '(scan_id, collector, schema_version, status, scope, record_count, error) '
            "VALUES (2, 'components', '4.0.0', 'complete', '{}', 1, NULL)")
        connection.commit()
        connection.close()
        self.manager = SessionManager()
        opened = dispatch(
            'open_session', {'db_path': str(self.db), 'scan_id': 2}, self.manager)
        self.assertNotIn('error', opened)

    def tearDown(self):
        self.manager.close()
        self.temp.cleanup()

    def test_or_predicate_cannot_read_previous_scan(self):
        result = dispatch('sql_query', {
            'sql': (
                "SELECT name FROM components "
                "WHERE name='current' OR 1=1 ORDER BY name"
            ),
        }, self.manager)

        self.assertNotIn('error', result)
        self.assertEqual(result['rows'], [{'name': 'current'}])

    def test_comment_and_string_cannot_disable_snapshot_scope(self):
        queries = (
            'SELECT name FROM components /* scan_id */',
            "SELECT name FROM components WHERE name = 'scan_id' OR 1=1",
            'SELECT name FROM components -- scan_id',
        )
        for sql in queries:
            with self.subTest(sql=sql):
                result = dispatch('sql_query', {'sql': sql}, self.manager)
                self.assertNotIn('error', result)
                self.assertEqual(result['rows'], [{'name': 'current'}])

    def test_framework_tables_are_rejected_in_every_reference_form(self):
        queries = (
            'SELECT product FROM scans',
            'SELECT product FROM "scans"',
            'SELECT product FROM `scans`',
            'SELECT product FROM [scans]',
            'SELECT c.name FROM components c, scans s',
            'SELECT product FROM (SELECT * FROM scans)',
            'WITH x AS (SELECT * FROM scans) SELECT product FROM x',
            'SELECT product FROM issues',
            'SELECT * FROM collector_runs',
            'SELECT * FROM collector_tables',
        )
        for sql in queries:
            with self.subTest(sql=sql):
                result = dispatch('sql_query', {'sql': sql}, self.manager)
                self.assertEqual(
                    result.get('error', {}).get('code'), 'TABLE_NOT_ALLOWED')

    def test_multiline_where_and_quoted_approved_tables_work(self):
        queries = (
            "SELECT name FROM components WHERE\nname = 'current'",
            "SELECT name FROM \"components\"\tWHERE name = 'current'",
            "SELECT name FROM `components` WHERE name = 'current'",
            "SELECT name FROM [components] WHERE name = 'current'",
        )
        for sql in queries:
            with self.subTest(sql=sql):
                result = dispatch('sql_query', {'sql': sql}, self.manager)
                self.assertNotIn('error', result)
                self.assertEqual(result['rows'], [{'name': 'current'}])

    def test_limit_and_truncated_reflect_the_requested_page(self):
        result = dispatch('sql_query', {
            'sql': (
                'SELECT name FROM components '
                'UNION ALL SELECT name FROM components'
            ),
            'limit': 1,
        }, self.manager)
        self.assertNotIn('error', result)
        self.assertEqual(result['row_count'], 1)
        self.assertTrue(result['truncated'])

        complete = dispatch('sql_query', {
            'sql': (
                'SELECT name FROM components '
                'UNION ALL SELECT name FROM components'
            ),
            'limit': 10,
        }, self.manager)
        self.assertNotIn('error', complete)
        self.assertEqual(complete['row_count'], 2)
        self.assertFalse(complete['truncated'])

    def test_limit_outside_supported_range_is_invalid(self):
        for limit in (0, 1001, -1):
            with self.subTest(limit=limit):
                result = dispatch('sql_query', {
                    'sql': 'SELECT name FROM components',
                    'limit': limit,
                }, self.manager)
                self.assertEqual(
                    result.get('error', {}).get('code'), 'INVALID_PARAM')

    def test_recursive_query_is_interrupted_by_execution_budget(self):
        result = dispatch('sql_query', {
            'sql': (
                'WITH RECURSIVE loop(x) AS ('
                'SELECT 1 UNION ALL SELECT x FROM loop) '
                'SELECT count(*) FROM loop'
            ),
        }, self.manager)
        self.assertEqual(result.get('error', {}).get('code'), 'TIMEOUT')



class SessionAndGenericQueryContractTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        self.db = create_fixture_db(self.root / 'knowledge.db')
        self.manager = SessionManager()
        self.opened = dispatch(
            'open_session', {'db_path': str(self.db)}, self.manager)
        self.assertNotIn('error', self.opened)
        self.assertEqual(self.opened['cpu_arch'], 'arm64')

    def tearDown(self):
        self.manager.close()
        self.temp.cleanup()

    def test_session_listing_keeps_cpu_arch(self):
        sessions = dispatch('list_sessions', {}, self.manager)['sessions']
        self.assertEqual(sessions[0]['cpu_arch'], 'arm64')

    def test_explicit_missing_and_incomplete_scans_use_stable_codes(self):
        missing = dispatch('open_session', {
            'db_path': str(self.db), 'scan_id': 999,
        }, SessionManager())
        self.assertEqual(missing['error']['code'], 'SCAN_NOT_FOUND')

        incomplete_path = self.root / 'incomplete.db'
        connection = sqlite3.connect(incomplete_path)
        from oskm_testing.fixture import create_schema
        create_schema(connection)
        connection.execute(
            'INSERT INTO scans '
            '(id, product, cpu_arch, workspace_root, started_at, finished_at) '
            "VALUES (1, ?, 'arm64', ?, ?, ?)",
            ('synthetic', '/src',
             '2026-11-02T00:00:00Z', None))
        connection.commit()
        connection.close()
        incomplete = dispatch('open_session', {
            'db_path': str(incomplete_path), 'scan_id': 1,
        }, SessionManager())
        self.assertEqual(incomplete['error']['code'], 'SCAN_INCOMPLETE')

    def test_list_entities_rejects_injected_filter_and_sort_keys(self):
        injected = dispatch('list_entities', {
            'table': 'components',
            'filters': {'scan_id = 1 OR name': 'OLD'},
        }, self.manager)
        self.assertEqual(injected['error']['code'], 'INVALID_FILTER')

        injected_sort = dispatch('list_entities', {
            'table': 'components',
            'sort': 'name; DROP TABLE components',
        }, self.manager)
        self.assertEqual(injected_sort['error']['code'], 'INVALID_SORT')

    def test_list_entities_traverses_two_pages_with_bound_cursor(self):
        first = dispatch('list_entities', {
            'table': 'components', 'page': {'limit': 1},
        }, self.manager)
        self.assertEqual(first['total'], 2)
        self.assertEqual(len(first['items']), 1)
        self.assertIsNotNone(first['next_cursor'])

        second = dispatch('list_entities', {
            'table': 'components', 'page': {'limit': 1, 'cursor': first['next_cursor']},
        }, self.manager)
        self.assertEqual({row['name'] for row in (first['items'] + second['items'])},
                         {'ace_engine', 'init'})
        self.assertIsNone(second['next_cursor'])

        stale = dispatch('list_entities', {
            'table': 'components',
            'page': {'limit': 1, 'cursor': first['next_cursor']},
            'filters': {'subsystem': 'graphics'},
        }, self.manager)
        self.assertEqual(stale['error']['code'], 'INVALID_CURSOR')

    def test_bad_cursor_is_rejected(self):
        result = dispatch('list_entities', {
            'table': 'components',
            'page': {'cursor': 'not-a-cursor'},
        }, self.manager)
        self.assertEqual(result['error']['code'], 'INVALID_CURSOR')

    def test_aggregate_validates_columns_and_pages(self):
        injected = dispatch('aggregate', {
            'table': 'components',
            'group_by': ['subsystem) OR 1=1'],
        }, self.manager)
        self.assertEqual(injected['error']['code'], 'INVALID_GROUP_BY')

        first = dispatch('aggregate', {
            'table': 'components',
            'group_by': ['subsystem'],
            'page': {'limit': 1},
        }, self.manager)
        self.assertEqual(len(first['groups']), 1)
        self.assertEqual(first['total'], 2)
        self.assertIsNotNone(first['next_cursor'])
        second = dispatch('aggregate', {
            'table': 'components',
            'group_by': ['subsystem'],
            'page': {'limit': 1, 'cursor': first['next_cursor']},
        }, self.manager)
        self.assertIsNone(second['next_cursor'])
        self.assertEqual({g['key'] for g in first['groups'] + second['groups']},
                         {'graphics', 'startup'})

    def test_alias_is_validated_quoted_and_cleaned_on_open_failure(self):
        invalid = dispatch('attach_secondary', {
            'db_path': str(self.db), 'alias': 'bad alias; DROP TABLE x',
        }, self.manager)
        self.assertEqual(invalid['error']['code'], 'INVALID_ALIAS')
        self.assertEqual(dispatch('list_sessions', {}, self.manager)['attached_aliases'], [])

        incomplete_path = self.root / 'incomplete.db'
        connection = sqlite3.connect(incomplete_path)
        from oskm_testing.fixture import create_schema
        create_schema(connection)
        connection.execute(
            'INSERT INTO scans '
            '(id, product, cpu_arch, workspace_root, started_at, finished_at) '
            "VALUES (1, ?, 'arm64', ?, ?, ?)",
            ('synthetic', '/src',
             '2026-11-02T00:00:00Z', None))
        connection.commit()
        connection.close()
        failed = dispatch('attach_secondary', {
            'db_path': str(incomplete_path), 'alias': 'baseline',
        }, self.manager)
        self.assertEqual(failed['error']['code'], 'NO_COMPLETED_SCAN')
        self.assertEqual(
            dispatch('list_sessions', {}, self.manager)['attached_aliases'], [])

    def test_unattached_alias_in_sql_keeps_alias_error(self):
        result = dispatch('sql_query', {
            'sql': 'SELECT name FROM nonexistent_alias.components',
        }, self.manager)
        self.assertEqual(result['error']['code'], 'ALIAS_NOT_ATTACHED')

    def test_get_scan_info_does_not_traceback_for_lost_scan_row(self):
        from oskm_cli.query.errors import QueryError

        session = self.manager.get_active()
        session.scan_row = lambda: (_ for _ in ()).throw(
            QueryError('SCAN_NOT_FOUND', 'scan row disappeared'))
        result = dispatch('get_scan_info', {}, self.manager)
        self.assertEqual(result['error']['code'], 'SCAN_NOT_FOUND')


class ToolReturnContractTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        self.db = create_fixture_db(self.root / 'knowledge.db')
        self.manager = SessionManager()
        opened = dispatch('open_session', {'db_path': str(self.db)}, self.manager)
        self.assertNotIn('error', opened)

    def tearDown(self):
        self.manager.close()
        self.temp.cleanup()

    def test_hdi_preserves_device_and_host_service_names(self):
        result = dispatch('get_hdi', {'service_name': 'HDI_NAME'}, self.manager)
        self.assertNotIn('error', result)
        hdi = result['hdis'][0]
        self.assertEqual(hdi['service_name'], 'HDI_NAME')
        self.assertEqual(hdi['service'], {
            'cfg': '/etc/init/foo.cfg', 'name': 'host_service'})

    def test_gitlink_cache_is_bound_to_database_identity(self):
        reset_cache()
        db_b = create_fixture_db(self.root / 'knowledge-b.db')
        connection = sqlite3.connect(db_b)
        connection.execute(
            'UPDATE repos SET remote_url = ?, head_commit = ? WHERE id = 1',
            ('https://other.test/repo', 'OTHER'))
        connection.commit()
        connection.close()

        manager_a = SessionManager()
        self.assertNotIn('error', dispatch(
            'open_session', {'db_path': str(self.db)}, manager_a))
        link_a = dispatch('git_url', {'path': 'foundation/ace/ace_engine'}, manager_a)
        manager_a.close()

        manager_b = SessionManager()
        self.assertNotIn('error', dispatch(
            'open_session', {'db_path': str(db_b)}, manager_b))
        try:
            link_b = dispatch(
                'git_url', {'path': 'foundation/ace/ace_engine'}, manager_b)
        finally:
            manager_b.close()
        self.assertEqual(link_a['url'], 'https://gitcode.com/openharmony/ace_engine/tree/head1')
        self.assertEqual(link_b['url'], 'https://other.test/repo/tree/OTHER')

    def test_install_module_returns_resolved_and_unresolved_component_id(self):
        resolved = dispatch(
            'get_install_module', {'label': '//base/foo:foo'}, self.manager)
        self.assertEqual(resolved['component_id'], 1)
        self.assertEqual(resolved['component'], 'ace_engine')

        db_b = create_fixture_db(self.root / 'unresolved.db')
        connection = sqlite3.connect(db_b)
        connection.execute('UPDATE install_modules SET component_id = NULL WHERE id = 2')
        connection.commit()
        connection.close()
        manager_b = SessionManager()
        self.assertNotIn('error', dispatch(
            'open_session', {'db_path': str(db_b)}, manager_b))
        try:
            unresolved = dispatch(
                'get_install_module', {'label': '//base/bar:bar'}, manager_b)
        finally:
            manager_b.close()
        self.assertIsNone(unresolved['component_id'])
        self.assertIsNone(unresolved['component'])

    def test_component_repo_is_business_name(self):
        result = dispatch('get_component', {'name': 'ace_engine'}, self.manager)
        self.assertNotIn('error', result)
        self.assertEqual(result['repo'], 'ace')

    def test_service_lookup_contract_by_name_and_whole_cfg(self):
        all_services = dispatch(
            'get_service', {'cfg': '/etc/init/foo.cfg'}, self.manager)
        self.assertEqual(
            [svc['name'] for svc in all_services['services']],
            ['foo', 'host_service'])

        named = dispatch('get_service', {
            'cfg': '/etc/init/foo.cfg', 'name': 'host_service',
        }, self.manager)
        self.assertEqual(named['name'], 'host_service')
        self.assertNotIn('services', named)

        missing = dispatch('get_service', {
            'cfg': '/etc/init/foo.cfg', 'name': 'missing',
        }, self.manager)
        self.assertEqual(missing['error']['code'], 'NOT_FOUND')



class DiffScanContractTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        self.db = create_fixture_db(self.root / 'knowledge.db')
        self.manager = SessionManager()
        opened = dispatch('open_session', {'db_path': str(self.db)}, self.manager)
        self.assertNotIn('error', opened)

    def tearDown(self):
        self.manager.close()
        self.temp.cleanup()

    def test_diff_rejects_missing_and_incomplete_scans(self):
        missing = dispatch('diff_scans', {
            'entity': 'components', 'scan_a': 999, 'scan_b': 1,
        }, self.manager)
        self.assertEqual(missing['error']['code'], 'SCAN_NOT_FOUND')

        connection = sqlite3.connect(self.db)
        connection.execute(
            'INSERT INTO scans '
            '(id, product, cpu_arch, workspace_root, started_at, finished_at) '
            "VALUES (2, ?, 'arm64', ?, ?, ?)",
            ('synthetic', '/src',
             '2026-11-03T00:00:00Z', None))
        connection.commit()
        connection.close()
        incomplete = dispatch('diff_scans', {
            'entity': 'components', 'scan_a': 1, 'scan_b': 2,
        }, self.manager)
        self.assertEqual(incomplete['error']['code'], 'SCAN_INCOMPLETE')

    def test_cross_db_diff_defaults_to_latest_completed_scan(self):
        baseline = create_fixture_db(self.root / 'baseline.db')
        attached = dispatch('attach_secondary', {
            'db_path': str(baseline), 'alias': 'baseline',
        }, self.manager)
        self.assertNotIn('error', attached)

        result = dispatch('diff_scans', {
            'entity': 'components', 'scan_a': 1, 'db_b': 'baseline',
        }, self.manager)
        self.assertNotIn('error', result)
        self.assertEqual(result['scan_b'], 1)
        self.assertEqual(result['added'], [])
        self.assertEqual(result['removed'], [])
        self.assertEqual(result['changed'], [])

    def test_diff_uses_business_identity_not_surrogate_ids(self):
        baseline = create_fixture_db(self.root / 'baseline.db')
        connection = sqlite3.connect(baseline)
        connection.execute('UPDATE repos SET id = 50 WHERE id = 1')
        connection.execute('UPDATE components SET id = 50, repo_id = 50 WHERE id = 1')
        connection.commit()
        connection.close()

        attached = dispatch('attach_secondary', {
            'db_path': str(baseline), 'alias': 'baseline',
        }, self.manager)
        self.assertNotIn('error', attached)
        result = dispatch('diff_scans', {
            'entity': 'components', 'scan_a': 1, 'scan_b': 1,
            'db_b': 'baseline', 'fields': ['subsystem', 'repo'],
        }, self.manager)
        self.assertNotIn('error', result)
        self.assertEqual(result['added'], [])
        self.assertEqual(result['removed'], [])
        self.assertEqual(result['changed'], [])


if __name__ == '__main__':
    unittest.main()
