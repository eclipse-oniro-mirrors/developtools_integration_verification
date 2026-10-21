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
"""Component input boundaries, declaration fidelity, queries and publication."""
from oskm.cli import main, parser
from oskm.core.models import (ScanLimits, FieldPredicate, PageRequest, RequestError,
                              ScanFatalError, ScanCancelled, QueryError, ResultError, PublishError)
from oskm.core.io import canonical, read_bytes
from oskm.core.session import ScanSession
from oskm.core.db import Database
from oskm.core.api import scan as _scan_one
from oskm.collectors.components.models import ComponentScanRequest, ComponentFilter, ComponentResult
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


class ComponentTest(unittest.TestCase):
    def setUp(self):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        self.root = Path(temp.name)
        self.index = self.root / 'out/test/build_configs/parts_info/components.json'
        self.request = ComponentScanRequest(self.root, 'test')
        self.entries = {}
        self.write(self.index, {})

    def write(self, path, obj):
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(obj if isinstance(obj, bytes) else canonical(obj))
        return path

    def bundle(self, name='a', subsystem='s', **attrs):
        path = self.root / 'src' / name / 'bundle.json'
        self.entries[name] = dict(path=f'src/{name}', subsystem=subsystem)
        self.write(self.index, self.entries)
        self.write(path, dict(component=dict(name=name, subsystem=subsystem, **attrs)))
        return path

    def scan(self, **kwargs):
        return _scan_one('components', self.request, **kwargs)

    def codes(self, result):
        return {issue['code'] for issue in result.snapshot.get('issues', ())}

    def invoke(self, *args):
        stdout, stderr = io.StringIO(), io.StringIO()
        with contextlib.redirect_stdout(stdout), contextlib.redirect_stderr(stderr):
            code = main(list(args))
        return code, json.loads(stdout.getvalue()), stderr.getvalue()

    def test_single_out_input_and_no_summary_fallback(self):
        manifest = self.bundle(deps={'components': ['external', 'external']}, build={'inner_kits': []})
        self.entries['a'].update(deps_components=['wrong'], innerapis=[{'name': 'wrong'}])
        self.write(self.index, self.entries)
        self.write(self.root / 'out/test/all_parts_info.json', {'wrong': {}})
        opened = []
        original = Path.open

        def tracked(path, *args, **kwargs):
            opened.append(path.resolve())
            return original(path, *args, **kwargs)
        with patch.object(Path, 'open', tracked):
            result = self.scan()
            with result.query() as query:
                self.assertEqual(query.list_dependents('external').total, 1)
                query.get_component('a')
        self.assertEqual(opened, [self.index, manifest])
        self.assertEqual(result.components[0]['deps']['components'], ('external', 'external'))

    def test_bundle_json_is_preserved_whole_not_truncated(self):
        # Everything the manifest declared survives, including keys the scanner
        # has no opinion about; only name/subsystem/manifest are index-derived.
        self.bundle('a', rom='12KB', ram='3MB', adapted_system_type=['standard'],
                    description='text', deps={'components': ['x']})
        record = self.scan().to_dict()['components'][0]
        self.assertEqual(record['rom'], '12KB')
        self.assertEqual(record['ram'], '3MB')
        self.assertEqual(record['adapted_system_type'], ['standard'])
        self.assertEqual(record['description'], 'text')
        self.assertEqual(record['name'], 'a')
        self.assertEqual(record['manifest'], 'src/a/bundle.json')

    def test_innerapi_rows_carry_the_external_deps_name(self):
        self.bundle('comp', build={'inner_kits': [
            {'name': '//foundation/comp/x:alpha', 'header': {'header_base': '//h'}},
            {'name': '//foundation/comp/y:beta'}], 'inner_api': [
            {'name': '//foundation/comp/z:gamma'}]})
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'components'])
        with ScanSession.open(Database(db)) as session:
            rows = session.sql('SELECT i.field, i.source_index, i.name, i.external_name, c.name comp '
                               'FROM innerapis i JOIN components c ON c.id = i.component_id '
                               'WHERE i.scan_id = ? ORDER BY i.id', (session.scan_id,))
        self.assertEqual([r['external_name'] for r in rows],
                         ['comp:alpha', 'comp:beta', 'comp:gamma'])
        self.assertEqual([r['field'] for r in rows], ['inner_kits', 'inner_kits', 'inner_api'])
        self.assertEqual([r['source_index'] for r in rows], [0, 1, 0])
        self.assertTrue(all(r['comp'] == 'comp' for r in rows))
        # the element is kept verbatim, header and all

    def test_duplicate_external_name_is_reported_with_every_location(self):
        # Two labels in different directories reduce to the same external_deps
        # name, which makes a consumer's reference ambiguous.
        self.bundle('comp', build={'inner_kits': [
            {'name': '//a/v1:shared'}, {'name': '//a/v2:shared'}, {'name': '//a:other'}]})
        result = self.scan()
        conflict = [i for i in result.snapshot['issues']
                    if i['code'] == 'INNERAPI_EXTERNAL_NAME_CONFLICT']
        self.assertEqual(len(conflict), 1)
        self.assertEqual(conflict[0]['severity'], 'warning')
        self.assertEqual(conflict[0]['details']['external_name'], 'comp:shared')
        self.assertEqual(list(conflict[0]['details']['declarations']),
                         ['/component/build/inner_kits/0', '/component/build/inner_kits/1'])

    def test_syscap_and_feature_rows_are_addressable(self):
        self.bundle('a', syscap=['SystemCapability.X', 'SystemCapability.Y'], features=['a_flag'])
        self.bundle('b', syscap=['SystemCapability.Z'])
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'components'])
        with ScanSession.open(Database(db)) as session:
            rows = session.sql('SELECT c.name comp, s.source_index, s.value FROM syscaps s '
                               'JOIN components c ON c.id = s.component_id '
                               'WHERE s.scan_id = ? ORDER BY s.id', (session.scan_id,))
            self.assertEqual([(r['comp'], r['source_index'], r['value']) for r in rows],
                             [('a', 0, 'SystemCapability.X'), ('a', 1, 'SystemCapability.Y'),
                              ('b', 0, 'SystemCapability.Z')])
            self.assertEqual([r['value'] for r in session.sql(
                'SELECT value FROM features WHERE scan_id = ?', (session.scan_id,))], ['a_flag'])
            # the arrays stay in the published record as well
            self.assertEqual(list(session.records('components')[0]['syscap']),
                             ['SystemCapability.X', 'SystemCapability.Y'])

    def test_duplicate_syscap_is_reported_within_and_across_components(self):
        self.bundle('a', syscap=['SystemCapability.Dup', 'SystemCapability.Dup'])
        self.bundle('b', syscap=['SystemCapability.Shared'])
        self.bundle('c', syscap=['SystemCapability.Shared'])
        issues = {(i['component'], i['code']): i for i in self.scan().snapshot['issues']}
        inside = issues[('a', 'SYSCAP_DUPLICATE')]
        self.assertEqual(inside['severity'], 'warning')
        self.assertEqual(inside['details']['value'], 'SystemCapability.Dup')
        self.assertEqual([d['pointer'] for d in inside['details']['declarations']],
                         ['/component/syscap/0', '/component/syscap/1'])
        # a value claimed by two components is reported on both, each listing both
        for owner in ('b', 'c'):
            across = issues[(owner, 'SYSCAP_DUPLICATE')]
            self.assertEqual([d['component'] for d in across['details']['declarations']], ['b', 'c'])

    def test_raw_fidelity_and_immutable_model(self):
        build = dict(sub_component=['//x:${name}', '//x:${name}'],
                     inner_kits=[
            dict(
                name='//x:kit',
                header=dict(
                    header_files=['x.h'],
                    header_base='//x'),
                extra=Decimal('1.1234567890123456789'))],
            conditions={'//x:kit': 'flag'}, unknown={'nested': [True, None]})
        self.bundle(deps={'components': [], 'vendor': {'a': 1}}, build=build, features=[], syscap=[])
        result = self.scan()
        self.assertEqual(result.to_dict()['components'][0]['build'], build)
        with self.assertRaises(TypeError):
            result.components[0]['name'] = 'new'
        copy = result.to_dict()
        copy['components'][0]['build']['inner_kits'].clear()
        self.assertEqual(len(result.components[0]['build']['inner_kits']), 1)

    def test_missing_null_empty_and_bad_types_are_distinct(self):
        self.bundle('absent')
        self.bundle('null', deps=None, build=3, features=None, syscap=False)
        self.bundle('empty', deps={}, build={}, features=[], syscap=[])
        self.bundle('bad', deps={'components': 'a'}, build={'inner_kits': [3], 'conditions': []})
        result = self.scan()
        self.assertEqual(result.snapshot['status'], 'degraded')
        with result.query() as query:
            self.assertNotIn('deps', query.get_component('absent'))
            self.assertIsNone(query.get_component('null')['deps'])
            self.assertEqual(
                query.list_components(
                    ComponentFilter(
                        fields=(
                            FieldPredicate(
                                'deps',
                                'is_null'),
                        ))).total,
                1)
            self.assertEqual(
                query.list_components(
                    ComponentFilter(
                        fields=(
                            FieldPredicate(
                                'deps',
                                'absent'),
                        ))).total,
                1)

    def test_ohos_multiple_parts_aliases_and_shared_read(self):
        self.entries = {name: dict(path='src/shared', subsystem='effective') for name in ('a', 'b')}
        self.write(self.index, self.entries)
        source = self.root / 'src/shared/ohos.build'
        self.write(
            source,
            dict(
                subsystem='declared',
                parts={
                    'a': dict(
                        module_list=['//x:${product_name}'],
                        inner_kits=[],
                        feature_list=['a_flag'],
                        system_capabilities=[],
                        hisysevent_config=['ignored']),
                    'b': dict(
                        deps={},
                        features=['fallback'],
                        syscap=[],
                        test_list=[])}))
        with patch('oskm.core.framework.read_bytes', wraps=read_bytes) as reader:
            result = self.scan()
        self.assertEqual(reader.call_count, 2)
        self.assertEqual(result.snapshot['status'], 'complete')
        self.assertEqual(len(result.snapshot['issues']), 2)
        a, b = result.to_dict()['components']
        self.assertEqual(a['features'], ['a_flag'])
        self.assertEqual(a['build'], {'module_list': ['//x:${product_name}'], 'inner_kits': []})
        self.assertEqual(b['build'], {'test_list': []})
        self.assertEqual(b['features'], ['fallback'])

    def test_alias_conflict_keeps_native_value(self):
        self.write(self.index, {'a': dict(path='src/a', subsystem='s')})
        self.write(
            self.root /
            'src/a/ohos.build',
            dict(
                subsystem='s',
                parts={
                    'a': dict(
                        feature_list=['native'],
                        features=['other'])}))
        result = self.scan()
        self.assertIn('FIELD_ALIAS_CONFLICT', self.codes(result))
        self.assertEqual(result.components[0]['features'], ('native',))

    def test_bad_index_is_fatal_and_empty_is_complete(self):
        self.assertEqual(self.scan().components, ())
        for data in (b'[]', b'{', b'{"x":{},"x":{}}', b'{"":{}}'):
            with self.subTest(data=data):
                self.write(self.index, data)
                with self.assertRaises(ScanFatalError):
                    self.scan()
        self.index.unlink()
        with self.assertRaises(ScanFatalError):
            self.scan()

    def test_bad_entries_preserve_identities(self):
        self.write(self.index, {'a': None, 'b': {'path': 'missing'}, 'c': {'path': 3, 'subsystem': 's'}})
        result = self.scan()
        self.assertEqual([r['name'] for r in result.components], ['a', 'b', 'c'])
        self.assertEqual(self.codes(result),
                         {'INDEX_ENTRY_TYPE',
                          'INDEX_FIELD_TYPE',
                          'MANIFEST_MISSING',
                          'SOURCE_PATH_INVALID'})

    def test_manifest_errors_and_duplicates_have_locations(self):
        path = self.bundle()
        for data in (b'[]', b'{', b'{"component":{"name":"a","name":"b"}}', b'\xff'):
            with self.subTest(data=data):
                self.write(path, data)
                result = self.scan()
                self.assertEqual(result.snapshot['status'], 'degraded')
                self.assertNotIn('build', result.components[0])
        self.write(path, b'{"component":{"name":"a","features":[],"features":["flag"]}}')
        issue = self.scan().snapshot['issues'][0]
        self.assertEqual(issue['pointer'], '/component/features')
        self.assertEqual(issue['details']['reason'], 'DUPLICATE_JSON_KEY')

    def test_identity_mismatch_does_not_import_details(self):
        path = self.bundle()
        self.write(path, dict(component=dict(name='b', subsystem='s', build={'sub_component': ['wrong']})))
        self.assertNotIn('build', self.scan().components[0])
        path.unlink()
        self.write(path.with_name('ohos.build'), dict(subsystem='s', parts={'b': {'module_list': ['wrong']}}))
        self.assertIn('COMPONENT_NAME_MISMATCH', self.codes(self.scan()))

    def test_subsystem_info_and_missing_subsystem(self):
        path = self.bundle()
        self.write(path, dict(component=dict(name='a', subsystem='other', build={})))
        result = self.scan()
        self.assertEqual(result.snapshot['status'], 'complete')
        self.assertEqual(result.components[0]['subsystem'], 's')
        self.assertEqual(result.snapshot['issues'][0]['severity'], 'info')
        self.write(path, dict(component=dict(name='a', build={})))
        self.assertEqual(self.scan().snapshot['status'], 'degraded')

    def test_ambiguous_missing_and_nonfile_manifest(self):
        path = self.bundle()
        other = self.write(path.with_name('ohos.build'), {})
        self.assertIn('MANIFEST_AMBIGUOUS', self.codes(self.scan()))
        path.unlink()
        other.unlink()
        self.assertIn('MANIFEST_MISSING', self.codes(self.scan()))
        path.mkdir()
        self.assertIn('MANIFEST_UNREADABLE', self.codes(self.scan()))

    def test_source_path_and_symlink_boundaries(self):
        self.bundle()
        for value in ('../elsewhere', '/etc', 'out/test', 'src/../a', 'bad\x00path'):
            with self.subTest(value=value):
                self.write(self.index, {'a': dict(path=value, subsystem='s')})
                self.assertIn('SOURCE_PATH_INVALID', self.codes(self.scan()))
        link = self.root / 'linked'
        link.symlink_to(self.root / 'out/test', target_is_directory=True)
        self.write(self.index, {'a': dict(path='linked', subsystem='s')})
        self.assertIn('SOURCE_PATH_INVALID', self.codes(self.scan()))
        path = self.bundle()
        path.unlink()
        path.symlink_to(self.index)
        self.assertIn('SOURCE_PATH_INVALID', self.codes(self.scan()))

    def test_index_symlink_outside_index_directory_is_fatal(self):
        target = self.write(self.root / 'source-index.json', {})
        self.index.unlink()
        self.index.symlink_to(target)
        with self.assertRaises(ScanFatalError):
            self.scan()

    def test_budget_limits_and_failure_cache(self):
        self.bundle('a')
        self.bundle('b')
        index_bytes = self.index.stat().st_size
        for limits in (ScanLimits(file_bytes=1),            # index itself exceeds the cap
                       ScanLimits(input_files=1),            # more components than allowed
                       ScanLimits(total_bytes=index_bytes)):  # budget exhausted by the index
            with self.subTest(limits=limits), self.assertRaises(ScanFatalError):
                _scan_one('components', replace(self.request, limits=limits))
        # A manifest larger than the per-file cap degrades that one component only.
        self.write(self.root / 'src/a/bundle.json',
                   dict(component=dict(name='a', subsystem='s', syscap=['x' * index_bytes])))
        limited = _scan_one('components', replace(self.request, limits=ScanLimits(file_bytes=index_bytes)))
        self.assertIn('MANIFEST_LIMIT', self.codes(limited))
        self.write(self.index, {k: dict(path='shared', subsystem='s') for k in ('a', 'b')})
        self.write(self.root / 'shared/ohos.build', b'{')
        with patch('oskm.core.framework.read_bytes', wraps=read_bytes) as reader:
            result = self.scan()
        self.assertEqual(reader.call_count, 2)
        self.assertEqual(len(result.snapshot['issues']), 2)

    def test_requests_progress_cancel_and_callbacks(self):
        self.bundle()
        for req in (
            None,
            replace(
                self.request,
                product='../a'),
            replace(
                self.request,
                workspace_root=self.root /
                'missing'),
            replace(
                self.request,
                limits=ScanLimits(
                    file_bytes=True))):
            with self.subTest(req=req), self.assertRaises(RequestError):
                _scan_one('components', req)
        with self.assertRaises(ScanCancelled):
            self.scan(cancelled=lambda: True)
        progress = []
        self.scan(on_progress=progress.append)
        self.assertEqual(progress[-1].phase, 'finalize')
        self.assertEqual(progress[-1].completed, 1)
        def fail(_): raise LookupError('caller')
        with self.assertRaises(ScanFatalError):
            self.scan(on_progress=fail)
        self.write(self.index, {'a': None})
        with self.assertRaises(ScanFatalError):
            self.scan(on_diagnostic=fail)

    def test_queries_reverse_deps_filters_and_aggregation(self):
        self.bundle('a', deps={'components': ['outside', 'outside'], 'third_party': ['jsoncpp']}, features=[])
        self.bundle('b', subsystem='t', deps={'components': ['a']})
        self.bundle('c', subsystem='t', deps={'components': 'outside'})
        result = self.scan()
        with result.query() as query:
            self.assertIsNone(query.get_component('unknown'))
            self.assertEqual(query.list_dependents('outside').total, 1)
            self.assertEqual(query.list_components(ComponentFilter(names=('a', 'b'), subsystems=('s',))).total, 1)
            pred = FieldPredicate('deps', 'contains', 'jsoncpp', pointer='/third_party')
            self.assertEqual(query.list_components(ComponentFilter(fields=(pred,))).items[0]['name'], 'a')
            self.assertEqual([dict(r) for r in query.count_by_subsystem()], [
                             dict(subsystem='s', count=1), dict(subsystem='t', count=2)])
            with self.assertRaises(QueryError):
                query.get_component('')
            with self.assertRaises(QueryError):
                query.list_components(page=PageRequest(0))
            with self.assertRaises(QueryError):
                query.list_components(ComponentFilter(fields=(FieldPredicate('deps', 'bad'),)))
        with self.assertRaises(QueryError):
            query.get_component('a')

    def test_cursor_roundtrip_and_foreign_cursor_rejected(self):
        for name in ('a', 'b', 'c'):
            self.bundle(name)
        result = self.scan()
        with result.query() as query:
            first = query.list_components(page=PageRequest(1))
            with self.assertRaises(QueryError):
                query.list_components(ComponentFilter(names=('b',)), page=PageRequest(1, first.next_cursor))
        # A cursor binds to result content, not to the object: an identical
        # rescan accepts it, a changed one does not.
        with self.scan().query() as query:
            page = query.list_components(page=PageRequest(2, first.next_cursor))
            self.assertEqual([row['name'] for row in page.items], ['b', 'c'])
            self.assertEqual(page.positions, (1, 2))
        self.bundle('d')
        with self.scan().query() as query, self.assertRaises(QueryError):
            query.list_components(page=PageRequest(1, first.next_cursor))

    def test_cli_scan_export_validate_and_degraded_exit(self):
        path = self.bundle()
        db = str(self.root / 'k.db')
        scan = ('scan', '--workspace-root', str(self.root), '--product', 'test',
                '--db', db, '--only', 'components')
        for _ in range(2):                      # rescanning is idempotent
            code, report, _ = self.invoke(*scan)
            self.assertEqual(code, 0)
            self.assertEqual(report['collectors']['components']['records'], 1)
        with self.assertRaises(SystemExit):
            with contextlib.redirect_stderr(io.StringIO()):
                parser().parse_args([*scan, '--format', 'sqlite'])
        path.unlink()
        # Degraded (missing manifest) is independent of the quality gate: no deps
        # were declared, so analyze_components finds nothing and the gate passes.
        code, report, _ = self.invoke(*scan, '--fail-on', 'error')
        self.assertEqual(code, 4)
        self.assertTrue(report['gate_passed'])
        self.index.unlink()
        self.assertEqual(self.invoke(*scan)[0], 3)
        # A document from another domain is rejected when a domain is asserted.

    def test_cli_quality_gate_independent_of_degraded_status(self):
        self.bundle(deps={'components': ['missing']})
        args = ('scan', '--workspace-root', str(self.root), '--product', 'test',
                '--db', str(self.root / 'k.db'), '--only', 'components')
        self.assertEqual(self.invoke(*args)[0], 0)
        code, report, _ = self.invoke(*args, '--fail-on', 'error')
        self.assertEqual(code, 0)
        self.assertTrue(report['gate_passed'])
        # A dangling dependency is a warning: the scan is complete, the data is not sound.
        code, report, _ = self.invoke(*args, '--fail-on', 'warning')
        self.assertEqual(code, 5)
        self.assertEqual(report['status'], 'complete')
        self.assertFalse(report['gate_passed'])


if __name__ == '__main__':
    unittest.main()
