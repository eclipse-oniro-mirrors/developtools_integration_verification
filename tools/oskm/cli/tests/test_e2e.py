"""End-to-end tests for the query tools against a real knowledge.db.

Run: python3 -m unittest discover -s cli/tests -p "test_*.py"
Requires: OSKM_TEST_DB (否则整组 skip)。

**这里不写死任何实体名。** 每个用例先从库里现取一个满足前置条件的样本
（`oskm_testing.testdb.sample_*`），再断言工具返回的**结构性质**。
原来写死 `ability_runtime` / `foundation` / `ace_engine_feature_enable_web`
的做法，换一个库、甚至同一个库重扫一次就会红——而产品并没有坏。
库的采集是允许降级的，所以选择器返回 None 时用例 `skipTest` 而不是失败。
"""
# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
import sys as _sys
from pathlib import Path as _Path
_HERE = _Path(__file__).resolve().parent
for _p in (str(_HERE.parents[0]), str(_HERE.parents[1])):
    if _p not in _sys.path:
        _sys.path.insert(0, _p)
import os
import unittest

import sys
from oskm_cli.query.tools import dispatch, REGISTRY
from oskm_cli.query.session import SessionManager
from oskm_testing.testdb import DB, latest_scan, sample_component, sample_gn_arg
from oskm_testing.testdb import sample_service, sample_arkts_kit



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

    # Q2: "某个部件有哪些 feature？"
    def test_02_component_features(self):
        name = sample_component(DB, with_features=True)
        if not name:
            self.skipTest('selected database has no component with features')
        comp = dispatch('get_component', {'name': name}, self.mgr)
        self.assertNoError(comp)
        r = dispatch('component_features', {'component_id': comp['id']}, self.mgr)
        self.assertNoError(r)
        self.assertGreater(len(r['features']), 0)

    # Q3: "某个进程跑哪些服务？"
    def test_03_search_services(self):
        name = sample_service(DB)
        if not name:
            self.skipTest('selected database has no services')
        r = dispatch('search_services', {'query': name, 'limit': 5}, self.mgr)
        self.assertNoError(r)
        self.assertGreater(r['total'], 0)
        self.assertIn(name, [item['name'] for item in r['results']])

    # Q4: "某个编译参数的值是什么？"
    def test_04_get_gn_arg(self):
        name = sample_gn_arg(DB)
        if not name:
            self.skipTest('selected database has no gn_args')
        r = dispatch('get_gn_arg', {'name': name}, self.mgr)
        self.assertNoError(r)
        self.assertEqual(r['name'], name)
        self.assertIn('current_value', r)

    # Q5: "哪些部件依赖它？"
    def test_05_component_dependents(self):
        name = sample_component(DB, with_dependents=True)
        if not name:
            self.skipTest('selected database has no depended-on component')
        comp = dispatch('get_component', {'name': name}, self.mgr)
        self.assertNoError(comp)
        r = dispatch('component_dependents', {'component_id': comp['id']}, self.mgr)
        self.assertNoError(r)
        self.assertIn('dependents', r)
        self.assertGreater(len(r['dependents']), 0)

    # Q6: "某个部件声明了哪些对外接口？"
    def test_06_component_innerapis(self):
        name = sample_component(DB, with_innerapis=True)
        if not name:
            self.skipTest('selected database has no component with innerapis')
        comp = dispatch('get_component', {'name': name}, self.mgr)
        self.assertNoError(comp)
        r = dispatch('component_innerapis', {'component_id': comp['id']}, self.mgr)
        self.assertNoError(r)
        self.assertGreater(len(r['innerapis']), 0)
        self.assertIn('source_url', r['innerapis'][0])

    # Q7: "bundle.json 的 git URL 是什么？"
    def test_07_git_url(self):
        name = sample_component(DB, with_repo=True)
        if not name:
            self.skipTest('selected database has no component with a repo')
        comp = dispatch('get_component', {'name': name}, self.mgr)
        self.assertNoError(comp)
        r = dispatch('git_url', {'path': comp['manifest']}, self.mgr)
        self.assertNoError(r)
        # 公开仓与内部镜像仓均可，测试不绑定具体站点。
        # 也**不绑定 manifest 是不是 bundle.json**：那取决于采集到的部件声明形态，
        # 合成库里 manifest 就是一个目录，git_url 返回的是 tree URL 而非文件 URL。
        # 这里只校 git_url 的契约：键齐全、url 由 ref 构成、repo 真能在库里找到。
        self.assertIn('://', r['url'])
        for key in ('repo', 'ref', 'file_path', 'exact'):
            self.assertIn(key, r)
        if r['ref']:
            self.assertIn(r['ref'], r['url'])
        self.assertNoError(dispatch('get_repo', {'name': r['repo']}, self.mgr))

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

    # Q13: "按名字片段搜部件"
    def test_13_search_components(self):
        name = sample_component(DB)
        if not name:
            self.skipTest('selected database has no components')
        # 用真名字的一个片段当查询词，而不是写死 'audio'——那个词在别的库里
        # 可能一个都搜不到。
        fragment = name[:max(3, len(name) // 2)]
        r = dispatch('search_components', {'query': fragment, 'limit': 10}, self.mgr)
        self.assertNoError(r)
        self.assertGreater(r['total'], 0)
        self.assertIn(name, [item['name'] for item in r['results']] or [name])

    # Q14: "某个部件有哪些 syscap？"
    def test_14_component_syscaps(self):
        name = sample_component(DB, with_syscaps=True)
        if not name:
            self.skipTest('selected database has no component with syscaps')
        comp = dispatch('get_component', {'name': name}, self.mgr)
        self.assertNoError(comp)
        r = dispatch('component_syscaps', {'component_id': comp['id']}, self.mgr)
        self.assertNoError(r)
        self.assertIn('syscaps', r)
        self.assertGreater(len(r['syscaps']), 0)

    # Q15: "列出所有仓"
    def test_15_list_repos(self):
        r = dispatch('list_repos', {'limit': 5}, self.mgr)
        self.assertNoError(r)
        self.assertGreater(r['total'], 0)
        self.assertIn('url', r['repos'][0])

    # Q16: "按名字片段搜 ELF"
    def test_16_search_elf_modules(self):
        from oskm_testing.testdb import sample_elf
        dest = sample_elf(DB)
        if not dest:
            self.skipTest('selected database has no elf_modules')
        base = dest.rsplit('/', 1)[-1]
        fragment = base.split('.')[0][:max(3, len(base.split('.')[0]) // 2)]
        r = dispatch('search_elf_modules', {'query': fragment, 'limit': 5}, self.mgr)
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
        name = sample_component(DB)
        if not name:
            self.skipTest('selected database has no components')
        comp = dispatch('get_component', {'name': name}, self.mgr)
        self.assertNoError(comp)
        r = dispatch('component_attached', {'component_id': comp['id']}, self.mgr)
        self.assertNoError(r)

    # Q19: "扫描元数据"
    def test_19_get_scan_info(self):
        r = dispatch('get_scan_info', {}, self.mgr)
        self.assertNoError(r)
        self.assertEqual(r['scan_id'], self.scan_id)
        self.assertIn('collectors', r)
        # cpu_arch 从 scans 记录取，不写死 'arm64'：arm32 板型同样合法。
        self.assertEqual(r['cpu_arch'], latest_scan(DB)['cpu_arch'])

    # Q20: "聚合：按子系统统计部件数"
    def test_20_aggregate(self):
        r = dispatch('aggregate', {
            'table': 'components', 'group_by': ['subsystem']}, self.mgr)
        self.assertNoError(r)
        self.assertIn('groups', r)
        self.assertGreater(len(r['groups']), 0)


class TestToolRegistry(unittest.TestCase):
    """注册表自身的不变量。

    这里**只**留一处"工具总数"的钉子（`test_tool_count`）。它曾经在
    `test_cli_bundle.py` 里被重复断言过一次，也在 `test_docs_match_registry.py`
    里以"文档写的数字 == len(REGISTRY)"的形式出现——三份钉子里改一处漏两处，
    正是这个仓反复踩的坑。文档那一份校的是**文档**，与本条不重复。

    `test_no_duplicate_names` 与 `test_tool_names_are_unique` 原来是同一条断言
    的两种写法（`len(x)==len(set(x))` 与 `sorted(x)==sorted(set(x))`），删掉了
    后者。留 `len` 那版是因为它的注释说明了**为什么**要单独校重名：
    注册同名工具会静默替换 handler，光看总数看不出来。
    """

    def test_tool_count(self):
        self.assertEqual(len(REGISTRY), 52)

    def test_no_duplicate_names(self):
        names = [t.name for t in REGISTRY]
        self.assertEqual(len(names), len(set(names)))

    def test_all_have_schemas(self):
        for t in REGISTRY:
            self.assertIsInstance(t.input_schema, dict)
            self.assertIn('type', t.input_schema)


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
        self.assertEqual(r['sessions'][0]['cpu_arch'], 'arm64')
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
