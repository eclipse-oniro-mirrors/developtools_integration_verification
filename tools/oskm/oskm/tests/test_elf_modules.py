"""Contract tests for the framework-integrated ELF dependency collector."""
import struct
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from oskm.collectors.elf_modules.models import (
    ElfModuleScanRequest,
    ElfModuleFilter,
)
from oskm.collectors.elf_modules.elf import read_elf
from oskm.collectors.elf_modules.resolution import candidate_index, resolve_needed
from oskm.core.api import scan as scan_one
from oskm.core import framework
from oskm.core.io import canonical


class ElfModulesTest(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.package = self.root / 'out/test/packages/phone'
        self.package.mkdir(parents=True)
        (self.package / 'system/profile').mkdir(parents=True)
        self.write('system/etc/hdfconfig/hdf_default.hcb', self.empty_hcb())
        self.write('prebuilts/ohos-sdk/linux/26.0.1/native/sysroot/'
                   'usr/lib/x86_64-linux-ohos/libndk.so', b'', workspace=True)

    @staticmethod
    def empty_hcb():
        def node(name, attributes=(), children=()):
            body = b''.join(
                b'\x02' + key.encode() + b'\0' + b'\x14' + value.encode() + b'\0'
                for key, value in attributes
            ) + b''.join(children)
            return (b'\x01' + name.encode() + b'\0'
                    + struct.pack('<I', len(body)) + body)

        manager = node('manager', (('match_attr', 'hdf_manager'),),
                       [node('host', [('hostName', 'host')])])
        root = node('root', children=[manager])
        return struct.pack('<IIIIi', 0xA00AA00A, 0, 7, 0, len(root)) + root

    def write(self, relative, value, *, workspace=False):
        path = (self.root if workspace else self.package) / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(value if isinstance(value, bytes) else canonical(value))
        return path

    def components(self):
        self.write('out/test/build_configs/parts_info/components.json',
                   {'part': {'subsystem': 'sub', 'path': 'component'}}, workspace=True)
        self.write('component/bundle.json',
                   {'component': {'name': 'part', 'subsystem': 'sub'}}, workspace=True)

    def manifest(self, rows):
        self.components()
        return self.write('system_module_info.json', rows)

    def row(self, dest, label, *, type='lib', gn_label=None, **extra):
        declared_label = gn_label or f'//component/x:{label}(//build/toolchain:clang)'
        return dict(dest=[dest], label=declared_label,
                    label_name=label, part_name='part', subsystem_name='sub',
                    type=type, source=f'x/{label}.so', install_enable=True, **extra)

    def elf(self, relative, soname, needed, *, ani=False, cangjie=False):
        path = self.package / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        strings = bytearray(b'\0')
        offsets = {}
        for value in (soname, *needed):
            offsets[value] = len(strings)
            strings += value.encode() + b'\0'
        phoff, phentsize, phnum = 64, 56, 2
        string_offset = phoff + phentsize * phnum
        dynamic_offset = (string_offset + len(strings) + 7) & ~7
        entries = [(14, offsets[soname])]
        entries.extend((1, offsets[name]) for name in needed)
        table = b''.join(struct.pack('<QQ', tag, value) for tag, value in entries)
        table += struct.pack('<QQQ', 5, string_offset, 10)[:-8]
        table += struct.pack('<QQ', 10, len(strings))
        table += struct.pack('<QQ', 0, 0)
        base_total = dynamic_offset + len(table)
        load = struct.pack('<IIQQQQQQ', 1, 5, 0, 0, 0, base_total,
                           base_total, 0x1000)
        dynamic = struct.pack('<IIQQQQQQ', 2, 6, dynamic_offset, dynamic_offset,
                              dynamic_offset, len(table), len(table), 8)

        sections = [(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)]
        payload = bytearray()
        section_names = bytearray(b'\0')

        def add_data(data, alignment=8):
            while len(payload) % alignment:
                payload.append(0)
            offset = base_total + len(payload)
            payload.extend(data)
            return offset, len(data)

        def add_section(name, section_type, *, data=b'', link=0, entsize=0):
            name_offset = len(section_names)
            section_names.extend(name.encode() + b'\0')
            offset, size = add_data(data) if data else (0, 0)
            sections.append((name_offset, section_type, 0, 0, offset, size,
                             link, 0, 1 if data else 0, entsize))
            return len(sections) - 1

        if ani:
            dynstr = add_section('.dynstr', 3, data=b'\0ANI_Constructor\0')
            symbol = struct.pack('<IBBHQQ', 1, 0x10, 0, dynstr, 0, 0)
            add_section('.dynsym', 11, data=symbol, link=dynstr, entsize=24)
        if cangjie:
            add_section('.cjmetadata', 1, data=b'cangjie\0')
        shstr_name = len(section_names)
        section_names.extend(b'.shstrtab\0')
        shstr_offset, shstr_size = add_data(section_names)
        sections.append((shstr_name, 3, 0, 0, shstr_offset, shstr_size,
                         0, 0, 1, 0))
        shstrndx = len(sections) - 1

        section_offset = (base_total + len(payload) + 7) & ~7
        section_headers = b''.join(
            struct.pack('<IIQQQQIIQQ', *section) for section in sections)
        total = section_offset + len(section_headers)
        header = struct.pack(
            '<16sHHIQQQIHHHHHH', b'\x7fELF\x02\x01\x01\x00' + b'\0' * 8,
            3, 62, 1, 0, phoff, section_offset, 0, 64, phentsize, phnum,
            64, len(sections), shstrndx,
        )
        blob = bytearray(total)
        blob[:len(header)] = header
        blob[phoff:phoff + len(load)] = load
        blob[phoff + len(load):phoff + len(load) + len(dynamic)] = dynamic
        blob[string_offset:string_offset + len(strings)] = strings
        blob[dynamic_offset:dynamic_offset + len(table)] = table
        blob[base_total:base_total + len(payload)] = payload
        blob[section_offset:section_offset + len(section_headers)] = section_headers
        path.write_bytes(blob)
        return path

    def test_parses_elf32_section_header_offsets(self):
        names = b'\0.shstrtab\0'
        section_offset = 64 + len(names)
        sections = (
            struct.pack('<IIIIIIIIII', *([0] * 10)),
            struct.pack('<IIIIIIIIII',
                        1, 3, 0, 0, 64, len(names), 0, 0, 1, 0),
        )
        blob = (struct.pack(
                    '<16sHHIIIIIHHHHHH',
                    b'\x7fELF\x01\x01\x01\x00' + b'\0' * 8,
                    3, 40, 1, 0, 0, section_offset, 0, 52, 0, 0,
                    40, len(sections), 1)
                + b'\0' * (64 - 52) + names + b''.join(sections))
        path = self.write('system/lib/libelf32.z.so', blob)

        with path.open('rb') as handle:
            result = read_elf(handle)

        self.assertEqual(result['format'], 'ELF32LE')
        self.assertFalse(result['dynamic'])

    def scan(self, *, without=(), **kwargs):
        return scan_one('elf_modules',
                        ElfModuleScanRequest(self.root, 'test', **kwargs),
                        without=without)

    def test_collector_is_registered_after_install_modules(self):
        framework.discover()
        self.assertIn('elf_modules', framework.names())
        self.assertEqual(framework.resolve_order(['elf_modules']),
                         ('repos', 'components', 'args', 'install_modules',
                          'component_links', 'services', 'hdi', 'sas',
                          'elf_modules'))

    def test_category_and_api_type_are_classified(self):
        rows = (
            self.row('system/lib/module/ani/libanidir.z.so', 'anidir'),
            self.row('system/lib/module/libnapi.z.so', 'napi'),
            self.row('system/lib/module/libpublicinner.z.so', 'publicinner'),
            self.row('system/lib/platformsdk/libindirect.z.so', 'indirect'),
            self.row('system/lib/platformsdk/libinner.z.so', 'inner'),
            self.row('system/lib/platformsdk/libndk.so', 'ndk'),
            self.row('system/lib/platformsdk/libplatform.z.so', 'platform'),
            self.row('system/lib/extensionability/libext.z.so', 'ext'),
            self.row('system/lib/libhdi.z.so', 'hdi', shlib_type='hdi_proxy'),
            self.row('system/lib/libother.z.so', 'other'),
        )
        self.manifest(rows)
        self.write('component/bundle.json', {
            'component': {
                'name': 'part', 'subsystem': 'sub',
                'build': {'inner_kits': [{'name': '//component/x:inner'}]},
            }
        }, workspace=True)
        self.elf('system/lib/module/ani/libanidir.z.so', 'libanidir.z.so', [])
        self.elf('system/lib/module/libnapi.z.so', 'libnapi.z.so',
                 ['libplatform.z.so'])
        self.elf('system/lib/module/libpublicinner.z.so',
                 'libpublicinner.z.so', [])
        self.elf('system/lib/platformsdk/libindirect.z.so',
                 'libindirect.z.so', [])
        self.elf('system/lib/platformsdk/libinner.z.so', 'libinner.z.so', [])
        self.elf('system/lib/platformsdk/libndk.so', 'libndk.so', [])
        self.elf('system/lib/platformsdk/libplatform.z.so', 'libplatform.z.so',
                 ['libindirect.z.so'])
        self.elf('system/lib/extensionability/libext.z.so', 'libext.z.so', [])
        self.elf('system/lib/libhdi.z.so', 'libhdi.z.so', [])
        self.elf('system/lib/libother.z.so', 'libother.z.so', [])

        result = self.scan()
        expected = {
            'system/lib/module/ani/libanidir.z.so': (('other',), 'internal_api'),
            'system/lib/module/libnapi.z.so': (('napi',), 'public_api'),
            'system/lib/module/libpublicinner.z.so': (('napi',), 'public_api'),
            'system/lib/platformsdk/libindirect.z.so':
                (('platform_sdk_indirect',), 'internal_api'),
            'system/lib/platformsdk/libinner.z.so': (('other',), 'inner_api'),
            'system/lib/platformsdk/libndk.so': (('ndk',), 'public_api'),
            'system/lib/platformsdk/libplatform.z.so':
                (('platform_sdk',), 'internal_api'),
            'system/lib/extensionability/libext.z.so':
                (('extension',), 'public_api'),
            'system/lib/libhdi.z.so': (('hdi_proxy',), 'internal_api'),
            'system/lib/libother.z.so': (('other',), 'internal_api'),
        }
        self.assertEqual({row['dest']: (row['category'], row['api_type'])
                          for row in result.elf_modules}, expected)
        with result.query() as query:
            page = query.list_elf_modules(
                ElfModuleFilter(categories=('platform_sdk', 'sa')))
            self.assertEqual([row['dest'] for row in page.items],
                             ['system/lib/platformsdk/libplatform.z.so'])
            page = query.list_elf_modules(ElfModuleFilter(api_types=('public_api',)))
            self.assertEqual({row['dest'] for row in page.items},
                             {'system/lib/module/libnapi.z.so',
                              'system/lib/module/libpublicinner.z.so',
                              'system/lib/platformsdk/libndk.so',
                              'system/lib/extensionability/libext.z.so'})

    def test_chipset_dependencies_are_propagated(self):
        self.manifest([
            self.row('vendor/lib/libvendor.z.so', 'vendor'),
            self.row('system/lib/libchipset.z.so', 'chipset'),
            self.row('system/lib/libchipset_indirect.z.so', 'chipset-indirect'),
        ])
        self.elf('vendor/lib/libvendor.z.so', 'libvendor.z.so', ['libchipset.z.so'])
        self.elf('system/lib/libchipset.z.so', 'libchipset.z.so',
                 ['libchipset_indirect.z.so'])
        self.elf('system/lib/libchipset_indirect.z.so',
                 'libchipset_indirect.z.so', [])

        result = self.scan()
        self.assertEqual({row['dest']: row['category'] for row in result.elf_modules},
                         {'vendor/lib/libvendor.z.so': ('other',),
                          'system/lib/libchipset.z.so': ('chipset_sdk',),
                          'system/lib/libchipset_indirect.z.so':
                              ('chipset_sdk_indirect',)})

    def test_ani_and_cangjie_use_binary_facts(self):
        self.manifest([
            self.row('system/lib/module/ani/libani.z.so', 'ani'),
            self.row('system/lib/module/libnapi_ani.z.so', 'napi-ani'),
            self.row('system/lib/libcangjie.z.so', 'cangjie'),
        ])
        self.elf('system/lib/module/ani/libani.z.so', 'libani.z.so', [], ani=True)
        self.elf('system/lib/module/libnapi_ani.z.so', 'libnapi_ani.z.so',
                 [], ani=True)
        self.elf('system/lib/libcangjie.z.so', 'libcangjie.z.so', [], cangjie=True)

        result = self.scan()
        self.assertEqual({row['dest']: (row['category'], row['api_type'])
                          for row in result.elf_modules},
                         {'system/lib/module/ani/libani.z.so':
                              (('ani',), 'public_api'),
                          'system/lib/module/libnapi_ani.z.so':
                              (('ani',), 'public_api'),
                          'system/lib/libcangjie.z.so':
                              (('cangjie',), 'public_api')})

    def test_ndk_suppresses_other_public_categories(self):
        self.write('prebuilts/ohos-sdk/linux/26.0.1/native/sysroot/'
                   'usr/lib/x86_64-linux-ohos/libhid.z.so', b'', workspace=True)
        self.manifest([
            self.row('system/lib/module/libhid.z.so', 'hid'),
        ])
        self.elf('system/lib/module/libhid.z.so', 'libhid.z.so', [],
                 ani=True, cangjie=True)

        result = self.scan()
        self.assertEqual(
            [(row['category'], row['api_type']) for row in result.elf_modules],
            [(('ndk',), 'public_api')])

    def test_sdk_version_directory_is_selected_numerically(self):
        self.write('prebuilts/ohos-sdk/linux/9.0.0/native/sysroot/'
                   'usr/lib/x86_64-linux-ohos/libold.so', b'', workspace=True)
        self.manifest([
            self.row('system/lib/libndk.so', 'ndk'),
            self.row('system/lib/libold.so', 'old'),
        ])
        self.elf('system/lib/libndk.so', 'libndk.so', [])
        self.elf('system/lib/libold.so', 'libold.so', [])

        result = self.scan()
        self.assertEqual({row['dest']: row['api_type'] for row in result.elf_modules},
                         {'system/lib/libndk.so': 'public_api',
                          'system/lib/libold.so': 'internal_api'})

    def test_collector_hits_and_anco_are_direct_categories(self):
        collector = framework.get('elf_modules')
        module = dict(file_name='libexample.z.so', install_module_id=7,
                      partition='vendor', shlib_type=None)
        info = dict(ani_constructor=False, cangjie=False)
        self.assertEqual(
            collector.classify_direct_categories(
                'vendor/lib/libexample.z.so', module, info, 'other',
                set(), {7}, {7}),
            ('sa', 'hdi'))
        self.assertEqual(
            collector.classify_direct_categories(
                'vendor/anco_spec/libexample.z.so', module, info, 'other',
                set(), set(), set()),
            ('anco',))
        self.assertEqual(
            collector.classify_direct_categories(
                'vendor/lib/libexample.z.so', dict(module, shlib_type='hdi_stub'),
                info, 'virt_service', set(), set(), set()),
            ('hdi_stub', 'anco'))

    def test_parses_elf_and_resolves_with_deps_guard_order(self):
        self.manifest([
            self.row('system/lib/module/libcaller.z.so', 'libcaller'),
            self.row('system/lib64/chipset-sdk/libbranch.z.so', 'libbranch64'),
            self.row('system/lib/libbranch.z.so', 'libbranch'),
            self.row('system/lib/chipset-sdk-sp/libunknown.z.so', 'libunknown-sp'),
            self.row('system/lib/module/libunknown.z.so', 'libunknown'),
        ])
        self.elf('system/lib/module/libcaller.z.so', 'libcaller.z.so',
                 ['libbranch.z.so', 'libunknown.z.so', 'libc.so'])
        self.elf('system/lib64/chipset-sdk/libbranch.z.so', 'libbranch.z.so', [])
        self.elf('system/lib/libbranch.z.so', 'libbranch.z.so', [])
        self.elf('system/lib/chipset-sdk-sp/libunknown.z.so', 'libunknown.z.so', [])
        self.elf('system/lib/module/libunknown.z.so', 'libunknown.z.so', [])

        result = self.scan()
        self.assertEqual(result.snapshot['status'], 'complete')
        self.assertEqual(len(result.elf_modules), 5)
        caller = result.query().get_elf_module('system/lib/module/libcaller.z.so')
        self.assertEqual([edge['target'] for edge in caller['dependencies']],
                         ['system/lib/libbranch.z.so', 'system/lib/module/libunknown.z.so', None])
        self.assertEqual(caller['label'], '//component/x:libcaller')
        self.assertEqual(caller['category'], ('napi',))
        self.assertEqual(caller['component']['name'], 'part')
        self.assertNotIn('engine', caller)
        self.assertEqual(result.snapshot['issues'], ({
            'path': 'out/test/packages/phone/system/lib/module/libcaller.z.so',
            'pointer': '/needed/2', 'code': 'ELF_DEPENDENCY_UNRESOLVED',
            'severity': 'warning', 'advisory': True,
            'details': {'needed_name': 'libc.so'},
        },))

        with result.query() as query:
            page = query.list_elf_modules(ElfModuleFilter(
                partitions=('system',), sonames=('libbranch.z.so',)))
            self.assertEqual({row['dest'] for row in page.items},
                             {'system/lib64/chipset-sdk/libbranch.z.so',
                              'system/lib/libbranch.z.so'})
            page = query.list_elf_modules(ElfModuleFilter(categories=('napi',)))
            self.assertEqual(len(page.items), 2)

    def test_only_system_and_vendor_are_match_candidates(self):
        self.manifest([
            self.row('system/lib/module/libcaller.z.so', 'libcaller'),
            self.row('ramdisk/lib/chipset-sdk-sp/libsec.z.so', 'libsec-ramdisk'),
            self.row('system/lib/chipset-sdk-sp/libsec.z.so', 'libsec-system'),
            self.row('updater/lib/libupdateronly.z.so', 'libupdateronly'),
        ])
        self.elf('system/lib/module/libcaller.z.so', 'libcaller.z.so',
                 ['libsec.z.so', 'libupdateronly.z.so'])
        self.elf('ramdisk/lib/chipset-sdk-sp/libsec.z.so', 'libsec.z.so', [])
        self.elf('system/lib/chipset-sdk-sp/libsec.z.so', 'libsec.z.so', [])
        self.elf('updater/lib/libupdateronly.z.so', 'libupdateronly.z.so', [])

        result = self.scan()
        self.assertEqual(len(result.elf_modules), 4)
        caller = result.query().get_elf_module('system/lib/module/libcaller.z.so')
        self.assertEqual([edge['target'] for edge in caller['dependencies']],
                         ['system/lib/chipset-sdk-sp/libsec.z.so', None])

    def test_resolves_needed_name_through_soname_fallback(self):
        self.manifest([
            self.row('system/lib/module/libcaller.z.so', 'libcaller'),
            self.row('system/lib/ld-musl-arm.so.1', 'musl'),
        ])
        self.elf('system/lib/module/libcaller.z.so', 'libcaller.z.so',
                 ['libc.so'])
        self.elf('system/lib/ld-musl-arm.so.1', 'libc.so', [])

        result = self.scan()
        caller = result.query().get_elf_module('system/lib/module/libcaller.z.so')
        self.assertEqual([edge['target'] for edge in caller['dependencies']],
                         ['system/lib/ld-musl-arm.so.1'])
        self.assertEqual(result.snapshot.get('issues', ()), ())

    def test_resolves_needed_name_through_install_symlink(self):
        self.manifest([
            self.row('system/lib/module/libcaller.z.so', 'libcaller'),
            self.row('system/lib/libreal.z.so', 'libreal',
                     symlink_file=['system/lib/libalias.so']),
        ])
        self.elf('system/lib/module/libcaller.z.so', 'libcaller.z.so',
                 ['libalias.so'])
        self.elf('system/lib/libreal.z.so', 'libreal.z.so', [])
        alias = self.package / 'system/lib/libalias.so'
        alias.symlink_to('libreal.z.so')

        result = self.scan()
        self.assertEqual(len(result.elf_modules), 2)
        caller = result.query().get_elf_module('system/lib/module/libcaller.z.so')
        self.assertEqual([edge['target'] for edge in caller['dependencies']],
                         ['system/lib/libreal.z.so'])
        self.assertEqual(result.snapshot.get('issues', ()), ())

    def test_file_name_takes_precedence_over_soname_fallback(self):
        def module(dest, file_name, soname):
            return dict(dest=dest, partition='system', file_name=file_name,
                        soname=soname)

        by_file_name = module('system/lib/physical.so', 'physical.so', 'wanted.so')
        wanted = module('system/lib/wanted.so', 'wanted.so', 'other.so')
        winner = resolve_needed(
            'wanted.so', candidate_index([by_file_name, wanted]))

        self.assertIs(winner, wanted)

    def test_direct_and_reverse_graph_queries_do_not_materialize_closures(self):
        self.manifest([
            self.row('system/lib/liba.z.so', 'liba'),
            self.row('system/lib/libb.z.so', 'libb'),
            self.row('system/lib/libc.z.so', 'libc'),
        ])
        self.elf('system/lib/liba.z.so', 'liba.z.so', ['libb.z.so'])
        self.elf('system/lib/libb.z.so', 'libb.z.so', ['libc.z.so'])
        self.elf('system/lib/libc.z.so', 'libc.z.so', [])
        result = self.scan()
        with result.query() as query:
            forward = query.reachable('system/lib/liba.z.so')
            self.assertEqual([(row['dest'], row['distance'], tuple(row['via']))
                              for row in forward],
                             [('system/lib/libb.z.so', 1, ('system/lib/liba.z.so',)),
                              ('system/lib/libc.z.so', 2,
                               ('system/lib/liba.z.so', 'system/lib/libb.z.so'))])
            reverse = query.reachable('system/lib/libc.z.so', direction='reverse')
            self.assertEqual([row['dest'] for row in reverse],
                             ['system/lib/libb.z.so', 'system/lib/liba.z.so'])
            self.assertEqual([row['dest'] for row in query.direct_dependents(
                'system/lib/libc.z.so')], ['system/lib/libb.z.so'])

    def test_duplicate_physical_dest_is_resolved_once(self):
        self.manifest([
            self.row('system/lib/libsame.z.so', 'first'),
            self.row('system/lib/libsame.z.so', 'second'),
        ])
        self.elf('system/lib/libsame.z.so', 'libsame.z.so', [])
        result = self.scan()
        self.assertEqual(len(result.elf_modules), 1)
        self.assertEqual(result.elf_modules[0]['label'], '//component/x:second')

    def test_invalid_elf_is_reported_without_stopping_the_collector(self):
        self.manifest([self.row('system/lib/libbad.z.so', 'libbad')])
        self.write('system/lib/libbad.z.so', b'\x7fELF\x02\x01\x01\x00' + b'x' * 28)
        result = self.scan()
        self.assertEqual(len(result.elf_modules), 0)
        self.assertEqual(result.snapshot['status'], 'degraded')
        self.assertEqual(result.snapshot['issues'][0]['code'], 'ELF_PARSE_FAILED')

    def test_known_non_elf_types_do_not_hit_the_elf_size_limit(self):
        self.manifest([
            self.row('system/app/example/example.hap', 'example', type='etc'),
            self.row('system/lib/libexample.z.so', 'example-lib'),
        ])
        hap = self.package / 'system/app/example/example.hap'
        hap.parent.mkdir(parents=True, exist_ok=True)
        with hap.open('wb') as handle:
            handle.truncate(128 * 1024 * 1024 + 1)
        self.elf('system/lib/libexample.z.so', 'libexample.z.so', [])

        result = self.scan()
        self.assertEqual([row['dest'] for row in result.elf_modules],
                         ['system/lib/libexample.z.so'])
        self.assertNotIn('ELF_PARSE_FAILED',
                         [issue['code'] for issue in result.snapshot.get('issues', ())])

    def test_missing_and_directory_targets_do_not_duplicate_install_issues(self):
        self.manifest([
            self.row('system/bin/missing', 'missing', type='bin'),
            self.row('system/etc/resources', 'resources', type='etc'),
        ])
        resources = self.package / 'system/etc/resources'
        resources.mkdir(parents=True)

        result = self.scan()
        self.assertEqual(result.elf_modules, ())
        self.assertNotIn('ELF_PARSE_FAILED',
                         [issue['code'] for issue in result.snapshot.get('issues', ())])

    def test_relocatable_elf_without_program_headers_is_kept(self):
        self.manifest([self.row('system/etc/bpf/netsys.o', 'netsys')])
        path = self.package / 'system/etc/bpf/netsys.o'
        path.parent.mkdir(parents=True, exist_ok=True)
        header = struct.pack(
            '<16sHHIQQQIHHHHHH', b'\x7fELF\x02\x01\x01\x00' + b'\0' * 8,
            1, 247, 1, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0,
        )
        path.write_bytes(header.ljust(64, b'\0'))
        result = self.scan()
        record = result.elf_modules[0]
        self.assertEqual((record['type'], record['dynamic'], record['needed']),
                         ('rel', False, ()))

    def test_missing_install_index_degrades_instead_of_rescanning_smi(self):
        self.manifest([self.row('system/lib/liba.z.so', 'liba')])
        self.elf('system/lib/liba.z.so', 'liba.z.so', [])
        result = self.scan(without=('install_modules',))
        self.assertEqual(result.elf_modules, ())
        self.assertEqual(result.snapshot['status'], 'degraded')
        self.assertIn('INSTALL_INDEX_NOT_SELECTED', result.snapshot['issues'][0]['code'])


if __name__ == '__main__':
    unittest.main()
