import contextlib
import io
import json
import os
import sqlite3
import tempfile
import unittest
from types import SimpleNamespace
from unittest import mock
from pathlib import Path

from agentic import cli, runtime


class RuntimeRefreshPolicy(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        self.write_db()
        (self.root / 'interface/sdk-js').mkdir(parents=True)
        (self.root / 'interface/sdk_c').mkdir(parents=True)
        (self.root / 'interface/sdk-js/api.d.ts').write_text(
            'declare const api: string;', encoding='utf-8')
        (self.root / 'interface/sdk_c/api.h').write_text(
            '#pragma once', encoding='utf-8')

    def write_db(self, *, legacy=False):
        path = self.root / 'knowledge.db'
        path.unlink(missing_ok=True)
        connection = sqlite3.connect(path)
        if legacy:
            connection.execute(
                'CREATE TABLE scans (id INTEGER PRIMARY KEY, product TEXT, '
                'workspace_root TEXT, started_at TEXT, finished_at TEXT)')
        else:
            connection.executescript("""
                CREATE TABLE scans (
                    id INTEGER PRIMARY KEY, product TEXT, zone TEXT,
                    cpu_arch TEXT, workspace_root TEXT, started_at TEXT,
                    finished_at TEXT
                );
                CREATE TABLE collector_runs (
                    scan_id INTEGER, collector TEXT, schema_version TEXT,
                    status TEXT, scope TEXT, record_count INTEGER, error TEXT
                );
                CREATE TABLE collector_tables (
                    scan_id INTEGER, collector TEXT, table_name TEXT,
                    is_primary INTEGER, component_column TEXT,
                    service_column TEXT
                );
                CREATE TABLE issues (
                    scan_id INTEGER, collector TEXT, path TEXT, pointer TEXT,
                    code TEXT, severity TEXT
                );
                INSERT INTO scans VALUES (
                    1, 'test', 'blue', 'arm', '/src',
                    '2026-11-02T00:00:00Z', '2026-11-02T00:00:01Z'
                );
            """)
        connection.commit()
        connection.close()

    def tearDown(self):
        self.temp.cleanup()

    def write_state(self, db_date, sdk_date, *, zone='blue', component='dayu600_7885_ai'):
        state = {
            'zone': zone,
            'component': component,
            'db': {'date': db_date, 'path': 'knowledge.db'},
            'sdk': {
                'date': sdk_date,
                'sdk-js': {'path': 'interface/sdk-js'},
                'sdk_c': {'path': 'interface/sdk_c'},
            },
        }
        (self.root / runtime.STATE_NAME).write_text(
            json.dumps(state), encoding='utf-8')

    def test_current_date_and_present_files_do_not_refresh(self):
        self.write_state('20261102', '20261102')
        self.assertFalse(runtime.needs_refresh(
            self.root / 'knowledge.db', today='20261102'))

    def test_previous_date_refreshes_both_artifacts(self):
        self.write_state('20261101', '20261101')
        self.assertTrue(runtime.needs_refresh(
            self.root / 'knowledge.db', today='20261102'))

    def test_missing_sdk_refreshes_even_on_the_same_date(self):
        self.write_state('20261102', '20261102')
        for child in (self.root / 'interface/sdk_c').iterdir():
            child.unlink()
        self.assertTrue(runtime.needs_refresh(
            self.root / 'knowledge.db', today='20261102'))

    def test_incompatible_current_date_database_needs_refresh(self):
        self.write_db(legacy=True)
        self.write_state('20261102', '20261102')
        self.assertTrue(runtime.needs_refresh(
            self.root / 'knowledge.db', today='20261102'))

    def test_unmanaged_database_is_not_refreshed(self):
        self.assertFalse(runtime.needs_refresh(
            self.root / 'knowledge.db', today='20261102'))

    def test_stale_state_invokes_installer_for_today(self):
        self.write_state('20261101', '20261101')
        calls = []

        def installer(root, zone, component, date):
            calls.append((root, zone, component, date))

        runtime.ensure_runtime(
            self.root / 'knowledge.db', today='20261102', installer=installer)

        self.assertEqual(calls, [(
            self.root.resolve(), 'blue', 'dayu600_7885_ai', '20261102')])

    def test_refresh_failure_uses_stale_database_and_starts_retry_window(self):
        self.write_state('20261101', '20261101')
        stderr = io.StringIO()

        def fail(*_args):
            raise RuntimeError('today build unavailable')

        with contextlib.redirect_stderr(stderr):
            refreshed = runtime.ensure_runtime(
                self.root / 'knowledge.db', today='20261102', installer=fail)

        self.assertFalse(refreshed)
        self.assertTrue((self.root / runtime.REFRESH_RETRY_NAME).is_file())
        self.assertIn('继续使用旧 knowledge.db', stderr.getvalue())

    def test_recent_refresh_failure_does_not_retry_on_every_query(self):
        self.write_state('20261101', '20261101')
        (self.root / runtime.REFRESH_RETRY_NAME).touch()

        with mock.patch.object(runtime, 'install_runtime') as install, \
                contextlib.redirect_stderr(io.StringIO()):
            refreshed = runtime.ensure_runtime(
                self.root / 'knowledge.db', today='20261102')

        self.assertFalse(refreshed)
        install.assert_not_called()

    def test_refresh_failure_is_raised_when_no_queryable_database_exists(self):
        self.write_state('20261101', '20261101')
        (self.root / 'knowledge.db').unlink()

        def fail(*_args):
            raise RuntimeError('today build unavailable')

        with self.assertRaisesRegex(RuntimeError, 'build unavailable'):
            runtime.ensure_runtime(
                self.root / 'knowledge.db', today='20261102', installer=fail)

    def test_refresh_failure_is_raised_for_incompatible_stale_database(self):
        self.write_db(legacy=True)
        self.write_state('20261101', '20261101')

        def fail(*_args):
            raise RuntimeError('today build unavailable')

        with self.assertRaisesRegex(RuntimeError, 'build unavailable'):
            runtime.ensure_runtime(
                self.root / 'knowledge.db', today='20261102', installer=fail)

    def test_successful_refresh_clears_previous_retry_marker(self):
        self.write_state('20261101', '20261101')
        marker = self.root / runtime.REFRESH_RETRY_NAME
        marker.touch()
        os.utime(marker, (0, 0))

        def installer(*_args):
            pass

        runtime.ensure_runtime(
            self.root / 'knowledge.db', today='20261102', installer=installer)

        self.assertFalse(marker.exists())


class QueryRefreshesManagedRuntime(unittest.TestCase):
    def test_open_session_refreshes_before_checking_database_exists(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / 'knowledge.db'
            args = SimpleNamespace(db=[str(path)], product=None, scan_id=None)
            manager = mock.Mock()
            manager.open.return_value = {'scan_id': 1}

            def refresh(target):
                target.write_bytes(b'downloaded')

            with mock.patch.object(cli.runtime, 'ensure_runtime',
                                   side_effect=refresh) as ensure, \
                    mock.patch.object(cli, 'SessionManager', return_value=manager):
                self.assertIs(cli.open_session(args), manager)

            ensure.assert_called_once_with(path)
            manager.open.assert_called_once_with(str(path), scan_id=None)

    def test_refresh_failure_is_reported_as_database_error(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / 'knowledge.db'
            args = SimpleNamespace(db=[str(path)], product=None, scan_id=None)
            with mock.patch.object(
                    cli.runtime, 'ensure_runtime',
                    side_effect=RuntimeError('download failed')):
                with self.assertRaises(cli.CliError) as raised:
                    cli.open_session(args)
            self.assertEqual(raised.exception.code, cli.EXIT_NO_DB)
            self.assertIn('download failed', str(raised.exception))

    def test_missing_managed_database_has_blue_zone_install_hint(self):
        path = Path.home() / '.oskm' / 'knowledge.db'
        with mock.patch.object(cli, 'default_zone', return_value='blue'):
            message = cli._database_not_found_message(path)

        self.assertIn('python3 -m agentic.runtime install', message)
        self.assertIn('--component <component>', message)

    def test_missing_managed_database_has_yellow_zone_env_hint(self):
        path = Path.home() / '.oskm' / 'knowledge.db'
        with mock.patch.object(cli, 'default_zone', return_value='yellow'):
            message = cli._database_not_found_message(path)

        self.assertIn('OSKM_YELLOW_DB_BASE_URL', message)
        self.assertIn('agentic/.env', message)

    def test_missing_arbitrary_database_does_not_suggest_automatic_download(self):
        message = cli._database_not_found_message('/tmp/custom/knowledge.db')

        self.assertIn('不会为任意缺失路径自动下载', message)
        self.assertIn('--db ~/.oskm/knowledge.db', message)


if __name__ == '__main__':
    unittest.main()
