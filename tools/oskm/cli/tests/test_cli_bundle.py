"""CLI 产物的门禁：固定名、可复现、可独立运行、产物落在 cli/ 内部。

四条断言各自拦一类真实故障：

- **文件名带上了版本**：CLI 与 `knowledge.db` 同类，装到
  `<runtime-root>/oskm-cli.pyz`，文档与调用方永远不用钉版本。名字一旦漂回
  `oskm-cli-1.0.0.pyz`，SKILL.md 里的每条命令都会在下次发版时变成坏指令。
- **不可复现**：`SHA256SUMS` 存的就是 pyz 的 sha256；构建不确定，
  "装的是不是刚构建的那份"就无从查起，每次 CI 都会"漂"。
- **pyz 跑不起来**：`oskm_schema` 忘了 stage 进去时，源树里一切正常
  （它就躺在 `packages/oskm/`），只有 pyz 会 ImportError。
- **产物落在别处**：`cli/` 就是产物①的全部，构建输出也不例外。默认目录一旦
  漂回 `packages/oskm/dist/`，`.gitignore` 与文档里的路径会同时开始说谎。

> 这里曾经有一条 `PinStaysCurrent`（现场重构建 pyz 并比对 `cli_pin.json`）。
> 它抓过一次真漂移，但 pin 机制本身已于 2026-11-12 删除——CLI 不再记版本，
> 完整性改由 skill 侧的结构校验（`cli_install.verify_pyz`）负责。
"""
# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
for _p in (str(_HERE.parents[0]), str(_HERE.parents[1])):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)
import hashlib
import json
import os
import subprocess
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path

sys.path.insert(0, str(_HERE.parents[0] / 'scripts'))
import build_cli  # noqa: E402

from oskm_cli import __version__  # noqa: E402

CLI_ROOT = _HERE.parents[0]
OSKM = _HERE.parents[1]
SKILL_ROOT = OSKM / 'skills' / 'ohos-design-architecture-evidence-query'


def sha256(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


class ArtifactNaming(unittest.TestCase):
    def test_the_name_is_fixed_and_version_less(self):
        self.assertEqual(build_cli.artifact_name(), 'oskm-cli.pyz')
        self.assertEqual(build_cli.artifact_name('9.9.9'), 'oskm-cli.pyz')
        self.assertNotIn(build_cli.cli_version(), build_cli.ARTIFACT_NAME)

    def test_the_version_is_still_reported_by_the_artifact_itself(self):
        """不记版本不等于不知道版本：`--version` 仍然要能查。"""
        self.assertRegex(build_cli.cli_version(), r'^\d+\.\d+\.\d+$')
        init = (build_cli.PACKAGE / '__init__.py').read_text(encoding='utf-8')
        self.assertIn(f"__version__ = '{build_cli.cli_version()}'", init)

    def test_no_pin_machinery_is_left_behind(self):
        self.assertFalse(hasattr(build_cli, 'update_pin'))
        self.assertFalse(hasattr(build_cli, 'PIN_FILE'))
        self.assertFalse((SKILL_ROOT / 'oskm_runtime' / 'cli_pin.json').exists())


class PyzIsReproducible(unittest.TestCase):
    def test_two_builds_are_byte_identical(self):
        with tempfile.TemporaryDirectory(prefix='oskm-cli-rep-') as temp:
            first = build_cli.build_pyz(Path(temp) / 'a' / build_cli.artifact_name())
            second = build_cli.build_pyz(Path(temp) / 'b' / build_cli.artifact_name())
        self.assertEqual(first['sha256'], second['sha256'])

    def test_zip_metadata_is_normalized(self):
        with tempfile.TemporaryDirectory(prefix='oskm-cli-meta-') as temp:
            archive = build_cli.build_pyz(
                Path(temp) / build_cli.artifact_name())['archive']
            with zipfile.ZipFile(archive) as archive_file:
                infos = archive_file.infolist()
        self.assertTrue(infos)
        for info in infos:
            self.assertEqual(info.date_time, build_cli.ZIP_EPOCH, info.filename)
            self.assertEqual(info.compress_type, zipfile.ZIP_DEFLATED,
                             info.filename)
        names = [info.filename for info in infos]
        self.assertEqual(names, sorted(names), '条目没有按名字排序')
        self.assertEqual(names[0], '__main__.py')

    def test_the_shebang_makes_it_directly_executable(self):
        with tempfile.TemporaryDirectory(prefix='oskm-cli-exec-') as temp:
            archive = build_cli.build_pyz(
                Path(temp) / build_cli.artifact_name())['archive']
            self.assertTrue(archive.read_bytes().startswith(b'#!'))
            self.assertTrue(os.access(archive, os.X_OK))


class PyzContents(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix='oskm-cli-contents-')
        cls.release = build_cli.build_pyz(
            Path(cls.temp.name) / build_cli.artifact_name())
        cls.archive = cls.release['archive']
        with zipfile.ZipFile(cls.archive) as archive_file:
            cls.names = set(archive_file.namelist())

    @classmethod
    def tearDownClass(cls):
        cls.temp.cleanup()

    def test_query_layer_and_schema_are_both_inside(self):
        """`oskm_schema` 忘了 stage 时，源树里一切正常，只有 pyz 会炸。"""
        for required in ('__main__.py',
                         'oskm_cli/__init__.py',
                         'oskm_cli/cli.py',
                         'oskm_cli/database.py',
                         'oskm_cli/query/tools/__init__.py',
                         'oskm_cli/query/arkts/query.py',
                         'oskm_schema/__init__.py',
                         'oskm_schema/base.py',
                         'oskm_schema/arkts.py'):
            self.assertIn(required, self.names)

    def test_no_collectors_tests_or_maintainer_docs(self):
        for name in self.names:
            parts = Path(name).parts
            self.assertNotIn('collectors', parts, name)
            # 共用测试辅助是两个产物的**测试**依赖，不是运行依赖。
            self.assertNotIn('oskm_testing', parts, name)
            self.assertNotIn('__pycache__', parts, name)
            self.assertNotIn('tests', parts, name)
            self.assertNotIn('scripts', parts, name)
            self.assertFalse(name.startswith('oskm/'), name)
        for excluded in ('oskm_schema/README.md',
                         'oskm_schema/schema-single-source.md'):
            self.assertNotIn(excluded, self.names)

    def test_entry_point_guards_the_python_version(self):
        """撞上 3.9 时要给出可执行的提示，而不是一句 `TypeError: … |`。"""
        with zipfile.ZipFile(self.archive) as archive_file:
            source = archive_file.read('__main__.py').decode('utf-8')
        self.assertIn('sys.version_info < (3, 10)', source)
        self.assertIn('Python 3.10+', source)
        # 守卫必须在任何 oskm 导入之前，否则它自己就先炸了。
        self.assertLess(source.index('sys.version_info'),
                        source.index('from oskm_cli.cli import main'))


class PyzRunsStandalone(unittest.TestCase):
    """在干净子进程、空 cwd、无 PYTHONPATH 下真跑。"""

    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix='oskm-cli-run-')
        cls.archive = build_cli.build_pyz(
            Path(cls.temp.name) / build_cli.artifact_name())['archive']

    @classmethod
    def tearDownClass(cls):
        cls.temp.cleanup()

    def _run(self, *arguments):
        return subprocess.run(
            [sys.executable, str(self.archive), *arguments],
            cwd=self.temp.name, capture_output=True, text=True,
            env={'PATH': os.environ.get('PATH', ''),
                 'HOME': self.temp.name, 'PYTHONNOUSERSITE': '1'})

    def test_version(self):
        result = self._run('--version')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stdout.strip(), f'oskm-cli {__version__}')

    def test_usage_names_the_cli_not_the_old_dispatcher(self):
        result = self._run('--help')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('oskm-cli', result.stdout)
        self.assertIn('validate-db', result.stdout)

    def test_ask_list_is_generated_from_the_registry(self):
        result = self._run('ask', '--list')
        self.assertEqual(result.returncode, 0, result.stderr)
        from oskm_cli.query.tools import REGISTRY
        self.assertEqual(len(REGISTRY), 52)
        for tool in REGISTRY:
            self.assertIn(tool.name, result.stdout)

    def test_a_missing_database_explains_who_downloads(self):
        result = self._run('--db', 'nope.db', 'ask', 'get_scan_info')
        self.assertEqual(result.returncode, 3)
        self.assertIn('bootstrap.py install', result.stderr)
        self.assertIn('不会为任意缺失路径自动下载', result.stderr)

    def test_validate_db_rejects_a_non_database(self):
        path = Path(self.temp.name) / 'garbage.db'
        path.write_bytes(b'not sqlite at all')
        result = self._run('validate-db', str(path))
        self.assertEqual(result.returncode, 2)
        self.assertIn('不兼容', result.stderr)

    def test_the_cli_never_touches_the_network_or_the_runtime_root(self):
        """空 HOME + 无端点：查询路径上不该有任何东西去读配置、联网或写盘。

        旧实现在 `open_session()` 里调 `runtime.ensure_runtime()`，于是
        "跑一条查询"会顺带读 `.env`、判断日期、可能联网下载 19 MB。
        这条断言就是把那个耦合钉死在门外。
        """
        home = Path(self.temp.name) / 'empty-home'
        home.mkdir()
        before = sorted(path.name for path in home.iterdir())
        result = subprocess.run(
            [sys.executable, str(self.archive), 'ask', '--list'],
            cwd=self.temp.name, capture_output=True, text=True,
            env={'PATH': os.environ.get('PATH', ''), 'HOME': str(home),
                 'PYTHONNOUSERSITE': '1'})
        self.assertEqual(result.returncode, 0, result.stderr)
        for leaked in ('OSKM_DOWNLOAD_ENDPOINT', 'OSKM_DOWNLOAD_SOURCE',
                       '.oskm', 'install --runtime-root', '刷新'):
            self.assertNotIn(leaked, result.stderr)
        self.assertEqual(sorted(path.name for path in home.iterdir()), before)


class ReleaseLayoutTests(unittest.TestCase):
    """产物落在 `cli/dist/`，而且 SHA256SUMS 不会攒下已删除的旧版本。"""

    def test_default_output_is_inside_cli(self):
        self.assertEqual(build_cli.DEFAULT_OUTPUT, CLI_ROOT / 'dist')
        self.assertEqual(build_cli.CLI_ROOT, CLI_ROOT)

    def test_the_skill_installs_to_the_same_fixed_name(self):
        """两侧对"装在哪、叫什么"必须一致，否则文档里的命令是坏的。"""
        sys.path.insert(0, str(SKILL_ROOT))
        from oskm_runtime import cli_install
        self.assertEqual(cli_install.ARTIFACT_NAME, build_cli.ARTIFACT_NAME)
        self.assertEqual(
            cli_install.installed_path(Path('/r')), Path('/r/oskm-cli.pyz'))

    def test_build_writes_pyz_and_checksums_into_the_output_dir(self):
        with tempfile.TemporaryDirectory(prefix='oskm-cli-layout-') as temp:
            result = build_cli.build(Path(temp))
            produced = sorted(p.name for p in Path(temp).iterdir())
        self.assertEqual(produced, ['SHA256SUMS', build_cli.artifact_name()])
        self.assertEqual(Path(result['archive']).parent, Path(temp).resolve())

    def test_checksums_drop_entries_whose_file_is_gone(self):
        """合并写入不能只加不减。

        旧版本的归档删掉之后，它那一行如果还留着，`sha256sum -c` 就报
        "No such file or directory"，看起来像构建坏了——而其实什么都没坏。
        """
        with tempfile.TemporaryDirectory(prefix='oskm-cli-sums-') as temp:
            output = Path(temp)
            stale = output / 'oskm-cli-0.0.1.pyz'
            stale.write_bytes(b'old')
            build_cli.write_checksums(output, {stale.name: 'deadbeef'})
            stale.unlink()
            build_cli.build(output)
            lines = (output / 'SHA256SUMS').read_text(
                encoding='utf-8').splitlines()
        self.assertEqual(len(lines), 1, lines)
        self.assertTrue(lines[0].endswith(build_cli.artifact_name()), lines)

    def test_no_removed_distribution_channels_are_left_behind(self):
        """npm 通道与 cli_pin.json 都于 2026-11-12 去掉；残留一半比没有更坏。"""
        self.assertFalse((CLI_ROOT / 'npm').exists())
        for name in ('build_npm', 'package_json', 'NPM_PACKAGE', 'NPM_TEMPLATE',
                     'update_pin', 'ARTIFACT_PREFIX'):
            self.assertFalse(hasattr(build_cli, name), name)
        with tempfile.TemporaryDirectory(prefix='oskm-cli-nonpm-') as temp:
            build_cli.build(Path(temp))
            produced = sorted(p.name for p in Path(temp).rglob('*'))
        self.assertEqual([n for n in produced if 'npm' in n or n.endswith('.tgz')],
                         [])


if __name__ == '__main__':
    unittest.main()
