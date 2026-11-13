"""skill 发布归档的门禁。

拆分之后归档的性质变了，所以断言也变了。旧 `test_standalone_bundle.py`
要证明"查询引擎被打进来了"；现在要证明的恰恰相反——**它没被打进来**，
而且两个产物在解压后仍能拼起来工作。

最有价值的一条是 `test_extracted_skill_queries_a_database_with_a_separate_cli`：
它在子进程里、清空 `PYTHONPATH`、用 `OSKM_CLI` 指向一个单独构建的 pyz，
真跑一次查询。这条过了，才说明"两个独立产物"不是文档里的说法。
"""

import _path_setup
import hashlib
import json
import os
import re
import subprocess
import sys
import tarfile
import tempfile
import unittest
from pathlib import Path
import build_cli
import build_skill
from oskm_testing.fixture import create_fixture_db

# tests -> skill root（oskm_runtime）-> skills -> packages/oskm
# （oskm_schema、oskm_testing）-> packages/oskm/cli（oskm_cli）。
# `unittest discover` 把测试模块当顶层加载，所以这里手工补路径。
_HERE = Path(__file__).resolve().parent
_SKILL = _HERE.parent
_OSKM = _HERE.parents[2]


SKILL_NAME = 'ohos-design-architecture-evidence-query'


class SkillBundleTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix='oskm-skill-bundle-')
        cls.dist = Path(cls.temp.name) / 'dist'
        cls.release = build_skill.build_bundle(cls.dist)
        cls.archive = Path(cls.release['archive'])
        cls.root = build_skill.skill_name()


    @classmethod
    def tearDownClass(cls):
        cls.temp.cleanup()


    # ---------------------------------------------------------------- 内容

    def test_archive_contains_the_skill_and_its_runtime(self):
        names = set(self._names())
        for required in (
            f'{self.root}/SKILL.md',
            f'{self.root}/README.md',
            f'{self.root}/bootstrap.py',
            f'{self.root}/oskm_runtime/__init__.py',
            f'{self.root}/oskm_runtime/bootstrap.py',
            f'{self.root}/oskm_runtime/cli_install.py',
            f'{self.root}/oskm_runtime/db_download.py',
            f'{self.root}/oskm_runtime/environment.py',
            f'{self.root}/oskm_runtime/install.py',
            f'{self.root}/oskm_runtime/state.py',
            f'{self.root}/oskm_runtime/doctor.py',
            f'{self.root}/oskm_runtime/.env.example',
            f'{self.root}/references/usage.md',
            f'{self.root}/references/tools.md',
            f'{self.root}/references/spec/README.md',
            f'{self.root}/examples/architecture-trace.md',
            f'{self.root}/evals/evals.json',
            f'{self.root}/evals/release-checklist.md',
            f'{self.root}/evals/with-skill-report.md',
            f'{self.root}/evals/without-skill-report.md',
            f'{self.root}/evals/skill-judge-report.md',
        ):
            self.assertIn(required, names)


    def test_archive_has_exactly_one_package_root(self):
        names = self._names()
        self.assertEqual({name.split('/', 1)[0] for name in names}, {self.root})
        self.assertEqual([n for n in names if n.endswith('/SKILL.md')],
                         [f'{self.root}/SKILL.md'])


    def test_the_query_engine_is_not_bundled(self):
        """**这是拆分的核心断言**：skill 不再自带查询引擎与表定义。"""
        names = self._names()
        for forbidden in ('agentic', 'oskm_cli', 'oskm_schema', 'cli',
                          'oskm_testing'):
            hits = [name for name in names
                    if name.split('/')[1:2] == [forbidden]
                    or f'/{forbidden}/' in name]
            self.assertEqual(hits, [], f'{forbidden} 不该出现在 skill 归档里')
        self.assertFalse(any('collectors' in name for name in names))
        self.assertFalse(any(name.endswith('.pyz') for name in names))


    def test_the_archive_never_contains_its_own_output_directory(self):
        """默认输出就在 skill 内部，所以必须显式排除 `dist/`。

        不排除的后果很阴：`stage_bundle` 复制的是当前磁盘状态，于是上一次的
        归档被打进这一次的归档——**每构建一次长一截**，而且不报错。
        实测过一次：第一次构建多了个空的 `dist/` 目录条目。
        """
        for name in self._names():
            parts = name.split('/')
            self.assertNotIn('dist', parts, name)
            self.assertFalse(name.endswith(('.tar.gz', '.tgz', '.pyz')), name)
            self.assertNotIn('SHA256SUMS', parts, name)


    def test_rebuilding_into_the_same_directory_does_not_grow_the_archive(self):
        first = build_skill.build_bundle(self.dist)
        second = build_skill.build_bundle(self.dist)
        self.assertEqual(first['sha256'], second['sha256'])
        self.assertEqual(first['size'], second['size'])
        self.assertEqual(first['members'], second['members'])


    def test_default_output_directory_is_inside_the_skill(self):
        self.assertEqual(build_skill.DEFAULT_OUTPUT, _SKILL / 'dist')


    def test_the_skill_builder_does_not_import_the_cli_builder(self):
        """两个产物各自独立，连构建期也不该有 import 依赖。"""
        text = Path(build_skill.__file__).read_text(encoding='utf-8')
        self.assertNotIn('import build_cli', text)
        self.assertTrue(hasattr(build_skill, 'write_checksums'),
                        'SHA256SUMS 应该自己写，而不是借 CLI builder 的函数')


    def test_maintainer_and_generated_files_are_excluded(self):
        names = self._names()
        for name in names:
            self.assertFalse(any(part in name for part in (
                '__pycache__', '.pytest_cache', '.mypy_cache', 'tests',
                'scripts')), name)
        self.assertFalse(any(name.endswith((
            '.pyc', '.pyo', '.db', '.sqlite', '.sqlite3', '.log'))
            for name in names))
        self.assertFalse(any(name.split('/')[-1] in {
            '.env', 'skill-design.md', 'standalone-packaging.md',
            'query-skill-design.md', 'cli-skill-split.md',
            'schema-single-source.md', 'build_bundle.py', 'build_skill.py',
            'build_cli.py'} for name in names))


    def test_local_env_files_are_never_bundled(self):
        ignored = build_skill._ignore(
            _SKILL / 'oskm_runtime',
            ['.env', '.env.local', '.env.example', 'state.py'])
        self.assertTrue({'.env', '.env.local'}.issubset(ignored))
        self.assertNotIn('.env.example', ignored)


    def test_env_example_documents_exactly_the_supported_keys(self):
        text = self._read('oskm_runtime/.env.example')
        values = {}
        for raw in text.splitlines():
            line = raw.strip()
            if not line or line.startswith('#'):
                continue
            key, separator, value = line.partition('=')
            self.assertTrue(separator, line)
            values[key] = value.strip()

        from oskm_runtime import environment
        self.assertEqual(set(values), {'OSKM_DOWNLOAD_SOURCE',
                                       'OSKM_DOWNLOAD_ENDPOINT'})
        self.assertEqual(values.get('OSKM_DOWNLOAD_SOURCE'), 'OPENHARMONY_CI')
        self.assertTrue(values.get('OSKM_DOWNLOAD_ENDPOINT', '').startswith('https://'))
        # 其余键以注释形式出现即可（它们都是可选的）。
        for optional in (environment.CLI_PATH_ENV, environment.RUNTIME_ROOT_ENV):
            self.assertIn(optional, text)
        # CLI 不再有独立的下载端点：它随 knowledge.tar.gz 一起来。
        self.assertNotIn('OSKM_CLI_ENDPOINT', text)
        self.assertNotIn('OSKM_CLI_ENDPOINT', environment.ENV_KEYS)
        self.assertIn('oskm-cli.pyz', text,
                      '.env.example 要说清楚归档里有什么')


    def test_env_example_documents_the_whole_archive(self):
        """`.env.example` 是使用者第一次读的东西，必须讲清归档里有哪些文件。"""
        text = self._read('oskm_runtime/.env.example')
        for item in ('knowledge.db', 'oskm-cli.pyz',
                     'interface/sdk-js', 'interface/sdk_c'):
            self.assertIn(item, text, f'.env.example 没提 {item}')


    def test_no_version_pin_is_bundled(self):
        """CLI 与 `knowledge.db` 同类：固定文件名、不记版本，所以没有 pin。"""
        self.assertNotIn(f'{self.root}/oskm_runtime/cli_pin.json', self._names())
        for gone in ('check_pin', 'cli_version', 'PIN_FILE'):
            self.assertFalse(hasattr(build_skill, gone), gone)


    def test_skill_md_does_not_mention_the_removed_entry_point(self):
        """`python3 -m agentic` 已经不存在了；留在文档里就是坏指令。"""
        for member in ('SKILL.md', 'README.md', 'references/usage.md'):
            text = self._read(member)
            self.assertNotIn('-m agentic', text, member)
            self.assertNotIn('agentic/', text, member)


    def test_release_uses_the_skill_name_and_version(self):
        self.assertEqual(self.archive.name,
                         f'{SKILL_NAME}-{build_skill.skill_version()}.tar.gz')
        self.assertEqual(build_skill.skill_name(), SKILL_NAME)


    def test_checksums_are_written_next_to_the_archive(self):
        checksums = (self.dist / 'SHA256SUMS').read_text(encoding='utf-8')
        line = next(ln for ln in checksums.splitlines()
                    if ln.endswith(self.archive.name))
        digest, _, name = line.partition('  ')
        self.assertEqual(digest,
                         hashlib.sha256(self.archive.read_bytes()).hexdigest())
        self.assertEqual(name, self.archive.name)


    # ------------------------------------------------------------ 确定性

    def test_archive_build_is_reproducible(self):
        with tempfile.TemporaryDirectory(prefix='oskm-skill-rebuild-') as temp:
            again = build_skill.build_bundle(Path(temp) / 'dist')
        self.assertEqual(again['sha256'], self.release['sha256'])


    def test_archive_member_metadata_is_normalized(self):
        with tarfile.open(self.archive, 'r:gz') as tar:
            for member in tar:
                self.assertEqual(member.mtime, 0, member.name)
                self.assertEqual(member.uid, 0, member.name)
                self.assertEqual(member.gid, 0, member.name)
                self.assertEqual(member.uname, '', member.name)
                self.assertEqual(member.gname, '', member.name)
                # USTAR 的 magic 就写在头里；TarInfo 不暴露 format 字段。
                self.assertEqual(member.pax_headers, {}, member.name)


    def test_staging_rejects_a_query_engine_leaking_back_in(self):
        with tempfile.TemporaryDirectory(prefix='oskm-skill-stage-') as temp:
            package = build_skill.stage_bundle(temp)
            (package / 'oskm_schema').mkdir()
            (package / 'oskm_schema' / '__init__.py').write_text('', encoding='utf-8')
            with self.assertRaisesRegex(RuntimeError, 'forbidden path'):
                build_skill._validate_package(package)


    def test_staging_rejects_a_real_env_file(self):
        with tempfile.TemporaryDirectory(prefix='oskm-skill-env-') as temp:
            package = build_skill.stage_bundle(temp)
            self.assertFalse((package / 'oskm_runtime' / '.env').exists())


    def _names(self):
        with tarfile.open(self.archive, 'r:gz') as tar:
            return [member.name for member in tar]


    def _read(self, member):
        with tarfile.open(self.archive, 'r:gz') as tar:
            return tar.extractfile(f'{self.root}/{member}').read().decode('utf-8')



class ExtractedSkillTests(unittest.TestCase):
    """解压后的 skill + 单独构建的 CLI，在干净子进程里真的能跑。"""

    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix='oskm-skill-extract-')
        cls.base = Path(cls.temp.name)
        cls.release = build_skill.build_bundle(cls.base / 'dist')
        with tarfile.open(cls.release['archive'], 'r:gz') as tar:
            tar.extractall(cls.base, filter='data')
        cls.package = cls.base / build_skill.skill_name()
        cls.cli_archive = cls.base / build_cli.artifact_name()
        cls.cli_release = build_cli.build_pyz(cls.cli_archive)
        cls.db = create_fixture_db(cls.base / 'knowledge.db')


    @classmethod
    def tearDownClass(cls):
        cls.temp.cleanup()


    def test_the_two_artifacts_compose(self):
        """**这条是整个拆分的验收**：解压出来的 skill + 单独构建的 pyz。

        干净子进程、清空环境、无源码树、无 PYTHONPATH：skill 负责把 CLI
        认出来，CLI 负责回答查询，两者都不认识对方。
        """
        located = self._run('cli-path')
        self.assertEqual(located.returncode, 0, located.stderr)
        queried = self._run_cli('--db', str(self.db), 'ask', 'get_scan_info')
        self.assertEqual(queried.returncode, 0, queried.stderr)
        self.assertEqual(json.loads(queried.stdout)['product'], 'synthetic')


    def test_bootstrap_rejects_query_commands_and_says_what_to_run(self):
        result = self._run('arch', 'overview')
        self.assertEqual(result.returncode, 2, result.stdout)
        self.assertIn('未知命令 arch', result.stderr)
        self.assertIn('oskm-cli.pyz', result.stderr)


    def test_extracted_skill_resolves_the_cli_from_the_environment(self):
        result = self._run('cli-path')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(Path(result.stdout.strip()).resolve(),
                         self.cli_archive.resolve())


    def test_extracted_skill_reports_doctor(self):
        result = self._run('doctor')
        self.assertIn('oskm_cli (OK)', result.stdout)
        self.assertIn('Runtime root:', result.stdout)


    def test_extracted_skill_validates_a_database_via_the_cli(self):
        result = self._run('validate-db', str(self.db))
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertTrue(json.loads(result.stdout)['ok'])


    def test_without_a_cli_the_failure_is_actionable(self):
        """找不到 CLI 时，错误信息要指向"跑一次 install"，而不是某个端点。"""
        result = self._run('cli-path', OSKM_CLI='/nonexistent/x.pyz')
        self.assertEqual(result.returncode, 1)
        self.assertIn('oskm-cli.pyz', result.stderr)
        self.assertIn('bootstrap.py install', result.stderr)
        self.assertNotIn('OSKM_CLI_ENDPOINT', result.stderr)


    def test_a_managed_runtime_picks_up_a_locally_installed_cli(self):
        """不用 OSKM_CLI：`<root>/oskm-cli.pyz` 就该被认出来（第 2 级候选）。

        固定文件名让这条变得很简单——没有版本要比对、没有摘要要校验，
        只要它是个能用的 pyz。（曾经这里要把归档里的 `cli_pin.json` 改写成
        现场构建的摘要，否则用例会因为"pin 过期"而红，把注意力从真正的
        被测行为上引开。pin 机制已删除。）
        """
        root = self.base / 'managed'
        root.mkdir(exist_ok=True)
        built = build_cli.build_pyz(root / build_cli.artifact_name())
        result = self._run('cli-path', '--runtime-root', str(root),
                           OSKM_CLI='', HOME=str(self.base))
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(Path(result.stdout.strip()).resolve(),
                         built['archive'].resolve())


    def test_refresh_is_idempotent_on_an_unmanaged_runtime(self):
        """`refresh` 对没有状态文件的库什么都不做——用户自管的库不许被碰。"""
        empty = self.base / 'empty-root'
        result = self._run('refresh', '--runtime-root', str(empty))
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('已是最新', result.stderr)
        self.assertFalse(empty.exists())


    def _run(self, *arguments, **environ):
        env = {
            'PATH': os.environ.get('PATH', ''),
            'HOME': str(self.base),
            'PYTHONNOUSERSITE': '1',
            'OSKM_CLI': str(self.cli_archive),
        }
        env.update(environ)
        return subprocess.run(
            [sys.executable, 'bootstrap.py', *arguments],
            cwd=str(self.package), env=env, capture_output=True, text=True)


    def _run_cli(self, *arguments, **environ):
        """查询直接调 pyz——bootstrap 不再透传（2026-11-12 删除）。"""
        env = {'PATH': os.environ.get('PATH', ''), 'HOME': str(self.base),
               'PYTHONNOUSERSITE': '1'}
        env.update(environ)
        return subprocess.run(
            [sys.executable, str(self.cli_archive), *arguments],
            cwd=str(self.base), env=env, capture_output=True, text=True)

if __name__ == '__main__':
    unittest.main()
