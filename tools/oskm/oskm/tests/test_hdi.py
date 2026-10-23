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
"""Independent hc-gen fixtures plus malformed inputs and association tests."""
from oskm.cli import main, parser
from oskm.core.models import (ScanLimits, FieldPredicate, PageRequest, RequestError,
                              ScanFatalError, ScanCancelled, QueryError, PublishError)
from oskm.core.io import canonical
from oskm.core.api import scan as _scan_one
from oskm.collectors.hdi.discovery import extract
from oskm.collectors.hdi.records import raw_hdi
from oskm.collectors.hdi.hcb import read_hcb, HCBError
from oskm.collectors.hdi.models import HDIScanRequest, HDIFilter, HDIResult
import contextlib
import io
import json
import struct
import sys
import tempfile
import unittest
from dataclasses import replace
from pathlib import Path
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

FIXTURES = Path(__file__).parent / 'fixtures/hdi'


def value(v):
    if isinstance(v, str):
        return b'\x14' + v.encode() + b'\0'
    if isinstance(v, list):
        return b'\x04' + struct.pack('<H', len(v)) + b''.join(value(x) for x in v)
    if isinstance(v, dict):
        return b'\x03' + struct.pack('<I', v['$ref'])
    return b'\x13' + struct.pack('<Q', v)


def node(name, attributes=(), children=()):
    items = attributes.items() if isinstance(attributes, dict) else attributes
    body = b''.join(b'\x02' + k.encode() + b'\0' + value(v) for k, v in items) + b''.join(children)
    return b'\x01' + name.encode() + b'\0' + struct.pack('<I', len(body)) + body


def blob(root):
    return struct.pack('<IIIIi', 0xA00AA00A, 0, 7, 0, len(root)) + root


class HDITest(unittest.TestCase):
    def setUp(self):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        self.root = Path(temp.name)
        self.package = self.root / 'out/test/packages/phone'
        self.package.mkdir(parents=True)
        self.request = HDIScanRequest(self.root, 'test')
        self.raw = dict(serviceName='example', moduleName='libexample.so', policy=2, preload=0,
                        priority=100, permission=436, deviceMatchAttr='')
        self.hcb = self.package / 'vendor/etc/hdfconfig/hdf_default.hcb'
        self.cfg = self.package / 'vendor/etc/init/host.cfg'
        self.library = self.package / 'vendor/lib/libexample.so'
        self.modules = self.package / 'system_module_info.json'
        self.bundle = self.root / 'drivers/example/bundle.json'
        self.row = dict(dest=['vendor/lib/libexample.so'], label='//drivers/example:driver(//build/tc:arm)',
                        part_name='driver', subsystem_name='hdf')

    def write(self, path, data):
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data if isinstance(data, bytes) else canonical(data))
        return path

    def install(self, raws=None, host='host', extra=(), partition='vendor'):
        devices = [node('node' + str(i), r) for i, r in enumerate(raws if raws is not None else [self.raw])]
        manager = node(
            'manager', dict(
                match_attr='hdf_manager'), [
                node(
                    'host', {
                        'hostName': host}, [
                        node(
                            'device', children=devices)])])
        return self.write(self.package / f'{partition}/etc/hdfconfig/hdf_default.hcb',
                          blob(node('root', children=[manager, *extra])))

    def service(self, args=None, name='host', copies=1):
        args = ['-i', '0', '-n', 'host'] if args is None else args
        return self.write(self.cfg, dict(services=[dict(name=name, path=['/vendor/bin/hdf_devhost', *args])] * copies))

    def owner(self, rows=None):
        self.write(self.library, b'\x7fELFfixture')
        self.write(self.modules, [self.row] if rows is None else rows)
        self.write(self.bundle, dict(component=dict(name='driver', subsystem='hdf')))
        self.components()

    def components(self, entries=None):
        path = self.root / 'out/test/build_configs/parts_info/components.json'
        self.write(
            path,
            entries if entries is not None else {
                'driver': {
                    'subsystem': 'hdf',
                    'path': 'drivers/example'}})

    def full(self, raws=None):
        self.install(raws)
        self.service()
        self.owner()
        return self.scan()

    def scan(self, **kwargs):
        return _scan_one('hdi', self.request, **kwargs)

    def codes(self, result):
        return {p['code'] for p in result.snapshot.get('issues', ())}

    def test_independent_compact_and_aligned_fixtures(self):
        for name in ('compact', 'aligned'):
            root = read_hcb((FIXTURES / (name + '.hcb')).read_bytes())
            records = extract(root, 'vendor/etc/hdfconfig/hdf_default.hcb')
            self.assertEqual(len(records), 1)
            raw = raw_hdi(records[0])
            for k, v in self.raw.items():
                self.assertEqual(raw[k], v)
            self.assertEqual([raw[k] for k in ('byte', 'word', 'dword', 'qword')],
                             [255, 65535, 4294967295, 9223372036854775807])
            self.assertEqual(raw['numbers'], [1, 65535, 9223372036854775807])
            self.assertEqual(raw['quoted'], 'a"b')
            self.assertEqual(raw['empty'], [])
            self.assertEqual(raw['ref'], {'$ref': root.children[0].offset})

    def test_headers_boundaries_and_opcodes(self):
        good = (FIXTURES / 'compact.hcb').read_bytes()
        bad = [good[:19], good[:-1], good + b'x', b'xxxx' + good[4:], good[:4] +
               struct.pack('<I', 1) + good[8:], good[:12] + struct.pack('<I', 1) + good[16:]]
        bad.extend([blob(b'\x01root\0' + struct.pack('<I', 100)), blob(b'\x01root\0' +
                   struct.pack('<I', 1) + b'\xff'), blob(b'\x01root'), blob(node('wrong'))])
        for data in bad:
            with self.subTest(data=data[:30]), self.assertRaises(HCBError):
                read_hcb(data)

    def test_duplicate_nodes_attributes_and_invalid_references(self):
        bad = [
            node(
                'root', children=[
                    node('same'), node('same')]), node(
                'root', [
                    ('x', 1), ('x', 2)]), node(
                        'root', {
                            'x': {
                                '$ref': 21}})]
        for tree in bad:
            with self.assertRaises(HCBError):
                read_hcb(blob(tree))
        self.assertEqual(read_hcb(blob(node('root', {'x': {'$ref': 20}}))).attributes['x'], {'$ref': 20})

    def test_limits_and_encoding(self):
        data = (FIXTURES / 'compact.hcb').read_bytes()
        for kwargs in (dict(depth=2), dict(items=2)):
            with self.assertRaises(HCBError):
                read_hcb(data, **kwargs)
        with self.assertRaises(HCBError):
            read_hcb(blob(node('root', {'x': 'y'})).replace(b'y\0', b'\xff\0'))
        with self.assertRaises(HCBError):
            read_hcb(blob(node('root', {'x': [[1]]})))
        # uint64 max and literal newlines survive without conversion to float.
        raw = read_hcb(blob(node('root', {'max': 2**64 - 1, 's': 'x\ny"z'}))).attributes
        self.assertEqual(raw, {'max': 2**64 - 1, 's': 'x\ny"z'})

    def test_minimal_layout_and_exact_owner(self):
        r = self.full()
        self.assertEqual(r.snapshot['status'], 'complete')
        item = r.hdis[0]
        self.assertEqual(item['label'], '//drivers/example:driver')
        self.assertEqual((item['component']['name'], item['component']['subsystem']), ('driver', 'hdf'))
        self.assertEqual(item['service'], dict(cfg='vendor/etc/init/host.cfg', name='host'))
        self.assertEqual(canonical(raw_hdi(item)), canonical(self.raw))
        self.assertEqual(r.snapshot.get('issues', ()), ())   # advisory checks clean too

    def test_unknown_fields_collisions_and_immutable_result(self):
        raw = dict(self.raw, process='rawhost', part='rawpart', library='rawlib', config='rawconfig',
                   array=[0, '', 2**64 - 1], ref={'$ref': 20})
        r = self.full([raw])
        item = r.hdis[0]
        self.assertEqual(canonical(raw_hdi(item)), canonical(raw))
        self.assertEqual(item['process'], 'host')
        with self.assertRaises(TypeError):
            item['config']['part'] = 'x'
        r.to_dict()['hdis'][0]['config']['array'].append(4)
        self.assertEqual(len(item['config']['array']), 3)

    def test_manager_scope_duplicates_empty_and_unsupported(self):
        self.install([self.raw, self.raw], extra=[node('unrelated', {'moduleName': 'other'})])
        self.service()
        self.owner()
        r = self.scan()
        self.assertEqual(len(r.hdis), 2)
        advisory = [i for i in r.snapshot['issues'] if i.get('advisory')]
        self.assertEqual([i['code'] for i in advisory], ['HDI_NAME_DUPLICATE'] * 2)
        self.assertEqual(r.snapshot['status'], 'complete')   # advisory never degrades
        self.install([])
        r = self.scan()
        self.assertEqual(r.hdis, ())
        self.assertEqual(r.snapshot['status'], 'complete')
        for tree in (node('root'), node('root', children=[
                     node('a', {'match_attr': 'hdf_manager'}), node('b', {'match_attr': 'hdf_manager'})])):
            self.write(self.hcb, blob(tree))
            self.assertIn('HCB_MANAGER_COUNT', self.codes(self.scan()))

    def test_invalid_file_does_not_erase_other_partition(self):
        self.full()
        self.install(partition='system')
        self.hcb.write_bytes(b'bad')
        r = self.scan()
        self.assertEqual(len(r.hdis), 1)
        self.assertEqual(len(r.snapshot['scope']), 2)
        self.assertEqual(r.hdis[0]['hcb'], 'system/etc/hdfconfig/hdf_default.hcb')
        self.assertEqual(r.snapshot['status'], 'degraded')

    def test_nested_device_is_not_partially_emitted(self):
        tree = node(
            'root', children=[
                node(
                    'manager', {
                        'match_attr': 'hdf_manager'}, [
                        node(
                            'host', {
                                'hostName': 'host'}, [
                                node(
                                    'device', children=[
                                        node(
                                            'ok', self.raw), node(
                                                'bad', self.raw, [
                                                    node('extra')])])])])])
        self.write(self.hcb, blob(tree))
        r = self.scan()
        self.assertEqual(r.hdis, ())
        self.assertIn('HCB_DEVICE_STRUCTURE', self.codes(r))

    def test_missing_input_invalid_request_and_budgets(self):
        with self.assertRaises(ScanFatalError):
            self.scan()
        for request in (replace(self.request, product='../x'), replace(self.request,
                        limits=ScanLimits(tree_depth=0)), replace(self.request, package_root=Path('/tmp'))):
            with self.assertRaises(RequestError):
                _scan_one('hdi', request)
        self.full()
        r = _scan_one('hdi', replace(self.request, limits=ScanLimits(file_bytes=20)))
        self.assertIn('HCB_SIZE_LIMIT', self.codes(r))
        with self.assertRaises(ScanFatalError):
            _scan_one('hdi', replace(self.request, limits=ScanLimits(input_files=1)))

    def test_host_matching_name_conflict_and_no_fallback(self):
        self.full()
        self.service(args=[])
        self.assertIn('SERVICE_UNMATCHED', self.codes(self.scan()))
        self.service(args=['-n', 'other'], name='host')
        self.assertIn('SERVICE_UNMATCHED', self.codes(self.scan()))
        self.service(name='alias')
        r = self.scan()
        self.assertEqual(r.hdis[0]['service']['name'], 'alias')
        self.assertIn('PROCESS_NAME_MISMATCH', self.codes(r))
        self.service(copies=2)
        self.assertIn('SERVICE_AMBIGUOUS', self.codes(self.scan()))

    def test_malformed_host_and_partial_service_index(self):
        self.full()
        for args in (['-n'], ['-n', 'host', '-n', 'host'], ['-n', 3], ['-i', '-n']):
            self.service(args=args)
            r = self.scan()
            self.assertIn('SERVICE_INDEX_INCOMPLETE', self.codes(r))
            self.assertNotIn('service', r.hdis[0])
        self.service()
        self.write(self.cfg.parent / 'bad.cfg', b'{')
        self.assertIn('SERVICE_INDEX_INCOMPLETE', self.codes(self.scan()))

    def test_bad_raw_types_are_kept(self):
        self.install([dict(self.raw, moduleName=[], policy='bad')], host=[])
        self.service()
        r = self.scan()
        self.assertEqual(r.hdis[0].get('process', None), None)
        self.assertEqual(r.hdis[0]['moduleName'], ())
        self.assertIn('MODULE_PATH_INVALID', self.codes(r))
        self.assertIn('HOST_NAME_INVALID', self.codes(r))
        self.assertIn('HDI_FIELD_INVALID', self.codes(r))

    def test_missing_and_ambiguous_libraries(self):
        self.full()
        self.library.unlink()
        r = self.scan()
        self.assertIn('LIBRARY_UNMATCHED', self.codes(r))
        self.assertNotIn('library', r.hdis[0])
        self.owner()
        self.write(self.package / 'vendor/lib64/libexample.so', b'\x7fELF')
        r = self.scan()
        self.assertIn('LIBRARY_AMBIGUOUS', self.codes(r))
        self.assertNotIn('label', r.hdis[0])

    def test_module_paths_no_suffix_fallback_and_non_elf(self):
        self.full()
        for name, code in (('example', 'LIBRARY_UNMATCHED'), ('../libexample.so', 'MODULE_PATH_INVALID'),
                           ('vendor/lib/libexample.so', 'MODULE_PATH_UNSUPPORTED')):
            self.install([dict(self.raw, moduleName=name)])
            self.assertIn(code, self.codes(self.scan()))
        self.install([dict(self.raw, moduleName='/vendor/lib/libexample.so')])
        self.assertEqual(self.scan().snapshot['status'], 'complete')
        self.library.write_bytes(b'not elf')
        self.assertIn('LIBRARY_NOT_ELF', self.codes(self.scan()))

    def test_symlink_directories_excluded_and_files_confined(self):
        self.full()
        (self.package / 'root').mkdir()
        (self.package / 'root/lib').symlink_to('/system/lib', target_is_directory=True)
        (self.package / 'root/etc').symlink_to('/system/etc', target_is_directory=True)
        self.assertEqual(self.scan().snapshot['status'], 'complete')
        outside = self.root / 'outside.so'
        self.write(outside, b'\x7fELF')
        self.library.unlink()
        self.library.symlink_to(outside)
        self.assertIn('LIBRARY_PATH_INVALID', self.codes(self.scan()))
        self.hcb.unlink()
        self.hcb.symlink_to(outside)
        self.assertIn('HCB_OUTSIDE_ALLOWED_ROOT', self.codes(self.scan()))

    def test_library_enumeration_failure_prevents_unique_match(self):
        self.full()
        import os
        real = os.scandir

        def scandir(path):
            if Path(path) == self.package / 'vendor/lib64':
                raise PermissionError()
            return real(path)
        with patch('os.scandir', side_effect=scandir):
            r = self.scan()
        self.assertIn('LIBRARY_INDEX_INCOMPLETE', self.codes(r))
        self.assertNotIn('library', r.hdis[0])

    def test_module_index_and_label_ambiguity(self):
        self.full()
        self.write(self.modules, [self.row, dict(self.row, label='//drivers/example:other')])
        self.assertIn('ORIGIN_LABEL_AMBIGUOUS', self.codes(self.scan()))
        self.write(self.modules, [self.row, dict(self.row, label='//drivers/example:driver(//build/tc:other)')])
        self.assertEqual(self.scan().snapshot['status'], 'complete')
        # A manifest row that cannot be expanded leaves the index with holes,
        # which is reported once instead of calling every device uninstalled.
        self.write(self.modules, [self.row, {}])
        r = self.scan()
        self.assertIn('ORIGIN_INDEX_INCOMPLETE', self.codes(r))
        self.assertIn('library', r.hdis[0])
        self.assertNotIn('label', r.hdis[0])
        self.write(self.modules, [])
        self.assertIn('ORIGIN_UNMATCHED', self.codes(self.scan()))

    def test_attribution_faults_are_diagnosed_against_the_manifest_not_the_device(self):
        # Ownership is resolved once by the install index. A device whose
        # library has no attributable origin simply has no component; the reason
        # is filed against the manifest row, which is where it can be fixed.
        self.full()
        self.write(self.modules, [dict(self.row, label='//elsewhere/deep:x(//build/tc:arm)',
                                       part_name='driver,other')])
        r = self.scan()
        self.assertNotIn('component', r.hdis[0])
        self.assertEqual(r.hdis[0]['label'], '//elsewhere/deep:x')   # linked, unattributed
        self.assertEqual(self.codes(r), set())
        # An unparsable label leaves the device without an origin at all.
        self.write(self.modules, [dict(self.row, label='//bad\x00:target')])
        r = self.scan()
        self.assertIn('ORIGIN_LABEL_INVALID', self.codes(r))
        self.assertNotIn('label', r.hdis[0])
        self.assertNotIn('component', r.hdis[0])

    def test_unregistered_component_and_resolve_component_disabled(self):
        # The manifest names a component the build index does not know; the
        # index reports it, the device is left unattributed but still linked.
        self.full()
        self.components(entries={})
        r = self.scan()
        self.assertNotIn('component', r.hdis[0])
        self.assertEqual(r.hdis[0]['label'], '//drivers/example:driver')
        # Deselecting components does not cost the label: the install index
        # still knows which target installed the library.
        with patch('oskm.collectors.components.collector.ComponentsCollector.collect', side_effect=AssertionError):
            r = _scan_one('hdi', replace(self.request, resolve_component=False))
        self.assertEqual(r.snapshot['status'], 'complete')
        self.assertNotIn('component', r.hdis[0])
        self.assertEqual(r.hdis[0]['label'], '//drivers/example:driver')

    def test_queries_persistence_cursor_and_aggregate(self):
        r = self.full([self.raw, dict(self.raw, serviceName='second', preload=2)])
        q = r.query()
        first = q.list_hdis(page=PageRequest(1))
        filters = HDIFilter(fields=(FieldPredicate('preload', 'eq', 2),))
        self.assertEqual(q.list_hdis(filters).total, 1)
        self.assertEqual(q.aggregate_hdis(('service', 'field:preload')).total_groups, 2)
        # An identical rescan yields an equivalent result and accepts its cursors.
        with self.scan().query() as again:
            self.assertEqual(again.list_hdis(), q.list_hdis())
            self.assertEqual(again.list_hdis(filters), q.list_hdis(filters))
            self.assertEqual(again.get_service_ref(0), q.get_service_ref(0))
            self.assertEqual(again.list_hdis(page=PageRequest(cursor=first.next_cursor)),
                             q.list_hdis(page=PageRequest(cursor=first.next_cursor)))
            self.assertEqual(again.aggregate_hdis(), q.aggregate_hdis())
        self.assertEqual(q.get_hdi(100), None)
        q.close()
        with self.assertRaises(QueryError):
            q.list_hdis()

    def test_query_validation_and_raw_collision(self):
        r = self.full([dict(self.raw, process='raw', array=[1])])
        q = r.query()
        self.assertEqual(
            q.list_hdis(
                HDIFilter(
                    processes=(
                        'host',), fields=(
                        FieldPredicate(
                            'process', 'eq', 'raw'),))).total, 1)
        with self.assertRaises(QueryError):
            q.aggregate_hdis(('field:array',))
        empty = HDIResult(dict(r.snapshot), ()).query()
        for action in (
            lambda: empty.get_hdi(True), lambda: empty.list_hdis(
                HDIFilter(
                    names=['x'])), lambda: empty.list_hdis(
                page=PageRequest(0)), lambda: empty.aggregate_hdis(
                    ('wrong',))):
            with self.assertRaises(QueryError):
                action()

    def test_callbacks_and_cancellation(self):
        self.full()
        events = []
        r = self.scan(on_progress=events.append)
        self.assertEqual(sum(p.phase == 'finalize' for p in events), 1)
        with self.assertRaises(ScanCancelled):
            self.scan(cancelled=lambda: True)
        with self.assertRaises(ScanFatalError):
            self.scan(on_progress=lambda p: 1 / 0)
        self.assertEqual(len(r.hdis), 1)

    def test_cli_parameters_exit_codes(self):
        self.full()
        db = str(self.root / 'k.db')
        args = ['scan', '--workspace-root', str(self.root), '--product', 'test', '--db', db, '--only', 'hdi']
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            self.assertEqual(main(args), 0)
            self.assertEqual(main(args), 0)
            self.library.unlink()
            self.assertEqual(main(args), 4)
            for option in ('--fields', '--partition', '--progress', '--module-info', '--output'):
                with self.assertRaises(SystemExit):
                    parser().parse_args(args + [option, 'x'])
            self.owner()
            self.install([dict(self.raw, policy='bad')])
            self.assertEqual(main(args + ['--fail-on', 'error']), 5)


if __name__ == '__main__':
    unittest.main()
