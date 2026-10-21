"""End-to-end tests for the MCP server against a real knowledge.db.

Run: python3 -m unittest discover -s agentic/mcp/tests -p "test_*.py"

Requires: KnowledgeBase/artifacts/rk3568/knowledge.db
"""
import os
import unittest

# sys.path adjustment for running from packages/oskm/
import sys
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', '..'))

from agentic.mcp.tools import dispatch, REGISTRY
from agentic.mcp.session import SessionManager

DB = os.path.join(os.path.dirname(__file__), '..', '..', '..', '..', '..',
                  'artifacts', 'rk3568', 'knowledge.db')


@unittest.skipUnless(os.path.isfile(DB), f'test database not found: {DB}')
class TestEndToEnd(unittest.TestCase):
    """20 typical Agent questions, end-to-end through the tool dispatch layer."""

    @classmethod
    def setUpClass(cls):
        cls.mgr = SessionManager()
        r = dispatch('open_session', {'db_path': DB}, cls.mgr)
        assert 'error' not in r, f'open_session failed: {r}'
        cls.scan_id = r['scan_id']

    @classmethod
    def tearDownClass(cls):
        cls.mgr.close()

    def assertNoError(self, result, msg=''):
        self.assertNotIn('error', result, f'unexpected error: {result.get("error")} {msg}')

    # Q1: "这个文件属于哪个部件？"
    def test_01_owner_of(self):
        # Find a real path first
        paths = dispatch('sql_query', {
            'sql': 'SELECT dest FROM install_targets LIMIT 1'}, self.mgr)
        self.assertNoError(paths)
        dest = paths['rows'][0]['dest']
        r = dispatch('owner_of', {'dest': dest}, self.mgr)
        self.assertNoError(r)
        self.assertIn('component', r)

    # Q2: "ability_runtime 部件有哪些 feature？"
    def test_02_component_features(self):
        comp = dispatch('get_component', {'name': 'ability_runtime'}, self.mgr)
        self.assertNoError(comp)
        r = dispatch('component_features', {'component_id': comp['id']}, self.mgr)
        self.assertNoError(r)
        self.assertGreater(len(r['features']), 0)

    # Q3: "foundation 进程跑哪些服务？"
    def test_03_search_services(self):
        r = dispatch('search_services', {'query': 'foundation', 'limit': 5}, self.mgr)
        self.assertNoError(r)
        self.assertGreater(r['total'], 0)

    # Q4: "ace_engine_feature_enable_web 的值是什么？"
    def test_04_get_gn_arg(self):
        r = dispatch('get_gn_arg', {'name': 'ace_engine_feature_enable_web'}, self.mgr)
        self.assertNoError(r)
        self.assertEqual(r['name'], 'ace_engine_feature_enable_web')
        self.assertIn('current_value', r)

    # Q5: "哪些部件依赖 ability_runtime？"
    def test_05_component_dependents(self):
        comp = dispatch('get_component', {'name': 'ability_runtime'}, self.mgr)
        r = dispatch('component_dependents', {'component_id': comp['id']}, self.mgr)
        self.assertNoError(r)
        self.assertIn('dependents', r)

    # Q6: "ability_runtime 声明了哪些对外接口？"
    def test_06_component_innerapis(self):
        comp = dispatch('get_component', {'name': 'ability_runtime'}, self.mgr)
        r = dispatch('component_innerapis', {'component_id': comp['id']}, self.mgr)
        self.assertNoError(r)
        if r['innerapis']:
            self.assertIn('source_url', r['innerapis'][0])

    # Q7: "bundle.json 的 git URL 是什么？"
    def test_07_git_url(self):
        comp = dispatch('get_component', {'name': 'ability_runtime'}, self.mgr)
        r = dispatch('git_url', {'path': comp['manifest']}, self.mgr)
        self.assertNoError(r)
        self.assertIn('gitcode.com', r['url'])
        self.assertIn('bundle.json', r['url'])

    # Q8: "数据库里有多少个部件？"
    def test_08_sql_query_count(self):
        r = dispatch('sql_query', {
            'sql': 'SELECT COUNT(*) AS n FROM components'}, self.mgr)
        self.assertNoError(r)
        self.assertGreater(r['rows'][0]['n'], 0)

    # Q9: "扫描有哪些质量问题？"
    def test_09_list_issues(self):
        r = dispatch('list_issues', {'limit': 5}, self.mgr)
        self.assertNoError(r)
        self.assertIn('issues', r)

    # Q10: "feature 关联命中率是多少？"
    def test_10_get_link_stats(self):
        r = dispatch('get_link_stats', {}, self.mgr)
        self.assertNoError(r)
        self.assertIn('features', r)
        if r['features']:
            self.assertIn('hit_rate', r['features'])

    # Q11: "数据库有哪些表？"
    def test_11_get_tables(self):
        r = dispatch('get_tables', {}, self.mgr)
        self.assertNoError(r)
        self.assertIn('components', r['tables'])

    # Q12: "components 表有哪些列？"
    def test_12_get_schema(self):
        r = dispatch('get_schema', {'table': 'components'}, self.mgr)
        self.assertNoError(r)
        col_names = [c['name'] for c in r['tables'][0]['columns']]
        self.assertIn('name', col_names)

    # Q13: "找到名字含 audio 的部件"
    def test_13_search_components(self):
        r = dispatch('search_components', {'query': 'audio', 'limit': 10}, self.mgr)
        self.assertNoError(r)
        self.assertGreater(r['total'], 0)

    # Q14: "ability_runtime 有哪些 syscap？"
    def test_14_component_syscaps(self):
        comp = dispatch('get_component', {'name': 'ability_runtime'}, self.mgr)
        r = dispatch('component_syscaps', {'component_id': comp['id']}, self.mgr)
        self.assertNoError(r)
        self.assertIn('syscaps', r)

    # Q15: "列出所有仓"
    def test_15_list_repos(self):
        r = dispatch('list_repos', {'limit': 5}, self.mgr)
        self.assertNoError(r)
        self.assertGreater(r['total'], 0)
        self.assertIn('url', r['repos'][0])

    # Q16: "搜索名字含 libfoo 的 ELF"
    def test_16_search_elf_modules(self):
        r = dispatch('search_elf_modules', {'query': 'lib', 'limit': 5}, self.mgr)
        self.assertNoError(r)
        self.assertGreater(r['total'], 0)

    # Q17: "按 SA ID 查 SA"
    def test_17_get_sa(self):
        # Find a real SA ID first
        sas = dispatch('sql_query', {
            'sql': 'SELECT sa_id FROM sas LIMIT 1'}, self.mgr)
        if sas['rows']:
            r = dispatch('get_sa', {'sa_id': sas['rows'][0]['sa_id']}, self.mgr)
            self.assertNoError(r)

    # Q18: "部件的各域记录"
    def test_18_component_attached(self):
        comp = dispatch('get_component', {'name': 'ability_runtime'}, self.mgr)
        r = dispatch('component_attached', {'component_id': comp['id']}, self.mgr)
        self.assertNoError(r)

    # Q19: "扫描元数据"
    def test_19_get_scan_info(self):
        r = dispatch('get_scan_info', {}, self.mgr)
        self.assertNoError(r)
        self.assertEqual(r['scan_id'], self.scan_id)
        self.assertIn('collectors', r)

    # Q20: "聚合：按子系统统计部件数"
    def test_20_aggregate(self):
        r = dispatch('aggregate', {
            'table': 'components', 'group_by': ['subsystem']}, self.mgr)
        self.assertNoError(r)
        self.assertIn('groups', r)
        self.assertGreater(len(r['groups']), 0)


class TestToolRegistry(unittest.TestCase):
    def test_tool_count(self):
        self.assertEqual(len(REGISTRY), 43)

    def test_all_have_schemas(self):
        for t in REGISTRY:
            self.assertIsInstance(t.input_schema, dict)
            self.assertIn('type', t.input_schema)

    def test_no_duplicate_names(self):
        names = [t.name for t in REGISTRY]
        self.assertEqual(len(names), len(set(names)))


@unittest.skipUnless(os.path.isfile(DB), f'test database not found: {DB}')
class TestMultiDatabase(unittest.TestCase):
    """Cross-database comparison: attach, diff, detach."""

    @classmethod
    def setUpClass(cls):
        import shutil, tempfile
        cls._tmpdir = tempfile.mkdtemp()
        cls.db_copy = os.path.join(cls._tmpdir, 'knowledge_copy.db')
        shutil.copy2(DB, cls.db_copy)
        cls.mgr = SessionManager()
        dispatch('open_session', {'db_path': DB}, cls.mgr)

    @classmethod
    def tearDownClass(cls):
        cls.mgr.close()
        import shutil; shutil.rmtree(cls._tmpdir)

    def test_01_attach_secondary(self):
        r = dispatch('attach_secondary', {'db_path': self.db_copy, 'alias': 'baseline'}, self.mgr)
        self.assertNotIn('error', r, f'attach failed: {r}')
        self.assertEqual(r['alias'], 'baseline')
        self.assertGreater(len(r['tables']), 0)

    def test_02_list_sessions_shows_alias(self):
        dispatch('attach_secondary', {'db_path': self.db_copy, 'alias': 'b2'}, self.mgr)
        r = dispatch('list_sessions', {}, self.mgr)
        self.assertNotIn('error', r)
        self.assertIn('b2', r['attached_aliases'])
        dispatch('detach_secondary', {'alias': 'b2'}, self.mgr)

    def test_03_diff_scans_same_db(self):
        r = dispatch('list_scans', {}, self.mgr)
        scan_ids = [s['scan_id'] for s in r['scans']]
        if len(scan_ids) >= 2:
            r = dispatch('diff_scans', {
                'entity': 'gn_args',
                'scan_a': scan_ids[0],
                'scan_b': scan_ids[-1],
            }, self.mgr)
            self.assertNotIn('error', r, f'diff failed: {r}')
            self.assertIn('added', r)
            self.assertIn('removed', r)
            self.assertIn('changed', r)

    def test_04_diff_scans_cross_db(self):
        dispatch('attach_secondary', {'db_path': self.db_copy, 'alias': 'copy'}, self.mgr)
        sid = self.mgr.get_active().scan_id
        r = dispatch('diff_scans', {
            'entity': 'components',
            'scan_a': sid,
            'scan_b': sid,
            'db_b': 'copy',
        }, self.mgr)
        self.assertNotIn('error', r, f'cross-db diff failed: {r}')
        # Same scan_id in a copy → no differences
        self.assertEqual(len(r['added']), 0)
        self.assertEqual(len(r['removed']), 0)
        self.assertEqual(len(r['changed']), 0)
        dispatch('detach_secondary', {'alias': 'copy'}, self.mgr)

    def test_05_sql_query_with_alias(self):
        dispatch('attach_secondary', {'db_path': self.db_copy, 'alias': 'copy'}, self.mgr)
        sid = self.mgr.get_active().scan_id
        r = dispatch('sql_query', {
            'sql': f'SELECT COUNT(*) AS n FROM copy.components WHERE scan_id = ?',
            'params': [sid],
        }, self.mgr)
        self.assertNotIn('error', r, f'alias SQL failed: {r}')
        self.assertGreater(r['rows'][0]['n'], 0)
        dispatch('detach_secondary', {'alias': 'copy'}, self.mgr)

    def test_06_sql_query_after_detach_fails(self):
        r = dispatch('sql_query', {
            'sql': 'SELECT COUNT(*) AS n FROM nonexistent_alias.components',
        }, self.mgr)
        self.assertIn('error', r)
        self.assertEqual(r['error']['code'], 'ALIAS_NOT_ATTACHED')

    def test_07_diff_scans_invalid_entity(self):
        r = dispatch('diff_scans', {
            'entity': 'nonexistent',
            'scan_a': 1,
            'scan_b': 2,
        }, self.mgr)
        self.assertIn('error', r)
        self.assertEqual(r['error']['code'], 'INVALID_ENTITY')

    def test_08_diff_scans_cross_db_gn_args(self):
        dispatch('attach_secondary', {'db_path': self.db_copy, 'alias': 'copy'}, self.mgr)
        sid = self.mgr.get_active().scan_id
        r = dispatch('diff_scans', {
            'entity': 'gn_args',
            'scan_a': sid,
            'scan_b': sid,
            'db_b': 'copy',
        }, self.mgr)
        self.assertNotIn('error', r, f'gn_args diff failed: {r}')
        self.assertEqual(len(r['added']), 0)
        self.assertEqual(len(r['removed']), 0)
        dispatch('detach_secondary', {'alias': 'copy'}, self.mgr)
