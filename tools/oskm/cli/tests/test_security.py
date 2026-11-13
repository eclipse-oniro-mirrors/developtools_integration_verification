"""Security tests for sql_query escape hatch."""

from pathlib import Path
import _path_setup
import unittest
from oskm_cli.query import security
from oskm_cli.query.security import check_sql, SecurityError

# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
_HERE = Path(__file__).resolve().parent


ALLOWED = {'components', 'services', 'gn_args', 'repos', 'innerapis', 'features',
           'syscaps', 'install_modules', 'install_targets', 'install_module_tags',
           'elf_modules', 'elf_module_dependencies', 'sas', 'hdis', 'scans',
           'collector_runs', 'issues', 'component_links_run'}
ALIASES = set()
SCAN_ID = 2


class TestReadOnly(unittest.TestCase):
    def test_accepts_select(self):
        sql, _ = check_sql('SELECT * FROM components', ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('scan_id', sql)

    def test_accepts_with_cte(self):
        sql, _ = check_sql(
            'WITH x AS (SELECT * FROM components) SELECT * FROM x',
            ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('scan_id', sql)

    def test_rejects_insert(self):
        with self.assertRaises(SecurityError) as ctx:
            check_sql('INSERT INTO repos VALUES (1)', ALLOWED, ALIASES, SCAN_ID)
        self.assertEqual(ctx.exception.code, 'NOT_READ_ONLY')

    def test_rejects_update(self):
        with self.assertRaises(SecurityError) as ctx:
            check_sql('UPDATE repos SET name = "x"', ALLOWED, ALIASES, SCAN_ID)
        self.assertEqual(ctx.exception.code, 'NOT_READ_ONLY')

    def test_rejects_delete(self):
        with self.assertRaises(SecurityError) as ctx:
            check_sql('DELETE FROM repos', ALLOWED, ALIASES, SCAN_ID)
        self.assertEqual(ctx.exception.code, 'NOT_READ_ONLY')

    def test_rejects_drop(self):
        with self.assertRaises(SecurityError) as ctx:
            check_sql('DROP TABLE repos', ALLOWED, ALIASES, SCAN_ID)
        self.assertEqual(ctx.exception.code, 'NOT_READ_ONLY')


class TestForbiddenKeywords(unittest.TestCase):
    def test_rejects_pragma(self):
        with self.assertRaises(SecurityError) as ctx:
            check_sql('SELECT * FROM components; PRAGMA table_info(repos)',
                      ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('FORBIDDEN_KEYWORD', ctx.exception.code)

    def test_rejects_attach(self):
        with self.assertRaises(SecurityError) as ctx:
            check_sql("SELECT * FROM components; ATTACH DATABASE 'x.db' AS sec",
                      ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('FORBIDDEN_KEYWORD', ctx.exception.code)

    def test_rejects_create(self):
        with self.assertRaises(SecurityError) as ctx:
            check_sql('SELECT * FROM components; CREATE TABLE x (id INT)',
                      ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('FORBIDDEN_KEYWORD', ctx.exception.code)


class TestTableWhitelist(unittest.TestCase):
    def test_allows_known_table(self):
        sql, _ = check_sql('SELECT * FROM services', ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('services', sql)

    def test_rejects_unknown_table(self):
        with self.assertRaises(SecurityError) as ctx:
            check_sql('SELECT * FROM nonexistent', ALLOWED, ALIASES, SCAN_ID)
        self.assertEqual(ctx.exception.code, 'TABLE_NOT_ALLOWED')

    def test_allows_alias_table(self):
        aliases = {'baseline'}
        sql, _ = check_sql(
            'SELECT * FROM baseline.components WHERE 1=1',
            ALLOWED, aliases, SCAN_ID)
        self.assertIn('baseline', sql)

    def test_rejects_unattached_alias(self):
        with self.assertRaises(SecurityError) as ctx:
            check_sql('SELECT * FROM baseline.components',
                      ALLOWED, ALIASES, SCAN_ID)
        self.assertEqual(ctx.exception.code, 'ALIAS_NOT_ATTACHED')


class TestScanIdInjection(unittest.TestCase):
    def test_injects_when_missing(self):
        sql, params = check_sql('SELECT * FROM components', ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('scan_id = ?', sql)
        self.assertEqual(params, (SCAN_ID,))

    def test_preserves_when_present(self):
        sql, params = check_sql(
            'SELECT * FROM components WHERE scan_id = 5',
            ALLOWED, ALIASES, SCAN_ID)
        self.assertNotIn('scan_id = ?', sql)
        self.assertEqual(params, ())

    def test_injects_with_existing_where(self):
        sql, params = check_sql(
            'SELECT * FROM components WHERE name = ?',
            ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('scan_id = ?', sql)
        self.assertIn('AND', sql)
        self.assertEqual(params, (SCAN_ID,))

    def test_injects_with_existing_multiline_where(self):
        sql, params = check_sql(
            'SELECT * FROM components\nWHERE name = ?',
            ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('WHERE scan_id = ? AND', sql)
        self.assertEqual(params, (SCAN_ID,))


class TestLimitEnforcement(unittest.TestCase):
    def test_adds_limit_when_missing(self):
        sql, _ = check_sql('SELECT * FROM components', ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('LIMIT 1000', sql)

    def test_preserves_existing_limit(self):
        sql, _ = check_sql(
            'SELECT * FROM components WHERE scan_id = 2 LIMIT 10',
            ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('LIMIT 10', sql)
        self.assertNotIn('LIMIT 1000', sql)


class TestTrailingSemicolon(unittest.TestCase):
    """SQL 以 `;`（或 `; -- 注释`）结尾时，注入 scan_id/LIMIT 不能拼在分号后，
    否则 sqlite3 报 "You can only execute one statement at a time"。
    文件传进来的 SQL 几乎都以 `;` 收尾，这是常见写法。
    """

    def test_trailing_semicolon(self):
        sql, params = check_sql('SELECT * FROM components;', ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('scan_id = ?', sql)
        self.assertEqual(params, (SCAN_ID,))
        self.assertNotIn('; WHERE', sql)

    def test_semicolon_then_line_comment(self):
        sql, _ = check_sql('SELECT * FROM components; -- done', ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('scan_id = ?', sql)
        self.assertNotIn('; -- done WHERE', sql)

    def test_semicolon_then_block_comment(self):
        sql, _ = check_sql('SELECT * FROM components; /* c */', ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('scan_id = ?', sql)
        self.assertNotIn('; /* c */ WHERE', sql)

    def test_semicolon_with_existing_limit(self):
        sql, _ = check_sql('SELECT * FROM components LIMIT 5;', ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('LIMIT 5', sql)
        self.assertNotIn('LIMIT 1000', sql)

    def test_with_cte_trailing_semicolon(self):
        sql, _ = check_sql(
            'WITH x AS (SELECT * FROM components) SELECT * FROM x;',
            ALLOWED, ALIASES, SCAN_ID)
        self.assertIn('scan_id = ?', sql)


class TestScanIdInjectionPosition(unittest.TestCase):
    """没有 WHERE 时，scan_id 的注入点必须在 GROUP BY/ORDER BY/LIMIT/HAVING
    中**最早出现**的那个之前，否则 `GROUP BY x WHERE ...` 非法。
    """

    def test_group_by_no_where(self):
        sql, params = check_sql(
            'SELECT subsystem, COUNT(*) AS n FROM components '
            'GROUP BY subsystem ORDER BY n DESC LIMIT 3',
            ALLOWED, ALIASES, SCAN_ID)
        self.assertIn(' WHERE scan_id = ? GROUP BY', sql)
        self.assertLess(sql.index('scan_id'), sql.index('GROUP BY'))
        self.assertEqual(params, (SCAN_ID,))

    def test_order_by_no_where(self):
        sql, _ = check_sql(
            'SELECT * FROM components ORDER BY name', ALLOWED, ALIASES, SCAN_ID)
        self.assertIn(' WHERE scan_id = ? ORDER BY', sql)
        self.assertLess(sql.index('scan_id'), sql.index('ORDER BY'))

    def test_group_by_having_no_where(self):
        sql, _ = check_sql(
            'SELECT subsystem, COUNT(*) AS n FROM components '
            'GROUP BY subsystem HAVING n > 8',
            ALLOWED, ALIASES, SCAN_ID)
        self.assertLess(sql.index('scan_id'), sql.index('GROUP BY'))
        self.assertLess(sql.index('scan_id'), sql.index('HAVING'))


class TestEmptySql(unittest.TestCase):
    def test_rejects_empty(self):
        with self.assertRaises(SecurityError) as ctx:
            check_sql('', ALLOWED, ALIASES, SCAN_ID)
        self.assertEqual(ctx.exception.code, 'EMPTY_SQL')


class LeadingCommentsAreSkipped(unittest.TestCase):
    """SQL 走文件传进来时开头几乎总有注释。

    原实现取 `sql.strip().split()[0]`，带头注释时拿到的是 `--`，
    于是整条被判 NOT_READ_ONLY。命令行里手写 SQL 碰不到，
    改成 `--sql-file` 之后天天碰到。

    剥掉的只是**开头**的注释，剥完第一个词仍须是 SELECT/WITH——
    下面后三条就是盯着这点，别让"跳过注释"变成绕过只读校验的口子。
    """

    TABLES = {'components'}

    def accepts(self, sql):
        check_sql(sql, self.TABLES, set(), 1)

    def rejects(self, sql, code='NOT_READ_ONLY'):
        with self.assertRaises(SecurityError) as cm:
            check_sql(sql, self.TABLES, set(), 1)
        self.assertEqual(cm.exception.code, code)

    def test_line_comment(self):
        self.accepts('-- 统计各子系统部件数\nSELECT 1 FROM components')

    def test_block_comment(self):
        self.accepts('/* 统计 */ SELECT 1 FROM components')

    def test_multiline_and_blank_lines(self):
        self.accepts('\n\n-- a\n-- b\n\nSELECT 1 FROM components')

    def test_block_comment_spanning_lines(self):
        self.accepts('/* a\n   b */\nSELECT 1 FROM components')

    def test_comment_cannot_disguise_a_write(self):
        self.rejects('-- SELECT\nDROP TABLE components')
        self.rejects('/* SELECT */ DELETE FROM components')

    def test_comment_only_is_not_a_query(self):
        self.rejects('-- nothing here')



class TestPrivateSqlExecutor(unittest.TestCase):
    def test_enables_uri_handling_for_readonly_attach(self):
        calls = []
        original_connect = security.sqlite3.connect

        def connect(*args, **kwargs):
            calls.append((args, kwargs))
            return original_connect(*args, **kwargs)

        security.sqlite3.connect = connect
        try:
            rows, truncated = security.execute_readonly_sql(
                [], 'SELECT 1 AS n', limit=1)
        finally:
            security.sqlite3.connect = original_connect

        self.assertEqual(rows, [{'n': 1}])
        self.assertFalse(truncated)
        self.assertEqual(
            calls[0][1].get('uri'), True,
            'private executor must enable SQLite URI handling')
        self.assertEqual(calls[0][0][0], ':memory:')
