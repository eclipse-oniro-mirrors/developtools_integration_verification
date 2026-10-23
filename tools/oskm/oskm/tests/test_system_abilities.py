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
"""SA collection, association and artifact contract tests with isolated products."""
from oskm.core.session import ScanSession
from oskm.core.db import Database
from oskm.cli import main, parser
from oskm.core.models import (ScanLimits, FieldPredicate, PageRequest, RequestError,
                              QueryError, ScanCancelled, ScanFatalError, PublishError)
from oskm.core.io import canonical
from oskm.core.api import scan as _scan_one
from oskm.collectors.system_abilities.records import raw_sa
from oskm.collectors.system_abilities.models import SAScanRequest, SAFilter
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


class SATest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.build = self.root / 'out/test'
        self.package = self.build / 'packages/phone'
        self.profiles = self.package / 'system/profile'
        self.profiles.mkdir(parents=True)
        self.request = SAScanRequest(self.root, 'test')
        self.rows = []
        self.parts = {}
        self.raw = dict(name=100, libpath='libexample.so', **{'run-on-create': True, 'distributed': False})

    def write(self, path, value):
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(canonical(value))
        return path

    def install(self, raws=None, process='host', name='host.json', service=True):
        raws = [self.raw] if raws is None else raws
        path = self.write(self.profiles / name, dict(process=process, systemability=raws))
        if service:
            self.service(process=process, profile=name)
        return path

    def service(self, process='host', profile='host.json', cfg='host.cfg', **overrides):
        raw = dict(name=process, path=['/system/bin/sa_main', '/system/profile/' + profile])
        raw.update(overrides)
        return self.write(self.package / 'system/etc/init' / cfg, dict(services=[raw]))

    def target(self, raw=None, process='host', part='alpha', subsystem='subsystem', label=None):
        raw = self.raw if raw is None else raw
        n = len(self.rows)
        label = label or f'//components/{part}/profile:target(//build/tc:a)'
        source = f'obj/{part}/{n}.json'
        info = f'sa_profile/inputs/{part}/{n}_info.json'
        self.write(self.build / source, dict(process=process, systemability=[raw]))
        self.write(self.build / info, dict(part_name=part, label=label, sa_info_files=[source]))
        row = dict(type='sa', part_name=part, label=label, install_info_file=info)
        self.rows.append(row)
        self.manifest()
        self.write(
            self.root /
            f'components/{part}/bundle.json',
            dict(
                name='@ohos/not-part',
                component=dict(
                    name=part,
                    subsystem=subsystem)))
        self.parts[part] = {'subsystem': subsystem, 'path': f'components/{part}'}
        self.components()
        return row, self.build / info, self.build / source

    def smi(self, rows):
        return self.write(self.package / 'system_module_info.json', rows)

    def manifest(self):
        return self.write(self.package / 'sa_profile/src_sa_install_info.json', self.rows)

    def components(self, entries=None):
        return self.write(self.root / 'out/test/build_configs/parts_info/components.json',
                          entries if entries is not None else self.parts)

    def scan(self, **changes):
        return _scan_one('sas', replace(self.request, **changes))

    def codes(self, result):
        return {i['code'] for i in result.snapshot.get('issues', ())}

    def test_exact_chain_host_and_cross_part_process(self):
        other = dict(self.raw, name=200)
        self.install([self.raw, other])
        self.target()
        self.target(other, part='beta', subsystem='other')
        # Merged module membership is deliberately unusable; it must not be read.
        self.write(self.package / 'system_module_info.json', {'part_name': 'wrong,group'})
        result = self.scan()
        self.assertEqual(result.snapshot['status'], 'complete')
        self.assertEqual([r['component']['name'] for r in result.sas], ['alpha', 'beta'])
        self.assertEqual([r['service']['name'] for r in result.sas], ['host', 'host'])
        self.assertEqual(result.sas[0]['service'], dict(cfg='system/etc/init/host.cfg', name='host'))
        # label now names the module that installed the SA, and this fixture
        # declares no install manifest, so there is none to name.
        self.assertNotIn('label', result.sas[0])
        self.assertFalse(any(p.endswith('system_module_info.json') for p in result._input_paths))

    def test_lossless_layout_unknown_values_and_immutable_api(self):
        raw = dict(self.raw, process='raw-process', part=None, service={}, config={'name': None},
                   value=Decimal('1.2345678901234567890123'), args=[True, 1, None], index=7)
        self.install([raw])
        self.target(raw)
        result = self.scan()
        record = result.sas[0]
        self.assertEqual(canonical(raw_sa(record)), canonical(raw))
        self.assertEqual(set(result.to_dict()), {'snapshot', 'sas'})
        self.assertNotIn('index', record)
        self.assertEqual(record['service']['name'], 'host')
        self.assertEqual(record['config']['process'], 'raw-process')
        with self.assertRaises(TypeError):
            record['config']['part'] = 'changed'
        result.to_dict()['sas'][0]['config']['args'].append(3)
        self.assertEqual(len(record['config']['args']), 3)

    def test_empty_directory_non_sa_and_no_input_chain(self):
        result = self.scan()
        self.assertEqual(result.sas, ())
        self.assertEqual(result.snapshot['status'], 'complete')
        self.assertEqual(result._input_paths, ())
        self.write(self.profiles / 'trust.json', dict(process='host', said=[100]))
        self.write(self.profiles / 'empty.json', {})
        self.write(self.profiles / 'nested/hidden.json', dict(process='hidden', systemability=[self.raw]))
        result = self.scan()
        self.assertEqual(result.sas, ())
        self.assertEqual(result.snapshot['status'], 'complete')
        self.assertNotIn('SA_SOURCE_MANIFEST_INVALID', self.codes(result))

    def test_referenced_non_sa_and_empty_profiles_are_reported(self):
        self.write(self.profiles / 'host.json', dict(process='host', said=[100]))
        self.service()
        self.assertIn('PROFILE_DECLARATION_MISSING', self.codes(self.scan()))
        self.install([])
        self.assertIn('PROFILE_DECLARATION_MISSING', self.codes(self.scan()))

    def test_invalid_profile_shapes_and_nonobject_elements(self):
        path = self.install([self.raw, False, None, {}])
        self.target()
        self.write(self.profiles / 'bad-array.json', dict(systemability={}))
        self.write(self.profiles / 'bad-root.json', [])
        (self.profiles / 'duplicate.json').write_text('{"process":"a","process":"b"}')
        (self.profiles / 'syntax.json').write_text('{')
        result = self.scan()
        self.assertEqual(len(result.sas), 2)
        self.assertEqual(set(result.sas[1]), {'profile', 'service'})
        self.assertTrue({'SA_NOT_OBJECT', 'SYSTEMABILITY_NOT_ARRAY', 'PROFILE_NOT_OBJECT',
                        'PROFILE_DUPLICATE_JSON_KEY', 'PROFILE_INVALID_JSON'} <= self.codes(result))
        pointers = {i.get('pointer') for i in result.snapshot['issues'] if i['code'] == 'SA_NOT_OBJECT'}
        self.assertEqual(pointers, {'/systemability/1', '/systemability/2'})

    def test_process_is_not_inferred(self):
        path = self.install()
        self.target()
        self.write(path, dict(systemability=[self.raw]))
        result = self.scan()
        self.assertNotIn('process', result.sas[0])
        self.assertNotIn('component', result.sas[0])
        self.assertIn('SA_IDENTITY_INVALID', self.codes(result))

    def test_linking_first_argument_only_and_no_name_fallback(self):
        self.install()
        self.target()
        self.service(path=['/system/bin/sa_main', '/system/profile/wrong.json', '/system/profile/host.json'])
        result = self.scan()
        self.assertNotIn('service', result.sas[0])
        self.assertIn('SERVICE_UNMATCHED', self.codes(result))
        self.service(path=['/system/bin/custom', '/system/profile/host.json'])
        self.assertIn('SERVICE_UNMATCHED', self.codes(self.scan()))
        self.service(path=['/system/bin/sa_main', '/system/./profile//host.json'])
        self.assertEqual(self.scan().snapshot['status'], 'complete')

    def test_linking_ambiguity_and_name_conflict(self):
        self.install()
        self.target()
        self.service(cfg='duplicate.cfg')
        result = self.scan()
        self.assertNotIn('service', result.sas[0])
        self.assertIn('SERVICE_AMBIGUOUS', self.codes(result))
        (self.package / 'system/etc/init/duplicate.cfg').unlink()
        self.service(process='different')
        result = self.scan()
        self.assertNotIn('process', result.sas[0])
        self.assertEqual(result.sas[0]['service']['name'], 'different')
        self.assertIn('PROCESS_NAME_MISMATCH', self.codes(result))

    def test_partial_service_index_does_not_confirm_unique_host(self):
        self.install()
        self.target()
        (self.package / 'system/etc/init/bad.cfg').write_text('{')
        result = self.scan()
        self.assertNotIn('service', result.sas[0])
        self.assertEqual(result.sas[0]['component']['name'], 'alpha')
        self.assertIn('SERVICE_INDEX_INCOMPLETE', self.codes(result))
        self.assertTrue(all(not i['path'].startswith('/') for i in result.snapshot['issues']))

    def test_toolchain_duplicates_merge_but_targets_do_not(self):
        self.install()
        self.target()
        self.target(label='//components/alpha/profile:target(//build/tc:b)')
        self.assertEqual(self.scan().snapshot['status'], 'complete')
        self.target(part='beta')
        result = self.scan()
        self.assertNotIn('component', result.sas[0])
        self.assertIn('SA_SOURCE_AMBIGUOUS', self.codes(result))

    def test_source_content_mismatch_and_unmatched_key(self):
        self.install()
        self.target(dict(self.raw, libpath='stale.so'))
        result = self.scan()
        self.assertIn('SA_SOURCE_MISMATCH', self.codes(result))
        self.assertEqual(result.sas[0]['libpath'], 'libexample.so')
        self.assertNotIn('label', result.sas[0])
        self.rows = []
        self.target(process='other')
        self.assertIn('SA_SOURCE_UNMATCHED', self.codes(self.scan()))

    def test_missing_and_partial_source_chain(self):
        self.install()
        result = self.scan()
        self.assertEqual(len(result.sas), 1)
        self.assertIn('SA_SOURCE_INDEX_INCOMPLETE', self.codes(result))
        self.target()
        self.rows.append(
            dict(
                type='sa',
                part_name='missing',
                label='//missing:target',
                install_info_file='missing.json'))
        self.manifest()
        result = self.scan()
        self.assertNotIn('component', result.sas[0])
        self.assertIn('SA_SOURCE_INDEX_INCOMPLETE', self.codes(result))

    def test_invalid_labels_cannot_become_filesystem_paths(self):
        self.install()
        for label in ('//components/alpha/\x00profile:target',
                      '//components\\alpha:target', '//components/../alpha:target'):
            self.rows = []
            self.target(label=label)
            result = self.scan()
            self.assertIn('SA_SOURCE_INDEX_INCOMPLETE', self.codes(result))
            self.assertNotIn('label', result.sas[0])

    def test_target_metadata_and_single_sa_constraints(self):
        self.install()
        row, info, source = self.target()
        data = json.loads(info.read_text())
        data['part_name'] = 'conflict'
        self.write(info, data)
        self.assertIn('SA_SOURCE_INDEX_INCOMPLETE', self.codes(self.scan()))
        data['part_name'] = 'alpha'
        self.write(info, data)
        self.write(source, dict(process='host', systemability=[self.raw, self.raw]))
        self.assertIn('SA_SOURCE_INDEX_INCOMPLETE', self.codes(self.scan()))

    def test_part_conflicting_with_the_label_directory_is_reported(self):
        # Ownership is cross-checked against the components index, not against
        # bundle.json on disk: a label living inside another registered
        # component's directory contradicts the part_name the build declared.
        self.install()
        self.target()
        self.parts['beta'] = {'subsystem': 'subsystem', 'path': 'components/alpha/profile'}
        self.write(self.root / 'components/alpha/profile/bundle.json',
                   dict(component=dict(name='beta', subsystem='subsystem')))
        self.components()
        result = self.scan()
        self.assertNotIn('component', result.sas[0])
        self.assertIn('SA_COMPONENT_CONFLICT', self.codes(result))
        # An unregistered bundle.json on the path is simply not a candidate --
        # the old nearest-bundle walk used to stop at it and report it invalid.
        del self.parts['beta']
        self.components()
        self.write(self.root / 'components/alpha/profile/bundle.json', dict(component='bad'))
        # (unregistered now, and malformed, yet attribution still succeeds)
        result = self.scan()
        self.assertEqual(result.sas[0]['component']['name'], 'alpha')
        self.assertNotIn('BUNDLE_INVALID', self.codes(result))
        self.assertEqual(result.sas[0]['component']['name'], 'alpha')
        self.assertEqual(result.sas[0]['component']['subsystem'], 'subsystem')

    def test_subsystem_comes_from_components_registry_not_bundle(self):
        # Once `part` is confirmed, subsystem is read from the components dependency
        # registry, not re-derived from bundle.json or system_module_info.json.
        self.install()
        self.target()
        (self.root / 'components/alpha/bundle.json').unlink()
        result = self.scan()
        self.assertEqual(result.sas[0]['component'], dict(name='alpha', subsystem='subsystem'))
        self.assertEqual(result.snapshot['status'], 'complete')
        self.components(entries={})
        result = self.scan()
        self.assertNotIn('component', result.sas[0])
        self.assertIn('COMPONENT_NOT_REGISTERED', self.codes(result))

    def test_resolve_component_disabled_skips_dependency_scan(self):
        self.install()
        self.target()
        with patch('oskm.collectors.components.collector.ComponentsCollector.collect', side_effect=AssertionError):
            result = self.scan(resolve_component=False)
        self.assertEqual(result.snapshot['status'], 'complete')
        self.assertNotIn('component', result.sas[0])
        self.assertNotIn('label', result.sas[0])

    def test_source_files_do_not_extend_installed_inventory(self):
        self.install()
        self.target()
        self.target(dict(self.raw, name=999), process='uninstalled')
        result = self.scan()
        self.assertEqual([r['name'] for r in result.sas], [100])
        self.assertEqual(result.snapshot['status'], 'complete')

    def test_duplicate_ids_and_content_are_retained(self):
        self.install([self.raw, self.raw])
        self.target()
        result = self.scan()
        self.assertEqual(result.sas[0], result.sas[1])
        self.assertEqual(result.snapshot['status'], 'complete')
        self.assertEqual(result.query().aggregate_sas().denominator, 2)
        self.assertEqual(result.query().list_sas(SAFilter(ids=(100,))).positions, (0, 1))
        advisory = [i for i in result.snapshot['issues'] if i.get('advisory')]
        self.assertEqual([i['code'] for i in advisory], ['SA_ID_DUPLICATE'] * 2)
        self.assertEqual(result.snapshot['status'], 'complete')   # advisory never degrades

    def test_boundaries_limits_and_directory_errors(self):
        self.install()
        row, info, source = self.target()
        self.rows[0]['install_info_file'] = '../outside.json'
        self.manifest()
        self.assertIn('SA_SOURCE_INDEX_INCOMPLETE', self.codes(self.scan()))
        row['install_info_file'] = info.relative_to(self.build).as_posix()
        self.manifest()
        source.unlink()
        outside = self.root / 'outside.json'
        self.write(outside, dict(process='host', systemability=[self.raw]))
        source.symlink_to(outside)
        self.assertIn('SA_SOURCE_OUTSIDE_ALLOWED_ROOT', self.codes(self.scan()))
        result = self.scan(limits=ScanLimits(file_bytes=1))
        self.assertIn('PROFILE_SIZE_LIMIT', self.codes(result))
        with self.assertRaises(ScanFatalError):
            self.scan(limits=ScanLimits(input_files=1))
        with self.assertRaises(RequestError):
            self.scan(limits=ScanLimits(input_files=0))
        with self.assertRaises(RequestError):
            self.scan(product='../escape')
        with self.assertRaises(RequestError):
            self.scan(package_root=Path('missing'))
        with patch('oskm.collectors.system_abilities.discovery.os.scandir', side_effect=PermissionError):
            result = self.scan()
        self.assertIn('PROFILE_DIRECTORY_UNREADABLE', self.codes(result))
        self.assertEqual(result.sas, ())

    def test_predicates_metadata_collisions_and_scalar_groups(self):
        raws = [
            dict(
                self.raw, name=100, part='raw', x=True), dict(
                self.raw, name=200, x=1), dict(
                self.raw, name=300, x=None), dict(
                    self.raw, name=400)]
        self.install(raws)
        for raw in raws:
            self.target(raw)
        query = self.scan().query()
        def positions(predicate): return query.list_sas(SAFilter(fields=(predicate,))).positions
        self.assertEqual(positions(FieldPredicate('x', 'eq', True)), (0,))
        self.assertEqual(positions(FieldPredicate('x', 'eq', 1)), (1,))
        self.assertEqual(positions(FieldPredicate('x', 'is_null')), (2,))
        self.assertEqual(positions(FieldPredicate('x', 'absent')), (3,))
        self.assertEqual(positions(FieldPredicate('part', 'eq', 'raw')), (0,))
        self.assertEqual(
            query.list_sas(
                SAFilter(
                    components=(
                        'alpha',), processes=(
                        'host',), service_names=(
                        'host',))).total, 4)
        self.assertEqual(query.aggregate_sas(('field:x',)).total_groups, 4)
        self.assertEqual(query.aggregate_sas(('service',)).groups[0]['count'], 4)
        self.assertEqual(query.get_service_ref(0)['name'], 'host')
        self.assertIsNone(query.get_sa(999))

    def test_invalid_queries_even_on_empty_results(self):
        query = self.scan().query()
        for f in (SAFilter(ids=(True,)), SAFilter(ids=('100',)), SAFilter(
                components=['a']), SAFilter(fields=(FieldPredicate('name', 'bad'),))):
            with self.assertRaises(QueryError):
                query.list_sas(f)
        for page in (PageRequest(0), PageRequest(True), PageRequest(cursor='not-a-cursor')):
            with self.assertRaises(QueryError):
                query.list_sas(page=page)
        with self.assertRaises(QueryError):
            query.aggregate_sas(('wrong',))
        with self.assertRaises(QueryError):
            query.get_sa(True)
        query.close()
        with self.assertRaises(QueryError):
            query.list_sas()

    def test_exact_values_survive_the_store_and_cursors_rebind(self):
        raw = dict(self.raw, value=Decimal('1.12345678901234567890123456789'), big=2**80)
        self.install([raw, raw])
        self.target(raw)
        result = self.scan()
        baseline = result.query()
        cursor = baseline.list_sas(page=PageRequest(1)).next_cursor
        record = result.to_dict()['sas'][0]
        self.assertEqual(str(record['config']['value']), '1.12345678901234567890123456789')
        self.assertEqual(record['config']['big'], 2**80)
        with self.scan().query() as query:
            self.assertEqual(query.list_sas(), baseline.list_sas())
            self.assertEqual(query.list_sas(page=PageRequest(cursor=cursor)).positions, (1,))
            self.assertEqual(query.aggregate_sas(), baseline.aggregate_sas())

    def test_callbacks_and_cancellation(self):
        self.install()
        self.target()
        events = []
        result = _scan_one('sas', self.request, on_progress=events.append)
        self.assertEqual(events[-1].phase, 'finalize')
        self.assertEqual(sum(e.phase == 'finalize' for e in events), 1)
        with self.assertRaises(ScanCancelled):
            _scan_one('sas', self.request, cancelled=lambda: True)

        def broken(_): raise ValueError('callback')
        with self.assertRaises(ScanFatalError):
            _scan_one('sas', self.request, on_progress=broken)
        self.assertEqual(len(result.sas), 1)

    def test_cli_parameters_quality_and_degraded_exit(self):
        raw = dict(self.raw, distributed='bad')
        self.install([raw])
        self.target(raw)
        db = str(self.root / 'k.db')

        def run(extra):
            with contextlib.redirect_stdout(io.StringIO()) as out, contextlib.redirect_stderr(io.StringIO()):
                code = main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                             '--db', db, '--only', 'sas', *extra])
            return code, json.loads(out.getvalue())
        self.assertEqual(run([])[0], 0)
        self.assertEqual(run(['--fail-on', 'error'])[0], 5)
        (self.package / 'sa_profile/src_sa_install_info.json').unlink()
        self.assertEqual(run(['--fail-on', 'error'])[0], 4)
        scan_parser = parser()._subparsers._group_actions[0].choices['scan']
        self.assertEqual({a.dest for a in scan_parser._actions} - {'help'}, {'workspace_root',
                         'product', 'db', 'only', 'without', 'scan_id', 'reuse_upstream', 'fail_on'})

    def test_install_link_is_the_library_not_the_profile(self):
        # An SA has two installed artifacts. The profile is installed by a
        # label-less sa_info aggregate, so linking to it would give a module no
        # caller could follow back by label; the implementation library's module
        # carries one, so that is what sas.install_module_id points at.
        self.install()
        self.target()
        self.smi([{'dest': ['system/profile/host.json'], 'part_name': 'alpha',
                   'type': 'sa_info'},
                  {'dest': ['system/lib/libexample.so'], 'type': 'lib',
                   'part_name': 'alpha', 'label': '//components/alpha:lib(//build/tc:a)'},
                  {'dest': ['system/etc/init/host.cfg'], 'type': 'etc',
                   'part_name': 'alpha', 'label': '//components/alpha:cfg(//build/tc:a)'}])
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'sas'])
        with ScanSession.open(Database(db)) as session:
            row = session.sql('SELECT * FROM sas WHERE scan_id = ?', (session.scan_id,))[0]
            self.assertIsNotNone(row['install_module_id'])
            module = session.sql('SELECT * FROM install_modules WHERE id = ?',
                                 (row['install_module_id'],))[0]
            self.assertEqual(module['label'], '//components/alpha:lib')
            # The SA's own sa_profile target is not stored at all any more: the
            # published label is the installing module's, and the sa_profile
            # target never appears in the manifest.
            self.assertNotIn('label', row)
            self.assertIsNone(session.install_module('//components/alpha/profile:target'))
            self.assertEqual(session.records('sas')[0]['label'], '//components/alpha:lib')
            # the profile's installer is reachable, and is the unlabelled row
            self.assertIsNone(session.installed_at('system/profile/host.json')[0].label)

    def test_install_link_is_absent_when_the_library_is_not_a_module(self):
        self.install()
        self.target()
        self.smi([{'dest': ['system/etc/init/host.cfg'], 'type': 'etc',
                   'part_name': 'alpha', 'label': '//components/alpha:cfg(//build/tc:a)'}])
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'sas'])
        with ScanSession.open(Database(db)) as session:
            row = session.sql('SELECT * FROM sas WHERE scan_id = ?', (session.scan_id,))[0]
            # unset, not an error: not every SA library is a module of its own
            self.assertIsNone(row['install_module_id'])
            self.assertFalse([i for i in session.issues('sas') if 'INSTALL' in i['code']])


if __name__ == '__main__':
    unittest.main()
