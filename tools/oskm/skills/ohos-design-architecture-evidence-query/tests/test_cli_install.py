# pylint: disable=wrong-import-position  # tests adjust sys.path before local imports
"""CLI 产物的三级定位、结构校验与载入。

**CLI 与 `knowledge.db` 同类：固定文件名 `oskm-cli.pyz`，不记版本、不锁摘要。**
所以这里没有"pin 漂移"这一类用例——那套机制（`cli_pin.json` + 源码树版本必须
等于 pin 否则硬失败）已于 2026-11-12 删除。完整性改成**结构校验**
（`verify_pyz`：shebang + 是 zip + 有 `__main__.py` 与 `oskm_cli/cli.py` +
CRC 完好），与 DB 那侧的 `verify_sqlite`（文件头 + `PRAGMA integrity_check`）
同一思路：校"它是不是一个能用的产物"，不校"它是不是某一次构建的那一份"。
"""
# tests -> skill root（oskm_runtime）-> skills -> packages/oskm
# （oskm_schema、oskm_testing）-> packages/oskm/cli（oskm_cli）。
# `unittest discover` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
_SKILL = _HERE.parent
_OSKM = _HERE.parents[2]
for _p in (str(_SKILL), str(_OSKM / 'cli'), str(_OSKM),
           str(_OSKM / 'cli' / 'scripts')):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)
import hashlib
import io
import json
import subprocess
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path
from unittest import mock

import build_cli

from oskm_runtime import cli_install, state
from oskm_runtime.environment import CLI_PATH_ENV


def fake_pyz(path: Path, payload: bytes = b'not really a zipapp') -> Path:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(payload)
    return path


def real_pyz(path: Path) -> Path:
    """A genuinely runnable pyz, built by the CLI's own builder."""
    path.parent.mkdir(parents=True, exist_ok=True)
    return Path(build_cli.build_pyz(path)['archive'])


def sha(path: Path) -> str:
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


class ArtifactNaming(unittest.TestCase):
    """固定名是这次的**核心决定**，值得单独钉住。"""

    def test_the_artifact_name_carries_no_version(self):
        self.assertEqual(cli_install.artifact_name(), 'oskm-cli.pyz')
        self.assertEqual(build_cli.artifact_name(), 'oskm-cli.pyz')
        self.assertNotIn(build_cli.cli_version(), cli_install.ARTIFACT_NAME)

    def test_it_lives_next_to_knowledge_db(self):
        root = Path('/tmp/some-root')
        self.assertEqual(cli_install.installed_path(root),
                         root / 'oskm-cli.pyz')
        self.assertEqual(cli_install.installed_path(root).parent, root)

    def test_there_is_no_version_pin_anywhere(self):
        """`cli_pin.json` 与相关 API 一并删除；残留一半比没有更坏。"""
        self.assertFalse((_SKILL / 'oskm_runtime' / 'cli_pin.json').exists())
        for gone in ('PIN_FILE', 'read_pin', 'pinned_version', 'CLI_DIR_NAME',
                     'uninstall_stale_cli', '_verify_sha256'):
            self.assertFalse(hasattr(cli_install, gone), gone)
        self.assertFalse(hasattr(build_cli, 'update_pin'))


class VerifyPyzTests(unittest.TestCase):
    """结构校验：挡住"下载回来一个 200 的 HTML 错误页"这类最常见失败。"""

    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='oskm verify ')
        self.root = Path(self.temp.name)

    def tearDown(self):
        self.temp.cleanup()

    def test_a_real_pyz_passes(self):
        archive = real_pyz(self.root / 'oskm-cli.pyz')
        cli_install.verify_pyz(archive)          # 不抛即通过

    def test_missing_shebang_is_rejected(self):
        path = fake_pyz(self.root / 'x.pyz', b'PK\x03\x04not a zipapp either')
        with self.assertRaisesRegex(cli_install.CliInstallError, 'shebang'):
            cli_install.verify_pyz(path)

    def test_html_error_page_is_rejected(self):
        path = fake_pyz(self.root / 'x.pyz',
                        b'#!/usr/bin/env python3\n<html>404 Not Found</html>')
        with self.assertRaisesRegex(cli_install.CliInstallError, '不是有效 zip'):
            cli_install.verify_pyz(path)

    def test_a_zip_without_the_query_layer_is_rejected(self):
        path = self.root / 'x.pyz'
        buffer = io.BytesIO()
        with zipfile.ZipFile(buffer, 'w') as archive:
            archive.writestr('__main__.py', 'print("hi")\n')
        path.write_bytes(b'#!/usr/bin/env python3\n' + buffer.getvalue())
        with self.assertRaisesRegex(cli_install.CliInstallError, '缺少必需条目'):
            cli_install.verify_pyz(path)

    def test_a_truncated_archive_is_rejected(self):
        archive = real_pyz(self.root / 'oskm-cli.pyz')
        truncated = self.root / 'truncated.pyz'
        truncated.write_bytes(archive.read_bytes()[: len(archive.read_bytes()) // 2])
        with self.assertRaises(cli_install.CliInstallError):
            cli_install.verify_pyz(truncated)

    def test_an_unreadable_path_is_reported(self):
        with self.assertRaisesRegex(cli_install.CliInstallError, '不可读'):
            cli_install.verify_pyz(self.root / 'does-not-exist.pyz')

    def test_version_is_readable_from_the_archive(self):
        archive = real_pyz(self.root / 'oskm-cli.pyz')
        self.assertEqual(cli_install.pyz_version(archive), build_cli.cli_version())

    def test_version_of_a_non_archive_is_unknown_not_an_error(self):
        self.assertEqual(cli_install.pyz_version(self.root / 'nope.pyz'),
                         'unknown')


class SourceTreeDiscovery(unittest.TestCase):
    def test_finds_the_checkout_from_inside_the_skill(self):
        self.assertEqual(cli_install.find_source_tree(Path(cli_install.__file__)),
                         _OSKM.resolve())

    def test_returns_none_outside_a_checkout(self):
        with tempfile.TemporaryDirectory() as temp:
            self.assertIsNone(cli_install.find_source_tree(Path(temp)))

    def test_source_tree_location_exposes_both_packages(self):
        """`oskm_cli` 在 cli/，`oskm_schema` 在 packages/oskm/——两个都要。"""
        location = cli_install._location_from_source()
        self.assertEqual(location.kind, cli_install.SOURCE)
        self.assertIn(str(_OSKM / 'cli'), location.sys_path)
        self.assertIn(str(_OSKM), location.sys_path)
        self.assertEqual(location.version, build_cli.cli_version())


class ResolutionOrder(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='oskm cli ')
        self.root = Path(self.temp.name)

    def tearDown(self):
        self.temp.cleanup()

    def test_env_override_beats_everything(self):
        installed = real_pyz(cli_install.installed_path(self.root))
        override = real_pyz(self.root / 'override' / 'oskm-cli.pyz')
        with mock.patch.dict('os.environ', {CLI_PATH_ENV: str(override)}):
            location = cli_install.resolve_cli(self.root)
        self.assertEqual(location.path, override)
        self.assertEqual(location.kind, cli_install.ENV)
        self.assertNotEqual(location.path, installed)

    def test_env_override_accepts_a_source_directory(self):
        with mock.patch.dict('os.environ', {CLI_PATH_ENV: str(_OSKM)}):
            location = cli_install.resolve_cli(self.root)
        self.assertEqual(location.kind, cli_install.ENV)
        self.assertEqual(location.version, build_cli.cli_version())

    def test_env_override_that_points_at_nothing_falls_through(self):
        installed = real_pyz(cli_install.installed_path(self.root))
        with mock.patch.dict('os.environ', {CLI_PATH_ENV: '/nonexistent/x.pyz'}):
            location = cli_install.resolve_cli(self.root)
        self.assertEqual(location.kind, cli_install.INSTALLED)
        self.assertEqual(location.path, installed.resolve())

    def test_there_is_no_fourth_candidate_that_downloads(self):
        """CLI 不单独下载——它随 knowledge.tar.gz 一起来。

        所以解析链只有三级：`$OSKM_CLI` → `<root>/oskm-cli.pyz` → 源码树。
        曾经的 `$OSKM_CLI_ENDPOINT` 第 4 级已删除；`download_cli` 也不该存在，
        否则又会多出一条"CLI 和 DB 分开取"的路径。
        """
        self.assertFalse(hasattr(cli_install, 'download_cli'))
        import oskm_runtime.environment as env
        self.assertFalse(hasattr(env, 'cli_endpoint'))
        self.assertNotIn('OSKM_CLI_ENDPOINT', env.ENV_KEYS)

    def test_a_broken_env_override_is_reported_not_silently_skipped(self):
        """显式指了一个坏文件时，错误里要带上"是它坏了"，而不是只说"没找到"。

        `$OSKM_CLI` 是**不做摘要校验**的（显式覆盖即"我知道我在干什么"），
        但仍然要过结构校验——否则一个写错的路径会变成后面某处一句
        看不懂的 ImportError。
        """
        fake_pyz(self.root / 'bad.pyz', b'#!/bin/sh\necho not a pyz')
        with mock.patch.dict('os.environ', {
                CLI_PATH_ENV: str(self.root / 'bad.pyz')}, clear=True), \
                mock.patch.object(cli_install, 'find_source_tree',
                                  return_value=None):
            with self.assertRaises(cli_install.CliInstallError) as raised:
                cli_install.resolve_cli(self.root)
        message = str(raised.exception)
        self.assertIn('不是有效 zip', message)
        self.assertIn(str(self.root / 'bad.pyz'), message)

    def test_installed_artifact_beats_the_source_tree(self):
        installed = real_pyz(cli_install.installed_path(self.root))
        location = cli_install.resolve_cli(self.root)
        self.assertEqual(location.path, installed.resolve())
        self.assertEqual(location.kind, cli_install.INSTALLED)
        self.assertEqual(location.sys_path, (str(installed.resolve()),))

    def test_a_corrupt_installed_artifact_is_reported_with_its_reason(self):
        fake_pyz(cli_install.installed_path(self.root), b'#!/bin/sh\necho nope')
        with mock.patch.object(cli_install, 'find_source_tree',
                               return_value=None):
            with self.assertRaisesRegex(cli_install.CliInstallError,
                                        r'2\. .*oskm-cli\.pyz'):
                cli_install.resolve_cli(self.root, allow_download=False)

    def test_falls_back_to_the_source_tree_when_nothing_is_installed(self):
        location = cli_install.resolve_cli(self.root)
        self.assertEqual(location.kind, cli_install.SOURCE)
        self.assertEqual(location.path, _OSKM.resolve())

    def test_failure_lists_every_attempted_location(self):
        with mock.patch.object(cli_install, 'find_source_tree',
                               return_value=None), \
                mock.patch.dict('os.environ', {}, clear=True):
            with self.assertRaises(cli_install.CliInstallError) as raised:
                cli_install.resolve_cli(self.root)
        message = str(raised.exception)
        for expected in ('1.', '2.', '3.', cli_install.ARTIFACT_NAME,
                         CLI_PATH_ENV, 'build_cli.py', 'bootstrap.py install'):
            self.assertIn(expected, message)
        # 没有任何"去某个端点下载 CLI"的候选了。
        self.assertNotIn('OSKM_CLI_ENDPOINT', message)


class EnsureAndRecordTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='oskm ensure ')
        self.root = Path(self.temp.name)

    def tearDown(self):
        self.temp.cleanup()

    def write_managed_state(self, **extra):
        document = {'version': state.STATE_VERSION, 'source': 'OPENHARMONY_CI',
                    'date': '20261112'}
        document.update(extra)
        state.write_state(self.root / state.STATE_NAME, document)

    def test_ensure_records_cli_provenance_for_a_managed_runtime(self):
        """状态里的 `cli` 段是**出处记录**，不是期望值——与 `db.sha256` 同性质。"""
        path = real_pyz(cli_install.installed_path(self.root))
        self.write_managed_state()
        location = cli_install.ensure_cli(self.root)

        self.assertEqual(location.kind, cli_install.INSTALLED)
        document = json.loads(
            (self.root / state.STATE_NAME).read_text(encoding='utf-8'))
        self.assertEqual(document['cli']['path'], 'oskm-cli.pyz')
        self.assertEqual(document['cli']['sha256'], sha(path))
        # 不记版本：版本由产物自己报告（`oskm-cli.pyz --version`）。
        self.assertNotIn('version', document['cli'])

    def test_ensure_does_not_touch_an_unmanaged_runtime(self):
        real_pyz(cli_install.installed_path(self.root))
        cli_install.ensure_cli(self.root)
        self.assertFalse((self.root / state.STATE_NAME).exists())

    def test_a_source_tree_cli_is_not_recorded_as_installed(self):
        """源码树里的 CLI 没有被装进运行时根目录，写进状态就是说谎。"""
        self.write_managed_state()
        location = cli_install.ensure_cli(self.root)
        self.assertEqual(location.kind, cli_install.SOURCE)
        document = json.loads(
            (self.root / state.STATE_NAME).read_text(encoding='utf-8'))
        self.assertNotIn('cli', document)

    def test_version_two_state_survives_ensure_cli(self):
        """2.5.6 留下的状态文件（没有 cli 段）必须能读、能补。"""
        path = real_pyz(cli_install.installed_path(self.root))
        state.write_state(self.root / state.STATE_NAME, {
            'version': 2, 'source': 'OPENHARMONY_CI', 'date': '20261111',
            'db': {'path': 'knowledge.db'},
        })
        cli_install.ensure_cli(self.root)
        document = json.loads(
            (self.root / state.STATE_NAME).read_text(encoding='utf-8'))
        self.assertEqual(document['version'], 2)     # 只补 cli，不改版本号
        self.assertEqual(document['cli']['sha256'], sha(path))
        self.assertEqual(document['db'], {'path': 'knowledge.db'})


class LoadCliModuleTests(unittest.TestCase):
    """`load_cli()` / `load_database()` 真的把模块取回来了。

    这里**不**再验一遍"构建出来的 pyz 能独立运行"——那是
    `cli/tests/test_cli_bundle.py::PyzRunsStandalone` 的职责（6 条子进程用例，
    覆盖 --version / --help / ask --list / 缺库报错 / validate-db / 不联网）。
    """

    def test_load_cli_imports_the_query_entry_point(self):
        with tempfile.TemporaryDirectory() as temp:
            module = cli_install.load_cli(runtime_root=Path(temp))
        for name in ('main', 'build_parser', 'run_validate_db'):
            self.assertTrue(hasattr(module, name), name)

    def test_load_database_is_where_the_contract_lives(self):
        with tempfile.TemporaryDirectory() as temp:
            database = cli_install.load_database(runtime_root=Path(temp))
        self.assertTrue(hasattr(database, 'validate_db'))
        self.assertIn('components', database.REQUIRED_COLUMNS)

    def test_a_built_pyz_is_importable_from_its_own_archive(self):
        """真 pyz 的加载必须在**子进程**里测。

        同进程里 `oskm_cli` 早已在 `sys.modules`（源树版本），再 import 一次
        只会拿到缓存——测了个寂寞。
        """
        with tempfile.TemporaryDirectory(prefix='oskm pyz ') as temp:
            archive = real_pyz(Path(temp) / 'oskm-cli.pyz')
            location = cli_install.resolve_cli(Path(temp))
            self.assertEqual(location.kind, cli_install.INSTALLED)
            self.assertEqual(location.sys_path, (str(archive.resolve()),))

            probe = subprocess.run(
                [sys.executable, '-c',
                 'import sys; sys.path.insert(0, sys.argv[1]);\n'
                 'import oskm_cli, oskm_cli.database as d;\n'
                 'print(oskm_cli.__file__);\n'
                 'print(len(d.REQUIRED_COLUMNS))', str(archive)],
                capture_output=True, text=True)
            self.assertEqual(probe.returncode, 0, probe.stderr)
            self.assertIn(archive.name, probe.stdout)
            self.assertGreater(int(probe.stdout.strip().splitlines()[-1]), 20)


if __name__ == '__main__':
    unittest.main()
