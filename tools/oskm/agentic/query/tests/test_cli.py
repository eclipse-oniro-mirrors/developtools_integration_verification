"""CLI 的验收：ask / arch / diff / sql。

`oskm ask` 的子命令是**生成的**，所以这里不逐个断言 50 个命令长什么样——
那等于把生成器的输出抄一遍。断言的是生成这件事本身成立：
每个工具都有子命令、枚举会被拒、数组参数能传、必填缺了会报错。

`arch` 另有一条结构性断言：它只许编排已有工具，不许自己写 SQL（见
test_arch_writes_no_sql）。这条约束不检查的话，`arch` 迟早会长成
第二套绕过工具层的查询 API。
"""
import io
import json
import os
import re
import sys
import contextlib
import sqlite3
import shutil
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', '..'))

from agentic import cli
from agentic.query.tools import REGISTRY
from agentic.query.tests.testdb import DB, elf_dest



def run(*argv):
    """跑一次 CLI，返回 (退出码, stdout, stderr)。"""
    out, err = io.StringIO(), io.StringIO()
    with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
        try:
            # DB 是 pathlib.Path；argparse 只收 str，统一转掉。
            code = cli.main([str(a) for a in argv])
        except SystemExit as exc:          # argparse 自己退出（参数错）
            code = exc.code
    return code, out.getvalue(), err.getvalue()


@unittest.skipUnless(os.path.isfile(DB), f'test database not found: {DB}')
class AskIsGenerated(unittest.TestCase):
    def test_every_tool_has_a_subcommand(self):
        parser = cli.build_parser()
        ask = next(a for a in parser._subparsers._group_actions[0].choices.values()
                   if a.prog.endswith('ask'))
        generated = set(ask._subparsers._group_actions[0].choices)
        self.assertEqual({t.name for t in REGISTRY} - generated, set())

    def test_scalar_call(self):
        code, out, _ = run('--db', DB, 'ask', 'get_component', '--name', 'ace_engine')
        self.assertEqual(code, 0)
        self.assertEqual(json.loads(out)['subsystem'], 'arkui')

    def test_enum_is_rejected_by_argparse(self):
        """枚举校验白拿：choices 从 schema 的 enum 生成，错值进不了 handler。"""
        code, _, err = run('--db', DB, 'ask', 'list_arkts_modules',
                           '--implementation_kind', 'bogus')
        self.assertEqual(code, 2)
        self.assertIn('invalid choice', err)

    def test_array_param(self):
        """`--group_by subsystem` 这种数组参数，34 行样机当初是挂的。"""
        code, out, _ = run('--db', DB, 'ask', 'aggregate',
                           '--table', 'components', '--group_by', 'subsystem')
        self.assertEqual(code, 0)
        # 子系统数随库走（rk3568 是 56），断言分组本身成组且数得过来。
        groups = json.loads(out)['groups']
        self.assertGreaterEqual(len(groups), 10)
        self.assertEqual(len(groups), len({g['key'] for g in groups}))

    def test_object_param(self):
        code, out, _ = run('--db', DB, 'ask', 'list_entities',
                           '--table', 'components', '--page', '{"limit": 3}')
        self.assertEqual(code, 0)
        self.assertEqual(len(json.loads(out)['items']), 3)

    def test_tool_error_exits_5(self):
        code, _, err = run('--db', DB, 'ask', 'get_component', '--name', 'no_such')
        self.assertEqual(code, cli.EXIT_TOOL_ERROR)
        self.assertIn('NOT_FOUND', err)

    def test_missing_db_exits_3(self):
        code, _, err = run('--db', '/nonexistent.db', 'ask', 'get_tables')
        self.assertEqual(code, cli.EXIT_NO_DB)
        self.assertIn('not found', err)

    def test_no_db_and_no_product_is_a_usage_error(self):
        """不猜默认产品。artifacts/ 下的目录布局很容易被误认成多产品。"""
        code, _, err = run('ask', 'get_tables')
        self.assertEqual(code, cli.EXIT_USAGE)
        self.assertIn('--db', err)

    def test_list_covers_every_tool(self):
        code, out, _ = run('ask', '--list')
        self.assertEqual(code, 0)
        for tool in REGISTRY:
            self.assertIn(tool.name, out)

    def test_markdown_list_omits_session_tools(self):
        """会话类在 CLI 里退化成参数，不该出现在给 skill 用的索引里。"""
        _, out, _ = run('ask', '--list', '--markdown')
        self.assertIn('`get_component`', out)
        self.assertNotIn('`open_session`', out)


@unittest.skipUnless(os.path.isfile(DB), f'test database not found: {DB}')
class DiffAcrossFiles(unittest.TestCase):
    """跨库对比：--db 给两次。

    不只验"跑通"——**注入已知差异再核对检出的正是那几条**。
    只跑通不注入，证明不了它真的在比对。
    """

    @classmethod
    def setUpClass(cls):
        cls.tmp = tempfile.mkdtemp()
        cls.other = os.path.join(cls.tmp, 'b.db')
        shutil.copy(DB, cls.other)
        connection = sqlite3.connect(cls.other)
        connection.execute("DELETE FROM components WHERE name IN "
                           "('ace_engine', 'image_framework')")
        connection.execute("UPDATE components SET subsystem = 'changed' "
                           "WHERE name = 'init'")
        connection.commit()
        connection.close()

    @classmethod
    def tearDownClass(cls):
        shutil.rmtree(cls.tmp, ignore_errors=True)

    def test_detects_exactly_the_injected_differences(self):
        code, out, _ = run('--db', DB, '--db', self.other, 'diff',
                           '--entity', 'components')
        self.assertEqual(code, 0)
        result = json.loads(out)
        self.assertEqual(result['added'], [])
        self.assertEqual(sorted(result['removed']), ['ace_engine', 'image_framework'])
        self.assertEqual([c['key'] for c in result['changed']], ['init'])
        self.assertEqual(result['changed'][0]['changes'],
                         [{'field': 'subsystem', 'before': 'startup', 'after': 'changed'}])

    def test_three_databases_is_rejected(self):
        code, _, err = run('--db', DB, '--db', self.other, '--db', DB,
                           'diff', '--entity', 'components')
        self.assertEqual(code, cli.EXIT_USAGE)
        self.assertIn('最多给两个', err)

    def test_single_database_needs_scan_b(self):
        code, _, err = run('--db', DB, 'diff', '--entity', 'components')
        self.assertEqual(code, cli.EXIT_USAGE)
        self.assertIn('--scan-b', err)


@unittest.skipUnless(os.path.isfile(DB), f'test database not found: {DB}')
class SqlFromFile(unittest.TestCase):
    """SQL 走文件，绕开 shell 引号地狱。

    这段 SQL 刻意带上**头注释、单引号、换行、% 通配符**——
    带头注释曾经被 check_sql 判成 NOT_READ_ONLY（它取第一个 token 拿到 `--`），
    而那正是 SQL 文件的常态。
    """

    SQL = ("-- 各子系统部件数，排除三方\n"
           "SELECT c.subsystem, COUNT(*) AS parts,\n"
           "       SUM(CASE WHEN c.name LIKE '%engine%' THEN 1 ELSE 0 END) AS engines\n"
           "  FROM components c\n"
           " WHERE c.subsystem != 'thirdparty'\n"
           " GROUP BY c.subsystem HAVING parts > 8 ORDER BY parts DESC\n")

    def setUp(self):
        self.tmp = tempfile.mkdtemp()
        self.path = os.path.join(self.tmp, 'q.sql')
        Path(self.path).write_text(self.SQL, encoding='utf-8')

    def tearDown(self):
        shutil.rmtree(self.tmp, ignore_errors=True)

    def test_commented_multiline_file_runs(self):
        code, out, _ = run('--db', DB, 'sql', '--file', self.path)
        self.assertEqual(code, 0)
        rows = json.loads(out)['rows']
        self.assertGreater(len(rows), 0)
        # HAVING parts > 8 只保留大子系统；首行应是子系统聚合，验证 GROUP BY 生效。
        self.assertEqual(len(rows), len({r['subsystem'] for r in rows}))

    def test_writes_are_still_rejected(self):
        Path(self.path).write_text('-- looks harmless\nDROP TABLE components',
                                   encoding='utf-8')
        code, _, err = run('--db', DB, 'sql', '--file', self.path)
        self.assertEqual(code, cli.EXIT_TOOL_ERROR)
        self.assertIn('NOT_READ_ONLY', err)

    def test_sql_and_file_are_mutually_exclusive(self):
        code, _, err = run('--db', DB, 'sql', '--sql', 'SELECT 1', '--file', self.path)
        self.assertEqual(code, cli.EXIT_USAGE)
        self.assertIn('二选一', err)

    def test_missing_file(self):
        code, _, err = run('--db', DB, 'sql', '--file', '/nonexistent.sql')
        self.assertEqual(code, cli.EXIT_USAGE)
        self.assertIn('not found', err)


@unittest.skipUnless(os.path.isfile(DB), f'test database not found: {DB}')
class ArchCommands(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.image_so = elf_dest('libimage.z.so')
        cls.beget_proxy_so = elf_dest('libbeget_proxy.z.so')

    def require_paths(self):
        if not self.image_so or not self.beget_proxy_so:
            self.skipTest('selected database lacks the rk3568 ELF samples')

    def cases(self):
        self.require_paths()
        return (
            ('overview', None),
            ('trace', self.image_so),
            ('impact', self.beget_proxy_so),
            ('impact', 'init'),
            ('provides', 'image_framework'),
            ('switch', 'ace_engine_feature_asbng_path'),
            ('runtime', 'foundation'),
        )

    def test_all_six_run(self):
        for question, target in self.cases():
            argv = ['--db', DB, 'arch', question] + ([target] if target else [])
            code, out, err = run(*argv)
            self.assertEqual(code, 0, f'arch {question} {target}: {err}')
            self.assertTrue(json.loads(out), f'arch {question} 返回空')

    def test_capped_at_six(self):
        """封顶 6 条。想加第 7 条，先问它是不是真的架构级。"""
        self.assertEqual(len(cli.ARCH), 6)

    def test_trace_reaches_the_repository(self):
        self.require_paths()
        _, out, _ = run('--db', DB, 'arch', 'trace',
                        self.image_so)
        result = json.loads(out)
        self.assertEqual(result['component'], 'image_framework')
        self.assertEqual(result['subsystem'], 'multimedia')
        # repo 名随库走：rk3568 是短名，新库带仓路径前缀。
        self.assertTrue(result['repo'].endswith('multimedia_image_framework'))
        self.assertTrue(result['repo_url'].startswith('https://'))
        self.assertEqual(result['sdk_modules'], ['api/@ohos.multimedia.image'])

    def test_unknown_target_is_a_tool_error_not_a_crash(self):
        for question, target in (('trace', 'system/lib/nope.so'),
                                 ('provides', 'no_such_component'),
                                 ('switch', 'no_such_arg'),
                                 ('runtime', 'zzzz_no_such_service')):
            code, _, err = run('--db', DB, 'arch', question, target)
            self.assertEqual(code, cli.EXIT_TOOL_ERROR, f'{question} {target}')
            self.assertTrue(err.strip())

    def test_target_is_required_where_it_matters(self):
        code, _, err = run('--db', DB, 'arch', 'trace')
        self.assertEqual(code, cli.EXIT_USAGE)
        self.assertIn('需要一个参数', err)

    def test_arch_writes_no_sql(self):
        """arch 的硬约束：只许编排已有工具，不许自己写 SQL。

        不检查这条，arch 迟早会为了"就差一个字段"直接 session.sql()，
        于是变成第二套绕过工具层、没有权限校验也没有游标的查询 API。
        """
        source = Path(cli.__file__).read_text(encoding='utf-8')
        body = re.sub(r'""".*?"""', '', source, flags=re.S)     # 去掉文档字符串
        self.assertNotIn('session.sql(', body)
        self.assertNotIn('.execute(', body)
        for keyword in ('SELECT ', 'FROM ', 'JOIN '):
            self.assertNotIn(keyword, body, f'cli.py 里出现了 SQL：{keyword}')

    def test_arch_only_calls_registered_tools(self):
        source = Path(cli.__file__).read_text(encoding='utf-8')
        called = set(re.findall(r"_call\(manager, '([a-z_]+)'", source))
        self.assertTrue(called, '没解析到任何 _call，正则可能失效')
        self.assertEqual(called - {t.name for t in REGISTRY}, set())


class EntryPointDispatch(unittest.TestCase):
    """`oskm.py` 按子命令分派到扫描 CLI 还是查询 CLI。

    不能只看 argv[0]：查询 CLI 的全局 flag 写在子命令前面（`--db X ask …`）。
    也不能傻扫所有 token——第一版就是这么写的，`scan --product sql` 会被
    `sql` 这个取值骗到查询侧去。
    """

    @staticmethod
    def dispatcher():
        import importlib.util
        path = Path(__file__).resolve().parents[3] / 'oskm.py'
        spec = importlib.util.spec_from_file_location('oskm_entry', path)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        return module

    def test_routing(self):
        entry = self.dispatcher()
        for argv, expected in (
                (['list'], False),
                (['scan', '--product', 'rk3568', '--workspace-root', '/x'], False),
                (['scan', '--product', 'sql', '--workspace-root', '/x'], False),
                (['--product', 'arch', 'scans'], False),
                (['--db', '/tmp/a.db', 'ask', 'get_tables'], True),
                (['--db', '/tmp/a.db', '--format', 'table', 'arch', 'overview'], True),
                (['--db=/tmp/a.db', 'sql', '--file', 'q.sql'], True),
                (['--db', 'x', 'diff', '--entity', 'components'], True)):
            self.assertEqual(entry._is_query(argv), expected, argv)


if __name__ == '__main__':
    unittest.main()
