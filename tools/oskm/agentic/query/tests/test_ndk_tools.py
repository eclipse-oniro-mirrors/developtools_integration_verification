import os
import unittest

import sys
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', '..'))

from agentic.query.tools import dispatch, REGISTRY
from agentic.query.session import SessionManager
from agentic.query.tests.testdb import DB, elf_dest



@unittest.skipUnless(os.path.isfile(DB), f'test database not found: {DB}')
class TestNdkTools(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.library_dest = elf_dest('libOpenSLES.so')
        cls.mgr = SessionManager()
        result = dispatch('open_session', {'db_path': DB}, cls.mgr)
        assert 'error' not in result, result

    @classmethod
    def tearDownClass(cls):
        cls.mgr.close()

    def test_search_by_header_and_library(self):
        for query in ('OpenSLES', 'libOpenSLES.so'):
            result = dispatch('search_ndk_headers', {'query': query, 'limit': 5}, self.mgr)
            self.assertNotIn('error', result, result)
            self.assertGreater(result['total'], 0)
            self.assertIn('match_strategy', result['results'][0])
            self.assertIn('dest', result['results'][0])

    def test_search_filters_strategy_and_component(self):
        result = dispatch('search_ndk_headers', {
            'query': 'libuv', 'match_strategy': 'symbol', 'component': 'libuv',
        }, self.mgr)
        self.assertNotIn('error', result, result)
        self.assertEqual(result['total'], 2)
        self.assertTrue(all(r['match_strategy'] == 'symbol' for r in result['results']))

    def test_search_rejects_unknown_strategy(self):
        result = dispatch('search_ndk_headers', {
            'query': 'OpenSLES', 'match_strategy': 'guess',
        }, self.mgr)
        self.assertEqual(result['error']['code'], 'INVALID_PARAM')

    def test_get_headers_for_library(self):
        if not self.library_dest:
            self.skipTest('selected database has no libOpenSLES.so')
        result = dispatch('get_ndk_headers', {
            'dest': self.library_dest,
        }, self.mgr)
        self.assertNotIn('error', result, result)
        self.assertEqual(result['dest'], self.library_dest)
        self.assertEqual(result['component'], 'audio_framework')
        self.assertEqual(result['total'], len(result['headers']))
        self.assertTrue(result['headers'])
        self.assertTrue(all(r['source_url'] for r in result['headers']))

    def test_get_headers_not_found(self):
        result = dispatch('get_ndk_headers', {'dest': 'system/lib/missing.so'}, self.mgr)
        self.assertEqual(result['error']['code'], 'NOT_FOUND')

    def test_registry_contains_ndk_tools(self):
        names = {tool.name for tool in REGISTRY}
        self.assertIn('search_ndk_headers', names)
        self.assertIn('get_ndk_headers', names)


if __name__ == '__main__':
    unittest.main()
