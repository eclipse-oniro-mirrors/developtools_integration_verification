"""Contract tests: the install manifest is preserved, attributed and queryable."""
import contextlib
import io
import json
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from oskm.cli import main
from oskm.collectors.install_modules.models import (InstallModuleFilter,
                                                    InstallModuleScanRequest)
from oskm.collectors.install_modules.records import SHAPE, raw_module
from oskm.collectors.install_modules.targets import modules_at, normalize_dest
from oskm.core.api import scan as _scan_one
from oskm.core.db import Database
from oskm.core.io import canonical
from oskm.core.models import UNSET
from oskm.core.session import ScanSession

LABEL = '//component/x:y(//build/toolchain:clang)'


class InstallModulesTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.package = self.root / 'out/test/packages/phone'
        self.package.mkdir(parents=True)

    def write(self, relative, value, *, workspace=False):
        path = (self.root if workspace else self.package) / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(canonical(value))
        return path

    def manifest(self, rows):
        """Write the SMI *and* materialise every dest it declares.

        size/link_target_path are observations of the package, so a fixture that
        declares an install without creating the file is now a product
        inconsistency (TARGET_MISSING) rather than a neutral stub.
        Tests that want that case call `install=False` and build the tree
        themselves.
        """
        self.install(rows)
        return self.write('system_module_info.json', rows)

    def install(self, rows, body=b'x'):
        """Create a plain file for each declared dest (skipping directory installs)."""
        for row in rows if isinstance(rows, list) else []:
            for dest in (row.get('dest') or []) if isinstance(row, dict) else []:
                if not isinstance(dest, str) or not dest or dest.endswith('/'):
                    continue
                if dest.startswith('/') or '..' in dest.split('/') or '\\' in dest:
                    continue
                path = self.package / dest
                path.parent.mkdir(parents=True, exist_ok=True)
                if not path.exists():
                    path.write_bytes(body)

    def components(self, entries=None, bundles=None):
        self.write('out/test/build_configs/parts_info/components.json',
                   entries or {'part': {'subsystem': 'sub', 'path': 'component'}},
                   workspace=True)
        for directory, component in (bundles or
                                     {'component': {'name': 'part', 'subsystem': 'sub'}}).items():
            self.write(f'{directory}/bundle.json', {'component': component}, workspace=True)

    def scan(self, **kwargs):
        return _scan_one('install_modules',
                         InstallModuleScanRequest(self.root, 'test', **kwargs))

    def row(self, **kwargs):
        base = dict(label=LABEL, label_name='y', part_name='part', subsystem_name='sub',
                    type='lib', source='x/liby.z.so', install_enable=True,
                    dest=['system/lib/liby.z.so'])
        base.update(kwargs)
        return {k: v for k, v in base.items() if v is not None}

    def codes(self, result):
        return [i['code'] for i in result.snapshot.get('issues', ())]

    def stored(self, table, order='dest_index'):
        """Run a real scan into a db and return the table's rows.

        `result.snapshot` carries metadata and issues only, not rows."""
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'install_modules'])
        with ScanSession.open(Database(db)) as session:
            return session.sql(f'SELECT * FROM {table} ORDER BY {order}')

    # -- declaration preservation --------------------------------------------

    def test_record_is_the_smi_row_verbatim_and_columns_only_project_it(self):
        rows = [self.row(),
                self.row(label=None, label_name=None, type='sa_info',
                         dest=['system/profile/a.json'], odd={'deep': [1, None, True]})]
        self.manifest(rows)
        self.components()
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'install_modules'])
        with ScanSession.open(Database(db)) as session:
            stored = session.sql('SELECT * FROM install_modules ORDER BY ordinal')
            for row, raw in zip(stored, rows):
                self.assertEqual(json.loads(row['record']), raw)
            # the column holds the stripped label; the declaration keeps the toolchain
            self.assertEqual(stored[0]['label'], '//component/x:y')
            self.assertEqual(json.loads(stored[0]['record'])['label'], LABEL)
            self.assertIsNone(stored[1]['label'])
            # attribution is the foreign key alone: no part_name/subsystem column
            self.assertNotIn('part_name', stored[0])
            self.assertNotIn('subsystem_name', stored[0])
            self.assertIsNotNone(stored[0]['component_id'])

    def test_published_record_keeps_the_declared_names_and_adds_the_component(self):
        self.manifest([self.row()])
        self.components()
        record = self.scan().install_modules[0]
        self.assertEqual(record['label'], '//component/x:y')        # stripped, see below
        self.assertEqual(record['part_name'], 'part')               # declaration kept
        self.assertEqual(record['subsystem_name'], 'sub')
        self.assertEqual(dict(record['component']),
                         dict(name='part', subsystem='sub', manifest='component/bundle.json'))

    def test_only_label_differs_between_the_published_record_and_the_declaration(self):
        # label is published stripped so it joins with services/hdi/sas, which is
        # the one field the published view does not round-trip. Everything else
        # does, and the toolchain form stays recoverable from the record column.
        self.manifest([self.row()])
        self.components()
        published = raw_module(self.scan().install_modules[0])
        self.assertEqual(published['label'], '//component/x:y')
        self.assertEqual(canonical(dict(published, label=LABEL)), canonical(self.row()))

    def test_shape_round_trips_and_looks_values_up_by_declared_name(self):
        raw = self.row(extra={'x': [1, 2]}, dest=['a/b', 'c/d'])
        record = SHAPE.make((0,), {}, raw)
        self.assertEqual(SHAPE.raw(record), raw)
        self.assertEqual(SHAPE.value(record, 'extra'), {'x': [1, 2]})
        self.assertEqual(SHAPE.value(record, 'part_name'), 'part')
        self.assertIs(SHAPE.value(record, 'ordinal'), UNSET)   # context is not declared

    # -- dest expansion -------------------------------------------------------

    def test_normalize_dest_rules(self):
        for value, expected in [('system/lib/a.so', ('system/lib/a.so', False)),
                                ('system/app/Demo/', ('system/app/Demo', True)),
                                ('./system//lib/a.so', ('system/lib/a.so', False)),
                                ('/absolute', None), ('../escape', None), ('', None),
                                ('a\\b', None), ('a\x00b', None), (None, None), (7, None)]:
            with self.subTest(value=value):
                self.assertEqual(normalize_dest(value), expected)

    def test_modules_at_prefers_exact_then_the_longest_directory_install(self):
        rows = [dict(dest='system/app/Demo', directory=1, module_id=1),
                dict(dest='system/app', directory=1, module_id=2),
                dict(dest='system/app/Demo/entry.hap', directory=0, module_id=3)]
        at = lambda d: [r['module_id'] for r in modules_at(rows, d)]
        self.assertEqual(at('system/app/Demo/entry.hap'), [3])   # exact wins
        self.assertEqual(at('system/app/Demo/other'), [1])       # longest directory
        self.assertEqual(at('system/app/Else/x'), [2])
        self.assertEqual(at('vendor/x'), [])

    def test_dest_expansion_directory_installs_and_unusable_paths(self):
        self.manifest([self.row(dest=['system/lib/a.so', 'vendor/lib/a.so']),
                       self.row(label='//component/h:hap', dest=['system/app/Demo/'], type='app'),
                       self.row(label='//component/b:b', dest=['/absolute', '../escape', ''])])
        self.components()
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'install_modules'])
        with ScanSession.open(Database(db)) as session:
            targets = session.sql('SELECT * FROM install_targets ORDER BY module_id, dest_index')
            self.assertEqual([(t['dest'], t['directory'], t['partition'], t['file_name'])
                              for t in targets],
                             [('system/lib/a.so', 0, 'system', 'a.so'),
                              ('vendor/lib/a.so', 0, 'vendor', 'a.so'),
                              ('system/app/Demo', 1, 'system', 'Demo')])
            self.assertEqual([i['code'] for i in session.issues('install_modules')
                              if i['code'] == 'MODULE_DEST_INVALID'], ['MODULE_DEST_INVALID'] * 3)
            # the slash-terminated declaration is untouched in the record
            stored = session.sql('SELECT record FROM install_modules ORDER BY ordinal')
            self.assertEqual(json.loads(stored[1]['record'])['dest'], ['system/app/Demo/'])
            # directory install is reachable through the session, exact path is not
            self.assertEqual([m.label for m in session.installed_at('system/app/Demo/inner.abc')],
                             ['//component/h:hap'])

    def test_duplicate_dest_is_reported_for_every_claimant_and_both_are_kept(self):
        self.manifest([self.row(label='//component/a:a'), self.row(label='//component/b:b')])
        self.components()
        result = self.scan()
        reported = [i for i in result.snapshot['issues'] if i['code'] == 'INSTALL_DEST_AMBIGUOUS']
        self.assertEqual(len(reported), 2)          # one per declaration, neither dropped
        self.assertTrue(all(i.get('advisory') for i in reported))
        self.assertEqual(len(result.install_modules), 2)
        self.assertEqual(result.snapshot['status'], 'complete')   # advisory never degrades

    # -- attribution ----------------------------------------------------------

    def test_nearest_component_wins_over_a_disagreeing_part_name(self):
        self.manifest([self.row(part_name='other')])
        self.components({'part': {'subsystem': 'sub', 'path': 'component'},
                         'other': {'subsystem': 'sub', 'path': 'elsewhere'}},
                        {'component': {'name': 'part', 'subsystem': 'sub'},
                         'elsewhere': {'name': 'other', 'subsystem': 'sub'}})
        result = self.scan()
        self.assertEqual(result.install_modules[0]['component']['name'], 'part')
        conflict = [i for i in result.snapshot['issues']
                    if i['code'] == 'MODULE_COMPONENT_CONFLICT']
        self.assertEqual(len(conflict), 1)
        self.assertEqual(dict(conflict[0]['details']), dict(bundle='part', part_name='other'))

    def test_prefix_match_sees_ohos_build_components_a_bundle_walk_cannot(self):
        # The manifest is ohos.build, so walking the tree for bundle.json finds
        # nothing; the components table knows it. This is the behaviour that
        # makes the SQL match strictly better than nearest_bundle().
        self.manifest([self.row(label='//vendor/board/deep/inner:x', part_name=None)])
        self.write('out/test/build_configs/parts_info/components.json',
                   {'product': {'subsystem': 'prod', 'path': 'vendor/board'}}, workspace=True)
        self.write('vendor/board/ohos.build',
                   {'subsystem': 'prod', 'parts': {'product': {}}}, workspace=True)
        result = self.scan()
        self.assertEqual(result.install_modules[0]['component']['name'], 'product')
        self.assertNotIn('MODULE_COMPONENT_UNRESOLVED', self.codes(result))

    def test_unregistered_prefix_falls_back_to_part_name(self):
        self.manifest([self.row(label='//elsewhere/deep:x', part_name='part')])
        self.components()
        self.assertEqual(self.scan().install_modules[0]['component']['name'], 'part')

    def test_comma_part_name_is_reported_not_guessed(self):
        self.manifest([self.row(label=None, label_name=None, part_name='one,two')])
        self.components()
        result = self.scan()
        self.assertIn('MODULE_PART_AMBIGUOUS', self.codes(result))
        self.assertNotIn('component', result.install_modules[0])
        self.assertEqual(result.snapshot['status'], 'complete')

    def test_no_label_and_no_part_name_is_unresolved(self):
        self.manifest([self.row(label=None, label_name=None, part_name=None, type='notice')])
        self.components()
        result = self.scan()
        self.assertIn('MODULE_COMPONENT_UNRESOLVED', self.codes(result))
        self.assertNotIn('component', result.install_modules[0])

    def test_subsystem_disagreement_is_reported_not_stored(self):
        self.manifest([self.row(subsystem_name='stale')])
        self.components()
        result = self.scan()
        reported = [i for i in result.snapshot['issues']
                    if i['code'] == 'MODULE_SUBSYSTEM_DIFFERS']
        self.assertEqual(len(reported), 1)
        self.assertEqual(reported[0]['severity'], 'info')
        self.assertEqual(dict(reported[0]['details']), dict(declared='stale', component='sub'))
        # the component's subsystem is authoritative; the declaration is still visible
        self.assertEqual(result.install_modules[0]['component']['subsystem'], 'sub')
        self.assertEqual(result.install_modules[0]['subsystem_name'], 'stale')

    def test_unparsable_label_leaves_the_column_null_but_keeps_the_declaration(self):
        self.manifest([self.row(label='not a label')])
        self.components()
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'install_modules'])
        with ScanSession.open(Database(db)) as session:
            row = session.sql('SELECT * FROM install_modules')[0]
            self.assertIsNone(row['label'])
            self.assertEqual(json.loads(row['record'])['label'], 'not a label')
            self.assertIn('MODULE_LABEL_INVALID',
                          {i['code'] for i in session.issues('install_modules')})

    def test_without_components_leaves_attribution_unresolved_without_failing(self):
        self.manifest([self.row()])
        self.components()
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            code = main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                         '--db', db, '--only', 'install_modules', '--without', 'components'])
        self.assertEqual(code, 0)
        with ScanSession.open(Database(db)) as session:
            row = session.sql('SELECT * FROM install_modules')[0]
            self.assertIsNone(row['component_id'])
            self.assertEqual(session.issues('install_modules'), ())

    def test_missing_manifest_degrades_instead_of_crashing(self):
        self.components()
        result = self.scan()
        self.assertEqual(result.install_modules, ())
        self.assertEqual(result.snapshot['status'], 'degraded')
        self.assertIn('MODULE_INFO_UNAVAILABLE', self.codes(result))

    def test_manifest_that_is_not_an_array_degrades(self):
        self.write('system_module_info.json', {'not': 'an array'})
        self.components()
        self.assertIn('MODULE_INFO_NOT_ARRAY', self.codes(self.scan()))

    def test_non_object_rows_are_reported_and_skipped(self):
        self.manifest([self.row(), 7, None])
        self.components()
        result = self.scan()
        self.assertEqual(len(result.install_modules), 1)
        self.assertEqual(self.codes(result).count('MODULE_ROW_INVALID'), 2)

    # -- tags and queries -----------------------------------------------------

    def test_tags_are_expanded_and_queryable(self):
        self.manifest([self.row(innerapi_tags=['platformsdk', 'ndk']),
                       self.row(label='//component/z:z', dest=['system/lib/z.so'])])
        self.components()
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'install_modules'])
        with ScanSession.open(Database(db)) as session:
            self.assertEqual([(t['source_index'], t['value']) for t in
                              session.sql('SELECT * FROM install_module_tags ORDER BY source_index')],
                             [(0, 'platformsdk'), (1, 'ndk')])
            module = session.install_module('//component/x:y')
            self.assertEqual(module.tags(), ('platformsdk', 'ndk'))
            self.assertEqual(module.targets(), ('system/lib/liby.z.so',))

    def test_query_by_label_dest_tag_component_and_partition(self):
        self.manifest([self.row(innerapi_tags=['ndk']),
                       self.row(label='//component/z:z', type='bin',
                                dest=['vendor/bin/z', 'system/bin/z'])])
        self.components()
        with self.scan().query() as query:
            by = lambda **kw: query.list_modules(InstallModuleFilter(**kw)).total
            self.assertEqual(by(labels=('//component/x:y',)), 1)
            self.assertEqual(by(dests=('vendor/bin/z',)), 1)
            self.assertEqual(by(tags=('ndk',)), 1)
            self.assertEqual(by(components=('part',)), 2)
            self.assertEqual(by(subsystems=('sub',)), 2)
            self.assertEqual(by(partitions=('vendor',)), 1)
            self.assertEqual(by(types=('bin',)), 1)
            self.assertEqual(by(types=('bin',), partitions=('system',)), 1)
            self.assertEqual([m['label'] for m in query.modules_at('system/bin/z')],
                             ['//component/z:z'])
            groups = query.aggregate_modules(('partition',))
            self.assertEqual({g['key'][0]['value']: g['count'] for g in groups.groups},
                             {'system': 2, 'vendor': 1})

    # -- size / link_target_path: observations of the package -----------------

    def test_size_is_the_entry_s_own_bytes_and_never_follows_a_symlink(self):
        """lstat, not stat. The symlink's target here is installed in its own
        right, so a followed size would charge its bytes twice."""
        self.manifest([self.row(dest=['system/lib/real.so', 'system/lib/alias.so'])])
        (self.package / 'system/lib/real.so').write_bytes(b'0123456789')
        link = self.package / 'system/lib/alias.so'
        link.unlink()
        link.symlink_to('real.so')
        self.components()
        by_dest = {t['dest']: t for t in self.stored('install_targets')}
        self.assertEqual(by_dest['system/lib/real.so']['size'], 10)
        self.assertIsNone(by_dest['system/lib/real.so']['link_target_path'])
        # the link's resolved full path, not the 10 bytes of what it points at
        self.assertEqual(by_dest['system/lib/alias.so']['link_target_path'], 'system/lib/real.so')
        self.assertEqual(by_dest['system/lib/alias.so']['size'], len('real.so'))

    def test_directory_install_size_sums_the_tree_below(self):
        self.manifest([self.row(dest=['system/app/Demo/'], type='app')])
        for name, body in (('a.hap', b'xxx'), ('sub/b.abc', b'yyyyy')):
            path = self.package / 'system/app/Demo' / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(body)
        self.components()
        target = self.stored('install_targets')[0]
        self.assertEqual((target['directory'], target['size']), (1, 8))

    def test_declared_target_absent_from_the_package_is_advisory(self):
        """Both files read fine; the product just does not hold what it declares."""
        self.manifest([self.row()])
        (self.package / 'system/lib/liby.z.so').unlink()
        self.components()
        result = self.scan()
        self.assertEqual(self.codes(result), ['TARGET_MISSING'])
        issue = result.snapshot['issues'][0]
        self.assertEqual((issue['severity'], issue['advisory']), ('warning', True))
        self.assertIsNone(self.stored('install_targets')[0]['size'])

    def test_directory_found_where_a_file_was_declared_is_reported(self):
        """modules_at only does the prefix fallback for *declared* directories,
        so files below this one would be untraceable to their module."""
        self.manifest([self.row()])
        path = self.package / 'system/lib/liby.z.so'
        path.unlink()
        path.mkdir()
        (path / 'inner').write_bytes(b'abcd')
        self.components()
        self.assertEqual(self.codes(self.scan()), ['TARGET_DIRECTORY_UNDECLARED'])
        self.assertEqual(self.stored('install_targets')[0]['size'], 4)

    def test_size_is_observed_so_it_stays_out_of_the_published_record(self):
        """`record` is the declaration verbatim; size is a fact about the
        package, so it must not leak into it."""
        self.manifest([self.row()])
        self.components()
        stored = self.stored('install_modules', order='ordinal')[0]
        self.assertNotIn('size', json.loads(stored['record']))

    # -- symlink_file：模块在这些位置建的链接 -------------------------------

    def _with_link(self):
        """dest 装真文件，symlink_file 在另一处建链接指向它。"""
        rows = [self.row(dest=['system/lib/chipset-sdk/liby.z.so'],
                         symlink_file=['system/lib/platformsdk/liby.z.so'])]
        self.manifest(rows)
        link = self.package / 'system/lib/platformsdk/liby.z.so'
        link.parent.mkdir(parents=True, exist_ok=True)
        link.symlink_to('../chipset-sdk/liby.z.so')
        self.components()
        return rows

    def test_symlink_file_becomes_its_own_install_target(self):
        """镜像里真实存在的条目，就该能按路径查到它属于谁。"""
        self._with_link()
        rows = self.stored('install_targets')
        self.assertEqual([r['dest'] for r in rows],
                         ['system/lib/chipset-sdk/liby.z.so',
                          'system/lib/platformsdk/liby.z.so'])
        # 两个数组共用一个连续序号，不是各自从 0 起
        self.assertEqual([r['dest_index'] for r in rows], [0, 1])
        link = rows[1]
        self.assertEqual(link['link_target_path'], 'system/lib/chipset-sdk/liby.z.so')
        self.assertEqual(link['directory'], 0)
        # 链接行记的是链接自身的字节，不是它指向的文件的
        self.assertEqual(link['size'], len('../chipset-sdk/liby.z.so'))

    def test_symlink_row_is_reachable_by_path_lookup(self):
        self._with_link()
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'install_modules'])
        with ScanSession.open(Database(db)) as session:
            owner = session.owner_of('system/lib/platformsdk/liby.z.so')
            self.assertIsNotNone(owner, '软链接路径也要能反查到部件')
            self.assertEqual(owner.name, 'part')

    def test_same_path_in_both_arrays_yields_one_row(self):
        """rk3568 的 etsstdlib：symlink_file 与 dest 指的是同一个位置。
        发两行会让 modules_at() 对同一个文件返回两条。"""
        self.manifest([self.row(dest=['system/etc/x.abc'],
                                symlink_file=['system/etc/x.abc'],
                                symlink_path='../framework/x_boot.abc')])
        target = self.package / 'system/framework/x_boot.abc'
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(b'boot')
        link = self.package / 'system/etc/x.abc'
        link.unlink()
        link.symlink_to('../framework/x_boot.abc')
        self.components()
        rows = self.stored('install_targets')
        self.assertEqual(len(rows), 1)
        # symlink_path 声明的指向，与盘上观测到的一致
        self.assertEqual(rows[0]['link_target_path'], 'system/framework/x_boot.abc')

    def test_declared_link_that_is_a_real_file_is_reported(self):
        """这个不变量一旦破掉，意味着构建把完整拷贝放在了本该是链接的位置。"""
        rows = [self.row(dest=['system/lib/chipset-sdk/liby.z.so'],
                         symlink_file=['system/lib/platformsdk/liby.z.so'])]
        self.manifest(rows)          # manifest() 只为 dest 建文件
        fake = self.package / 'system/lib/platformsdk/liby.z.so'
        fake.parent.mkdir(parents=True, exist_ok=True)
        fake.write_bytes(b'a full copy, not a link')
        self.components()
        result = self.scan()
        self.assertEqual(self.codes(result), ['SYMLINK_NOT_A_LINK'])
        issue = result.snapshot['issues'][0]
        self.assertEqual((issue['severity'], issue['advisory']), ('warning', True))

    def test_symlink_declaration_stays_in_the_record(self):
        """record 是声明的逐字保留，所以不必为"这行来自哪个数组"加列。"""
        self._with_link()
        stored = self.stored('install_modules', order='ordinal')[0]
        self.assertEqual(json.loads(stored['record'])['symlink_file'],
                         ['system/lib/platformsdk/liby.z.so'])

    def test_session_navigation_from_component_and_back(self):
        self.manifest([self.row()])
        self.components()
        db = str(self.root / 'k.db')
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            main(['scan', '--workspace-root', str(self.root), '--product', 'test',
                  '--db', db, '--only', 'install_modules'])
        with ScanSession.open(Database(db)) as session:
            self.assertEqual(session.owner_of('system/lib/liby.z.so').name, 'part')
            self.assertIsNone(session.owner_of('system/lib/absent.so'))
            self.assertEqual([m.label for m in
                              session.component('part').attached('install_modules')],
                             ['//component/x:y'])
            self.assertEqual([d for d, _ in session.installed_under('system/lib')],
                             ['system/lib/liby.z.so'])


if __name__ == '__main__':
    unittest.main()
