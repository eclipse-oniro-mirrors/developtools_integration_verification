#!/usr/bin/env python3
# coding=utf-8

#
# Copyright (c) 2021-2026 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
"""Unified-model navigation over the store, and the registry-driven CLI."""
from oskm.core.session import ScanSession
from oskm.core.runner import run
from oskm.core.models import QueryError, ScanRequest
from oskm.core.io import canonical
from oskm.core.db import Database
from oskm.core import framework
from oskm.cli import main
import contextlib
import io
import json
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
sys.path.insert(0, str(Path(__file__).resolve().parent))


class Fixture(unittest.TestCase):
    """Minimal product tree covering all four domains and their links."""

    def setUp(self):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        self.root = Path(temp.name)
        self.package = self.root / 'out/test/packages/phone'
        self.database = Database(self.root / 'knowledge.db')
        self.write(self.root / 'out/test/build_configs/parts_info/components.json', {
            'driver': {'subsystem': 'hdf', 'path': 'src/driver'},
            'helper': {'subsystem': 'hdf', 'path': 'src/helper'},
            'lonely': {'subsystem': 'misc', 'path': 'src/lonely'}})
        self.write(self.root / 'src/driver/bundle.json', {'component': dict(
            name='driver', subsystem='hdf', deps={'components': ['helper']})})
        self.write(self.root / 'src/helper/bundle.json',
                   {'component': dict(name='helper', subsystem='hdf')})
        self.write(self.root / 'src/lonely/bundle.json',
                   {'component': dict(name='lonely', subsystem='misc')})
        self.write(self.package / 'system/etc/init/host.cfg', {'services': [
            {'name': 'host', 'path': ['/bin/hdf_devhost', '-n', 'host']}]})
        # Services attribute via the cfg, HDI via the installed library.
        self.write(self.package / 'system_module_info.json', [
            {'dest': ['system/etc/init/host.cfg'], 'label': '//src/driver:cfg',
             'part_name': 'driver'},
            {'dest': ['vendor/lib/libexample.so'], 'label': '//src/driver:lib',
             'part_name': 'driver'}])
        (self.package / 'system/profile').mkdir(parents=True, exist_ok=True)
        self.write(self.package / 'vendor/etc/hdfconfig/hdf_default.hcb', self.hcb())
        self.write(self.package / 'vendor/lib/libexample.so', b'\x7fELFfixture')
        self.scan_id = run(self.database, ScanRequest(self.root, 'test')).scan_id

    def write(self, path, obj):
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(obj if isinstance(obj, bytes) else canonical(obj))
        return path

    def hcb(self):
        # Reuse the HDI fixture's wire-format helpers rather than re-deriving the
        # binary layout here.
        from test_hdi import blob, node
        device = node('node0', dict(serviceName='example', moduleName='libexample.so'))
        manager = node('manager', dict(match_attr='hdf_manager'),
                       [node('host', {'hostName': 'host'}, [node('device', children=[device])])])
        return blob(node('root', children=[manager]))

    def session(self):
        session = ScanSession.open(self.database)
        self.addCleanup(session.close)
        return session

    def invoke(self, *args):
        out, err = io.StringIO(), io.StringIO()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
            code = main(list(args))
        return code, json.loads(out.getvalue())


class SessionTest(Fixture):
    def test_opens_from_the_database_alone(self):
        # No source tree involved: this is the MCP path.
        session = self.session()
        self.assertEqual(session.scan_id, self.scan_id)
        self.assertEqual(session.collectors,
                         ('args', 'component_links', 'components', 'elf_modules', 'hdi',
                          'install_modules', 'repos', 'sas', 'services'))
        self.assertIn(session.status, ('complete', 'degraded'))

    def test_subsystem_to_component_navigation(self):
        session = self.session()
        self.assertEqual([s.name for s in session.subsystems()], ['hdf', 'misc'])
        self.assertEqual(sorted(c.name for c in session.subsystem('hdf').components()),
                         ['driver', 'helper'])
        self.assertEqual([c.name for c in session.subsystem('misc').components()], ['lonely'])
        self.assertEqual(session.subsystem('absent').components(), ())

    def test_component_dependency_graph_in_both_directions(self):
        session = self.session()
        driver = session.component('driver')
        self.assertEqual([c.name for c in driver.dependencies()], ['helper'])
        self.assertEqual([c.name for c in session.component('helper').dependents()], ['driver'])
        self.assertEqual(session.component('helper').dependencies(), ())
        self.assertIsNone(session.component('ghost'))

    def test_component_to_service_to_device_chain(self):
        session = self.session()
        driver = session.component('driver')
        attached = driver.attached()
        # install_modules joins automatically: it declares COMPONENT_COLUMN.
        self.assertEqual(sorted(attached), ['hdi', 'install_modules', 'services'])
        service = attached['services'][0]
        self.assertEqual((service.cfg, service.name), ('system/etc/init/host.cfg', 'host'))
        # Service -> hosted devices, and back up to the owning component.
        hosted = service.hosted('hdi')
        self.assertEqual([h['serviceName'] for h in hosted], ['example'])
        self.assertEqual(hosted[0].service().cfg, service.cfg)
        self.assertEqual(hosted[0].component().name, 'driver')
        self.assertEqual(service.component().name, 'driver')

    def test_hosting_is_resolved_by_row_id_not_by_cfg(self):
        # One cfg can declare several services. Matching on cfg alone would make
        # every service in that file claim the same hosted device.
        self.write(self.package / 'system/etc/init/host.cfg', {'services': [
            {'name': 'host', 'path': ['/bin/hdf_devhost', '-n', 'host']},
            {'name': 'sibling', 'path': ['/bin/other']}]})
        run(self.database, ScanRequest(self.root, 'test'))
        with ScanSession.open(self.database) as session:
            host, sibling = session.services()
            self.assertEqual((host.name, sibling.name), ('host', 'sibling'))
            self.assertEqual(host.cfg, sibling.cfg)
            self.assertEqual([h['serviceName'] for h in host.hosted('hdi')], ['example'])
            self.assertEqual(sibling.hosted('hdi'), ())

    def test_foreign_keys_are_enforced_by_the_database(self):
        import sqlite3
        with self.database.connect() as connection:
            with self.assertRaises(sqlite3.IntegrityError):
                connection.execute('INSERT INTO services (scan_id, position, cfg, '
                                   'component_id, record) VALUES (?, 99, ?, 999999, ?)',
                                   (self.scan_id, 'x', '{}'))

    def test_unattributed_component_has_no_attachments(self):
        session = self.session()
        self.assertEqual(session.component('lonely').attached(), {})
        self.assertEqual(session.component('lonely').attached('services'), ())

    def test_records_and_documents_match_the_published_contract(self):
        session = self.session()
        document = session.document('services')
        self.assertEqual(set(document), {'snapshot', 'services'})
        self.assertEqual(document['snapshot']['schema_version'], '4.1.0')
        # The nested component object is rebuilt by joining, not stored per record.
        self.assertEqual(document['services'][0]['component'],
                         {'name': 'driver', 'subsystem': 'hdf',
                          'manifest': 'src/driver/bundle.json'})
        self.assertEqual(session.records('services'), tuple(document['services']))

    def test_absent_collector_is_reported_not_silently_empty(self):
        session = self.session()
        with self.assertRaises(QueryError):
            session.document('nope')
        with self.assertRaises(QueryError):
            session.records('modules')

    def test_sql_escape_hatch_and_issue_listing(self):
        session = self.session()
        rows = session.sql('SELECT h.service_name, c.subsystem FROM hdis h '
                           'JOIN components c ON c.id = h.component_id '
                           'WHERE h.scan_id = ?', (session.scan_id,))
        self.assertEqual(rows, ({'service_name': 'example', 'subsystem': 'hdf'},))
        self.assertTrue(all({'collector', 'code', 'path'} <= set(i) for i in session.issues()))

    def test_every_domain_links_to_the_module_that_installed_its_artifact(self):
        session = self.session()
        service = session.service('system/etc/init/host.cfg')
        device = service.hosted('hdi')[0]
        # services -> the module installing the cfg; hdi -> the driver library.
        # Both carry the same label the domain resolved on its own, because both
        # came from the same manifest row.
        self.assertEqual(service.install_module().label, '//src/driver:cfg')
        self.assertEqual(service['label'], '//src/driver:cfg')
        self.assertEqual(device.install_module().label, '//src/driver:lib')
        self.assertEqual(device['label'], '//src/driver:lib')
        # Every link reaches a component through the module, matching the
        # component the domain resolved independently.
        for entity in (service, device):
            self.assertEqual(entity.install_module().component().name,
                             entity.component().name)

    def test_label_is_read_back_from_the_install_index_not_stored_per_domain(self):
        session = self.session()
        # No domain keeps a label column any more; it belongs to the build
        # target that installed the artifact and is read back through the key.
        for table in ('services', 'hdis', 'sas'):
            columns = {r['name'] for r in session.sql(f'PRAGMA table_info({table})')}
            self.assertNotIn('label', columns)
            self.assertIn('install_module_id', columns)
        rows = session.sql(
            'SELECT t.cfg, m.label FROM services t '
            'JOIN install_modules m ON m.id = t.install_module_id WHERE t.scan_id = ?',
            (session.scan_id,))
        self.assertEqual(rows, ({'cfg': 'system/etc/init/host.cfg',
                                 'label': '//src/driver:cfg'},))
        self.assertEqual(session.service('system/etc/init/host.cfg')['label'],
                         '//src/driver:cfg')

    def test_new_collector_joins_navigation_by_declaration_only(self):
        # A domain that declares COMPONENT_COLUMN appears under attached() with no
        # change to the navigation layer.
        session = self.session()
        self.assertEqual(
            {n for n in framework.names() if framework.get(n).COMPONENT_COLUMN},
            {'services', 'hdi', 'sas', 'install_modules', 'elf_modules'})
        self.assertLessEqual(set(session.component('driver').attached()),
                             {'services', 'hdi', 'sas', 'install_modules'})


class CommandLineTest(Fixture):
    def test_list_reports_registry_and_topological_order(self):
        code, report = self.invoke('list')
        self.assertEqual(code, 0)
        self.assertEqual(report['order'],
                         ['repos', 'components', 'args', 'install_modules',
                          'component_links', 'services', 'hdi', 'sas', 'elf_modules'])
        self.assertEqual(report['collectors']['hdi']['depends_on'],
                         ['services', 'components', 'install_modules'])

    def test_scan_runs_every_collector_and_reports_each(self):
        target = self.root / 'fresh.db'
        code, report = self.invoke('scan', '--workspace-root', str(self.root),
                                   '--product', 'test', '--db', str(target))
        self.assertEqual(code, 0)
        self.assertEqual(sorted(report['collectors']),
                         ['args', 'component_links', 'components', 'elf_modules', 'hdi',
                          'install_modules', 'repos', 'sas', 'services'])
        self.assertTrue(target.exists())

    def test_only_pulls_dependencies_and_without_drops_them(self):
        target = self.root / 'partial.db'
        base = ('scan', '--workspace-root', str(self.root), '--product', 'test',
                '--db', str(target))
        code, report = self.invoke(*base, '--only', 'hdi')
        self.assertEqual(code, 0)
        self.assertEqual(sorted(report['collectors']),
                         ['components', 'hdi', 'install_modules', 'repos', 'services'])
        code, report = self.invoke(*base, '--only', 'hdi', '--without', 'components')
        self.assertEqual(sorted(report['collectors']),
                         ['hdi', 'install_modules', 'repos', 'services'])

    def test_unknown_collector_is_rejected_by_the_parser(self):
        with self.assertRaises(SystemExit), contextlib.redirect_stderr(io.StringIO()):
            self.invoke('scan', '--workspace-root', str(self.root), '--product', 'test',
                        '--only', 'ghost')

    def test_reuse_upstream_rewrites_one_collector_in_place(self):
        code, report = self.invoke('scan', '--workspace-root', str(self.root),
                                   '--product', 'test', '--db', str(self.database.path),
                                   '--only', 'hdi', '--scan-id', str(self.scan_id),
                                   '--reuse-upstream')
        self.assertEqual(code, 0)
        self.assertEqual(list(report['collectors']), ['hdi'])
        self.assertEqual(report['scan_id'], self.scan_id)
        _, scans = self.invoke('scans', '--db', str(self.database.path))
        self.assertEqual(len(scans['scans']), 1)

    def test_session_reports_a_missing_store_cleanly(self):
        with self.assertRaises(QueryError):
            ScanSession.open(Database(self.root / 'empty.db'))

    def test_drop_removes_the_scan_and_cascades(self):
        code, report = self.invoke('drop', '--db', str(self.database.path),
                                   '--scan-id', str(self.scan_id))
        self.assertEqual((code, report['deleted']), (0, 1))
        with self.database.connect() as connection:
            for table in ('components', 'services', 'hdis', 'sas', 'issues', 'collector_runs'):
                self.assertEqual(connection.execute(f'SELECT * FROM {table}').fetchall(), [],
                                 table)
