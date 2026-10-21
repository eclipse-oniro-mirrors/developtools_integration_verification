"""Security tests for sql_query escape hatch."""
import unittest

from agentic.mcp.security import check_sql, SecurityError

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


class TestEmptySql(unittest.TestCase):
    def test_rejects_empty(self):
        with self.assertRaises(SecurityError) as ctx:
            check_sql('', ALLOWED, ALIASES, SCAN_ID)
        self.assertEqual(ctx.exception.code, 'EMPTY_SQL')
