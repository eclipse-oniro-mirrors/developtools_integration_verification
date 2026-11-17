"""Install ownership must refuse to guess when evidence is ambiguous."""

import _path_setup
import sqlite3
import tempfile
import unittest
from pathlib import Path

from oskm_cli.query.session import SessionManager
from oskm_cli.query.tools import dispatch
from oskm_testing.fixture import create_fixture_db

# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
_HERE = Path(__file__).resolve().parent


class InstallAmbiguityTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.db = create_fixture_db(Path(self.temp.name) / 'knowledge.db')
        self.manager = SessionManager()
        result = self.manager.open(str(self.db))
        self.assertNotIn('error', result)

    def tearDown(self):
        self.manager.close()
        self.temp.cleanup()

    def _add_duplicate_target(self):
        connection = sqlite3.connect(self.db)
        try:
            connection.execute(
                'INSERT INTO install_modules '
                '(scan_id, id, ordinal, label, label_name, type, shlib_type, source, '
                'install_enable, component_id, record) '
                "VALUES (1, 99, 99, '//base/foo_duplicate:foo', 'foo', 'shared_library', "
                "'shared_library', 'foundation/base/foo_duplicate', 1, 2, '{}')")
            connection.execute(
                'INSERT INTO install_targets '
                '(scan_id, module_id, dest_index, dest, directory, partition, file_name, '
                'size, link_target_path, link_target_id) '
                "VALUES (1, 99, 0, 'system/lib/libfoo.so', 0, 'system', 'libfoo.so', "
                'NULL, NULL, NULL)')
            connection.commit()
        finally:
            connection.close()
        self.manager.close()
        self.manager.open(str(self.db))

    def test_owner_of_is_ambiguous_when_two_modules_install_same_dest(self):
        self._add_duplicate_target()
        result = dispatch('owner_of', {'dest': 'system/lib/libfoo.so'}, self.manager)
        self.assertEqual(result['error']['code'], 'AMBIGUOUS')
        self.assertIn('//base/foo:foo', result['error']['message'])
        self.assertIn('//base/foo_duplicate:foo', result['error']['message'])

    def test_installed_at_still_lists_every_candidate(self):
        self._add_duplicate_target()
        result = dispatch('installed_at', {'dest': 'system/lib/libfoo.so'}, self.manager)
        labels = sorted(module['label'] for module in result['modules'])
        self.assertEqual(labels, ['//base/foo:foo', '//base/foo_duplicate:foo'])

    def _add_duplicate_label(self):
        connection = sqlite3.connect(self.db)
        try:
            connection.execute(
                'INSERT INTO install_modules '
                '(scan_id, id, ordinal, label, label_name, type, shlib_type, source, '
                'install_enable, component_id, record) '
                "VALUES (1, 100, 100, '//base/foo:foo', 'foo', 'shared_library', "
                "'shared_library', 'foundation/base/foo_toolchain2', 1, 2, '{}')")
            connection.execute(
                'INSERT INTO install_targets '
                '(scan_id, module_id, dest_index, dest, directory, partition, file_name, '
                'size, link_target_path, link_target_id) '
                "VALUES (1, 100, 0, 'system/lib/libfoo_toolchain2.so', 0, 'system', "
                "'libfoo_toolchain2.so', NULL, NULL, NULL)")
            connection.commit()
        finally:
            connection.close()
        self.manager.close()
        self.manager.open(str(self.db))

    def test_get_install_module_is_ambiguous_when_label_matches_multiple_modules(self):
        self._add_duplicate_label()
        result = dispatch('get_install_module', {'label': '//base/foo:foo'}, self.manager)
        self.assertEqual(result['error']['code'], 'AMBIGUOUS')
        self.assertIn('id=1', result['error']['message'])
        self.assertIn('id=100', result['error']['message'])

    def test_owner_of_returns_unique_owner(self):
        result = dispatch('owner_of', {'dest': 'system/lib/libfoo.so'}, self.manager)
        self.assertNotIn('error', result)
        self.assertEqual(result['component'], 'ace_engine')
        self.assertEqual(result['install_module'], '//base/foo:foo')


if __name__ == '__main__':
    unittest.main()
