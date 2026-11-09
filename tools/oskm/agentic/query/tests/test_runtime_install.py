import contextlib
import importlib
import io
import json
import shutil
import sqlite3
import tempfile
import unittest
from pathlib import Path
from unittest import mock

from agentic import runtime
from agentic.db_download import DownloadError
from agentic.environment import YELLOW_DB_BASE_ENV


COMPATIBLE_SCHEMA = """
    CREATE TABLE scans (
        id INTEGER PRIMARY KEY, product TEXT, zone TEXT, cpu_arch TEXT,
        workspace_root TEXT, started_at TEXT, finished_at TEXT
    );
    CREATE TABLE collector_runs (
        scan_id INTEGER, collector TEXT, schema_version TEXT,
        status TEXT, scope TEXT, record_count INTEGER, error TEXT
    );
    CREATE TABLE collector_tables (
        scan_id INTEGER, collector TEXT, table_name TEXT,
        is_primary INTEGER, component_column TEXT, service_column TEXT
    );
    CREATE TABLE issues (
        scan_id INTEGER, collector TEXT, path TEXT, pointer TEXT,
        code TEXT, severity TEXT
    );
    INSERT INTO scans VALUES (
        1, 'test', 'yellow', 'arm64', '/src',
        '2026-11-02T00:00:00Z', '2026-11-02T00:00:01Z'
    );
"""


class RuntimeInstallTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='oskm runtime ')
        self.root = (Path(self.temp.name) / 'runtime').resolve()
        self.root.mkdir()
        self.environment = mock.patch.dict(runtime.os.environ, {
            YELLOW_DB_BASE_ENV:
                'https://yellow-db.example.invalid/mirror',
        })
        self.environment.start()
        self.addCleanup(self.environment.stop)

    def tearDown(self):
        self.temp.cleanup()

    @staticmethod
    def write_db(path, *, compatible=True):
        path.parent.mkdir(parents=True, exist_ok=True)
        connection = sqlite3.connect(path)
        if compatible:
            connection.executescript(COMPATIBLE_SCHEMA)
        else:
            connection.execute(
                'CREATE TABLE scans (id INTEGER PRIMARY KEY, product TEXT, '
                'workspace_root TEXT, started_at TEXT, finished_at TEXT)')
        connection.commit()
        connection.close()

    @staticmethod
    def write_sdks(path):
        for name, relative in runtime.SDK_PATHS.items():
            target = path / relative
            target.mkdir(parents=True, exist_ok=True)
            (target / 'marker.txt').write_text(name, encoding='utf-8')

    def write_bundle(self, *, compatible=True, marker='new'):
        bundle = Path(self.temp.name) / f'bundle-{marker}'
        bundle.mkdir()
        self.write_db(bundle / 'knowledge.db', compatible=compatible)
        for name, relative in runtime.SDK_PATHS.items():
            target = bundle / relative
            target.mkdir(parents=True)
            (target / 'marker.txt').write_text(
                f'{name}-{marker}', encoding='utf-8')
        return bundle

    @staticmethod
    def copy_bundle(source):
        def download(**kwargs):
            shutil.copytree(source, kwargs['output'])
            return Path(kwargs['output']).resolve()
        return download

    def write_state(self, *, date='20261101', zone='yellow', component='',
                    db=None, sdk=None):
        state = {
            'version': 2,
            'date': date,
            'zone': zone,
            'component': component,
            'updated_at': '2026-11-01T00:00:00+08:00',
        }
        if db is not None:
            state['db'] = db
        if sdk is not None:
            state['sdk'] = sdk
        (self.root / runtime.STATE_NAME).write_text(
            json.dumps(state), encoding='utf-8')

    def test_install_extracts_complete_runtime_bundle(self):
        bundle = self.write_bundle()
        with mock.patch.object(
                runtime, 'download_runtime_bundle',
                side_effect=self.copy_bundle(bundle)) as download:
            runtime.install_runtime(
                self.root, 'yellow', '', '20261102')

        self.assertEqual(download.call_args.kwargs['zone'], 'yellow')
        self.assertEqual(download.call_args.kwargs['date'], '20261102')
        self.assertIsNone(download.call_args.kwargs['component'])
        state = json.loads(
            (self.root / runtime.STATE_NAME).read_text(encoding='utf-8'))
        self.assertEqual(state['version'], 2)
        self.assertEqual(state['date'], '20261102')
        self.assertEqual(state['zone'], 'yellow')
        self.assertEqual(state['component'], '')
        self.assertEqual(state['db']['path'], 'knowledge.db')
        self.assertEqual(len(state['db']['sha256']), 64)
        for name, relative in runtime.SDK_PATHS.items():
            self.assertEqual(state['sdk'][name]['path'], relative)
            self.assertEqual(
                (self.root / relative / 'marker.txt').read_text(encoding='utf-8'),
                f'{name}-new')

    def test_skip_sdk_installs_only_db_and_preserves_sdk_state(self):
        self.write_sdks(self.root)
        old_sdk = {
            'date': '20261101',
            'sdk-js': {'path': 'interface/sdk-js'},
            'sdk_c': {'path': 'interface/sdk_c'},
        }
        self.write_state(sdk=old_sdk)
        old_marker = self.root / 'interface/sdk-js/marker.txt'
        old_marker.write_text('keep-sdk', encoding='utf-8')
        bundle = self.write_bundle(marker='skip-sdk')

        with mock.patch.object(
                runtime, 'download_runtime_bundle',
                side_effect=self.copy_bundle(bundle)):
            runtime.install_runtime(
                self.root, 'yellow', '', '20261102', download_sdk=False)

        self.assertEqual(old_marker.read_text(encoding='utf-8'), 'keep-sdk')
        state = json.loads(
            (self.root / runtime.STATE_NAME).read_text(encoding='utf-8'))
        self.assertEqual(state['db']['date'], '20261102')
        self.assertEqual(state['sdk'], old_sdk)

    def test_skip_db_installs_only_sdk_and_preserves_db_state(self):
        existing_db = self.root / 'knowledge.db'
        existing_db.write_bytes(b'keep-db')
        old_db = {'date': '20261101', 'path': 'knowledge.db', 'sha256': 'old'}
        self.write_sdks(self.root)
        self.write_state(db=old_db)
        bundle = self.write_bundle(marker='skip-db')

        with mock.patch.object(
                runtime, 'download_runtime_bundle',
                side_effect=self.copy_bundle(bundle)):
            runtime.install_runtime(
                self.root, 'yellow', '', '20261102', download_db=False)

        self.assertEqual(existing_db.read_bytes(), b'keep-db')
        state = json.loads(
            (self.root / runtime.STATE_NAME).read_text(encoding='utf-8'))
        self.assertEqual(state['db'], old_db)
        self.assertEqual(state['sdk']['date'], '20261102')

    def test_schema_failure_preserves_existing_runtime(self):
        self.write_db(self.root / 'knowledge.db')
        self.write_sdks(self.root)
        old_state = {
            'version': 2,
            'date': '20261101',
            'zone': 'yellow',
            'component': '',
            'db': {'date': '20261101', 'path': 'knowledge.db'},
            'sdk': {
                'date': '20261101',
                'sdk-js': {'path': 'interface/sdk-js'},
                'sdk_c': {'path': 'interface/sdk_c'},
            },
        }
        state_file = self.root / runtime.STATE_NAME
        state_file.write_text(json.dumps(old_state), encoding='utf-8')
        old_db = (self.root / 'knowledge.db').read_bytes()
        old_sdk = (self.root / 'interface/sdk-js/marker.txt').read_text(
            encoding='utf-8')
        bundle = self.write_bundle(compatible=False)

        with mock.patch.object(
                runtime, 'download_runtime_bundle',
                side_effect=self.copy_bundle(bundle)):
            with self.assertRaisesRegex(ValueError, 'schema'):
                runtime.install_runtime(
                    self.root, 'yellow', '', '20261102')

        self.assertEqual((self.root / 'knowledge.db').read_bytes(), old_db)
        self.assertEqual(
            (self.root / 'interface/sdk-js/marker.txt').read_text(encoding='utf-8'),
            old_sdk)
        self.assertEqual(json.loads(state_file.read_text(encoding='utf-8')),
                         old_state)

    def test_download_failure_preserves_existing_runtime(self):
        self.write_db(self.root / 'knowledge.db')
        self.write_sdks(self.root)
        old_db = (self.root / 'knowledge.db').read_bytes()
        old_sdk = (self.root / 'interface/sdk-js/marker.txt').read_text(
            encoding='utf-8')
        with mock.patch.object(
                runtime, 'download_runtime_bundle',
                side_effect=DownloadError('network down')):
            with self.assertRaisesRegex(DownloadError, 'network down'):
                runtime.install_runtime(
                    self.root, 'yellow', '', '20261102')

        self.assertEqual((self.root / 'knowledge.db').read_bytes(), old_db)
        self.assertEqual(
            (self.root / 'interface/sdk-js/marker.txt').read_text(encoding='utf-8'),
            old_sdk)

    def test_state_install_failure_rolls_back_existing_runtime(self):
        self.write_db(self.root / 'knowledge.db')
        self.write_sdks(self.root)
        old_state = {
            'version': 2,
            'date': '20261101',
            'zone': 'yellow',
            'component': '',
            'db': {'date': '20261101', 'path': 'knowledge.db'},
            'sdk': {
                'date': '20261101',
                'sdk-js': {'path': 'interface/sdk-js'},
                'sdk_c': {'path': 'interface/sdk_c'},
            },
        }
        state_file = self.root / runtime.STATE_NAME
        state_file.write_text(json.dumps(old_state), encoding='utf-8')
        old_db = (self.root / 'knowledge.db').read_bytes()
        old_sdk = (self.root / 'interface/sdk-js/marker.txt').read_text(
            encoding='utf-8')
        bundle = self.write_bundle(marker='state-failure')
        real_replace = runtime.os.replace
        failed = False

        def fail_state_replace(source, destination):
            nonlocal failed
            if Path(destination) == state_file:
                if not failed:
                    failed = True
                    raise OSError('state replace failed')
            return real_replace(source, destination)

        with mock.patch.object(
                runtime, 'download_runtime_bundle',
                side_effect=self.copy_bundle(bundle)), \
                mock.patch.object(
                    runtime.os, 'replace', side_effect=fail_state_replace):
            with self.assertRaisesRegex(OSError, 'state replace failed'):
                runtime.install_runtime(
                    self.root, 'yellow', '', '20261102')

        self.assertEqual((self.root / 'knowledge.db').read_bytes(), old_db)
        self.assertEqual(
            (self.root / 'interface/sdk-js/marker.txt').read_text(encoding='utf-8'),
            old_sdk)
        self.assertEqual(json.loads(state_file.read_text(encoding='utf-8')),
                         old_state)

    def test_doctor_reports_ready_without_git(self):
        stdout = io.StringIO()
        with contextlib.redirect_stdout(stdout):
            code = runtime.main(['doctor'])

        output = stdout.getvalue()
        self.assertEqual(code, 0, output)
        self.assertIn('Python:', output)
        self.assertIn('agentic, oskm_schema (OK)', output)
        self.assertIn('Yellow:', output)
        self.assertIn('Zone:   blue (默认区域)', output)
        self.assertIn(f'{YELLOW_DB_BASE_ENV}=已配置', output)
        self.assertIn('单个 knowledge.tar.gz', output)
        self.assertIn('不再需要 Git', output)
        self.assertNotIn('yellow-db.example.invalid', output)

    def test_doctor_rejects_python_older_than_310(self):
        stdout = io.StringIO()
        with mock.patch.object(runtime.sys, 'version_info', (3, 9, 6)), \
                contextlib.redirect_stdout(stdout):
            code = runtime.main(['doctor'])

        output = stdout.getvalue()
        self.assertEqual(code, 1, output)
        self.assertIn('Python 3.10+', output)

    def test_doctor_reports_module_import_failure_and_pythonpath_hint(self):
        real_import = importlib.import_module

        def import_module(name):
            if name == 'oskm_schema':
                raise ImportError('No module named oskm_schema')
            return real_import(name)

        stdout = io.StringIO()
        with mock.patch.object(
                runtime.importlib, 'import_module', side_effect=import_module), \
                contextlib.redirect_stdout(stdout):
            code = runtime.main(['doctor'])

        output = stdout.getvalue()
        self.assertEqual(code, 1, output)
        self.assertIn('oskm_schema (FAIL: No module named oskm_schema)', output)
        self.assertIn('PYTHONPATH=<...>/oskm', output)

    def test_doctor_rejects_yellow_zone_without_url(self):
        stdout = io.StringIO()
        with mock.patch.dict(runtime.os.environ, {
                'OSKM_DEFAULT_ZONE': 'yellow',
                YELLOW_DB_BASE_ENV: '',
        }, clear=True), contextlib.redirect_stdout(stdout):
            code = runtime.main(['doctor'])

        output = stdout.getvalue()
        self.assertEqual(code, 1, output)
        self.assertIn('Zone:   yellow (默认区域)', output)
        self.assertIn(f'{YELLOW_DB_BASE_ENV}=未配置', output)
        self.assertIn('默认区域为 yellow 时必须配置', output)

    def test_doctor_allows_blue_zone_without_yellow_url(self):
        stdout = io.StringIO()
        with mock.patch.dict(runtime.os.environ, {
                'OSKM_DEFAULT_ZONE': 'blue',
                YELLOW_DB_BASE_ENV: '',
        }, clear=True), contextlib.redirect_stdout(stdout):
            code = runtime.main(['doctor'])

        output = stdout.getvalue()
        self.assertEqual(code, 0, output)
        self.assertIn(f'{YELLOW_DB_BASE_ENV}=未配置', output)

    def test_cli_install_defaults_to_today(self):
        with mock.patch.object(runtime, 'today', return_value='20261102'), \
                mock.patch.object(runtime, 'install_runtime') as install:
            code = runtime.main([
                'install', '--zone', 'yellow', '--runtime-root', str(self.root),
                '--skip-db',
            ])
        self.assertEqual(code, 0)
        install.assert_called_once_with(
            self.root, 'yellow', '', '20261102', download_db=False,
            download_sdk=True)

    def test_cli_install_uses_blue_when_zone_is_omitted(self):
        with mock.patch.dict(runtime.os.environ, {}, clear=False), \
                mock.patch.object(runtime, 'install_runtime') as install:
            runtime.os.environ.pop('OSKM_DEFAULT_ZONE', None)
            code = runtime.main([
                'install', '--runtime-root', str(self.root),
                '--date', '20261102', '--component', 'dayu600_7885_ai',
                '--skip-db',
            ])
        self.assertEqual(code, 0)
        install.assert_called_once_with(
            self.root, 'blue', 'dayu600_7885_ai', '20261102',
            download_db=False, download_sdk=True)

    def test_cli_rejects_invalid_zone_and_component_before_download(self):
        cases = (
            (['--zone', 'blue'], '蓝区必须指定 --component'),
            (['--zone', 'yellow', '--component', 'wrong'],
             '黄区不接受 --component'),
        )
        for extra, message in cases:
            with self.subTest(extra=extra), \
                    mock.patch.object(runtime, 'download_runtime_bundle') as download:
                stderr = io.StringIO()
                with contextlib.redirect_stderr(stderr):
                    code = runtime.main([
                        'install', *extra, '--runtime-root', str(self.root),
                        '--date', '20261102',
                    ])
                self.assertNotEqual(code, 0)
                self.assertIn(message, stderr.getvalue())
                download.assert_not_called()

    def test_cli_rejects_both_skip_flags(self):
        stderr = io.StringIO()
        with contextlib.redirect_stderr(stderr):
            with self.assertRaises(SystemExit) as raised:
                runtime.main([
                    'install', '--zone', 'yellow', '--runtime-root',
                    str(self.root), '--skip-db', '--skip-sdk',
                ])
        self.assertEqual(raised.exception.code, 2)
        self.assertIn('not allowed with argument', stderr.getvalue())

    def test_ensure_runtime_refreshes_from_bundle(self):
        self.write_db(self.root / 'knowledge.db')
        self.write_sdks(self.root)
        self.write_state(
            date='20261101',
            db={'date': '20261101', 'path': 'knowledge.db'},
            sdk={
                'date': '20261101',
                'sdk-js': {'path': 'interface/sdk-js'},
                'sdk_c': {'path': 'interface/sdk_c'},
            })
        bundle = self.write_bundle(marker='refresh')

        with mock.patch.object(
                runtime, 'download_runtime_bundle',
                side_effect=self.copy_bundle(bundle)) as download:
            refreshed = runtime.ensure_runtime(
                self.root / 'knowledge.db', today='20261102')

        self.assertTrue(refreshed)
        download.assert_called_once()
        state = json.loads(
            (self.root / runtime.STATE_NAME).read_text(encoding='utf-8'))
        self.assertEqual(state['date'], '20261102')
        self.assertEqual(state['sdk']['date'], '20261102')


if __name__ == '__main__':
    unittest.main()
