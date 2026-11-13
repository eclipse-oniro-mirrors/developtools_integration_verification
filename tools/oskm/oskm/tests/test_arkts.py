"""P1 evidence, isolation, bounded transport and query regression tests."""
import base64
import contextlib
import copy
from dataclasses import replace
import hashlib
import io
import json
import os
from pathlib import Path
import selectors
import shutil
import sqlite3
import subprocess
import sys
import tempfile
import time
import unittest
from unittest.mock import patch

from oskm.core import framework
from oskm.core.db import Database, StoreError
from oskm.core.io import canonical
from oskm.core.models import QueryError, RequestError, ScanCancelled, ScanFatalError, ScanLimits, ScanRequest
from oskm.core.runner import run
from oskm.core.session import ScanSession
# oskm/tests -> oskm -> packages/oskm（oskm、oskm_schema）与 packages/oskm/cli
# （oskm_cli）。查询侧的 ArktsQuery 属于 CLI 产物，不在采集包里。
_PACKAGE = Path(__file__).resolve().parents[2]
for _entry in (str(_PACKAGE), str(_PACKAGE / 'cli')):
    if _entry not in sys.path:
        sys.path.insert(0, _entry)

from oskm_cli.query.arkts import ArktsQuery, export_document
from oskm.collectors.arkts.backend import Backend, validate_result
from oskm.collectors.arkts.collector import ArktsCollector
from oskm.collectors.arkts_links.collector import ArktsLinksCollector
from oskm.collectors.arkts.linking import resolve
from oskm.collectors.arkts.projection import locations
from oskm.collectors.arkts.models import (BackendLimits, SDK_PATH, NODE_PATH,
                                          TYPESCRIPT_PATH)

BACKEND = Path(os.environ.get('OSKM_TYPESCRIPT_ROOT', Path(__file__).resolve().parents[5] /
                             'interface/sdk-js/build-tools/node_modules/typescript'))
WORKSPACE_NODE = Path(__file__).resolve().parents[5] / NODE_PATH
HAS_BACKEND = BACKEND.is_dir() and WORKSPACE_NODE.is_file()


class LinkingTest(unittest.TestCase):
    def link_database(self):
        connection = sqlite3.connect(':memory:')
        self.addCleanup(connection.close)
        connection.executescript('''
            CREATE TABLE arkts_modules(
                id INTEGER PRIMARY KEY, scan_id INTEGER, module_key TEXT,
                impl_so_path TEXT, impl_match TEXT, impl_elf_id INTEGER);
            CREATE TABLE install_targets(
                id INTEGER PRIMARY KEY, scan_id INTEGER, dest TEXT);
            CREATE TABLE elf_modules(
                id INTEGER PRIMARY KEY, scan_id INTEGER, install_target_id INTEGER);
            CREATE TABLE collector_runs(
                scan_id INTEGER, collector TEXT, status TEXT);
            INSERT INTO arkts_modules(
                id, scan_id, module_key, impl_so_path, impl_match)
            VALUES(
                1, 7, 'api/@internal/ets/button',
                'system/lib64/platformsdk/libace_engine_pa_ark.z.so',
                'arkui_engine');
        ''')
        return connection

    def add_installed_elf(self, connection, dest, position):
        target_id = connection.execute(
            'INSERT INTO install_targets(scan_id, dest) VALUES(?,?)',
            (7, dest)).lastrowid
        connection.execute(
            'INSERT INTO elf_modules(scan_id, install_target_id) VALUES(?,?)',
            (7, target_id))

    def test_arkui_engine_so_depends_on_arch(self):
        # The image layout is an installation fact. Until an installed target
        # provides better evidence, use the architecture-based reference path.
        from oskm.collectors.arkts.models import ARKUI_ENGINE_SO, arkui_engine_so
        expected_arm = 'system/lib/platformsdk/libace_engine_pa_ark.z.so'
        expected_arm64 = 'system/lib64/platformsdk/libace_engine_pa_ark.z.so'
        self.assertEqual(arkui_engine_so('arm'), expected_arm)
        self.assertEqual(arkui_engine_so('arm64'), expected_arm64)
        self.assertEqual(ARKUI_ENGINE_SO,
                         'system/lib64/platformsdk/libace_engine_pa_ark.z.so')

    def test_napi_reference_paths_follow_cpu_arch(self):
        from oskm.collectors.arkts.models import arch_library_path
        reference = 'system/lib64/module/multimedia/libimage.z.so'
        self.assertEqual(arch_library_path(reference, 'arm'),
                         'system/lib/module/multimedia/libimage.z.so')
        self.assertEqual(arch_library_path(reference, 'arm64'), reference)

    def test_post_insert_without_link_tables_is_a_noop(self):
        connection = sqlite3.connect(':memory:')
        self.addCleanup(connection.close)
        ArktsLinksCollector.post_insert(connection, 1)

    def test_collect_resolves_arkui_path_before_reporting_links(self):
        actual = 'system/lib64/libace_engine_pa_ark.z.so'
        connection = self.link_database()
        self.add_installed_elf(connection, actual, 0)
        connection.executemany(
            'INSERT INTO collector_runs(scan_id, collector, status) VALUES(?,?,?)',
            ((7, 'arkts', 'complete'), (7, 'elf_modules', 'complete')))
        with tempfile.TemporaryDirectory() as tmp:
            context = ArktsLinksCollector.CONTEXT_TYPE(
                scan_id=7, connection=connection,
                request=ScanRequest(Path(tmp), 'test'), collector='arkts_links')
            ArktsLinksCollector().collect(context)
        path = connection.execute(
            'SELECT impl_so_path FROM arkts_modules WHERE id=1').fetchone()[0]
        self.assertEqual(path, actual)
        self.assertEqual(context.records['arkts_links_run'][0]['linked'], 1)

    def test_duplicate_installed_targets_are_one_arkui_destination(self):
        actual = 'system/lib64/libace_engine_pa_ark.z.so'
        connection = self.link_database()
        self.add_installed_elf(connection, actual, 0)
        self.add_installed_elf(connection, actual, 1)
        ArktsLinksCollector.post_insert(connection, 7)
        path = connection.execute(
            'SELECT impl_so_path FROM arkts_modules WHERE id=1').fetchone()[0]
        self.assertEqual(path, actual)

    def test_module_targets_paths_and_out_of_scope(self):
        # A module declared for both language versions is one target. Keying on
        # the file made every such import ambiguous.
        modules = {'api/@ohos.a': {}, 'arkts/@ohos.a': {}, 'api/@ohos.c': {}}
        names = {'@ohos.a': ['api/@ohos.a', 'arkts/@ohos.a'], '@ohos.c': ['api/@ohos.c']}
        def check(value, complete=True):
            return resolve(value, 'kits/@kit.A.d.ts', modules, names, complete)
        self.assertEqual(check('@ohos.c')['_module_key'], 'api/@ohos.c')
        # Spelled out or not, a relative specifier names the same module.
        self.assertEqual(check('../api/@ohos.c')['_module_key'], 'api/@ohos.c')
        self.assertEqual(check('../api/@ohos.c.static.d.ets')['_module_key'], 'api/@ohos.c')
        self.assertEqual(check('../api/@ohos.c.d.ts')['_module_key'], 'api/@ohos.c')
        # Genuine ambiguity -- one bare name declared under two directories --
        # is still reported rather than guessed.
        self.assertEqual(check('@ohos.a')['resolution_status'], 'ambiguous')
        self.assertEqual(check('@ohos.a')['candidate_keys'], ['api/@ohos.a', 'arkts/@ohos.a'])
        self.assertEqual(check('./missing')['resolution_status'], 'not_found')
        self.assertEqual(check('./missing', complete=False)['resolution_reason'], 'discovery_incomplete')
        for value in ('../../escape', '/etc/passwd', 'https://example/a', './bad\\x', './bad\x00x'):
            self.assertEqual(check(value)['resolution_status'], 'unsupported')
        self.assertEqual(check('@kit.B')['target_kind'], 'kit')
        self.assertEqual(check('external')['resolution_status'], 'out_of_scope')

    def test_display_locations_are_codepoints_not_utf16(self):
        data = '\ufeff\u4e2d\U0001f600\r\n\u7532\rb\u2028c\u2029d\ne'.encode()
        offsets = [0, 3, 6, 10, len(data)-1]
        found = locations(data, offsets)
        self.assertEqual(found[3], (1, 1))
        self.assertEqual(found[6], (1, 2))
        self.assertEqual(found[10], (1, 3))
        self.assertEqual(found[len(data)-1], (6, 1))


class TransportTest(unittest.TestCase):
    """Real pipe failures, independent of an installed Node/compiler."""
    def backend(self, script, **limits):
        backend = Backend('.', limits=replace(BackendLimits(), **limits))
        backend.process = subprocess.Popen([sys.executable, '-u', '-c', script],
            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
            start_new_session=True, bufsize=0)
        backend.selector = selectors.DefaultSelector()
        for stream in (backend.process.stdin, backend.process.stdout, backend.process.stderr):
            os.set_blocking(stream.fileno(), False)
        for stream in (backend.process.stdout, backend.process.stderr):
            backend.selector.register(stream, selectors.EVENT_READ)
        self.addCleanup(backend.close)
        return backend

    def test_stderr_is_drained_while_request_is_written(self):
        b = self.backend('import sys,json\nsys.stderr.write("x"*1000000)\n'
            'v=json.loads(sys.stdin.readline())\nprint(json.dumps({"n":len(v["data"])}))')
        result = b._exchange({'data': 'y'*1000000}, 3)
        self.assertEqual(result['n'], 1000000)
        self.assertLessEqual(len(b.stderr), b.limits.stderr_bytes)

    def test_truncated_and_polluted_output_is_rejected(self):
        for script in ('print("log noise")', 'import sys;sys.stdout.write("{\\\"id\\\":1")',
                       'print("{\\\"id\\\":1,\\\"id\\\":2}")'):
            with self.subTest(script=script):
                b = self.backend(script)
                with self.assertRaises(ScanFatalError): b._exchange(None, 2)

    def test_huge_unterminated_frame_is_bounded(self):
        b = self.backend('import sys;sys.stdout.write("x"*65536);sys.stdout.flush()', response_bytes=1024)
        with self.assertRaisesRegex(ScanFatalError, 'RESPONSE_LIMIT'): b._exchange(None, 2)

    def test_timeout_and_cancel_reap_process(self):
        b = self.backend('import time;time.sleep(30)')
        with self.assertRaisesRegex(ScanFatalError, 'TIMEOUT'): b._exchange(None, .05)
        b.close(); self.assertIsNotNone(b.process.poll())
        b = self.backend('import time;time.sleep(30)')
        def cancel(): raise ScanCancelled('CANCELLED')
        b.check = cancel
        with self.assertRaises(ScanCancelled): b._exchange(None, 2)
        b.close(); self.assertIsNotNone(b.process.poll())


@unittest.skipUnless(HAS_BACKEND, 'locked Node/ohos-typescript integration dependency unavailable')
class ArktsTest(unittest.TestCase):

    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(); self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.sdk = self.root / SDK_PATH
        for name in ('api', 'arkts', 'kits'): (self.sdk/name).mkdir(parents=True, exist_ok=True)
        package = self.root / TYPESCRIPT_PATH
        package.parent.mkdir(parents=True, exist_ok=True)
        package.symlink_to(BACKEND, target_is_directory=True)
        node = self.root / NODE_PATH
        node.parent.mkdir(parents=True, exist_ok=True)
        node.symlink_to(WORKSPACE_NODE)
        self.write('api/@ohos.a.d.ts', '/** @file a\n * @kit Demo\n */\n' * 2 +
                   'import hidden from "fake"; declare class A {}')
        self.write('api/@ohos.b.d.ts', 'declare class B {}')
        self.write('api/@ohos.b.static.d.ets', '/** @file b\n * @kit Other\n */\nexport @interface Strange {}')
        self.write('arkts/@arkts.lang.d.ets', '/** @kit Orphan */\nexport @interface Retention {}')
        self.write('api/@ohos.bad.d.ts', b'/** @file bad */\n\xff')
        self.write('api/@internal/ets/button.d.ts', '/** @file Button\n * @kit Automatic Scene Configuration Kit\n */')
        self.write('kits/@kit.Demo.d.ts', '\ufeff/** @file 中😀\r\n * @kit Demo\r\n */\r\n' +
            'import a from "@ohos.a";\nimport {A} from "@ohos.a";\nexport * from "../api/@ohos.a";\n' +
            'import b from "@ohos.b";\nimport missing from "@ohos.missing";\nimport "external";\n' +
            'import other from "@kit.Empty";\n/*** if arkts dynamic */\nimport b2 from "@ohos.b";\n/*** endif */')
        self.write('kits/@kit.Demo.static.d.ets', "'use static';\n/** @file Demo\n * @kit Demo\n */")
        self.write('kits/@kit.Empty.d.ts', '')
        self.write('zh-cn/api/@ohos.ignore.d.ts', '/** @file x\n * @kit Fake\n */')
        self.database = Database(self.root/'knowledge.db')
        self.request = ScanRequest(self.root, 'sdk-source')
        self.scan_id = self.scan().scan_id


    def write(self, name, text):
        path = self.sdk/name; path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(text if isinstance(text, bytes) else text.encode())
        return path


    def add_installed_elf(self, connection, dest, position=0):
        module_id = connection.execute(
            'INSERT INTO install_modules(scan_id, ordinal, record) VALUES(?,?,?)',
            (self.scan_id, position, '{}')).lastrowid
        target_id = connection.execute(
            'INSERT INTO install_targets(scan_id, module_id, dest_index, dest, '
            'directory, partition, file_name) VALUES(?,?,?,?,?,?,?)',
            (self.scan_id, module_id, 0, dest, 0, 'system',
             dest.rsplit('/', 1)[-1])).lastrowid
        connection.execute(
            'INSERT INTO elf_modules(scan_id, position, install_target_id, '
            'install_module_id, partition, file_name, api_type, category, '
            'dynamic, needed) VALUES(?,?,?,?,?,?,?,?,?,?)',
            (self.scan_id, position, target_id, module_id, 'system',
             dest.rsplit('/', 1)[-1], 'internal_api', '[]', 0, '[]'))


    def scan(self, **kwargs):
        return run(self.database, self.request, only=('arkts',), without=('repos',), **kwargs)


    def session(self):
        session = ScanSession.open(self.database, scan_id=self.scan_id)
        self.addCleanup(session.close)
        return session


    def test_inventory_failed_sources_and_no_api_entities(self):
        session = self.session(); q = ArktsQuery(session)
        # Six module files, but @ohos.b is declared twice, so five modules.
        self.assertEqual(q.scope['counts']['modules'], 5)
        self.assertEqual(q.scope['counts']['sources'], 9)
        self.assertEqual(q.scope['counts']['kit_entries'], 3)
        self.assertEqual(q.scope['counts']['dual_declared'], 1)
        self.assertEqual(q.scope['counts']['entry_backed'], 2)
        self.assertEqual(q.get_kit('@kit.Demo')['sources']['total'], 2)
        self.assertEqual(q.kit_modules('@kit.Empty')['total'], 0)
        self.assertFalse((self.root/'out').exists())
        self.assertFalse(any(r[0].startswith('api_') for r in session.connection.execute("SELECT name FROM sqlite_master")))
        self.assertEqual(session.connection.execute('PRAGMA foreign_key_check').fetchall(), [])


    def test_both_language_declarations_are_one_module(self):
        q = ArktsQuery(self.session())
        module = q.get_module('api/@ohos.b')
        self.assertEqual(module['module']['language_coverage'], 'both')
        self.assertEqual([(d['source_path'], d['language_variant'], d['header_status'])
                          for d in module['declarations']['items']],
                         [(SDK_PATH + '/api/@ohos.b.d.ts', 'dynamic', 'no_tag'),
                          (SDK_PATH + '/api/@ohos.b.static.d.ets', 'static', 'ok')])
        # Read status belongs to the file, not to the module it declares.
        bad = q.get_module('api/@ohos.bad')['declarations']['items']
        self.assertEqual([(d['source_path'], d['read_status']) for d in bad],
                         [(SDK_PATH + '/api/@ohos.bad.d.ts', 'encoding_failed')])
        self.assertEqual(q.list_declarations(read_status='encoding_failed')['total'], 1)
        self.assertEqual(q.list_modules(language_coverage='both')['total'], 1)
        self.assertEqual(q.list_modules(declaration_format='static.d.ets')['total'], 1)


    def test_implementation_kind_and_arkui_engine_mapping(self):
        q = ArktsQuery(self.session())
        # The ArkUI engine serves every @internal declaration; the fixture's
        # modules are not in the bundled NAPI map, so the rest stay unknown.
        self.assertEqual(q.list_modules(implementation_kind='arkui')['total'], 1)
        button = q.get_module('api/@internal/ets/button')
        self.assertEqual(button['module']['implementation_kind'], 'arkui')
        self.assertEqual(button['module']['declaration_scope'], 'internal_ets')
        self.assertEqual(button['implementation']['impl_so_path'],
                         'system/lib64/platformsdk/libace_engine_pa_ark.z.so')
        self.assertEqual(button['implementation']['impl_match'], 'arkui_engine')
        # 没解析到 ELF：这里没跑 arkts_links
        self.assertNotIn('installed_at', button['implementation'])
        plain = q.get_module('api/@ohos.a')
        self.assertEqual(plain['module']['implementation_kind'], 'unknown')
        self.assertIsNone(plain['implementation'])
        # 参考数据不入库：arkts_sources 里只有 sdk-js 的声明文件，
        # 映射表的摘要记在 scope，供复现用。
        paths = [d['source_path'] for d in export_document(self.session())['sources']]
        self.assertTrue(all(p.startswith(SDK_PATH + '/') for p in paths), paths[:3])
        self.assertEqual(len(q.scope['napi_map']['sha256']), 64)


    def test_arkui_path_uses_unique_installed_target_and_links_its_elf(self):
        actual = 'system/lib64/libace_engine_pa_ark.z.so'
        with ScanSession.open(self.database, scan_id=self.scan_id) as session:
            connection = session.connection
            module_id = connection.execute(
                'INSERT INTO install_modules(scan_id, ordinal, record) VALUES(?,?,?)',
                (self.scan_id, 0, '{}')).lastrowid
            target_id = connection.execute(
                'INSERT INTO install_targets(scan_id, module_id, dest_index, dest, '
                'directory, partition, file_name) VALUES(?,?,?,?,?,?,?)',
                (self.scan_id, module_id, 0, actual, 0, 'system',
                 actual.rsplit('/', 1)[-1])).lastrowid
            connection.execute(
                'INSERT INTO elf_modules(scan_id, position, install_target_id, '
                'install_module_id, partition, file_name, api_type, category, '
                'dynamic, needed) VALUES(?,?,?,?,?,?,?,?,?,?)',
                (self.scan_id, 0, target_id, module_id, 'system',
                 actual.rsplit('/', 1)[-1], 'internal_api', '[]', 0, '[]'))
            ArktsLinksCollector.post_insert(connection, self.scan_id)
            button = ArktsQuery(session).get_module('api/@internal/ets/button')
            self.assertEqual(button['implementation']['impl_so_path'], actual)
            self.assertEqual(button['implementation']['installed_at'], actual)


    def test_arkui_path_keeps_fallback_with_missing_or_ambiguous_install_evidence(self):
        fallback = 'system/lib64/platformsdk/libace_engine_pa_ark.z.so'
        actual = (
            'system/lib64/libace_engine_pa_ark.z.so',
            'system/lib/platformsdk/libace_engine_pa_ark.z.so',
        )
        with ScanSession.open(self.database, scan_id=self.scan_id) as session:
            connection = session.connection
            ArktsLinksCollector.post_insert(connection, self.scan_id)
            button = ArktsQuery(session).get_module('api/@internal/ets/button')
            self.assertEqual(button['implementation']['impl_so_path'], fallback)
            self.assertNotIn('installed_at', button['implementation'])

            for position, dest in enumerate(actual):
                self.add_installed_elf(connection, dest, position=position)
            ArktsLinksCollector.post_insert(connection, self.scan_id)
            button = ArktsQuery(session).get_module('api/@internal/ets/button')
            self.assertEqual(button['implementation']['impl_so_path'], fallback)
            self.assertNotIn('installed_at', button['implementation'])


    def test_arkui_path_resolves_before_collect_reports_links(self):
        actual = 'system/lib64/libace_engine_pa_ark.z.so'
        with ScanSession.open(self.database, scan_id=self.scan_id) as session:
            connection = session.connection
            self.add_installed_elf(connection, actual)
            connection.execute(
                'INSERT INTO collector_runs(scan_id, collector, schema_version, '
                'status, record_count) VALUES(?,?,?,?,?)',
                (self.scan_id, 'elf_modules', 'test', 'complete', 1))
            context = ArktsLinksCollector.CONTEXT_TYPE(
                scan_id=self.scan_id, connection=connection, request=self.request,
                collector='arkts_links')
            ArktsLinksCollector().collect(context)
            self.assertEqual(context.records['arkts_links_run'][0]['linked'], 1)

        with ScanSession.open(self.database, scan_id=self.scan_id) as session:
            button = ArktsQuery(session).get_module('api/@internal/ets/button')
            self.assertEqual(button['implementation']['impl_so_path'], actual)


    def test_arkui_path_counts_distinct_destinations_not_duplicate_targets(self):
        actual = 'system/lib64/libace_engine_pa_ark.z.so'
        with ScanSession.open(self.database, scan_id=self.scan_id) as session:
            connection = session.connection
            self.add_installed_elf(connection, actual, position=0)
            self.add_installed_elf(connection, actual, position=1)
            ArktsLinksCollector.post_insert(connection, self.scan_id)
            button = ArktsQuery(session).get_module('api/@internal/ets/button')
            self.assertEqual(button['implementation']['impl_so_path'], actual)
            self.assertNotIn('installed_at', button['implementation'])


    def test_arm_napi_path_and_link_use_lib(self):
        self._assert_napi_layout_and_exact_link(
            'arm', 'system/lib/module/multimedia/libimage.z.so',
            'system/lib64/module/multimedia/libimage.z.so')


    def test_arm64_napi_path_and_link_use_lib64(self):
        self._assert_napi_layout_and_exact_link(
            'arm64', 'system/lib64/module/multimedia/libimage.z.so',
            'system/lib/module/multimedia/libimage.z.so')


    def test_scope_does_not_repeat_the_per_file_hashes(self):
        q = ArktsQuery(self.session())
        # The hashes are columns on arkts_sources; the scope keeps only a
        # digest over them, so it stays small but still pins the content.
        self.assertNotIn('files', q.scope)
        before = q.scope['files_digest']
        self.write('api/@ohos.b.d.ts', 'declare class B2 {}')
        self.scan(scan_id=self.scan_id, reuse_upstream=True)
        self.assertNotEqual(ArktsQuery(self.session()).scope['files_digest'], before)


    def test_bidirectional_queries_dedup_and_candidate_filter(self):
        q = ArktsQuery(self.session())
        self.assertEqual(q.kit_modules('@kit.Demo')['total'], 2)
        self.assertEqual(q.kit_modules('@kit.Demo', relation_type='declared_membership')['total'], 1)
        self.assertEqual(q.kit_modules('@kit.Demo', condition='dynamic')['total'], 1)
        # Three genuinely unresolved: a missing module, a bare external
        # specifier and a Kit. The fourth used to be @ohos.b, reported as
        # ambiguous only because its two declarations were two rows.
        unresolved = q.kit_modules('@kit.Demo', view='unresolved')
        self.assertEqual(unresolved['total'], 3)
        self.assertEqual([(i['target_text'], i['resolution_status']) for i in unresolved['items']],
                         [('@ohos.missing', 'not_found'), ('external', 'out_of_scope'), ('@kit.Empty', 'out_of_scope')])
        self.assertEqual(q.module_kits('api/@ohos.a')['items'][0]['kit_key'], '@kit.Demo')
        self.assertEqual(q.module_kits('arkts/@arkts.lang')['total'], 0)
        self.assertEqual(q.module_kits('arkts/@arkts.lang', include_candidates=True)['total'], 1)
        self.assertEqual(q.get_module('api/@ohos.a')['evidence']['total'], 5)
        self.assertEqual(q.list_modules(query='%')['total'], 0)
        self.assertEqual(q.list_kits(query='Automatic Scene')['items'][0]['origin'], 'label_only')


    def test_member_routes_mentioned_in_and_reverse_lookup(self):
        """两条来路、label_only 的回答、以及从部件/.so 反查 SDK 模块。"""
        q = ArktsQuery(self.session())
        # @ohos.a 既写了 @kit Demo 标签，又被 @kit.Demo 入口 import，两边都有。
        routes = q.get_kit('@kit.Demo')['member_routes']
        self.assertEqual(routes, dict(total=2, both=1, declared_only=0, referenced_only=1))
        self.assertEqual(q.get_module('api/@ohos.a')['kit_routes']['both'], 1)
        # 合计数掩盖不了来路差异：summary 只说 2 个模块，member_routes 说清是哪两条路。
        self.assertEqual(q.get_kit('@kit.Demo')['summary']['modules'], 2)

        # label_only 没有入口文件。空 sources 会被读成"查不到定义文件"，
        # 而事实是它没有定义文件——所以改答"谁提过它"。
        label = q.get_kit('label:Automatic Scene Configuration Kit')
        self.assertEqual(label['sources']['total'], 0)
        self.assertEqual(label['mentioned_in']['total'], 1)
        self.assertEqual(label['mentioned_in']['items'][0]['module_key'], 'api/@internal/ets/button')
        # 有入口的 Kit 不带这一项：对它们这个问题没有意义。
        self.assertNotIn('mentioned_in', q.get_kit('@kit.Demo'))

        # 反查：按实现库路径子串，调用方可以只给文件名；库内存的是架构化完整路径。
        self.assertEqual(q.list_modules(implemented_by='libace_engine')['total'], 1)
        self.assertEqual(q.list_modules(implemented_by='nothing-like-this')['total'], 0)
        # 按部件反查要跨采集器。本夹具只跑了 arkts，缺表必须明确报出来，
        # 不能静默返回 0 条——那会被读成"没有模块由这个部件实现"。
        with self.assertRaisesRegex(QueryError, 'CAPABILITY_UNAVAILABLE'):
            q.list_modules(component='ace_engine')
        # 游标与新筛选项绑定：换一个 implemented_by，旧游标必须失效。
        first = q.list_modules(limit=1)
        with self.assertRaisesRegex(QueryError, 'INVALID_PAGE_TOKEN'):
            q.list_modules(implemented_by='libace_engine', limit=1, page_token=first['next_page_token'])


    def test_page_token_filter_binding_and_rescan_invalidation(self):
        q = ArktsQuery(self.session()); first = q.list_modules(limit=2)
        second = q.list_modules(limit=2, page_token=first['next_page_token'])
        self.assertFalse({m['module_key'] for m in first['items']} & {m['module_key'] for m in second['items']})
        with self.assertRaisesRegex(QueryError, 'INVALID_PAGE_TOKEN'):
            q.list_modules(query='x', page_token=first['next_page_token'])
        for limit in (0, 201, True, '1'):
            with self.assertRaises(QueryError): q.list_modules(limit=limit)
        self.scan(scan_id=self.scan_id, reuse_upstream=True)
        self.assertEqual(q.list_modules(limit=2, page_token=first['next_page_token'])['items'], second['items'])
        self.write('api/@ohos.new.d.ts', 'declare class New {}')
        self.scan(scan_id=self.scan_id, reuse_upstream=True)
        with self.assertRaisesRegex(QueryError, 'STALE_PAGE_TOKEN'): q.list_modules(page_token=first['next_page_token'])


    def test_evidence_roundtrip_and_export_without_sources(self):
        session = self.session(); document = export_document(session)
        for relation in document['kit_relations']:
            data = (self.root/relation['source_path']).read_bytes()
            self.assertEqual(data[relation['start_byte']:relation['end_byte']].decode(), relation['record'])
            self.assertEqual(locations(data, [relation['start_byte']])[relation['start_byte']], (relation['line'], relation['column']))
        before = canonical(document)
        shutil.rmtree(self.sdk)
        self.assertEqual(canonical(export_document(session)), before)
        self.assertEqual(len(session.records('arkts')), 5)
        self.assertNotIn('api.signatures', before.decode())
        self.assertFalse(any('id' in relation or 'module_id' in relation for relation in document['kit_relations']))
        # The licence header is no longer copied into the store; the span that
        # locates it is, so the text can be read back from the source.
        self.assertFalse(any('record' in module for module in document['modules']))
        self.assertTrue(all('header_span' in d for d in document['sources']
                            if d['read_status'] == 'ok'))


    def test_scan_isolation_rescan_and_transaction_rollback(self):
        session = self.session(); before = canonical(export_document(session))
        new = self.scan().scan_id
        self.assertNotEqual(new, self.scan_id)
        self.scan(scan_id=self.scan_id, reuse_upstream=True)
        self.assertEqual(canonical(export_document(session)), before)
        session.connection.execute("CREATE TRIGGER fail_arkts BEFORE INSERT ON arkts_kit_relations BEGIN SELECT RAISE(ABORT, 'injected'); END")
        with self.assertRaisesRegex(StoreError, 'injected'): self.scan(scan_id=self.scan_id, reuse_upstream=True)
        self.assertEqual(canonical(export_document(session)), before)
        self.assertEqual(session.connection.execute('PRAGMA foreign_key_check').fetchall(), [])
        self.assertEqual(session.connection.execute('SELECT count(*) FROM arkts_kit_relations r JOIN arkts_modules m ON m.id=r.module_id WHERE m.scan_id!=r.scan_id').fetchone()[0], 0)


    def test_cancel_or_backend_failure_preserves_old_rows(self):
        session = self.session(); before = canonical(export_document(session))
        with self.assertRaises(ScanCancelled):
            self.scan(scan_id=self.scan_id, reuse_upstream=True, cancelled=lambda: True)
        with patch.object(Backend, 'parse', side_effect=ScanFatalError('injected')):
            with self.assertRaises(ScanFatalError): self.scan(scan_id=self.scan_id, reuse_upstream=True)
        self.assertEqual(canonical(export_document(session)), before)


    def test_roots_links_and_read_budgets(self):
        (self.sdk/'api/outside.d.ts').symlink_to(self.root/'missing')
        (self.sdk/'api/loop').symlink_to(self.sdk/'api', target_is_directory=True)
        self.scan(scan_id=self.scan_id, reuse_upstream=True)
        q = ArktsQuery(self.session())
        self.assertEqual(q.scope['quality']['discovery'], 'partial')
        self.assertEqual(q.get_module('api/outside')['declarations']['items'][0]['header_status'], 'failed')
        low = replace(self.request, limits=ScanLimits(file_bytes=10))
        result = run(self.database, low, only=('arkts',), without=('repos',))
        self.assertEqual(result['arkts'].status, 'degraded')
        with self.assertRaises(ScanFatalError):
            run(self.database, replace(self.request, limits=ScanLimits(input_files=1)), only=('arkts',), without=('repos',))
        with tempfile.TemporaryDirectory() as outside:
            self.sdk.rename(self.sdk.with_name('sdk-saved'))
            self.sdk.symlink_to(outside, target_is_directory=True)
            with self.assertRaisesRegex(RequestError, 'ROOT_OUTSIDE_WORKSPACE'):
                run(self.database, self.request, only=('arkts',), without=('repos',))


    def test_invalid_kit_and_syntax_failure_do_not_hide_inventory(self):
        self.write('kits/invalid.d.ts', 'import x from "@ohos.a";')
        self.write('kits/@kit.Broken.d.ts', '/** @file Broken\n * @kit Broken\n */\nimport x from "a"; import {')
        self.scan(scan_id=self.scan_id, reuse_upstream=True)
        document = export_document(self.session())
        broken_path, invalid_path = SDK_PATH + '/kits/@kit.Broken.d.ts', SDK_PATH + '/kits/invalid.d.ts'
        broken = next(d for d in document['sources'] if d['source_path'] == broken_path)
        # references_status 已删：它本来就是 coverage['kit.references'] 的投射
        self.assertEqual(broken['header_status'], 'ok')
        self.assertEqual(broken['coverage']['kit.references'], 'failed')
        self.assertFalse(any(r['source_path'] == broken_path for r in document['kit_relations']))
        self.assertTrue(any(d['source_path'] == invalid_path and 'kit_key' not in d
                            for d in document['sources']))


    def test_entry_script_derives_paths_without_extra_flags_or_path_node(self):
        from oskm_cli.query.session import SessionManager
        from oskm_cli.query.tools import dispatch
        # 采集侧的入口是 `python3 -m oskm.cli`（`packages/oskm/oskm.py` 已于
        # 2026-11-12 删除）。cwd 是临时目录，所以要显式给 PYTHONPATH——
        # 旧写法靠"脚本所在目录自动进 sys.path[0]"省掉了这一步。
        package = Path(__file__).resolve().parents[2]
        env = dict(os.environ, PATH=str(self.root / 'empty-path'),
                   PYTHONPATH=str(package))
        completed = subprocess.run([sys.executable, '-m', 'oskm.cli', 'scan', '--workspace-root', str(self.root),
            '--product', 'sdk-source', '--only', 'arkts', '--without', 'repos', '--db', str(self.root / 'cli.db')],
            cwd=self.root, env=env, capture_output=True, text=True, timeout=30)
        self.assertEqual(completed.returncode, 4, completed.stderr)
        self.assertEqual(json.loads(completed.stdout)['collectors']['arkts']['records'], 5)
        with ScanSession.open(Database(self.root / 'cli.db')) as scanned:
            self.assertEqual(ArktsQuery(scanned).scope['backend']['node_version'], 'v18.20.1')
        manager = SessionManager(); manager.open(str(self.database.path)); self.addCleanup(manager.close)
        with patch('subprocess.Popen', side_effect=AssertionError('query started process')):
            self.assertEqual(dispatch('arkts_kit_modules', {'kit_key':'@kit.Demo'}, manager)['total'], 2)
            self.assertEqual(dispatch('list_arkts_modules', {'limit':False}, manager)['error']['code'], 'INVALID_PARAM')
            self.assertEqual(dispatch('get_arkts_module', {'module_key':'missing'}, manager)['error']['code'], 'NOT_FOUND')
            self.assertEqual(dispatch('get_arkts_kit', {}, manager)['error']['code'], 'MISSING_PARAM')
            self.assertEqual(dispatch('list_arkts_kits', {'sql':'DROP TABLE x'}, manager)['error']['code'], 'INVALID_PARAM')


    def test_old_database_unrun_domain_is_not_empty_success(self):
        legacy = Database(self.root/'legacy.db')
        run(legacy, ScanRequest(self.root,'sdk-source'), only=('repos',))
        with ScanSession.open(legacy) as session:
            with self.assertRaisesRegex(QueryError, 'COLLECTOR_NOT_RUN'): ArktsQuery(session)


    def test_repo_snapshot_survives_upstream_replacement(self):
        session = self.session()
        session.connection.execute('INSERT INTO repos(scan_id,name,path,remote_url,head_commit) VALUES(?,?,?,?,?)',
            (self.scan_id, 'sdk', SDK_PATH, 'https://example.test/sdk.git', 'abc123'))
        session.connection.execute('INSERT INTO collector_runs(scan_id,collector,schema_version,status,record_count) VALUES(?,?,?,?,?)',
            (self.scan_id, 'repos', '1.0.0', 'complete', 1))
        self.scan(scan_id=self.scan_id, reuse_upstream=True)
        q = ArktsQuery(session)
        source = q.get_module('api/@ohos.a')['declarations']['items'][0]['source']
        self.assertFalse(source['source_metadata_stale'])
        self.assertEqual(source['content_match'], 'unverified')
        self.assertIn('/blob/abc123/api/', source['url'])
        self.assertFalse(q.get_kit('@kit.Demo')['sources']['items'][0]['source']['source_metadata_stale'])
        session.connection.execute('DELETE FROM repos WHERE scan_id=?', (self.scan_id,))
        source = q.get_module('api/@ohos.a')['declarations']['items'][0]['source']
        self.assertTrue(source['source_metadata_stale'])
        self.assertEqual(source['repo']['head_commit'], 'abc123')
        self.assertTrue(q.get_kit('@kit.Demo')['sources']['items'][0]['source']['source_metadata_stale'])
        self.assertEqual(q.list_modules()['total'], 5)
        session.connection.execute("UPDATE collector_runs SET status='failed' WHERE collector='repos' AND scan_id=?", (self.scan_id,))
        self.scan(scan_id=self.scan_id, reuse_upstream=True)
        self.assertEqual(ArktsQuery(session).list_modules()['total'], 5)


    def test_missing_capability_and_mismatched_backend_fail_before_source(self):
        backend = Backend(BACKEND, WORKSPACE_NODE)
        lock = backend.lock
        ready = dict(type='ready', protocol_version=1, ir_schema_version='1.0.0',
            adapter_version=lock['adapter_version'], node_version=lock['node_versions'][0],
            backend={k:lock[k] for k in ('package_name','package_version','compiler_version','entry_sha256')},
            profiles=['module_kit_v1'], capabilities=[])
        with patch.object(backend, '_exchange', return_value=ready):
            with self.assertRaises(ScanFatalError): backend.__enter__()
        self.assertIsNotNone(backend.process.poll())
        other = Backend(BACKEND, WORKSPACE_NODE)
        # package.json bytes are exempt (the build rewrites its npm metadata);
        # tamper with a pinned lib file instead to prove the identity gate.
        other.lock['files'] = {'lib/typescript.js': 'incorrect'}
        with self.assertRaisesRegex(ScanFatalError, 'IDENTITY_MISMATCH'): other.__enter__()


    def test_missing_workspace_node_does_not_fall_back_to_path(self):
        (self.root/NODE_PATH).unlink()
        with self.assertRaisesRegex(ScanFatalError, 'BACKEND_UNAVAILABLE'):
            self.scan(scan_id=self.scan_id, reuse_upstream=True)
        from oskm.cli import parser
        with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
            parser().parse_args(['scan', '--workspace-root', str(self.root), '--product', 'test', '--arkts-node', 'node'])


    def test_configuration_and_discovery_changes_invalidate_digest(self):
        q = ArktsQuery(self.session()); page = q.list_modules(limit=1)
        self.request = replace(self.request, options={'arkts': {'file_seconds':16}})
        self.scan(scan_id=self.scan_id, reuse_upstream=True)
        with self.assertRaisesRegex(QueryError, 'STALE_PAGE_TOKEN'): q.list_modules(page_token=page['next_page_token'])
        page = q.list_modules(limit=1)
        (self.sdk/'api/skip').symlink_to(self.sdk/'api', target_is_directory=True)
        self.scan(scan_id=self.scan_id, reuse_upstream=True)
        with self.assertRaisesRegex(QueryError, 'STALE_PAGE_TOKEN'): q.list_modules(page_token=page['next_page_token'])


    def test_protocol_integrity_rejects_future_fields_and_bad_evidence(self):
        data = '/** @file 中😀\n * @kit Demo\n */'.encode()
        with Backend(BACKEND, WORKSPACE_NODE) as backend:
            result = backend.parse('api/@ohos.x.d.ts', 'module', data)
            request = dict(id=1, path='api/@ohos.x.d.ts', sha256=hashlib.sha256(data).hexdigest(),
                           profile='module_kit_v1', ir_schema_version='1.0.0', file_role='module')
            for mutation in (lambda r:r.update(id=999), lambda r:r.update(sha256='bad'),
                lambda r:r['facts'].update({'api.signatures': []}),
                lambda r:r['facts']['file.header'].update(span=[0,999]),
                lambda r:r['facts']['file.header']['tags'][0].update(span=[1,14]),
                lambda r:r.update(ir_schema_version='2.0.0')):
                bad = copy.deepcopy(result); mutation(bad)
                with self.assertRaises(ScanFatalError): validate_result(bad, request, data)
        missing = Backend(self.root/'absent', WORKSPACE_NODE)
        with self.assertRaisesRegex(ScanFatalError, 'BACKEND_UNAVAILABLE'): missing.__enter__()


    def _assert_napi_layout_and_exact_link(self, cpu_arch, expected, wrong):
        self.write('api/@ohos.multimedia.image.d.ts', 'declare class Image {}')
        result = run(self.database, ScanRequest(self.root, 'sdk-source',
                                                cpu_arch=cpu_arch),
                     only=('arkts',), without=('repos',))
        with ScanSession.open(self.database, scan_id=result.scan_id) as session:
            connection = session.connection
            module = connection.execute(
                'SELECT id, impl_so_path, impl_elf_id FROM arkts_modules '
                'WHERE scan_id=? AND module_key=?',
                (result.scan_id, 'api/@ohos.multimedia.image')).fetchone()
            self.assertEqual(module['impl_so_path'], expected)
            self.assertIsNone(module['impl_elf_id'])

            def add_elf(dest):
                page_token = connection.execute(
                    'INSERT INTO install_modules(scan_id, ordinal, record) VALUES(?,?,?)',
                    (result.scan_id, 0, '{}'))
                module_id = page_token.lastrowid
                page_token = connection.execute(
                    'INSERT INTO install_targets(scan_id, module_id, dest_index, dest, '
                    'directory, partition, file_name) VALUES(?,?,?,?,?,?,?)',
                    (result.scan_id, module_id, 0, dest, 0, 'system',
                     dest.rsplit('/', 1)[-1]))
                target_id = page_token.lastrowid
                connection.execute(
                    'INSERT INTO elf_modules(scan_id, position, install_target_id, '
                    'install_module_id, partition, file_name, api_type, category, '
                    'dynamic, needed) VALUES(?,?,?,?,?,?,?,?,?,?)',
                    (result.scan_id, 0, target_id, module_id, 'system',
                     dest.rsplit('/', 1)[-1], 'internal_api', '[]', 0, '[]'))

            # The opposite architecture root must not be accepted as an alias.
            add_elf(wrong)
            ArktsLinksCollector.post_insert(connection, result.scan_id)
            self.assertIsNone(connection.execute(
                'SELECT impl_elf_id FROM arkts_modules WHERE id=?',
                (module['id'],)).fetchone()['impl_elf_id'])

            add_elf(expected)
            ArktsLinksCollector.post_insert(connection, result.scan_id)
            implementation = ArktsQuery(session).get_module(
                'api/@ohos.multimedia.image')['implementation']
            self.assertEqual(implementation['impl_so_path'], expected)
            self.assertEqual(implementation['installed_at'], expected)



if __name__ == '__main__': unittest.main()
