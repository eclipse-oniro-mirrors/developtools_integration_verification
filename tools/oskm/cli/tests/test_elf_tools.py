from pathlib import Path
import _path_setup
import sqlite3
import unittest
from oskm_cli.query.tools import ToolError
from oskm_cli.query.tools.elf import (
    elf_dependencies,
    elf_dependents,
    search_elf_modules,
)

# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
_HERE = Path(__file__).resolve().parent



_BASE_ELF_SCHEMA_SQL = '''
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
            CREATE TABLE elf_module_dependencies (
                id INTEGER PRIMARY KEY,
                scan_id INTEGER NOT NULL,
                caller_id INTEGER NOT NULL,
                needed_ordinal INTEGER NOT NULL,
                needed_name TEXT NOT NULL,
                callee_id INTEGER
            );
            INSERT INTO components VALUES
                (1, 1, 'root_component'),
                (2, 1, 'middle_component');
            INSERT INTO install_targets VALUES
                (1, 1, 1, 'system/lib/libroot.z.so', 0, 'system', 'libroot.z.so'),
                (2, 1, 2, 'system/lib/libmiddle.z.so', 0, 'system', 'libmiddle.z.so'),
                (3, 1, 3, 'system/lib/libchild.z.so', 0, 'system', 'libchild.z.so'),
                (4, 1, 4, 'system/lib/libother.z.so', 0, 'system', 'libother.z.so');
            INSERT INTO elf_modules VALUES
                (1, 1, 1, 1, 1, 'libroot.z.so', 'libroot.z.so', 'system', 'ELF', 'public_api', '[]', 'lib', 183, 1, '[]'),
                (2, 1, 2, 2, 2, 'libmiddle.z.so', 'libmiddle.z.so', 'system', 'ELF', 'public_api', '[]', 'lib', 183, 1, '[]'),
                (3, 1, 3, 3, NULL, 'libchild.z.so', 'libchild.z.so', 'system', 'ELF', 'public_api', '[]', 'lib', 183, 1, '[]'),
                (4, 1, 4, 4, 2, 'libother.z.so', 'libother.z.so', 'system', 'ELF', 'public_api', '[]', 'lib', 183, 1, '[]');
            INSERT INTO elf_module_dependencies VALUES
                (1, 1, 1, 0, 'libmiddle.z.so', 2),
                (2, 1, 2, 0, 'libchild.z.so', 3),
                (3, 1, 1, 1, 'libmissing.z.so', NULL),
                (4, 1, 4, 0, 'libnotroot.z.so', NULL);
'''


_ELF_SCHEMA_SQL = '''
            DELETE FROM elf_module_dependencies;
            DELETE FROM elf_modules;
            DELETE FROM install_targets;
            INSERT INTO install_targets VALUES
                (1, 1, 1, 'system/lib/root.so', 0, 'system', 'root.so'),
                (2, 1, 2, 'system/lib/a.so', 0, 'system', 'a.so'),
                (3, 1, 3, 'system/lib/b.so', 0, 'system', 'b.so'),
                (4, 1, 4, 'system/lib/sink.so', 0, 'system', 'sink.so'),
                (5, 1, 5, 'system/lib/loop.so', 0, 'system', 'loop.so');
            INSERT INTO elf_modules VALUES
                (1, 1, 1, 1, 1, 'root.so', 'root.so', 'system', 'ELF', 'public_api', '[]', 'lib', 183, 1, '[]'),
                (2, 1, 2, 2, 1, 'a.so', 'a.so', 'system', 'ELF', 'public_api', '[]', 'lib', 183, 1, '[]'),
                (3, 1, 3, 3, 1, 'b.so', 'b.so', 'system', 'ELF', 'public_api', '[]', 'lib', 183, 1, '[]'),
                (4, 1, 4, 4, 1, 'sink.so', 'sink.so', 'system', 'ELF', 'public_api', '[]', 'lib', 183, 1, '[]'),
                (5, 1, 5, 5, 1, 'loop.so', 'loop.so', 'system', 'ELF', 'public_api', '[]', 'lib', 183, 1, '[]');
            INSERT INTO elf_module_dependencies VALUES
                (1, 1, 1, 0, 'a.so', 2),
                (2, 1, 1, 1, 'b.so', 3),
                (3, 1, 2, 0, 'sink.so', 4),
                (4, 1, 3, 0, 'sink.so', 4),
                (5, 1, 4, 0, 'loop.so', 5),
                (6, 1, 5, 0, 'a.so', 2);
'''


class FakeSession:
    scan_id = 1

    def __init__(self):
        self.connection = sqlite3.connect(':memory:')
        self.connection.row_factory = sqlite3.Row
        self.connection.executescript(_BASE_ELF_SCHEMA_SQL)

    def sql(self, sql, params=()):
        return [dict(row) for row in self.connection.execute(sql, params)]


class FakeManager:
    def __init__(self):
        self.session = FakeSession()

    def get_active(self):
        return self.session


class TestElfTools(unittest.TestCase):
    def setUp(self):
        self.manager = FakeManager()

    def test_forward_dependencies_use_install_targets(self):
        result = elf_dependencies(
            {'dest': 'system/lib/libroot.z.so'}, self.manager)

        self.assertEqual(
            [(row['dest'], row['distance']) for row in result['reachable']],
            [('system/lib/libmiddle.z.so', 1),
             ('system/lib/libchild.z.so', 2)])
        self.assertEqual(
            result['reachable'][0]['via'],
            'system/lib/libroot.z.so → system/lib/libmiddle.z.so')
        self.assertEqual(
            result['unresolved'],
            [{'needed_name': 'libmissing.z.so',
              'caller_dest': 'system/lib/libroot.z.so'}])

    def test_reverse_dependencies_use_install_targets(self):
        result = elf_dependencies(
            {'dest': 'system/lib/libchild.z.so', 'direction': 'reverse'},
            self.manager)

        self.assertEqual(
            [(row['dest'], row['distance']) for row in result['reachable']],
            [('system/lib/libmiddle.z.so', 1),
             ('system/lib/libroot.z.so', 2)])
        self.assertEqual(result['unresolved'], [])

    def test_direct_dependents_use_install_targets(self):
        result = elf_dependents(
            {'dest': 'system/lib/libchild.z.so'}, self.manager)

        self.assertEqual([row['dest'] for row in result['dependents']],
                         ['system/lib/libmiddle.z.so'])

    def test_search_uses_install_targets(self):
        result = search_elf_modules({'query': 'root'}, self.manager)

        self.assertEqual([row['dest'] for row in result['results']],
                         ['system/lib/libroot.z.so'])


class GraphSession(FakeSession):
    """菱形 + 环的图，专门盯住"闭包不是路径枚举"。

        root ─┬─> a ─┐
              └─> b ─┴─> sink ──> loop ──> a   （loop 回指 a，构成环）

    sink 有两条等长路径可达。旧实现用 UNION ALL + 累加 path，sink 会出现两行；
    真实数据里这种菱形叠起来的后果是 3,586 行只有 297 个不同节点（92% 重复），
    max_distance=3 要跑 90.6 秒、吐 1.27 MB。
    """

    def __init__(self):
        super().__init__()
        self.connection.executescript(_ELF_SCHEMA_SQL)


class GraphManager(FakeManager):
    def __init__(self):
        super().__init__()
        self.session = GraphSession()


class TestDependencyClosure(unittest.TestCase):
    def setUp(self):
        self.manager = GraphManager()

    def call(self, **params):
        return elf_dependencies({'dest': 'system/lib/root.so', **params}, self.manager)

    def test_each_node_appears_once_at_its_shortest_distance(self):
        """菱形的汇点只能出现一次，距离取最短。"""
        result = self.call()
        dests = [row['dest'] for row in result['reachable']]
        self.assertEqual(len(dests), len(set(dests)), f'有重复节点: {dests}')
        self.assertEqual(
            [(r['dest'], r['distance']) for r in result['reachable']],
            [('system/lib/a.so', 1), ('system/lib/b.so', 1),
             ('system/lib/sink.so', 2), ('system/lib/loop.so', 3)])
        self.assertEqual(result['total'], 4)
        self.assertFalse(result['truncated'])

    def test_via_is_one_shortest_path(self):
        """via 要是一条真实的最短路径，长度与 distance 对得上。"""
        for row in self.call()['reachable']:
            hops = row['via'].split(' → ')
            self.assertEqual(hops[0], 'system/lib/root.so')
            self.assertEqual(hops[-1], row['dest'])
            self.assertEqual(len(hops) - 1, row['distance'], row['via'])

    def test_cycle_terminates(self):
        """loop.so → a.so 构成环。不设 max_distance 也必须停。"""
        result = self.call()
        self.assertEqual(result['total'], 4)       # 环不会把 a.so 再算一遍
        self.assertEqual(result['max_distance'], 16)

    def test_max_distance_bounds_the_walk(self):
        self.assertEqual([r['dest'] for r in self.call(max_distance=1)['reachable']],
                         ['system/lib/a.so', 'system/lib/b.so'])
        self.assertEqual(self.call(max_distance=0)['total'], 0)

    def test_limit_truncates_and_says_so(self):
        """截断必须可见。悄悄截断会被当成"就这么多"。"""
        result = self.call(limit=2)
        self.assertEqual(len(result['reachable']), 2)
        self.assertEqual(result['total'], 4)
        self.assertTrue(result['truncated'])
        # 截断发生在排序之后，留下的是最近的两个
        self.assertEqual([r['distance'] for r in result['reachable']], [1, 1])

    def test_limit_is_capped(self):
        self.assertEqual(len(self.call(limit=10 ** 9)['reachable']), 4)
        with self.assertRaises(ToolError):
            self.call(limit=0)


if __name__ == '__main__':
    unittest.main()
