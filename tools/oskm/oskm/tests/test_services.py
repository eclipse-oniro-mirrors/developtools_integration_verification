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
"""Contract tests: preserve declarations, conservative origins, equivalent stores."""
from oskm.core.session import ScanSession
from oskm.core.db import Database
from oskm.cli import main, parser
from oskm.core.models import (ScanLimits, FieldPredicate, PageRequest, QueryError,
                              RequestError, ScanCancelled, ScanFatalError, PublishError)
from oskm.core.io import canonical
from oskm.core.api import scan as _scan_one
from oskm.core.provenance import strip_label
from oskm.collectors.services.records import raw_service, service_type
from oskm.collectors.services.models import (ServiceScanRequest, ServiceFilter,
                                             ServiceAggregateRequest)
import contextlib
import io
import json
import sys
import tempfile
import unittest
from dataclasses import replace
from decimal import Decimal
from pathlib import Path
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))


class ServicesTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.package = self.root / 'out/test/packages/phone'
        self.package.mkdir(parents=True)
        # Component resolution is off by default in these fixtures; tests that exercise
        # it opt in explicitly with resolve_component=True (see self.components()).
        self.request = ServiceScanRequest(self.root, 'test', resolve_component=False)

    def write(self, relative, value, *, workspace=False):
        path = (self.root if workspace else self.package) / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(canonical(value))
        return path

    def cfg(self, services, path='system/etc/init/a.cfg'):
        return self.write(path, dict(services=services, imports=['never/read'], jobs=[{'cmds': ['never execute']}]))

    def scan(self, **kwargs):
        return _scan_one('services', replace(self.request, **kwargs))

    def modules(self, rows=None):
        self.write('system_module_info.json', rows if rows is not None else [self.module()])

    def module(self, **kwargs):
        row = dict(dest=['system/etc/init/a.cfg'],
                   label='//component/service:install(//build/toolchain:clang)',
                   part_name='part', subsystem_name='subsystem')
        row.update(kwargs)
        return row

    def components(self, entries=None):
        self.write('out/test/build_configs/parts_info/components.json',
                   entries if entries is not None else {'part': {'subsystem': 'subsystem', 'path': 'component'}},
                   workspace=True)
        if entries is None and not (self.root / 'component/bundle.json').exists():
            self.write('component/bundle.json',
                       {'component': {'name': 'part', 'subsystem': 'subsystem'}}, workspace=True)

    def test_reversible_layout_all_fields_and_collisions(self):
        raw = {
            'name': None,
            'path': [
                '/system/bin/sa_main',
                'x'],
            'uid': False,
            'gid': [],
            'start-mode': {},
            'ondemand': 0,
            'cfg': 'raw',
            'type': 'raw',
            'origin': None,
            'index': 7,
            'config': {
                'path': 'nested'},
            'new': {
                'x': [
                    None,
                    True,
                    Decimal('1.234567890123456789'),
                    2**70]}}
        self.cfg([raw, {}, raw])
        result = self.scan()
        self.assertEqual(set(result.to_dict()), {'snapshot', 'services'})
        self.assertEqual(len(result.services), 3)
        self.assertEqual(canonical(raw_service(result.services[0])), canonical(raw))
        self.assertEqual(result.services[0]['type'], 'sa')
        self.assertNotIn('index', result.services[0])
        self.assertEqual(set(result.services[1]), {'cfg'})
        self.assertEqual(result.services[0], result.services[2])
        with self.assertRaises(TypeError):
            result.services[0]['name'] = 'changed'
        detached = result.to_dict()
        detached['services'][0]['config']['new']['x'].append(5)
        self.assertEqual(len(result.services[0]['config']['new']['x']), 4)

    def test_all_scopes_sorted_empty_and_symlink_directories(self):
        self.cfg([{}], 'new/nested/etc/init/sub/a.cfg')
        self.cfg([{}], 'eng_system/etc/init/b.cfg')
        (self.package / 'empty/etc/init').mkdir(parents=True)
        (self.package / 'linked').symlink_to(self.package / 'new', target_is_directory=True)
        result = self.scan()
        self.assertEqual(result.snapshot['scope'], ('empty/etc/init', 'eng_system/etc/init', 'new/nested/etc/init'))
        self.assertEqual([r['cfg'] for r in result.services], [
                         'eng_system/etc/init/b.cfg', 'new/nested/etc/init/sub/a.cfg'])

    def test_empty_root_and_missing_root(self):
        result = self.scan()
        self.assertEqual(result.services, ())
        self.assertEqual(result.snapshot['status'], 'complete')
        with self.assertRaises(RequestError):
            self.scan(product='../escape')
        with self.assertRaises(RequestError):
            self.scan(package_root=Path('missing'))

    def test_nonobjects_duplicates_bad_json_and_missing_services(self):
        self.cfg([{}, 1, None, {}])
        self.write('system/etc/init/empty.cfg', {})
        self.write('system/etc/init/not-array.cfg', {'services': {}})
        bad = self.package / 'system/etc/init/duplicate.cfg'
        bad.write_text('{"services":[{"name":"a","name":"b"}]}')
        (bad.parent / 'syntax.cfg').write_text('{')
        result = self.scan()
        self.assertEqual(len(result.services), 2)
        self.assertEqual(result.snapshot['status'], 'degraded')
        issues = result.snapshot['issues']
        # scan-level findings: the two non-object entries
        self.assertEqual({i.get('pointer') for i in issues if not i.get('advisory')},
                         {'/services/1', '/services/2', None})
        # advisory findings sit in the same list, flagged, and point at the field
        self.assertEqual({(i['pointer'], i['code']) for i in issues if i.get('advisory')},
                         {('/services/0/name', 'FIELD_MISSING'), ('/services/0/path', 'FIELD_MISSING'),
                          ('/services/3/name', 'FIELD_MISSING'), ('/services/3/path', 'FIELD_MISSING')})

    def test_limits_and_external_file_symlink(self):
        path = self.cfg([{}])
        path.unlink()
        outside = self.root / 'outside.cfg'
        outside.write_text('{"services":[{}]}')
        path.symlink_to(outside)
        self.assertIn('CFG_OUTSIDE_ALLOWED_ROOT', {i['code'] for i in self.scan().snapshot['issues']})
        path.unlink()
        self.cfg([{}])
        self.assertEqual(self.scan(limits=ScanLimits(file_bytes=1)).services, ())
        self.cfg([{}], 'system/etc/init/b.cfg')
        with self.assertRaises(ScanFatalError):
            self.scan(limits=ScanLimits(input_files=1))
        with self.assertRaises(RequestError):
            self.scan(limits=ScanLimits(file_bytes=-1))

    def test_unreadable_init_is_in_scope(self):
        self.cfg([{}])

        def walk(root, **kwargs):
            yield str(self.package / 'system/etc'), ['init'], []
            kwargs['onerror'](PermissionError(13, 'denied', str(self.package / 'system/etc/init')))
        with patch('oskm.collectors.services.discovery.os.walk', side_effect=walk):
            result = self.scan()
        self.assertEqual(result.snapshot['scope'], ('system/etc/init',))
        self.assertEqual(result.snapshot['status'], 'degraded')
        self.assertEqual(result.services, ())

    def test_numeric_aggregation_and_component_filters(self):
        self.cfg([{'uid': 1}, {'uid': Decimal('1.00')}, {'uid': True}])
        self.modules()
        self.components()
        query = self.scan(resolve_component=True).query()
        groups = query.aggregate_services(ServiceAggregateRequest(group_by=('field:uid',)))
        self.assertEqual(groups.total_groups, 2)
        self.assertEqual(sorted(g['count'] for g in groups.groups), [1, 2])
        self.assertEqual(query.list_services(ServiceFilter(components=('part',))).total, 3)
        self.assertEqual(query.list_services(ServiceFilter(components=('other',))).total, 0)
        self.assertEqual(query.aggregate_services(ServiceAggregateRequest(group_by=('label',))).total_groups, 1)
        self.assertEqual(query.aggregate_services(ServiceAggregateRequest(group_by=('subsystem',))).total_groups, 1)

    def test_path_split_and_lossless_edge_cases(self):
        raws = [
            {'path': ['/system/bin/sa_main', 'a', 'a', ''], 'executable': 'raw', 'args': ['raw']},
            {'path': ['/bin/worker']}, {'path': ['', None, 7]}, {},
            {'path': []}, {'path': None}, {'path': 'wrong'}, {'path': [7, 'arg']},
        ]
        self.cfg(raws)
        result = self.scan()
        for raw, record in zip(raws, result.services):
            self.assertEqual(canonical(raw_service(record)), canonical(raw))
            self.assertNotIn('path', record)
        self.assertEqual(result.services[0]['executable'], '/system/bin/sa_main')
        self.assertEqual(result.services[0]['args'], ('a', 'a', ''))
        self.assertEqual(result.services[1]['args'], ())
        self.assertNotIn('config', result.services[1])
        self.assertNotIn('executable', result.services[3])
        self.assertEqual(result.services[4]['config']['path'], ())
        query = result.query()
        self.assertEqual(
            query.list_services(
                ServiceFilter(
                    fields=(
                        FieldPredicate(
                            'path',
                            'eq',
                            '/bin/worker',
                            pointer='/0'),
                    ))).positions,
            (1,
             ))
        self.assertEqual(
            query.list_services(
                ServiceFilter(
                    fields=(
                        FieldPredicate(
                            'executable', 'eq', 'raw'),))).positions, (0,))
        # path is reconstructed from executable/args, so the split is lossless.
        self.assertEqual(raw_service(result.services[1])['path'], ['/bin/worker'])
        self.assertNotIn('path', raw_service(result.services[3]))

    def test_promoted_columns_index_the_record_without_altering_it(self):
        self.cfg([{'name': 'ok', 'path': ['/bin/a'], 'uid': 'system', 'ondemand': True,
                   'start-mode': 'boot', 'secon': 'u:r:x:s0', 'sandbox': 1, 'importance': -5},
                  {'name': 'odd', 'path': ['/bin/b'], 'uid': 7, 'ondemand': 1, 'sandbox': 2**80}])
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'services', '--without', 'components'])
        with ScanSession.open(Database(db)) as session:
            good, odd = session.sql('SELECT * FROM services ORDER BY position')
            self.assertEqual((good['uid'], good['ondemand'], good['start_mode']), ('system', 1, 'boot'))
            self.assertEqual((good['secon'], good['sandbox'], good['importance']), ('u:r:x:s0', 1, -5))
            # Non-conforming values project to NULL: uid is an int, ondemand an int
            # rather than a bool, sandbox wider than 8 bytes.
            self.assertEqual((odd['uid'], odd['ondemand'], odd['sandbox']), (None, None, None))
            # ...but every one of them is still exact in the authoritative record.
            published = session.records('services')[1]
            self.assertEqual(published['uid'], 7)
            self.assertEqual(published['ondemand'], 1)
            self.assertEqual(published['config']['sandbox'], 2**80)

    def test_record_holds_the_whole_declaration_and_columns_only_index_it(self):
        declarations = [{'name': 'ok', 'path': ['/bin/a'], 'uid': 'system', 'gid': ['g1', 'g2'],
                         'secon': 'u:r:x:s0', 'once': 1, 'unknown_field': {'deep': [1, 2]}},
                        {'name': 7, 'path': ['/bin/b'], 'uid': {'odd': True}, 'ondemand': None}]
        self.cfg(declarations)
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'services', '--without', 'components'])
        with ScanSession.open(Database(db)) as session:
            good, odd = session.sql('SELECT * FROM services ORDER BY position')
            published = session.records('services')
            # the record column is the cfg declaration itself, nothing more and
            # nothing less: no cfg path, no split executable/args, no type
            self.assertEqual(json.loads(good['record']), declarations[0])
            self.assertEqual(json.loads(odd['record']), declarations[1])
            # the published record is that declaration transformed, regenerated
            # at export from the record plus the derived columns
            self.assertEqual(set(published[0]),
                             {'cfg', 'name', 'type', 'executable', 'args', 'uid', 'gid', 'config'})
            self.assertEqual(published[0]['config'],
                             {'secon': 'u:r:x:s0', 'once': 1, 'unknown_field': {'deep': [1, 2]}})
            # columns index it; a value a column cannot hold leaves it NULL while
            # the record keeps the value exactly
            self.assertEqual((good['name'], good['uid'], good['type']), ('ok', 'system', 'default'))
            self.assertEqual(json.loads(good['gid']), ['g1', 'g2'])
            self.assertIsNone(odd['name'])
            self.assertIsNone(odd['uid'])
            self.assertEqual(published[1]['name'], 7)
            self.assertEqual(published[1]['uid'], {'odd': True})
            self.assertIsNone(published[1]['ondemand'])

    def test_classifier(self):
        for path, expected in [(['/other/sa_main'], 'sa'), (['hdf_devhost'], 'hdf'),
                                 (['/bin/sh', 'sa_main'], 'default'),
                               (['SA_MAIN'], 'default'), ([], None), ([None], None), ('sa_main', None),
                               (['/bin/'], None), (['${exe}/sa_main'], None), ([''], None)]:
            with self.subTest(path=path):
                self.assertEqual(service_type(path), expected)

    def test_resolve_component_disabled_leaves_the_label_but_drops_the_component(self):
        # The install index still runs and still knows which target installed the
        # cfg; only the components dependency is deselected, so the module can be
        # named but not attributed.
        self.cfg([{}])
        self.modules()
        result = self.scan(resolve_component=False)
        self.assertEqual(result.snapshot['status'], 'complete')
        self.assertEqual(result.services[0]['label'], '//component/service:install')
        self.assertNotIn('component', result.services[0])

    def test_origin_bundle_and_toolchain_merge(self):
        self.cfg([{}, {}])
        row = self.module()
        row2 = dict(row, label='//component/service:install(//other:tc)')
        self.modules([row, row2])
        self.write('component/bundle.json', {'name': '@ohos/wrong',
                   'component': {'name': 'part', 'subsystem': 'subsystem'}}, workspace=True)
        self.components()
        result = self.scan(resolve_component=True)
        self.assertEqual(result.snapshot['status'], 'complete')
        self.assertEqual(result.services[0]['label'], '//component/service:install')
        self.assertEqual(dict(result.services[0]['component']),
                         dict(name='part', subsystem='subsystem', manifest='component/bundle.json'))
        self.assertEqual(result.services[0], result.services[1])

    def test_attribution_comes_from_the_install_index_and_its_faults_report_there(self):
        # Ownership is resolved once, by install_modules, against the manifest;
        # services only reads the answer. So a conflicting or unregistered
        # component leaves the service unattributed, and the diagnosis is filed
        # against the manifest row that caused it, not against every cfg.
        self.cfg([{}])
        self.modules()
        self.components()
        self.assertEqual(self.scan(resolve_component=True).services[0]['component']['name'], 'part')
        # the manifest row now claims a part_name that disagrees with the
        # component owning the label's directory
        self.modules([self.module(part_name='other')])
        self.components(entries={'part': {'subsystem': 'subsystem', 'path': 'component'},
                                 'other': {'subsystem': 'subsystem', 'path': 'elsewhere'}})
        self.write('elsewhere/bundle.json', {'component': {'name': 'other', 'subsystem': 'subsystem'}}, workspace=True)
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test', '--db', db,
                  '--only', 'services'])
        with ScanSession.open(Database(db)) as session:
            # the cfg's own module now claims a different component than part_name
            self.assertIn('MODULE_COMPONENT_CONFLICT',
                          {i['code'] for i in session.issues('install_modules')})
            self.assertEqual([i['code'] for i in session.issues('services')
                              if not i['advisory']], [])

    def test_origin_ambiguity_and_absence_are_reported_against_the_cfg(self):
        # Whether an installed cfg has exactly one origin is a question about
        # this service, so it stays here even though the index answers it.
        self.cfg([{}])
        row = self.module()
        for rows, code in [([row, dict(row, label='//other:install')], 'ORIGIN_LABEL_AMBIGUOUS'),
                           ([dict(row, label='bad')], 'ORIGIN_LABEL_INVALID'),
                           ([], 'ORIGIN_UNMATCHED')]:
            with self.subTest(code=code):
                self.modules(rows)
                result = self.scan(resolve_component=True)
                self.assertNotIn('label', result.services[0])
                self.assertNotIn('component', result.services[0])
                self.assertEqual({i['code'] for i in result.snapshot['issues']
                                  if not i.get('advisory')}, {code})
        # A manifest that could not be read fully is reported once, not once
        # per cfg: an index with holes would otherwise call every service
        # uninstalled, which is louder and less true.
        (self.package / 'system_module_info.json').unlink()
        result = self.scan(resolve_component=True)
        self.assertEqual(result.snapshot['status'], 'degraded')
        self.assertEqual({i['code'] for i in result.snapshot['issues']
                          if not i.get('advisory')}, {'ORIGIN_INDEX_INCOMPLETE'})

    def test_unregistered_manifests_on_the_path_are_skipped_not_tripped_over(self):
        # Ownership walks the components index, not the source tree, so a
        # bundle.json that the build never registered is simply not a candidate
        # -- where the old nearest-bundle walk would stop at it and give up.
        self.cfg([{}])
        self.modules()
        self.write('component/service/bundle.json', {}, workspace=True)
        self.write('component/bundle.json', {'component': {'name': 'outer'}}, workspace=True)
        self.write('registry/bundle.json', {'component': {'name': 'part', 'subsystem': 'subsystem'}}, workspace=True)
        self.components(entries={'part': {'subsystem': 'subsystem', 'path': 'registry'}})
        result = self.scan(resolve_component=True)
        # the label directory has no registered component above it, so the
        # module falls back to its declared part_name, which is registered
        self.assertEqual(result.services[0]['component']['name'], 'part')
        self.assertEqual(result.snapshot['status'], 'complete')

    def test_label_parser(self):
        self.assertEqual(strip_label('//a:b(//tc:x)'), '//a:b')
        for invalid in ('//a:b(junk)', '//a:b(//tc)', '//a/../b:c', '//a:b(x)y', '//a:b()'):
            self.assertIsNone(strip_label(invalid))

    def test_predicates_raw_collision_and_positions(self):
        self.cfg([{'name': 'same', 'uid': True, 'x': None, 'type': 'raw'}, {'name': 'same', 'uid': 1, 'x': [2, 3]}, {}])
        query = self.scan().query()
        def select(*predicates): return query.list_services(ServiceFilter(fields=predicates)).positions
        self.assertEqual(select(FieldPredicate('uid', 'eq', True)), (0,))
        self.assertEqual(select(FieldPredicate('uid', 'eq', 1)), (1,))
        self.assertEqual(select(FieldPredicate('x', 'is_null')), (0,))
        self.assertEqual(select(FieldPredicate('x', 'absent')), (2,))
        self.assertEqual(select(FieldPredicate('x', 'contains', 3)), (1,))
        self.assertEqual(select(FieldPredicate('x', 'eq', 3, pointer='/1')), (1,))
        self.assertEqual(select(FieldPredicate('type', 'eq', 'raw')), (0,))
        self.assertIsNone(query.get_service(3))
        for position in (-1, True, '0'):
            with self.assertRaises(QueryError):
                query.get_service(position)

    def test_query_validation_even_empty(self):
        query = self.scan().query()
        for filters in (
            ServiceFilter(
                fields=(
                    FieldPredicate(
                'x', 'invalid'),)), ServiceFilter(
                    fields=(
                        FieldPredicate(
                            'x', 'eq'),)), ServiceFilter(
                                fields=(
                                    FieldPredicate(
                                        'x', 'eq', 1, pointer='bad'),))):
            with self.assertRaises(QueryError):
                query.list_services(filters)
        with self.assertRaises(QueryError):
            query.list_services(page=PageRequest(limit=True))
        with self.assertRaises(QueryError):
            query.list_services(page=PageRequest(cursor='[]'))
        with self.assertRaises(QueryError):
            query.aggregate_services(ServiceAggregateRequest(group_by=('bad',)))
        query.close()
        with self.assertRaises(QueryError):
            query.list_services()

    def test_aggregation_preserves_duplicates_and_resource_units(self):
        self.cfg([{'uid': True, 'env': [1, 2]}, {'uid': 1, 'env': [1, 2]},
                 {'uid': 1, 'env': [1, 2]}, {'uid': None}, {}])
        query = self.scan().query()
        groups = query.aggregate_services(ServiceAggregateRequest(group_by=('field:uid',)))
        self.assertEqual(groups.denominator, 5)
        self.assertEqual(groups.total_groups, 4)
        resources = query.aggregate_services(ServiceAggregateRequest(grain='resource_item', resource_field='env'))
        self.assertEqual(resources.denominator, 6)
        self.assertEqual(resources.groups[0]['count'], 6)
        with self.assertRaises(QueryError):
            query.aggregate_services(ServiceAggregateRequest(group_by=('field:env',)))

    def test_cursor_binds_to_content_not_to_the_result_object(self):
        self.cfg([{'name': 'a', 'value': Decimal('1.1234567890123456789')}, {}, {}])
        result = self.scan()
        cursor = result.query().list_services(page=PageRequest(limit=1)).next_cursor
        rescan = self.scan()
        self.assertEqual(canonical(rescan.to_dict()), canonical(result.to_dict()))
        with rescan.query() as query:
            page = query.list_services(page=PageRequest(cursor=cursor))
            self.assertEqual(page.positions, (1, 2))
            self.assertEqual(query.aggregate_services().denominator, 3)

    def test_exact_values_survive_the_store(self):
        # Scans go through SQLite, where a REAL column would silently truncate
        # this to a double; JSON columns keep the literal text.
        self.cfg([{'name': '中文', 'value': Decimal('1.12345678901234567890123456789'),
                   'big': 2**80, 'nested': {'text': 'a\nb', 'empty': []}}])
        record = self.scan().to_dict()['services'][0]
        self.assertEqual(record['name'], '中文')
        self.assertEqual(str(record['config']['value']), '1.12345678901234567890123456789')
        self.assertEqual(record['config']['big'], 2**80)
        self.assertEqual(record['config']['nested'], {'text': 'a\nb', 'empty': []})

    def test_callbacks_and_cancellation(self):
        self.cfg([{}, 1])
        self.modules()
        events = []
        issues = []
        result = _scan_one('services', self.request, on_progress=events.append, on_diagnostic=issues.append)
        self.assertEqual(events[-1].phase, 'finalize')
        # The callback sees the whole dependency closure, so everything this
        # domain stored must appear in it: one scan issue (the non-object entry)
        # plus the empty service's two advisory FIELD_MISSING findings.
        self.assertEqual(len(result.snapshot['issues']), 3)
        self.assertTrue({canonical(i) for i in result.snapshot['issues']}
                        <= {canonical(i) for i in issues})
        with self.assertRaises(ScanCancelled):
            _scan_one('services', self.request, cancelled=lambda: True)

        def broken(_): raise ValueError('broken')
        with self.assertRaises(ScanFatalError):
            _scan_one('services', self.request, on_progress=broken)

    def test_cli_parameters_exit_codes_and_optional_analysis(self):
        self.cfg([{'name': 'bad'}])
        self.modules()
        db = str(self.root / 'k.db')

        def run(extra):
            with contextlib.redirect_stdout(io.StringIO()) as out, contextlib.redirect_stderr(io.StringIO()):
                code = main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                             '--db', db, '--only', 'services', '--without', 'components', *extra])
            return code, json.loads(out.getvalue())
        self.assertEqual(run([])[0], 0)
        code, response = run(['--fail-on', 'error'])
        self.assertEqual(code, 5)
        self.assertFalse(response['gate_passed'])
        self.cfg([{'name': 'replacement', 'path': ['/bin/service']}])
        self.assertEqual(run([])[0], 0)
        with ScanSession.open(Database(db)) as session:
            self.assertEqual(session.records('services')[0]['name'], 'replacement')
        scan_parser = parser()._subparsers._group_actions[0].choices['scan']
        self.assertEqual({a.dest for a in scan_parser._actions} - {'help'}, {'workspace_root',
                         'product', 'db', 'only', 'without', 'scan_id', 'reuse_upstream', 'fail_on'})
        for flag in ('--fields', '--partition', '--progress', '--module-info', '--output'):
            with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
                parser().parse_args(['scan', '--workspace-root', str(self.root), '--product', 'test', flag, 'x'])
        self.cfg([{'name': 'bad'}])
        result = self.scan()
        before = canonical(result.to_dict())
        self.assertTrue([i for i in result.snapshot['issues'] if i.get('advisory')])
        self.assertEqual(canonical(result.to_dict()), before)

    def test_cli_default_resolves_component(self):
        self.cfg([{}])
        self.modules()
        self.components()
        with contextlib.redirect_stdout(io.StringIO()) as out, contextlib.redirect_stderr(io.StringIO()):
            code = main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                         '--db', str(self.root / 'd.db'), '--only', 'services'])
        self.assertEqual(code, 0)
        with ScanSession.open(Database(self.root / 'd.db')) as session:
            self.assertEqual(session.records('services')[0]['component']['name'], 'part')


if __name__ == '__main__':
    unittest.main()
