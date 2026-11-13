# pylint: disable=wrong-import-position  # tests adjust sys.path before local imports
"""52 个工具每一个都至少被真调一次。

两条断言，各拦一类故障：
  · `test_no_tool_raises_internal` —— INTERNAL 基本等于 SQL 写错了，
    是实现缺陷而不是用法问题。
  · `test_search_tools_actually_return_rows` —— 只断言"不报错"挡不住搜索工具
    退化成**恒空**：SQL 条件写错一样返回 0 行、一样不报错。

**探针参数全部从库里现取**（`oskm_testing.testdb.sample_*`）。原来这张表钉的是
`ace_engine` / `foundation` / `arkui_ace_engine` / `@kit.AbilityKit` /
`sa_id=180` / `service_id=51` / `libbeget_proxy.z.so` 等十几个 wukong100 事实，
换一个库就大面积红。现在：取到样本就探，取不到就跳过该工具——采集是允许降级的，
某一域为空不是 bug。

**登记表本身是静态的**（`SKIPPED` + `probe_params()` 的键集），所以
"新加了工具却忘了登记探针"仍然会被立刻抓到，这一条不依赖库内容。
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

from oskm_cli.query.tools import dispatch, REGISTRY
from oskm_cli.query.session import SessionManager
from oskm_testing.testdb import DB, count, sample_component, sample_elf
from oskm_testing.testdb import sample_gn_arg, sample_arkts_kit, sample_arkts_module
from oskm_testing.testdb import sample_native_mapping, sample_names, sample_repo
from oskm_testing.testdb import sample_install_dest, sample_install_label
from oskm_testing.testdb import sample_service, sample_service_with_sa

# 值为 None 表示**刻意**跳过（需要第二个库、或会破坏后续调用）。
# 理由必须写在值里——不写理由就是漏测。
SKIPPED = {
    'close_session': '会把后面的调用全弄挂，单独测',
    'attach_secondary': '需要第二个库',
    'detach_secondary': '需要第二个库',
    'diff_scans': '需要第二个库（由 cli/tests/test_cli.py::DiffAcrossFiles 覆盖）',
}


def _fragment(text, minimum=3):
    """A stable substring of a real value, usable as a search query."""
    stem = str(text).rsplit('/', 1)[-1].split('.')[0]
    return stem[:max(minimum, len(stem) // 2)]


def _first(values):
    return values[0] if values else None


def _basic_probes():
    component = sample_component(DB)
    repo = sample_repo(DB)
    service = sample_service(DB)
    service_id = _first(sample_names('services', 1, 'id', DB))
    label = _first(sample_names('install_modules', 1, 'label', DB))
    gn_arg = sample_gn_arg(DB)
    return {
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
        'switch_session': {'session_id': 1},
        'list_entities': {'table': 'components', 'page': {'limit': 2}},
        'aggregate': {'table': 'components', 'group_by': ['subsystem']},
        'sql_query': {'sql': 'SELECT COUNT(*) AS n FROM components'},
        'get_schema': {'table': 'components'},
        'get_repo': {'name': repo[0]} if repo else None,
        'git_url': {'path': repo[1]} if repo else None,
        'get_component': {'name': component} if component else None,
        'search_components': {'query': _fragment(component)} if component else None,
        'component_attached': {'name': component} if component else None,
        'component_dependencies': {'name': component} if component else None,
        'component_dependents': {'name': component} if component else None,
        'component_features': {'name': component} if component else None,
        'component_syscaps': {'name': component} if component else None,
        'component_innerapis': {'name': component} if component else None,
        'get_service': {'name': service} if service else None,
        'search_services': {'query': _fragment(service)} if service else None,
        'service_hosted': {'service_id': service_id} if service_id else None,
        'get_install_module': {'label': label} if label else None,
        'search_install_modules': {'query': _fragment(label or 'a')} if label else None,
        'installed_at': {'label': label} if label else None,
        'get_gn_arg': {'name': gn_arg} if gn_arg else None,
        'search_gn_args': {'query': _fragment(gn_arg)} if gn_arg else None,
    }


def _runtime_probes():
    dest = sample_install_dest(DB)
    elf = sample_elf(DB)
    elf_with_deps = sample_elf(DB, with_dependencies=True)
    elf_with_dependents = sample_elf(DB, with_dependents=True)
    sa_id = _first(sample_names('sas', 1, 'sa_id', DB))
    hdi = _first(sample_names('hdis', 1, 'service_name', DB))
    return {
        'owner_of': {'dest': dest} if dest else None,
        'search_elf_modules': {'query': _fragment(elf)} if elf else None,
        'elf_dependencies': ({'dest': elf_with_deps, 'max_distance': 1}
                             if elf_with_deps else None),
        'elf_dependents': ({'dest': elf_with_dependents}
                           if elf_with_dependents else None),
        'get_sa': {'sa_id': sa_id} if sa_id else None,
        'search_sas': ({'query': _fragment(_first(
                           sample_names('sas', 1, 'profile', DB)) or 'sa')}
                       if sa_id else None),
        'get_hdi': {'service_name': hdi} if hdi else None,
        'search_hdis': {'query': _fragment(hdi)} if hdi else None,
    }


def _native_and_arkts_probes():
    native = sample_native_mapping(DB)
    kit = sample_arkts_kit(DB)
    module = sample_arkts_module(DB)
    return {
        'search_native_headers': ({'query': _fragment(native['file_name'])}
                                  if native else None),
        'get_native_headers': {'dest': native['dest']} if native else None,
        'get_arkts_kit': {'kit_key': kit} if kit else None,
        'arkts_kit_modules': {'kit_key': kit, 'limit': 2} if kit else None,
        'get_arkts_module': {'module_key': module} if module else None,
        'arkts_module_kits': {'module_key': module} if module else None,
    }


def probe_params():
    """每个工具的探针参数，全部由库推导；缺样本的值为 None（跳过该工具）。"""
    probes = {}
    probes.update(_basic_probes())
    probes.update(_runtime_probes())
    probes.update(_native_and_arkts_probes())
    probes.update({name: None for name in SKIPPED})
    return probes


# 工具 → 它取样所依赖的表。两个用途：
#   · 搜索门禁：表非空就必须真搜出东西（表空则跳过，不算失败）
#   · 覆盖率门禁：表非空却拿不到探针参数，说明选择器坏了
SEARCH_TABLES = {
    'search_components': 'components',
    'search_services': 'services',
    'search_install_modules': 'install_modules',
    'search_gn_args': 'gn_args',
    'search_elf_modules': 'elf_modules',
    'search_sas': 'sas',
    'search_hdis': 'hdis',
    'search_native_headers': 'native_headers',
}

PROBE_SOURCES = {
    'get_repo': 'repos', 'git_url': 'repos', 'list_repos': 'repos',
    'get_component': 'components', 'component_attached': 'components',
    'component_dependencies': 'components', 'component_dependents': 'components',
    'component_features': 'features', 'component_syscaps': 'syscaps',
    'component_innerapis': 'innerapis',
    'get_service': 'services', 'service_hosted': 'services',
    'get_install_module': 'install_modules', 'installed_at': 'install_modules',
    'owner_of': 'install_targets',
    'get_gn_arg': 'gn_args',
    'elf_dependencies': 'elf_module_dependencies',
    'elf_dependents': 'elf_module_dependencies',
    'get_native_headers': 'native_headers',
    'get_sa': 'sas', 'get_hdi': 'hdis',
    'get_arkts_kit': 'arkts_kits', 'arkts_kit_modules': 'arkts_kits',
    'get_arkts_module': 'arkts_modules', 'arkts_module_kits': 'arkts_modules',
}


@unittest.skipUnless(os.path.isfile(DB), f'test database not found: {DB}')
class EveryToolRuns(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.probes = probe_params()
        cls.mgr = SessionManager()
        result = dispatch('open_session', {'db_path': DB}, cls.mgr)
        assert 'error' not in result, result

    @classmethod
    def tearDownClass(cls):
        cls.mgr.close()

    def test_every_tool_is_probed_or_explicitly_skipped(self):
        """新加工具必须同时在这里登记，否则漏测。

        这条**不依赖库内容**：登记表是静态的，所以哪怕当前库某一域是空的、
        对应探针取不到样本，"忘了登记"依然会被抓到。
        """
        registered = {t.name for t in REGISTRY}
        known = set(self.probes)
        self.assertEqual(sorted(registered - known), [],
                         '新工具没登记探针')
        self.assertEqual(sorted(known - registered), [],
                         '登记了已不存在的工具（改名或删除后忘了一起改）')

    def test_skips_all_carry_a_reason(self):
        """跳过必须写理由，否则"跳过"会慢慢变成"漏测"的遮羞布。"""
        for name, reason in SKIPPED.items():
            self.assertTrue(reason and len(reason) > 4, f'{name} 没有跳过理由')

    def test_every_present_domain_is_actually_probed(self):
        """防呆：样本选择器集体失效时，前面几条会全绿而什么都没测到。

        **不用"探到 N 个工具"这种明确阈值**——那会把"库小"误判成"选择器坏了"
        （合成库只有 35/52 个工具能探到，但它一切正常）。改成按域判：
        某张表在当前库里非空，依赖它的工具就必须拿到探针参数。
        """
        gaps = []
        for tool, table in sorted(PROBE_SOURCES.items()):
            if tool not in self.probes:
                continue
            if count(table, DB) and self.probes[tool] is None:
                gaps.append(f'{tool} ← {table}({count(table, DB)} 行)')
        self.assertEqual(gaps, [], '这些表非空却没探到对应工具，选择器可能坏了')

        present = {t for t in PROBE_SOURCES.values() if count(t, DB)}
        self.assertTrue(present, '当前库一张相关表都没有，这条门禁空转了')

    def test_no_tool_raises_internal(self):
        """INTERNAL 基本等于 SQL 写错了，是实现缺陷不是用法问题。"""
        broken = []
        for tool in REGISTRY:
            params = self.probes.get(tool.name)
            if params is None:
                continue
            result = dispatch(tool.name, params, self.mgr)
            code = (result or {}).get('error', {}).get('code')
            if code == 'INTERNAL':
                broken.append((tool.name, result['error']['message']))
        self.assertEqual(broken, [], f'工具内部报错: {broken}')

    def test_search_tools_actually_return_rows(self):
        """搜索工具不许退化成恒空。

        查询词是从对应表里现取的一行的片段，所以"搜不到"只可能是 SQL 条件
        写错了，不可能是"这个库里恰好没有叫 ace 的东西"。表为空则跳过——
        没有安装 HDI 证据的库里 `hdis` 为空是正常状态，0 行不等于 SQL 退化
        （SQL 正确性由 `test_no_tool_raises_internal` 兜底）。
        """
        checked = []
        for tool, table in SEARCH_TABLES.items():
            params = self.probes.get(tool)
            if params is None or not count(table, DB):
                continue
            result = dispatch(tool, params, self.mgr)
            self.assertNotIn('error', result, f'{tool}: {result.get("error")}')
            self.assertGreater(result['total'], 0,
                               f'{tool}({params}) 搜不到任何东西，而 {table} 非空')
            checked.append(tool)
        self.assertGreaterEqual(len(checked), 3,
                                f'只校了 {checked}，搜索门禁几乎空转')


if __name__ == '__main__':
    unittest.main()
