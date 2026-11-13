"""CLI 的验收：ask / arch / diff / sql。

`oskm ask` 的子命令是**生成的**，所以这里不逐个断言 50 个命令长什么样——
那等于把生成器的输出抄一遍。断言的是生成这件事本身成立：
每个工具都有子命令、枚举会被拒、数组参数能传、必填缺了会报错。

`arch` 另有一条结构性断言：它只许编排已有工具，不许自己写 SQL（见
test_arch_writes_no_sql）。这条约束不检查的话，`arch` 迟早会长成
第二套绕过工具层的查询 API。
"""

import _path_setup
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
from oskm_cli import cli
from oskm_cli.query.tools import REGISTRY
from oskm_testing.testdb import DB, count, elf_dest, sample_component
from oskm_testing.testdb import sample_elf, sample_gn_arg, sample_names
from oskm_testing.testdb import sample_service_with_sa

# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
_HERE = Path(__file__).resolve().parent




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
        """标量参数从 schema 生成，取到的行要能对上请求的名字。

        原来钉的是 `ace_engine` + `subsystem == 'arkui'`，两个都是 wukong100
        的事实。现在名字从库里取，断言改成"返回的就是本文要的那一行"。
        """
        name = sample_component(DB)
        if not name:
            self.skipTest('selected database has no components')
        code, out, _ = run('--db', DB, 'ask', 'get_component', '--name', name)
        self.assertEqual(code, 0)
        result = json.loads(out)
        self.assertEqual(result['name'], name)
        self.assertIn('subsystem', result)

    def test_enum_is_rejected_by_argparse(self):
        """枚举校验白拿：choices 从 schema 的 enum 生成，错值进不了 handler。"""
        code, _, err = run('--db', DB, 'ask', 'list_arkts_modules',
                           '--implementation_kind', 'bogus')
        self.assertEqual(code, 2)
        self.assertIn('invalid choice', err)

    def test_array_param(self):
        """`--group_by subsystem` 这种数组参数，34 行样机当初是挂的。

        原来断言 `len(groups) >= 10`——那是对**库规模**的假设（wukong100 有 57
        个子系统），换成小库就红。改成校聚合本身的性质：分组互不重复，且
        **各组之和等于总数**。后者更强（能抓住漏分组），且不随库变化。
        """
        code, out, _ = run('--db', DB, 'ask', 'aggregate',
                           '--table', 'components', '--group_by', 'subsystem')
        self.assertEqual(code, 0)
        groups = json.loads(out)['groups']
        self.assertGreaterEqual(len(groups), 1)
        self.assertEqual(len(groups), len({g['key'] for g in groups}))
        self.assertEqual(sum(g['count'] for g in groups), count('components', DB))

    def test_object_param(self):
        code, out, _ = run('--db', DB, 'ask', 'list_entities',
                           '--table', 'components', '--page', '{"limit": 3}')
        self.assertEqual(code, 0)
        payload = json.loads(out)
        # 原来钉 `== 3`，那假设库里至少有 3 个部件。改成"分页真的生效"：
        # 不超过 limit，且等于 min(limit, 总数)。
        total = count('components', DB)
        self.assertLessEqual(len(payload['items']), 3)
        self.assertEqual(len(payload['items']), min(3, total))

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
        # 注入的差异也从库里现取：原来钉的是 ace_engine / image_framework / init
        # 三个 wukong100 部件名，换库就全红（而 diff 逻辑一个字没变）。
        cls.names = sample_names('components', limit=3, db_path=DB)
        cls.tmp = tempfile.mkdtemp()
        cls.other = os.path.join(cls.tmp, 'b.db')
        shutil.copy(DB, cls.other)
        if len(cls.names) == 3:
            connection = sqlite3.connect(cls.other)
            connection.execute('DELETE FROM components WHERE name IN (?, ?)',
                               cls.names[:2])
            connection.execute(
                'UPDATE components SET subsystem = ? WHERE name = ?',
                ('__changed__', cls.names[2]))
            connection.commit()
            connection.close()

    @classmethod
    def tearDownClass(cls):
        shutil.rmtree(cls.tmp, ignore_errors=True)

    def test_detects_exactly_the_injected_differences(self):
        if len(self.names) < 3:
            self.skipTest('selected database has fewer than 3 components')
        code, out, _ = run('--db', DB, '--db', self.other, 'diff',
                           '--entity', 'components')
        self.assertEqual(code, 0)
        result = json.loads(out)
        self.assertEqual(result['added'], [])
        self.assertEqual(sorted(result['removed']), sorted(self.names[:2]))
        self.assertEqual([c['key'] for c in result['changed']], [self.names[2]])
        changes = result['changed'][0]['changes']
        self.assertEqual([c['field'] for c in changes], ['subsystem'])
        self.assertEqual(changes[0]['after'], '__changed__')
        # before 是库里原本的值，不写死 'startup'。
        self.assertNotEqual(changes[0]['before'], '__changed__')

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

    # 这段 SQL 要保留的特征是**头注释 / 单引号 / 换行 / % 通配符**——那才是
    # 被测的东西（带头注释曾被 check_sql 判成 NOT_READ_ONLY）。
    # 原来还带 `!= 'thirdparty'` 与 `HAVING parts > 8`，那两个是对库内容的假设：
    # 小库里没有大子系统，查询返回 0 行，用例就红——而 SQL 文件通路一点没坏。
    SQL = ("-- 各子系统部件数（头注释 + 单引号 + 换行 + % 通配符）\n"
           "SELECT c.subsystem, COUNT(*) AS parts,\n"
           "       SUM(CASE WHEN c.name LIKE '%\\_%' ESCAPE '\\'\n"
           "                THEN 1 ELSE 0 END) AS underscored\n"
           "  FROM components c\n"
           " WHERE c.subsystem != '__no_such_subsystem__'\n"
           " GROUP BY c.subsystem ORDER BY parts DESC\n")

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
        # 每个子系统一行 → GROUP BY 生效；各行之和 == 部件总数 → 没有漏组。
        self.assertEqual(len(rows), len({r['subsystem'] for r in rows}))
        self.assertEqual(sum(r['parts'] for r in rows), count('components', DB))

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
    """六条 arch 命令。**目标全部从库里现取**，不写死 wukong100 的实体名。

    原来这里钉的是 `libimage.z.so` / `init` / `image_framework` /
    `ace_engine_feature_asbng_path` / `foundation`。换一个库就全红，而 arch 的
    编排逻辑一个字都没变。现在改成：用 `oskm_testing.testdb.sample_*` 取一个
    满足前置条件的样本；取不到就 `skipTest`（采集允许降级，某域为空不是 bug）。
    """

    @classmethod
    def setUpClass(cls):
        cls.trace_dest = sample_elf(DB)
        cls.impact_dest = sample_elf(DB, with_dependents=True)
        cls.component = sample_component(DB, with_repo=True)
        cls.gn_arg = sample_gn_arg(DB, with_features=True)
        cls.service = sample_service_with_sa(DB)

    def require(self, *values):
        if not all(values):
            self.skipTest('selected database lacks a sample for this arch command')

    def cases(self):
        self.require(self.trace_dest, self.impact_dest, self.component,
                     self.gn_arg, self.service)
        return (
            ('overview', None),
            ('trace', self.trace_dest),
            ('impact', self.impact_dest),
            ('impact', self.component),
            ('provides', self.component),
            ('switch', self.gn_arg),
            ('runtime', self.service),
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
        """`arch trace` 要把整条链走完：安装落点 → 部件 → 仓 → SDK 接口。

        **不钉具体值**（原来钉的是 image_framework / multimedia /
        api/@ohos.multimedia.image，全是 wukong100 的事实）。改成校两件更强的事：
        链条每一环都在，以及**各环节互相自洽**——`trace` 报的部件必须与
        `owner_of` 独立报出的一致。跨工具一致性比钉字面量更能抓住编排错误，
        而且不随库变化。
        """
        self.require(self.trace_dest)
        _, out, _ = run('--db', DB, 'arch', 'trace', self.trace_dest)
        result = json.loads(out)
        for key in ('file', 'component', 'subsystem', 'repo', 'repo_url',
                    'sdk_modules'):
            self.assertIn(key, result)
        self.assertIsInstance(result['sdk_modules'], list)
        if result['repo_url']:
            self.assertIn('://', result['repo_url'])

        # 自洽性：与另一个独立工具对同一个 dest 的归属判断一致。
        _, owner_out, _ = run('--db', DB, 'ask', 'owner_of',
                              '--dest', self.trace_dest)
        owner = json.loads(owner_out)
        if owner.get('component'):
            self.assertEqual(result['component'], owner['component'],
                             'arch trace 与 owner_of 对同一个 dest 给出了不同部件')

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


if __name__ == '__main__':
    unittest.main()
