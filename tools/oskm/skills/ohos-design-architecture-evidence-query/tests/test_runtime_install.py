# tests -> skill root（oskm_runtime）-> skills -> packages/oskm
# （oskm_schema、oskm_testing）-> packages/oskm/cli（oskm_cli）。
# `unittest discover` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
_SKILL = _HERE.parent
_OSKM = _HERE.parents[2]
for _p in (str(_SKILL), str(_OSKM / 'cli'), str(_OSKM)):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)
import contextlib
import io
import json
import os
import shutil
import sqlite3
import tempfile
import unittest
from pathlib import Path
from unittest import mock

from oskm_runtime import cli_install, install, state
from oskm_runtime.db_download import DownloadError
from oskm_runtime.environment import (
    ENDPOINT_ENV,
    HARMONYOS_CI,
    OPENHARMONY_CI,
    SOURCE_ENV,
)
from oskm_testing.fixture import create_schema, write_minimal_pyz


class RuntimeInstallTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='oskm runtime ')
        self.root = (Path(self.temp.name) / 'runtime').resolve()
        self.root.mkdir()
        self.cwd = mock.patch.object(
            install.Path, 'cwd', return_value=Path(self.temp.name))
        self.cwd.start()
        self.addCleanup(self.cwd.stop)
        self.environment = mock.patch.dict(install.os.environ, {
            SOURCE_ENV: OPENHARMONY_CI,
            ENDPOINT_ENV:
                'https://ci.example.invalid/download',
        })
        self.environment.start()
        self.addCleanup(self.environment.stop)

    def tearDown(self):
        self.temp.cleanup()

    @staticmethod
    def drop_scan_cpu_arch(path):
        connection = sqlite3.connect(path)
        try:
            connection.execute('ALTER TABLE scans DROP COLUMN cpu_arch')
            connection.commit()
        finally:
            connection.close()

    @classmethod
    def write_db(cls, path, *, compatible=True, cpu_arch=True):
        path.unlink(missing_ok=True)
        path.parent.mkdir(parents=True, exist_ok=True)
        connection = sqlite3.connect(path)
        if compatible:
            create_schema(connection)
            connection.execute(
                'INSERT INTO scans '
                '(id, product, workspace_root, started_at, finished_at) '
                'VALUES (1, ?, ?, ?, ?)',
                ('test', '/src',
                 '2026-11-02T00:00:00Z', '2026-11-02T00:00:01Z'))
        else:
            connection.execute(
                'CREATE TABLE scans (id INTEGER PRIMARY KEY, product TEXT, '
                'workspace_root TEXT, started_at TEXT, finished_at TEXT)')
        connection.commit()
        connection.close()
        if compatible and not cpu_arch:
            cls.drop_scan_cpu_arch(path)

    @staticmethod
    def write_sdks(path):
        for name, relative in state.SDK_PATHS.items():
            target = path / relative
            target.mkdir(parents=True, exist_ok=True)
            (target / 'marker.txt').write_text(name, encoding='utf-8')

    def write_bundle(
        self,
        *,
        compatible=True,
        marker='new',
        cpu_arch=True,
    ):
        bundle = Path(self.temp.name) / f'bundle-{marker}'
        bundle.mkdir()
        self.write_db(
            bundle / 'knowledge.db',
            compatible=compatible,
            cpu_arch=cpu_arch,
        )
        for name, relative in state.SDK_PATHS.items():
            target = bundle / relative
            target.mkdir(parents=True)
            (target / 'marker.txt').write_text(
                f'{name}-{marker}', encoding='utf-8')
        # 归档自带 CLI：install 一次装齐 DB + CLI + 两套 SDK。
        write_minimal_pyz(bundle / cli_install.ARTIFACT_NAME)
        return bundle

    def write_source_runtime(self, relative, *, cpu_arch=True):
        source = Path(self.temp.name) / 'source'
        source.mkdir(exist_ok=True)
        (source / '.gn').write_text('buildconfig = "//build/config/BUILDCONFIG.gn"\n')
        self.write_sdks(source)
        self.write_db(
            source / 'out' / relative / 'oskm/knowledge.db',
            cpu_arch=cpu_arch,
        )
        return source

    @staticmethod
    def copy_bundle(source):
        def download(**kwargs):
            shutil.copytree(source, kwargs['output'])
            return Path(kwargs['output']).resolve()
        return download

    def write_state(self, *, date='20261101', source=OPENHARMONY_CI,
                    db=None, sdk=None):
        document = {
            'version': 2,
            'source': source,
            'date': date,
            'updated_at': '2026-11-01T00:00:00+08:00',
        }
        if db is not None:
            document['db'] = db
        if sdk is not None:
            document['sdk'] = sdk
        (self.root / state.STATE_NAME).write_text(
            json.dumps(document), encoding='utf-8')

    def test_install_extracts_complete_runtime_bundle(self):
        bundle = self.write_bundle()
        with mock.patch.object(
                install, 'download_runtime_bundle',
                side_effect=self.copy_bundle(bundle)) as download:
            install.install_runtime(
                self.root, HARMONYOS_CI, '20261102')

        self.assertEqual(
            download.call_args.kwargs['source'], HARMONYOS_CI)
        self.assertEqual(download.call_args.kwargs['date'], '20261102')
        self.assertNotIn('component', download.call_args.kwargs)
        document = json.loads(
            (self.root / state.STATE_NAME).read_text(encoding='utf-8'))
        # version 3 是拆分后写入的（比 2 多一个 `cli` 段）。
        self.assertEqual(document['version'], state.STATE_VERSION)
        self.assertEqual(document['date'], '20261102')
        self.assertEqual(document['source'], HARMONYOS_CI)
        self.assertNotIn('component', document)
        self.assertEqual(document['db']['path'], 'knowledge.db')
        self.assertEqual(len(document['db']['sha256']), 64)
        # CLI 与 knowledge.db 一起落盘：固定文件名、与 DB 并排，状态里记出处。
        self.assertTrue(cli_install.installed_path(self.root).is_file(),
                        '归档自带 CLI，install 之后应在 <root>/oskm-cli.pyz')
        self.assertEqual(document['cli']['path'], cli_install.ARTIFACT_NAME)
        self.assertEqual(len(document['cli']['sha256']), 64)
        for name, relative in state.SDK_PATHS.items():
            self.assertEqual(document['sdk'][name]['path'], relative)
            self.assertEqual(
                (self.root / relative / 'marker.txt').read_text(encoding='utf-8'),
                f'{name}-new')

    def test_local_runtime_missing_cpu_arch_falls_back_to_download(self):
        source = self.write_source_runtime(Path('wukong100'), cpu_arch=False)
        source_db = source / 'out/wukong100/oskm/knowledge.db'
        bundle = self.write_bundle(marker='local-fallback')

        with mock.patch.object(
                install.Path, 'cwd', return_value=source), \
                mock.patch.object(
                    install, 'download_runtime_bundle',
                    side_effect=self.copy_bundle(bundle)) as download:
            install.install_runtime(
                self.root, OPENHARMONY_CI, '20261102')

        download.assert_called_once()
        # 安装器不再改写源码树：缺列的本地 DB 保持原样。
        for path, has_cpu_arch in (
                (self.root / 'knowledge.db', True),
                (source_db, False)):
            connection = sqlite3.connect(path)
            try:
                columns = {
                    row[1] for row in connection.execute(
                        'PRAGMA table_info(scans)')
                }
            finally:
                connection.close()
            self.assertEqual('cpu_arch' in columns, has_cpu_arch)

    def test_install_tolerates_an_archive_without_the_cli(self):
        """归档里暂时没有 `oskm-cli.pyz` 也要能装。

        服务器端正在往 `knowledge.tar.gz` 里补 CLI，补完之前旧归档必须照样
        能装——否则这次改动会让所有人装不上。缺 CLI 时：
          · DB 与两套 SDK 照常安装；
          · 已有的 CLI（如果之前装过）原样保留，不被清掉；
          · 状态里不写 `cli` 段（没装就没装，不假装）。
        """
        bundle = self.write_bundle(marker='no-cli')
        (bundle / cli_install.ARTIFACT_NAME).unlink()

        with mock.patch.object(
                install, 'download_runtime_bundle',
                side_effect=self.copy_bundle(bundle)):
            install.install_runtime(self.root, HARMONYOS_CI, '20261102')

        self.assertTrue((self.root / 'knowledge.db').is_file())
        for relative in state.SDK_PATHS.values():
            self.assertTrue((self.root / relative).is_dir(), relative)
        self.assertFalse(cli_install.installed_path(self.root).exists())
        document = json.loads(
            (self.root / state.STATE_NAME).read_text(encoding='utf-8'))
        self.assertNotIn('cli', document)

    def test_install_prefers_one_level_source_runtime_without_download(self):
        source = self.write_source_runtime(Path('wukong100'))
        bundle = self.write_bundle(marker='fallback')

        with mock.patch.object(
                install.Path, 'cwd', return_value=source), \
                mock.patch.object(
                    install, 'download_runtime_bundle',
                    side_effect=self.copy_bundle(bundle)) as download:
            install.install_runtime(
                self.root, OPENHARMONY_CI, '20261102')

        download.assert_not_called()
        self.assertTrue((self.root / 'knowledge.db').is_file())
        for relative in state.SDK_PATHS.values():
            self.assertTrue((self.root / relative / 'marker.txt').is_file())
            self.assertTrue((source / relative / 'marker.txt').is_file())
        self.assertTrue(
            (source / 'out/wukong100/oskm/knowledge.db').is_file())
        document = json.loads(
            (self.root / state.STATE_NAME).read_text(encoding='utf-8'))
        self.assertEqual(document['source'], 'local')
        self.assertEqual(document['source_root'], str(source.resolve()))

    def test_install_prefers_two_level_source_runtime_without_download(self):
        source = self.write_source_runtime(
            Path('generic_generic_arm_64only/general_all_phone_standard'))
        bundle = self.write_bundle(marker='fallback')

        with mock.patch.object(
                install.Path, 'cwd', return_value=source), \
                mock.patch.object(
                    install, 'download_runtime_bundle',
                    side_effect=self.copy_bundle(bundle)) as download:
            install.install_runtime(
                self.root, HARMONYOS_CI, '20261102')

        download.assert_not_called()
        self.assertTrue((self.root / 'knowledge.db').is_file())
        for relative in state.SDK_PATHS.values():
            self.assertTrue((self.root / relative / 'marker.txt').is_file())

    def test_install_prefers_newest_source_runtime_db(self):
        source = self.write_source_runtime(Path('one-level-old'))
        two_level_db = (
            source / 'out/generic_generic_arm_64only/'
            'general_all_phone_standard/oskm/knowledge.db')
        self.write_db(two_level_db)
        for path, product, mtime_ns in (
                (source / 'out/one-level-old/oskm/knowledge.db', 'old', 1_000),
                (two_level_db, 'new', 2_000)):
            connection = sqlite3.connect(path)
            connection.execute('UPDATE scans SET product = ?', (product,))
            connection.commit()
            connection.close()
            os.utime(path, ns=(mtime_ns, mtime_ns))

        with mock.patch.object(
                install.Path, 'cwd', return_value=source), \
                mock.patch.object(install, 'download_runtime_bundle') as download:
            install.install_runtime(
                self.root, HARMONYOS_CI, '20261102')

        download.assert_not_called()
        connection = sqlite3.connect(self.root / 'knowledge.db')
        self.assertEqual(
            connection.execute('SELECT product FROM scans').fetchone()[0],
            'new')
        connection.close()

    def test_non_source_directory_falls_back_to_download(self):
        source = self.write_source_runtime(Path('wukong100'))
        (source / '.gn').unlink()
        bundle = self.write_bundle(marker='fallback')

        with mock.patch.object(
                install.Path, 'cwd', return_value=source), \
                mock.patch.object(
                    install, 'download_runtime_bundle',
                    side_effect=self.copy_bundle(bundle)) as download:
            install.install_runtime(
                self.root, OPENHARMONY_CI, '20261102')

        download.assert_called_once()

    def test_source_root_requires_both_interface_sdk_directories(self):
        source = self.write_source_runtime(Path('wukong100'))
        self.assertTrue(install.is_openharmony_source_root(source))

        for relative in state.SDK_PATHS.values():
            with self.subTest(relative=relative):
                shutil.rmtree(source / relative)
                self.assertFalse(install.is_openharmony_source_root(source))
                self.write_sdks(source)

    def test_install_falls_back_when_source_runtime_sdk_is_incomplete(self):
        source = self.write_source_runtime(Path('wukong100'))
        shutil.rmtree(source / 'interface/sdk_c')
        bundle = self.write_bundle(marker='fallback')

        with mock.patch.object(
                install.Path, 'cwd', return_value=source), \
                mock.patch.object(
                    install, 'download_runtime_bundle',
                    side_effect=self.copy_bundle(bundle)) as download:
            install.install_runtime(
                self.root, OPENHARMONY_CI, '20261102')

        download.assert_called_once()

    def test_install_falls_back_when_source_runtime_db_schema_is_incompatible(self):
        source = self.write_source_runtime(Path('wukong100'))
        self.write_db(
            source / 'out/wukong100/oskm/knowledge.db', compatible=False)
        bundle = self.write_bundle(marker='fallback')

        with mock.patch.object(
                install.Path, 'cwd', return_value=source), \
                mock.patch.object(
                    install, 'download_runtime_bundle',
                    side_effect=self.copy_bundle(bundle)) as download:
            install.install_runtime(
                self.root, OPENHARMONY_CI, '20261102')

        download.assert_called_once()

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
                install, 'download_runtime_bundle',
                side_effect=self.copy_bundle(bundle)):
            install.install_runtime(
                self.root, HARMONYOS_CI, '20261102', download_sdk=False)

        self.assertEqual(old_marker.read_text(encoding='utf-8'), 'keep-sdk')
        document = json.loads(
            (self.root / state.STATE_NAME).read_text(encoding='utf-8'))
        self.assertEqual(document['db']['date'], '20261102')
        self.assertEqual(document['sdk'], old_sdk)

    def test_skip_db_installs_only_sdk_and_preserves_db_state(self):
        existing_db = self.root / 'knowledge.db'
        existing_db.write_bytes(b'keep-db')
        old_db = {'date': '20261101', 'path': 'knowledge.db', 'sha256': 'old'}
        self.write_sdks(self.root)
        self.write_state(db=old_db)
        bundle = self.write_bundle(marker='skip-db')

        with mock.patch.object(
                install, 'download_runtime_bundle',
                side_effect=self.copy_bundle(bundle)):
            install.install_runtime(
                self.root, HARMONYOS_CI, '20261102', download_db=False)

        self.assertEqual(existing_db.read_bytes(), b'keep-db')
        document = json.loads(
            (self.root / state.STATE_NAME).read_text(encoding='utf-8'))
        self.assertEqual(document['db'], old_db)
        self.assertEqual(document['sdk']['date'], '20261102')

    def test_schema_failure_preserves_existing_runtime(self):
        self.write_db(self.root / 'knowledge.db')
        self.write_sdks(self.root)
        old_document = {
            'version': state.STATE_VERSION,
            'date': '20261101',
            'source': HARMONYOS_CI,
            'db': {'date': '20261101', 'path': 'knowledge.db'},
            'sdk': {
                'date': '20261101',
                'sdk-js': {'path': 'interface/sdk-js'},
                'sdk_c': {'path': 'interface/sdk_c'},
            },
        }
        state_file = self.root / state.STATE_NAME
        state_file.write_text(json.dumps(old_document), encoding='utf-8')
        old_db = (self.root / 'knowledge.db').read_bytes()
        old_sdk = (self.root / 'interface/sdk-js/marker.txt').read_text(
            encoding='utf-8')
        bundle = self.write_bundle(compatible=False)

        with mock.patch.object(
                install, 'download_runtime_bundle',
                side_effect=self.copy_bundle(bundle)):
            with self.assertRaisesRegex(ValueError, 'schema'):
                install.install_runtime(
                    self.root, HARMONYOS_CI, '20261102')

        self.assertEqual((self.root / 'knowledge.db').read_bytes(), old_db)
        self.assertEqual(
            (self.root / 'interface/sdk-js/marker.txt').read_text(encoding='utf-8'),
            old_sdk)
        self.assertEqual(json.loads(state_file.read_text(encoding='utf-8')),
                         old_document)

    def test_download_failure_preserves_existing_runtime(self):
        self.write_db(self.root / 'knowledge.db')
        self.write_sdks(self.root)
        old_db = (self.root / 'knowledge.db').read_bytes()
        old_sdk = (self.root / 'interface/sdk-js/marker.txt').read_text(
            encoding='utf-8')
        with mock.patch.object(
                install, 'download_runtime_bundle',
                side_effect=DownloadError('network down')):
            with self.assertRaisesRegex(DownloadError, 'network down'):
                install.install_runtime(
                    self.root, HARMONYOS_CI, '20261102')

        self.assertEqual((self.root / 'knowledge.db').read_bytes(), old_db)
        self.assertEqual(
            (self.root / 'interface/sdk-js/marker.txt').read_text(encoding='utf-8'),
            old_sdk)

    def test_state_install_failure_rolls_back_existing_runtime(self):
        self.write_db(self.root / 'knowledge.db')
        self.write_sdks(self.root)
        old_document = {
            'version': state.STATE_VERSION,
            'date': '20261101',
            'source': HARMONYOS_CI,
            'db': {'date': '20261101', 'path': 'knowledge.db'},
            'sdk': {
                'date': '20261101',
                'sdk-js': {'path': 'interface/sdk-js'},
                'sdk_c': {'path': 'interface/sdk_c'},
            },
        }
        state_file = self.root / state.STATE_NAME
        state_file.write_text(json.dumps(old_document), encoding='utf-8')
        old_db = (self.root / 'knowledge.db').read_bytes()
        old_sdk = (self.root / 'interface/sdk-js/marker.txt').read_text(
            encoding='utf-8')
        bundle = self.write_bundle(marker='state-failure')
        real_replace = install.os.replace
        failed = False

        def fail_state_replace(source, destination):
            nonlocal failed
            if Path(destination) == state_file:
                if not failed:
                    failed = True
                    raise OSError('state replace failed')
            return real_replace(source, destination)

        with mock.patch.object(
                install, 'download_runtime_bundle',
                side_effect=self.copy_bundle(bundle)), \
                mock.patch.object(
                    install.os, 'replace', side_effect=fail_state_replace):
            with self.assertRaisesRegex(OSError, 'state replace failed'):
                install.install_runtime(
                    self.root, HARMONYOS_CI, '20261102')

        self.assertEqual((self.root / 'knowledge.db').read_bytes(), old_db)
        self.assertEqual(
            (self.root / 'interface/sdk-js/marker.txt').read_text(encoding='utf-8'),
            old_sdk)
        self.assertEqual(json.loads(state_file.read_text(encoding='utf-8')),
                         old_document)

    # `test_ensure_runtime_refreshes_from_bundle` 与
    # `test_ensure_runtime_rejects_state_without_source` 于 2026-11-12 删除：
    # `install.ensure_runtime()` 与 `install.state_source()` 随查询透传一起没了
    # （刷新不再挂在每条查询前面，改由显式 `bootstrap.py refresh` 触发）。
    # 前者的覆盖搬到了 `test_bootstrap.py::RefreshCommand::test_stale_runtime_is_reinstalled`；
    # 后者不再有意义——`install_runtime` 的来源取自 `--source` / 环境变量，
    # 状态文件里的 `source` 只用于"是不是本地源码运行时"这一个判断，
    # 缺了它 install 照常工作（由 --skip-db / --skip-sdk 的保留旧状态用例覆盖）。


if __name__ == '__main__':
    unittest.main()
