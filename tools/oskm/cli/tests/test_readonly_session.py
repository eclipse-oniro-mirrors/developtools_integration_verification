"""Behavioral checks for the collector-free read-only session."""

import _path_setup
import tempfile
import unittest
from pathlib import Path
from oskm_cli.query.readonly_session import ReadOnlyScanSession
from oskm_testing.fixture import create_fixture_db

# cli/tests -> cli (oskm_cli) / packages/oskm (oskm_schema, oskm_testing)。
# `unittest discover -s cli/tests` 把测试模块当顶层加载，所以这里手工补路径。
_HERE = Path(__file__).resolve().parent



class ReadOnlySessionTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.db = create_fixture_db(Path(self.temp.name) / 'knowledge.db')
        self.session = ReadOnlyScanSession.open(self.db)

    def tearDown(self):
        self.session.close()
        self.temp.cleanup()

    def test_component_record_and_dependencies(self):
        component = self.session.component('ace_engine')
        self.assertIsNotNone(component)
        self.assertEqual(component.name, 'ace_engine')
        self.assertEqual(component.subsystem, 'graphics')
        self.assertEqual(component.record['manifest'], 'foundation/ace/ace_engine')
        self.assertEqual(component.record['repo_id'], 1)
        self.assertEqual(component.record['deps'], {'components': ['init']})
        self.assertEqual([item.name for item in component.dependencies()], ['init'])
        self.assertEqual([item.name for item in component.dependents()], [])

    def test_service_rejoins_component_label_and_derived_fields(self):
        service = self.session.service('/etc/init/foo.cfg', 'foo')
        self.assertIsNotNone(service)
        self.assertEqual(service.name, 'foo')
        self.assertEqual(service.record['type'], 'sa')
        self.assertEqual(service.record['executable'], '/system/bin/sa_main')
        self.assertEqual(service.record['args'], ['-x'])
        self.assertEqual(service.record['label'], '//base/foo:foo')
        self.assertEqual(service.record['component']['name'], 'ace_engine')
        self.assertNotIn('path', service.record)
        self.assertEqual(service.record['config']['sandbox'], 1)

    def test_install_module_exports_record_targets_and_tags(self):
        module = self.session.install_module('//base/foo:foo')
        self.assertIsNotNone(module)
        self.assertEqual(module.get('label_name'), 'foo')
        self.assertEqual(module.get('component')['name'], 'ace_engine')
        self.assertEqual(module.targets(), ('system/lib/libfoo.so',))
        self.assertEqual(module.tags(), ('innerapi', 'chipsetsdk'))

    def test_installed_at_exact_then_longest_directory(self):
        exact = self.session.installed_at('system/lib/libfoo.so')
        self.assertEqual([module.label for module in exact], ['//base/foo:foo'])
        deep = self.session.installed_at('system/app/Bar/deep/file.txt')
        self.assertEqual([module.label for module in deep], ['//base/deep:deep'])
        parent = self.session.installed_at('system/app/Bar/other.txt')
        self.assertEqual([module.label for module in parent], ['//base/bar:bar'])

    def test_owner_of_uses_first_attributed_module(self):
        self.assertEqual(
            self.session.owner_of('system/lib/libfoo.so').name, 'ace_engine')
        self.assertEqual(
            self.session.owner_of('system/app/Bar/deep/file.txt').name, 'init')

    def test_sql_returns_plain_dict_rows(self):
        rows = self.session.sql(
            'SELECT name FROM components WHERE scan_id = ? ORDER BY name',
            (self.session.scan_id,))
        self.assertEqual(rows, ({'name': 'ace_engine'}, {'name': 'init'}))


if __name__ == '__main__':
    unittest.main()
