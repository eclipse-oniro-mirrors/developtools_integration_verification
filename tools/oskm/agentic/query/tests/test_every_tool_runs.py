"""每个工具都至少被真调一次，不许有 INTERNAL。

为什么要有这个文件：`search_gn_args` / `search_sas` / `search_hdis` / `get_hdi`
**四个工具从上线起就没成功过一次**——WHERE 子句里的 `scan_id` 没带表别名，
而查询 JOIN 了 `components` 等表，两边都有这一列，SQLite 在 prepare 阶段就抛
`ambiguous column name: scan_id`。前三个都写在 `AGENTS.md` 的「模糊搜索」一节里，
照着文档调的人只会拿到 INTERNAL。

既有的 32 条 e2e 测试覆盖的是「20 个典型提问」，挑的都是能答得漂亮的；
这类"列在文档里但从没人调过"的工具正好漏在缝里。**按名单逐个点名，才堵得住。**
第四个 `get_hdi` 就是手工挨个探时漏掉、被这里的名单当场抓出来的。

断言只有一条：不出现 INTERNAL。NOT_FOUND / MISSING_PARAM / INVALID_PARAM 都算正常
——探针给的参数不保证在每个库里都有数据，但**SQL 写错是跑不掉的**。
"""
import os
import sys
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', '..'))

from agentic.query.tools import dispatch, REGISTRY
from agentic.query.session import SessionManager
from agentic.query.tests.testdb import DB, elf_dest, latest_scan

_SO = elf_dest('libbeget_proxy.z.so',
               fallback='system/lib/chipset-sdk-sp/libbeget_proxy.z.so')
_NDK_SO = elf_dest('libimage.z.so', fallback='system/lib/libimage.z.so')

# 只为"让工具真的执行到 SQL"而给的参数，不求命中数据。
# 值为 None 表示刻意跳过（需要第二个库、或会破坏后续调用），
# 跳过的理由必须写在行尾——不写理由就是漏测。
PROBES = {
    'list_sessions': {},
    'list_scans': {},
    'get_scan_info': {},
    'get_link_stats': {},
    'get_tables': {},
    'list_issues': {},
    'list_repos': {},
    'list_arkts_kits': {},
    'list_arkts_modules': {},
    'list_arkts_declarations': {},
    'open_session': {'db_path': DB},
    'close_session': None,                 # 会把后面的调用全弄挂，单独测
    'switch_session': {'session_id': 1},
    'attach_secondary': None,              # 需要第二个库
    'detach_secondary': None,
    'diff_scans': None,                    # 需要第二个库
    'get_repo': {'name': 'arkui_ace_engine'},
    'git_url': {'path': 'foundation/arkui/ace_engine/bundle.json'},
    'get_component': {'name': 'ace_engine'},
    'search_components': {'query': 'ace'},
    'component_attached': {'name': 'ace_engine'},
    'component_dependencies': {'name': 'ace_engine'},
    'component_dependents': {'name': 'ace_engine'},
    'component_features': {'name': 'ace_engine'},
    'component_syscaps': {'name': 'ace_engine'},
    'component_innerapis': {'name': 'ace_engine'},
    'get_service': {'name': 'foundation'},
    'search_services': {'query': 'foundation'},
    'service_hosted': {'service_id': 51},
    'get_install_module': {'label': '//foundation/arkui/ace_engine:libace_engine'},
    'search_install_modules': {'query': 'image'},
    'owner_of': {'dest': _SO},
    'installed_at': {'label': '//foundation/arkui/ace_engine:libace_engine'},
    'get_gn_arg': {'name': 'ace_engine_feature_asbng_path'},
    'search_gn_args': {'query': 'ace_engine_feature'},
    'search_elf_modules': {'query': 'libimage'},
    'elf_dependencies': {'dest': _SO, 'max_distance': 1},
    'elf_dependents': {'dest': _SO},
    # NDK 头文件映射（2026-10-30 自上游合入）。rk3568 现有库里这张表
    # 可能是空的——探针只保证 SQL 跑得通，不要求命中数据。
    'search_ndk_headers': {'query': 'lib'},
    'get_ndk_headers': {'dest': _NDK_SO},
    'get_sa': {'sa_id': 180},
    'search_sas': {'query': 'ability'},
    'get_hdi': {'service_name': 'display_composer_service'},
    'search_hdis': {'query': 'display'},
    'list_entities': {'table': 'components', 'page': {'limit': 2}},
    'aggregate': {'table': 'components', 'group_by': ['subsystem']},
    'sql_query': {'sql': 'SELECT COUNT(*) AS n FROM components'},
    'get_schema': {'table': 'components'},
    'get_arkts_kit': {'kit_key': '@kit.AbilityKit'},
    'get_arkts_module': {'module_key': 'api/@ohos.multimedia.image'},
    'arkts_kit_modules': {'kit_key': '@kit.AbilityKit', 'limit': 2},
    'arkts_module_kits': {'module_key': 'api/@ohos.multimedia.image'},
}


@unittest.skipUnless(os.path.isfile(DB), f'test database not found: {DB}')
class EveryToolRuns(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.mgr = SessionManager()
        result = dispatch('open_session', {'db_path': DB}, cls.mgr)
        assert 'error' not in result, result

    @classmethod
    def tearDownClass(cls):
        cls.mgr.close()

    def test_every_tool_is_probed_or_explicitly_skipped(self):
        """新加工具必须同时在这里登记，否则漏测。"""
        missing = sorted({t.name for t in REGISTRY} - set(PROBES))
        self.assertEqual(missing, [], f'新工具没登记探针: {missing}')

    def test_no_tool_raises_internal(self):
        """INTERNAL 基本等于 SQL 写错了，是实现缺陷不是用法问题。"""
        broken = []
        for tool in REGISTRY:
            params = PROBES.get(tool.name)
            if params is None:
                continue
            result = dispatch(tool.name, params, self.mgr)
            code = (result or {}).get('error', {}).get('code')
            if code == 'INTERNAL':
                broken.append((tool.name, result['error']['message']))
        self.assertEqual(broken, [], f'工具内部报错: {broken}')

    def test_search_tools_actually_return_rows(self):
        """三个修过的搜索工具要能真搜出东西。

        只断言"不报错"挡不住它们退化成恒空——SQL 条件写错一样是 0 行。
        例外：search_hdis 在黄区（yellow）系统组件库本来就没有 HDI 数据，
        hdis 表为空是正常状态，0 行不等于 SQL 退化（SQL 正确性由
        test_no_tool_raises_internal 兜底）。
        """
        must_hit = [('search_gn_args', {'query': 'ace_engine_feature'}),
                    ('search_sas', {'query': 'ability'}),
                    ('search_elf_modules', {'query': 'libimage'}),
                    ('search_components', {'query': 'ace'}),
                    ('search_services', {'query': 'foundation'}),
                    ('search_install_modules', {'query': 'image'})]
        if latest_scan(DB) and latest_scan(DB)['zone'] == 'blue':
            must_hit.append(('search_hdis', {'query': 'display'}))
        else:
            # 黄区库无 HDI：只保证不报错（SQL 能跑通），不要求有行。
            result = dispatch('search_hdis', {'query': 'display'}, self.mgr)
            self.assertNotIn('error', result)
        for name, params in must_hit:
            result = dispatch(name, params, self.mgr)
            self.assertNotIn('error', result, f'{name}: {result.get("error")}')
            self.assertGreater(result['total'], 0, f'{name} 搜不到任何东西')


if __name__ == '__main__':
    unittest.main()
