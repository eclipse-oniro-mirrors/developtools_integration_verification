# pylint: disable=wrong-import-position  # tests adjust sys.path before local imports
"""`bootstrap.py` 的门禁：**只负责装，不负责查**。

2026-11-12 删掉了查询透传（`ask/arch/diff/sql` 转发给 CLI + 自动注入 `--db`）。
理由是它要求 bootstrap 手抄一份 CLI 的解析器知识——`VALUED_FLAGS` 就是那份手抄，
漂了会把 flag 的取值当成子命令，与被删掉的 `oskm.py` 同一类病。

现在盯住的是：

1. 七条托管命令各自的参数转发与退出码；
2. `--runtime-root` 从 argv 任意位置摘干净，不外泄给子命令解析器；
3. **查询命令被明确拒绝**，且拒绝信息直接给出该敲什么；
4. `refresh` 的幂等性：不过期就什么都不做，过期才走 install。

doctor / install 的命令行用例是从旧 `test_runtime_install.py` 搬过来的，
断言按新入口重写。
"""
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
import importlib
import io
import json
import tempfile
import unittest
from pathlib import Path
from unittest import mock

from oskm_runtime import bootstrap, cli_install, doctor, install, state
from oskm_runtime.db_download import DownloadError
from oskm_runtime.environment import (
    CLI_PATH_ENV,
    ENDPOINT_ENV,
    HARMONYOS_CI,
    OPENHARMONY_CI,
    SOURCE_ENV,
)
from oskm_testing.fixture import create_fixture_db, create_schema


def capture(argv, **environ):
    """Run `bootstrap.main(argv)` with a clean environment; return (code, out, err)."""
    out, err = io.StringIO(), io.StringIO()
    with mock.patch.dict('os.environ', environ, clear=True), \
            mock.patch.object(bootstrap, 'load_env_files', return_value=None), \
            contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
        try:
            code = bootstrap.main(argv)
        except SystemExit as exc:      # argparse 自己退出（参数错）
            code = exc.code
    return code, out.getvalue(), err.getvalue()


class ArgumentHandling(unittest.TestCase):
    def test_runtime_root_is_popped_from_anywhere(self):
        """`--runtime-root` 是 bootstrap 级的；子命令解析器不该看到它。"""
        for argv, expected in (
                (['--runtime-root', '/tmp/a', 'install'], '/tmp/a'),
                (['install', '--runtime-root', '/tmp/a'], '/tmp/a'),
                (['--runtime-root=/tmp/a', 'doctor'], '/tmp/a'),
                (['cli-path', '--runtime-root', '/tmp/a'], '/tmp/a')):
            value, rest = bootstrap.pop_runtime_root(argv)
            self.assertEqual(value, '/tmp/a', argv)
            self.assertNotIn('--runtime-root', rest)
            self.assertFalse(any(r.startswith('--runtime-root') for r in rest))

    def test_first_command_is_the_first_non_flag_token(self):
        """bootstrap 自己没有全局带值 flag，所以不需要"跳过取值"那套逻辑。

        这正是删掉查询透传换来的：原来 `first_command` 必须知道 CLI 的哪些全局
        flag 带取值（`--db` / `--product` / `--scan-id` / `--format`），那份清单
        是手抄的，漂了就会把 flag 的取值当成子命令。现在 bootstrap 只认自己的
        `--runtime-root`（已在上一步摘掉），子命令的 flag 都写在命令名**之后**，
        所以"第一个非 flag token"就是命令。
        """
        self.assertEqual(bootstrap.first_command(['install', '--date', 'x']),
                         'install')
        self.assertEqual(bootstrap.first_command(['doctor']), 'doctor')
        self.assertIsNone(bootstrap.first_command(['--help']))
        self.assertIsNone(bootstrap.first_command([]))
        # 命令名之后的取值不会被误当成命令。
        self.assertEqual(
            bootstrap.first_command(['download-db', '--date', 'install']),
            'download-db')

    def test_runtime_root_prefers_explicit_then_env_then_home(self):
        # macOS 上 /tmp 是 /private/tmp 的软链，resolve_root 会 resolve()。
        self.assertEqual(bootstrap.resolve_root('/tmp/a'),
                         Path('/tmp/a').resolve())
        with mock.patch.dict('os.environ', {'OSKM_RUNTIME_ROOT': '/tmp/d'},
                             clear=True):
            self.assertEqual(bootstrap.resolve_root(None),
                             Path('/tmp/d').resolve())
        with mock.patch.dict('os.environ', {}, clear=True):
            self.assertEqual(bootstrap.resolve_root(None),
                             Path('~/.oskm').expanduser().resolve())

    def test_validate_db_target_selects_the_runtime_root(self):
        """`validate-db PATH` 用 PATH 的父目录当运行时根。

        CLI 就装在那个库旁边（`<root>/oskm-cli.pyz`）。不认它的话，
        `bootstrap.py validate-db /some/root/knowledge.db` 会退回 `~/.oskm`
        找 CLI，然后报"找不到可用的 oskm-cli 产物"——用户明明已经把路径写在
        命令里了（实测踩过）。
        """
        self.assertEqual(
            bootstrap.resolve_root(None, ['validate-db', '/tmp/e/knowledge.db']),
            Path('/tmp/e').resolve())
        # 显式 --runtime-root 仍然优先。
        self.assertEqual(
            bootstrap.resolve_root('/tmp/f', ['validate-db', '/tmp/e/x.db']),
            Path('/tmp/f').resolve())
        # 没有位置参数时不炸，退回默认。
        with mock.patch.dict('os.environ', {}, clear=True):
            self.assertEqual(bootstrap.resolve_root(None, ['validate-db']),
                             Path('~/.oskm').expanduser().resolve())

    def test_usage_is_printed_for_bare_invocation(self):
        for argv in ([], ['help'], ['--help']):
            code, out, _ = capture(argv)
            self.assertEqual(code, 0, argv)
            for command in bootstrap.MANAGED:
                self.assertIn(command, out, argv)
            self.assertIn('只负责**装**，不负责查', out)
            self.assertIn('oskm-cli.pyz', out)

    def test_every_managed_command_is_dispatchable(self):
        """USAGE、MANAGED 与 MANAGED_COMMANDS 三处必须一致。

        三份手抄的清单（文档里列的、元组里的、字典里的）迟早会漂；
        漂了的症状是"help 里写着但敲下去说未知命令"。
        """
        self.assertEqual(set(bootstrap.MANAGED),
                         set(bootstrap.MANAGED_COMMANDS))
        code, out, _ = capture(['--help'])
        for command in bootstrap.MANAGED:
            self.assertIn(command, out)


class QueryCommandsAreRejected(unittest.TestCase):
    """查询透传删掉之后，`bootstrap.py arch …` 必须**明确拒绝**并给出正确命令。

    静默接受会怎样：bootstrap 把 `arch overview` 交给 argparse 子解析器，
    报一句 `invalid choice`，使用者完全看不出"查询要直接调 CLI"。
    更坏的是曾经的透传版本会真的去跑——那正是需要手抄 CLI 解析器的原因。
    """

    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='oskm reject ')
        self.root = Path(self.temp.name)

    def tearDown(self):
        self.temp.cleanup()

    def test_query_subcommands_are_rejected_with_the_right_hint(self):
        for command in ('ask', 'arch', 'diff', 'sql'):
            code, _, err = capture(
                ['--runtime-root', str(self.root), command, 'overview'])
            self.assertEqual(code, 2, command)
            self.assertIn(f'未知命令 {command}', err)
            self.assertIn('oskm-cli.pyz', err)
            self.assertIn('knowledge.db', err)
            self.assertIn('只负责安装', err)

    def test_the_hint_lists_the_managed_commands(self):
        code, _, err = capture(['--runtime-root', str(self.root), 'nope'])
        self.assertEqual(code, 2)
        for command in bootstrap.MANAGED:
            self.assertIn(command, err)

    def test_bootstrap_has_no_knowledge_of_cli_global_flags(self):
        """透传删掉之后，bootstrap 里不该再残留 CLI 的解析器知识。

        `VALUED_FLAGS` 是那份手抄清单的名字；`_db_flags` / `_has_db_selection`
        是为注入 `--db` 而写的 argv 扫描。它们与 CLI 的 argparse 定义必须
        同步，却没有任何机制保证同步——这正是删掉透传要消除的东西。
        """
        for gone in ('VALUED_FLAGS', '_db_flags', '_has_db_selection',
                     '_database_for', 'run_query'):
            self.assertFalse(hasattr(bootstrap, gone), gone)
        source = Path(bootstrap.__file__).read_text(encoding='utf-8')
        self.assertNotIn("'--scan-id'", source)
        self.assertNotIn("'--format'", source)


class DoctorCommand(unittest.TestCase):

    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='oskm doctor ')
        self.root = Path(self.temp.name) / 'runtime'
        self.root.mkdir()
        self.environment = mock.patch.dict('os.environ', {
            SOURCE_ENV: OPENHARMONY_CI,
            ENDPOINT_ENV: 'https://ci.example.invalid/download',
        })
        self.environment.start()
        self.addCleanup(self.environment.stop)


    def tearDown(self):
        self.temp.cleanup()


    def test_doctor_reports_ready_without_git(self):
        stdout = io.StringIO()
        with contextlib.redirect_stdout(stdout):
            code = doctor.main([str(self.root)])

        output = stdout.getvalue()
        self.assertEqual(code, 0, output)
        self.assertIn('Python:', output)
        self.assertIn('oskm_runtime (OK)', output)
        self.assertIn('oskm_cli (OK)', output)
        self.assertIn('oskm_schema (OK)', output)
        self.assertIn('Source / Endpoint:', output)
        self.assertIn(f'{SOURCE_ENV}=OPENHARMONY_CI', output)
        self.assertIn(f'{ENDPOINT_ENV}=已配置', output)
        self.assertIn('单个 knowledge.tar.gz', output)
        self.assertIn('不要求 Git', output)
        self.assertIn(f'Runtime root: {self.root.resolve()}', output)
        self.assertIn('未安装', output)
        self.assertNotIn('ci.example.invalid', output)


    def test_doctor_rejects_python_older_than_310(self):
        stdout = io.StringIO()
        with mock.patch.object(doctor.sys, 'version_info', (3, 9, 6)), \
                contextlib.redirect_stdout(stdout):
            code = doctor.main([str(self.root)])

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
                doctor.importlib, 'import_module', side_effect=import_module), \
                contextlib.redirect_stdout(stdout):
            code = doctor.main([str(self.root)])

        output = stdout.getvalue()
        self.assertEqual(code, 1, output)
        self.assertIn('oskm_schema (FAIL: No module named oskm_schema)', output)
        self.assertIn('PYTHONPATH=<skill 目录>', output)


    def test_doctor_rejects_missing_endpoint(self):
        stdout = io.StringIO()
        with mock.patch.dict('os.environ', {
                SOURCE_ENV: HARMONYOS_CI,
                ENDPOINT_ENV: '',
        }, clear=True), contextlib.redirect_stdout(stdout):
            code = doctor.main([str(self.root)])

        output = stdout.getvalue()
        self.assertEqual(code, 1, output)
        self.assertIn(f'{SOURCE_ENV}=HARMONYOS_CI', output)
        self.assertIn(f'{ENDPOINT_ENV}=未配置', output)
        self.assertIn('下载配置无效', output)


    def test_doctor_rejects_invalid_source(self):
        stdout = io.StringIO()
        with mock.patch.dict('os.environ', {
                SOURCE_ENV: 'PUBLIC_CI',
                ENDPOINT_ENV: 'https://ci.example.invalid/download',
        }, clear=True), contextlib.redirect_stdout(stdout):
            code = doctor.main([str(self.root)])

        output = stdout.getvalue()
        self.assertEqual(code, 1, output)
        self.assertIn(f'{SOURCE_ENV}=格式错误', output)


    def test_doctor_reports_a_managed_runtime(self):
        create_fixture_db(self.root / 'knowledge.db')
        for name, relative in state.SDK_PATHS.items():
            target = self.root / relative
            target.mkdir(parents=True)
            (target / 'marker.txt').write_text(name, encoding='utf-8')
        state.write_state(self.root / state.STATE_NAME, {
            'version': state.STATE_VERSION, 'source': OPENHARMONY_CI,
            'date': '20261112',
            'db': {'path': 'knowledge.db'}, 'sdk': {'date': '20261112'},
            'cli': {'version': '1.0.0'},
        })
        stdout = io.StringIO()
        with contextlib.redirect_stdout(stdout):
            code = doctor.main([str(self.root)])
        output = stdout.getvalue()
        self.assertEqual(code, 0, output)
        self.assertIn(f'version {state.STATE_VERSION}', output)
        self.assertIn('db=✓, sdk=✓, cli=✓', output)
        self.assertIn('可打开', output)


    def test_missing_endpoint_is_only_a_warning_once_the_runtime_is_complete(self):
        """一个能正常查询的只读环境不该被 doctor 判成"未就绪"。

        旧实现一律 FAIL，于是已经装好 DB + SDK + CLI 的人会看到
        "错误: 运行时依赖检查未通过"，然后去修一个根本没坏的东西。
        """
        self._complete_runtime()
        stdout = io.StringIO()
        with mock.patch.dict('os.environ', {SOURCE_ENV: OPENHARMONY_CI,
                                            ENDPOINT_ENV: ''}, clear=True), \
                contextlib.redirect_stdout(stdout):
            code = doctor.main([str(self.root)])
        output = stdout.getvalue()
        self.assertEqual(code, 0, output)
        self.assertIn('WARN', output)
        self.assertIn('查询可用', output)
        self.assertNotIn('错误: 运行时依赖检查未通过', output)


    def test_missing_endpoint_is_a_failure_when_nothing_is_installed(self):
        stdout = io.StringIO()
        with mock.patch.dict('os.environ', {SOURCE_ENV: OPENHARMONY_CI,
                                            ENDPOINT_ENV: ''}, clear=True), \
                contextlib.redirect_stdout(stdout):
            code = doctor.main([str(self.root)])
        output = stdout.getvalue()
        self.assertEqual(code, 1, output)
        self.assertIn('FAIL: 下载配置无效', output)


    def test_runtime_completeness_requires_both_sdk_trees(self):
        self._complete_runtime()
        self.assertTrue(doctor.runtime_is_complete(self.root))
        for child in (self.root / 'interface/sdk_c').iterdir():
            child.unlink()
        self.assertFalse(doctor.runtime_is_complete(self.root))


    def test_doctor_reports_an_unmanaged_database(self):
        create_fixture_db(self.root / 'knowledge.db')
        stdout = io.StringIO()
        with contextlib.redirect_stdout(stdout):
            code = doctor.main([str(self.root)])
        output = stdout.getvalue()
        self.assertEqual(code, 0, output)
        self.assertIn('非托管', output)


    def _complete_runtime(self):
        create_fixture_db(self.root / 'knowledge.db')
        for name, relative in state.SDK_PATHS.items():
            target = self.root / relative
            target.mkdir(parents=True, exist_ok=True)
            (target / 'marker.txt').write_text(name, encoding='utf-8')



class InstallCommand(unittest.TestCase):
    """`install` 只做一件事：把归档里的四样东西装到运行时根目录。

    **不再"先装 CLI 再下载 DB"**——CLI 就在 `knowledge.tar.gz` 里，和
    `knowledge.db` 一起落盘。所以这里不 mock `ensure_cli`，也没有单独的
    CLI 下载端点可配。
    """

    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='oskm install ')
        self.root = Path(self.temp.name) / 'runtime'
        self.root.mkdir()
        mock.patch.object(bootstrap, 'load_env_files',
                          return_value=None).start()
        self.addCleanup(mock.patch.stopall)

    def tearDown(self):
        self.temp.cleanup()

    def test_install_defaults_to_today_and_default_source(self):
        # `capture()` 用 clear=True，所以 SOURCE_ENV 缺席 → 默认 OPENHARMONY_CI。
        with mock.patch.object(state, 'today', return_value='20261102'), \
                mock.patch.object(install, 'install_runtime') as install_runtime:
            code, _, err = capture(
                ['install', '--runtime-root', str(self.root), '--skip-db'])
        self.assertEqual(code, 0, err)
        install_runtime.assert_called_once_with(
            self.root.resolve(), OPENHARMONY_CI, '20261102',
            download_db=False, download_sdk=True)

    def test_install_forwards_source_and_date(self):
        with mock.patch.object(install, 'install_runtime') as install_runtime:
            code, _, err = capture([
                'install', '--source', HARMONYOS_CI,
                '--runtime-root', str(self.root), '--date', '20261102',
                '--skip-sdk'])
        self.assertEqual(code, 0, err)
        install_runtime.assert_called_once_with(
            self.root.resolve(), HARMONYOS_CI, '20261102',
            download_db=True, download_sdk=False)

    def test_install_does_not_resolve_a_cli_beforehand(self):
        """CLI 是归档的一部分，install 没有"先装 CLI"这一步。

        曾经的顺序（先 `ensure_cli`、再下载 DB）只在"CLI 单独下载/单独发布"
        成立时才需要；现在归档自带 `oskm-cli.pyz`，那个顺序反而会让 CLI 和
        DB 的版本来自两个地方。
        """
        with mock.patch.object(cli_install, 'ensure_cli') as ensure_cli, \
                mock.patch.object(install, 'install_runtime') as install_runtime:
            code, _, err = capture(
                ['install', '--runtime-root', str(self.root),
                 '--date', '20261102'])
        self.assertEqual(code, 0, err)
        ensure_cli.assert_not_called()
        self.assertEqual(install_runtime.call_count, 1)

    def test_install_failure_is_reported_with_exit_code_one(self):
        with mock.patch.object(install, 'install_runtime',
                               side_effect=DownloadError('no archive anywhere')):
            code, _, err = capture(
                ['install', '--runtime-root', str(self.root),
                 '--date', '20261102'])
        self.assertEqual(code, 1)
        self.assertIn('no archive anywhere', err)

    def test_install_rejects_both_skip_flags(self):
        stderr = io.StringIO()
        with mock.patch.object(bootstrap, 'load_env_files', return_value=None), \
                contextlib.redirect_stderr(stderr):
            with self.assertRaises(SystemExit) as raised:
                bootstrap.main([
                    'install', '--runtime-root', str(self.root),
                    '--skip-db', '--skip-sdk'])
        self.assertEqual(raised.exception.code, 2)
        self.assertIn('not allowed with argument', stderr.getvalue())

    def test_download_db_forwards_source_and_writes_from_the_archive(self):
        """`download-db` 取的是同一个 `knowledge.tar.gz`，只捞出其中的 DB。"""
        output = self.root / 'history.db'
        with mock.patch.object(bootstrap, 'download_database',
                               return_value=output.resolve()) as download:
            code, out, err = capture([
                'download-db', '--source', 'HARMONYOS_CI',
                '--date', '20261102', '--output', str(output)])
        self.assertEqual(code, 0, err)
        download.assert_called_once_with(
            source='HARMONYOS_CI', date='20261102', output=output.resolve())
        self.assertIn(str(output.resolve()), out)

    def test_download_db_reports_download_errors(self):
        with mock.patch.object(
                bootstrap, 'download_database',
                side_effect=DownloadError('boom')):
            code, _, err = capture([
                'download-db', '--date', '20261102',
                '--output', str(self.root / 'x.db')])
        self.assertEqual(code, 1)
        self.assertIn('boom', err)


class RefreshCommand(unittest.TestCase):
    """`refresh` = `install` 的幂等版：不过期就什么都不做。

    查询透传删掉之后，"每次查询前顺手刷新"没有了触发点。与其让运行时静默
    停在旧日期，不如给一条显式命令。它跑的是 `state.needs_refresh()` 那套
    **廉价检查**（不跑 `PRAGMA integrity_check`），过期才真的下载。
    """

    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='oskm refresh ')
        self.root = Path(self.temp.name)
        self.addCleanup(self.temp.cleanup)
        patcher = mock.patch.object(bootstrap, 'load_env_files',
                                    return_value=None)
        patcher.start()
        self.addCleanup(patcher.stop)


    def test_up_to_date_runtime_is_left_alone(self):
        self._managed_runtime(state.today())
        with mock.patch.object(install, 'install_runtime') as install_runtime, \
                mock.patch.object(cli_install, 'ensure_cli') as ensure_cli:
            code, _, err = capture(
                ['refresh', '--runtime-root', str(self.root)])
        self.assertEqual(code, 0, err)
        install_runtime.assert_not_called()
        ensure_cli.assert_not_called()          # 不刷新就不必碰 CLI
        self.assertIn('已是最新', err)


    def test_stale_runtime_is_reinstalled(self):
        self._managed_runtime('20260101')
        with mock.patch.object(state, 'today', return_value='20261112'), \
                mock.patch.object(install, 'install_runtime') as install_runtime:
            code, _, err = capture(
                ['refresh', '--runtime-root', str(self.root)])
        self.assertEqual(code, 0, err)
        # CLI 随归档一起来，所以 refresh 不单独传 cli_location。
        install_runtime.assert_called_once_with(
            self.root.resolve(), OPENHARMONY_CI, '20261112',
            download_db=True, download_sdk=True)


    def test_explicit_date_is_honoured(self):
        self._managed_runtime('20260101')
        with mock.patch.object(install, 'install_runtime') as install_runtime, \
                mock.patch.object(cli_install, 'ensure_cli') as ensure_cli:
            ensure_cli.return_value = cli_install.CliLocation(
                path=self.root / 'oskm-cli.pyz', kind=cli_install.INSTALLED,
                version='1.0.0', sys_path=())
            code, _, err = capture(
                ['refresh', '--runtime-root', str(self.root),
                 '--date', '20260101'])
        self.assertEqual(code, 0, err)
        install_runtime.assert_not_called()     # 与状态里的日期一致 → 不过期


    def test_unmanaged_runtime_is_never_refreshed(self):
        """没有状态文件的库是用户自管的，`refresh` 不许碰它。"""
        create_fixture_db(self.root / 'knowledge.db')
        with mock.patch.object(install, 'install_runtime') as install_runtime:
            code, _, err = capture(
                ['refresh', '--runtime-root', str(self.root)])
        self.assertEqual(code, 0, err)
        install_runtime.assert_not_called()


    def test_refresh_failure_is_reported_and_keeps_the_old_runtime(self):
        self._managed_runtime('20260101')
        before = (self.root / 'knowledge.db').read_bytes()
        with mock.patch.object(state, 'today', return_value='20261112'), \
                mock.patch.object(cli_install, 'ensure_cli') as ensure_cli, \
                mock.patch.object(install, 'install_runtime',
                                  side_effect=DownloadError('boom')):
            ensure_cli.return_value = cli_install.CliLocation(
                path=self.root / 'oskm-cli.pyz', kind=cli_install.INSTALLED,
                version='1.0.0', sys_path=())
            code, _, err = capture(
                ['refresh', '--runtime-root', str(self.root)])
        self.assertEqual(code, 1)
        self.assertIn('boom', err)
        self.assertEqual((self.root / 'knowledge.db').read_bytes(), before)


    def _managed_runtime(self, date):
        create_fixture_db(self.root / 'knowledge.db')
        for name, relative in state.SDK_PATHS.items():
            target = self.root / relative
            target.mkdir(parents=True, exist_ok=True)
            (target / 'marker.txt').write_text(name, encoding='utf-8')
        state.write_state(self.root / state.STATE_NAME, {
            'version': state.STATE_VERSION, 'source': OPENHARMONY_CI,
            'date': date,
            'db': {'date': date, 'path': 'knowledge.db'},
            'sdk': {'date': date,
                    **{n: {'path': r} for n, r in state.SDK_PATHS.items()}},
        })



class ManagedRuntimeCommands(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='oskm managed ')
        self.root = Path(self.temp.name)

    def tearDown(self):
        self.temp.cleanup()

    def test_cli_path_prints_the_resolved_location(self):
        code, out, err = capture(['cli-path', '--runtime-root', str(self.root)])
        self.assertEqual(code, 0, err)
        self.assertTrue(out.strip(), 'cli-path 什么都没打印')

    def test_cli_path_reports_failure_with_exit_code_one(self):
        with mock.patch.object(cli_install, 'resolve_cli',
                               side_effect=cli_install.CliInstallError('nope')):
            code, _, err = capture(
                ['cli-path', '--runtime-root', str(self.root)])
        self.assertEqual(code, 1)
        self.assertIn('nope', err)

    def test_validate_db_needs_a_path(self):
        code, _, err = capture(
            ['validate-db', '--runtime-root', str(self.root)])
        self.assertEqual(code, 2)
        self.assertIn('需要一个路径', err)

    def test_validate_db_accepts_a_schema_complete_database(self):
        create_fixture_db(self.root / 'knowledge.db')
        code, out, err = capture(
            ['validate-db', str(self.root / 'knowledge.db'),
             '--runtime-root', str(self.root)])
        self.assertEqual(code, 0, err)
        self.assertTrue(json.loads(out)['ok'])

    def test_validate_db_rejects_an_incompatible_database(self):
        import sqlite3
        path = self.root / 'legacy.db'
        connection = sqlite3.connect(path)
        connection.execute('CREATE TABLE scans (id INTEGER PRIMARY KEY)')
        connection.commit()
        connection.close()
        code, _, err = capture(
            ['validate-db', str(path), '--runtime-root', str(self.root)])
        self.assertEqual(code, 2)
        self.assertIn('不兼容', err)

    def test_update_cli_reports_where_the_cli_came_from(self):
        code, out, err = capture(
            ['update-cli', '--runtime-root', str(self.root)])
        self.assertEqual(code, 0, err)
        self.assertIn('oskm-cli 1.0.0', out)

    def test_env_override_selects_the_cli(self):
        code, out, err = capture(
            ['cli-path', '--runtime-root', str(self.root)],
            **{CLI_PATH_ENV: str(_OSKM)})
        self.assertEqual(code, 0, err)
        self.assertEqual(Path(out.strip()).resolve(), _OSKM.resolve())


class SkillEnvExampleIsComplete(unittest.TestCase):
    """`.env.example` 必须把每个支持的配置项都写出来。

    漏一个的后果很具体：使用者复制模板、填好、跑 doctor，然后被一句
    "不支持的配置项"顶回来——或者更坏，一个静默用不上的默认值。
    """

    def test_every_supported_key_is_documented(self):
        from oskm_runtime import environment
        text = (Path(environment.__file__).parent / '.env.example').read_text(
            encoding='utf-8')
        for key in environment.ENV_KEYS:
            self.assertIn(key, text, f'.env.example 没有提到 {key}')

    def test_no_unsupported_key_is_documented(self):
        """文档里教人配的键必须真的被支持。

        反方向的漂移比漏写更坏：漏写只是少一个功能，写了一个不存在的键
        会让人对着 `.env` 调半天，而 `load_env_file` 会用一句
        "不支持的配置项"把他顶回来——前提是它认得那个键。
        """
        from oskm_runtime import environment
        text = (Path(environment.__file__).parent / '.env.example').read_text(
            encoding='utf-8')
        import re
        documented = {
            match for match in
            re.findall(r'^\s*#?\s*(OSKM_[A-Z_]+)\s*=', text, re.M)}
        self.assertEqual(documented - set(environment.ENV_KEYS), set())


if __name__ == '__main__':
    unittest.main()
