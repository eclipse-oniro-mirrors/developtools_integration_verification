"""NDK 头文件映射工具。

**参数全部从库里现取。** 原来这个文件钉的是 `libOpenSLES.so` / `'OpenSLES'` /
`'libuv'` / `component='libuv'` / `total == 2` / `component == 'audio_framework'`
——六个 wukong100 的事实。换一个库、甚至同一个库重扫一次（NDK 映射条数随
构建产物变），用例就红，而两个工具的逻辑一个字都没改。

现在的写法：先用 `sample_ndk_mapping()` 取一条真映射，再用它的字段反查自己。
断言只校**契约**（键齐全、total 与结果条数一致、过滤器真的过滤了），
以及**跨工具自洽**（search 与 get 对同一个 dest 给出同一个 component）。
NDK 表为空的库（采集降级）直接 skipTest，不算失败。
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

from oskm_cli.query.tools import dispatch
from oskm_cli.query.session import SessionManager
from oskm_testing.testdb import DB, ndk_strategies, sample_ndk_mapping


def _fragment(text, minimum=3):
    """A stable substring of a real value, usable as a search query."""
    stem = text.rsplit('/', 1)[-1].split('.')[0]
    return stem[:max(minimum, len(stem) // 2)]


@unittest.skipUnless(os.path.isfile(DB), f'test database not found: {DB}')
class TestNdkTools(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.mapping = sample_ndk_mapping(DB)
        cls.strategies = ndk_strategies(DB)
        cls.mgr = SessionManager()
        result = dispatch('open_session', {'db_path': DB}, cls.mgr)
        assert 'error' not in result, result

    @classmethod
    def tearDownClass(cls):
        cls.mgr.close()

    def require_mapping(self):
        if not self.mapping:
            self.skipTest('selected database has no NDK header mappings')

    def test_search_by_header_and_library(self):
        self.require_mapping()
        # 两个方向的查询词都来自那条真映射：库名与头文件名。
        for query in (_fragment(self.mapping['file_name']),
                      _fragment(self.mapping['header_path'])):
            result = dispatch('search_ndk_headers',
                              {'query': query, 'limit': 50}, self.mgr)
            self.assertNotIn('error', result, result)
            self.assertGreater(result['total'], 0, f'query={query}')
            for key in ('match_strategy', 'dest'):
                self.assertIn(key, result['results'][0])
            # total 是全量匹配数，不是本页条数（截断时才不等）。
            self.assertGreaterEqual(result['total'], len(result['results']))

    def test_search_filters_by_strategy(self):
        """过滤器真的过滤了——但不钉"恰好 2 条"这种库内容。"""
        self.require_mapping()
        strategy = next(iter(sorted(self.strategies)))
        result = dispatch('search_ndk_headers', {
            'query': '', 'match_strategy': strategy, 'limit': 500}, self.mgr)
        self.assertNotIn('error', result, result)
        self.assertGreater(result['total'], 0)
        self.assertTrue(all(r['match_strategy'] == strategy
                            for r in result['results']))
        # 与直接数库里的行数一致：过滤没有漏也没有多。
        self.assertEqual(result['total'], self.strategies[strategy])

    def test_search_filters_by_component(self):
        self.require_mapping()
        if not self.mapping.get('component'):
            self.skipTest('the sampled NDK mapping has no attributed component')
        result = dispatch('search_ndk_headers', {
            'query': '', 'component': self.mapping['component'],
            'limit': 500}, self.mgr)
        self.assertNotIn('error', result, result)
        self.assertGreater(result['total'], 0)
        self.assertTrue(all(r['component'] == self.mapping['component']
                            for r in result['results']))

    def test_search_rejects_unknown_strategy(self):
        result = dispatch('search_ndk_headers', {
            'query': 'anything', 'match_strategy': 'guess',
        }, self.mgr)
        self.assertEqual(result['error']['code'], 'INVALID_PARAM')

    def test_get_headers_for_library(self):
        self.require_mapping()
        result = dispatch('get_ndk_headers',
                          {'dest': self.mapping['dest']}, self.mgr)
        self.assertNotIn('error', result, result)
        self.assertEqual(result['dest'], self.mapping['dest'])
        self.assertEqual(result['total'], len(result['headers']))
        self.assertTrue(result['headers'])
        self.assertTrue(all(r['source_url'] for r in result['headers']))

    def test_get_and_search_agree_on_the_component(self):
        """跨工具自洽：同一个 dest，`get` 与 `search` 必须报同一个部件。

        这比钉 `component == 'audio_framework'` 强——归属算法改了、或者换了个库，
        只要两个工具还一致就通过；一旦其中一个错了，立刻暴露。
        """
        self.require_mapping()
        if not self.mapping.get('component'):
            self.skipTest('the sampled NDK mapping has no attributed component')
        got = dispatch('get_ndk_headers', {'dest': self.mapping['dest']}, self.mgr)
        self.assertNotIn('error', got, got)
        self.assertEqual(got['component'], self.mapping['component'])

        searched = dispatch('search_ndk_headers', {
            'query': _fragment(self.mapping['file_name']), 'limit': 500}, self.mgr)
        self.assertNotIn('error', searched, searched)
        same = [r for r in searched['results'] if r['dest'] == self.mapping['dest']]
        self.assertTrue(same, 'search 没能搜回 get 用的那个 dest')
        self.assertEqual({r['component'] for r in same}, {got['component']})

    def test_get_headers_not_found(self):
        result = dispatch('get_ndk_headers',
                          {'dest': 'system/lib/__definitely_missing__.so'}, self.mgr)
        self.assertEqual(result['error']['code'], 'NOT_FOUND')


if __name__ == '__main__':
    unittest.main()
