# pylint: disable=wrong-import-position  # tests adjust sys.path before local imports
# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
for _p in (str(_HERE.parents[0]), str(_HERE.parents[1])):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)
import os
import sqlite3
import sys
import unittest
from pathlib import Path

from oskm_cli.query.tools import dispatch

# cli/tests -> cli -> packages/oskm -> packages -> KnowledgeBase/
OSKM = Path(__file__).resolve().parents[2]
ROOT = OSKM.parents[1]
SKILL_ROOT = OSKM / 'skills' / 'ohos-design-architecture-evidence-query'


_SEARCH_SCHEMA_SQL = '''
            CREATE TABLE install_targets (
                id INTEGER PRIMARY KEY,
                scan_id INTEGER NOT NULL,
                module_id INTEGER,
                dest TEXT NOT NULL,
                directory INTEGER NOT NULL,
                partition TEXT,
                file_name TEXT
            );
            CREATE TABLE components (
                id INTEGER PRIMARY KEY,
                scan_id INTEGER NOT NULL,
                name TEXT
            );
            CREATE TABLE elf_modules (
                id INTEGER PRIMARY KEY,
                scan_id INTEGER NOT NULL,
                install_target_id INTEGER NOT NULL,
                install_module_id INTEGER,
                component_id INTEGER,
                file_name TEXT NOT NULL,
                soname TEXT,
                partition TEXT,
                format TEXT,
                api_type TEXT NOT NULL,
                category TEXT NOT NULL,
                type TEXT,
                machine INTEGER,
                dynamic INTEGER NOT NULL,
                needed TEXT NOT NULL
            );
            CREATE TABLE native_headers (
                id INTEGER PRIMARY KEY,
                scan_id INTEGER NOT NULL,
                elf_module_id INTEGER NOT NULL,
                header_path TEXT NOT NULL,
                match_strategy TEXT NOT NULL
            );
            INSERT INTO components VALUES (1, 1, 'search_component');
            WITH RECURSIVE sequence(n) AS (
                VALUES (1) UNION ALL SELECT n + 1 FROM sequence WHERE n < 21
            )
            INSERT INTO install_targets
                SELECT n, 1, n, 'system/lib/libsearch' || n || '.so', 0,
                       'system', 'libsearch' || n || '.so' FROM sequence;
            WITH RECURSIVE sequence(n) AS (
                VALUES (1) UNION ALL SELECT n + 1 FROM sequence WHERE n < 21
            )
            INSERT INTO elf_modules
                SELECT n, 1, n, n, 1, 'libsearch' || n || '.so',
                       'libsearch' || n || '.so', 'system', 'ELF', 'public_api', 'lib', 'library', 183, 1, '[]' FROM sequence;
            WITH RECURSIVE sequence(n) AS (
                VALUES (1) UNION ALL SELECT n + 1 FROM sequence WHERE n < 21
            )
            INSERT INTO native_headers
                SELECT n, 1, n, 'interface/sdk_c/search' || n || '.h',
                       'build_gn' FROM sequence;
'''


class FakeSession:
    scan_id = 1

    def __init__(self):
        self.connection = sqlite3.connect(':memory:')
        self.connection.row_factory = sqlite3.Row
        self.connection.executescript(_SEARCH_SCHEMA_SQL)

    def sql(self, sql, params=()):
        return [dict(row) for row in self.connection.execute(sql, params)]


class FakeManager:
    def __init__(self):
        self.session = FakeSession()

    def get_active(self):
        return self.session


class TestSearchTotals(unittest.TestCase):
    def setUp(self):
        self.manager = FakeManager()

    def test_elf_total_is_full_match_count_not_return_count(self):
        limited = dispatch('search_elf_modules',
                           {'query': 'search'}, self.manager)
        full = dispatch('search_elf_modules',
                        {'query': 'search', 'limit': 100}, self.manager)

        self.assertEqual(limited['total'], 21)
        self.assertEqual(len(limited['results']), 20)
        self.assertTrue(limited['truncated'])
        self.assertEqual(full['total'], 21)
        self.assertEqual(len(full['results']), 21)
        self.assertFalse(full['truncated'])

    def test_native_total_is_full_match_count_not_return_count(self):
        limited = dispatch('search_native_headers',
                           {'query': 'search'}, self.manager)
        full = dispatch('search_native_headers',
                        {'query': 'search', 'limit': 100}, self.manager)

        self.assertEqual(limited['total'], 21)
        self.assertEqual(len(limited['results']), 20)
        self.assertTrue(limited['truncated'])
        self.assertEqual(full['total'], 21)
        self.assertEqual(len(full['results']), 21)
        self.assertFalse(full['truncated'])


class TestSearchDocs(unittest.TestCase):
    def test_docs_define_full_match_total_and_truncation(self):
        for path in (
                SKILL_ROOT / 'references/spec/elf.md',
                SKILL_ROOT / 'references/spec/native.md'):
            with self.subTest(path=path.name):
                text = path.read_text(encoding='utf-8')
                self.assertIn('`total` 是全量匹配数', text)
                self.assertIn('`truncated`', text)
                self.assertIn('`limit`', text)

    def test_skill_requires_image_boundary_and_wide_search_totals(self):
        text = (SKILL_ROOT / 'SKILL.md').read_text(encoding='utf-8')
        self.assertIn('`install_targets` 不是实际 `.img` 数', text)
        self.assertIn('实测 `.img` 数量', text)
        self.assertIn('ELF 与 Native SDK 宽搜索的 `total`', text)
        self.assertIn('`truncated`', text)

    def test_skill_requires_feature_count_for_arch_switch_answers(self):
        text = (SKILL_ROOT / 'SKILL.md').read_text(encoding='utf-8')
        self.assertIn('`feature_count`', text)
        self.assertIn('`features`', text)



if __name__ == '__main__':
    unittest.main()
