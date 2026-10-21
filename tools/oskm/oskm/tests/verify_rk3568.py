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
"""Real-product acceptance for rk3568, run against the SQLite store.

One scan, eight collectors, then each domain is reconciled against an oracle built
independently of the scanner: the components index and every manifest are decoded
again by a separate JSON reader, cfg files are re-enumerated from the filesystem,
HCB device nodes are decompiled with hc-gen, SA profiles are re-read with their
install-info provenance chain walked back to bundle.json, and installed ELF files
are re-read with GNU readelf.

Two invariants are checked everywhere, because they are what the storage model
promises:

  record  == the entity's own declaration in its source file, nothing added and
             nothing removed, numbers included;
  columns == a projection of that record, so a value a column cannot hold leaves
             the column NULL without the record losing it.

Usage:
    python tests/verify_rk3568.py --workspace-root /path/to/code
"""
from oskm.core.session import ScanSession
from oskm.core.provenance import strip_label
from oskm.core.models import ScanRequest
from oskm.core.io import canonical, parse_json
from oskm.core.db import Database
from oskm.core import runner
from oskm.collectors.system_abilities.records import raw_sa
from oskm.collectors.services.records import raw_service
from oskm.collectors.hdi.records import raw_hdi
import argparse
import json
import re
import subprocess
import sys
import tempfile
from collections import Counter
from decimal import Decimal
from pathlib import Path

PACKAGE = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(PACKAGE))


class Pairs(list):
    """Object hook input that keeps repeated keys instead of collapsing them."""


def source_json(path):
    """Independent decoder: detect duplicate properties before building dicts.

    Deliberately not core/io.py -- the oracle must not share code with the thing
    it checks. parse_float=Decimal matches the scanner's exactness requirement.
    """
    raw = json.loads(path.read_text(encoding='utf-8'), object_pairs_hook=Pairs,
                     parse_float=Decimal)
    duplicates = []

    def convert(value, pointer=''):
        if isinstance(value, Pairs):
            result = {}
            for key, child in value:
                location = pointer + '/' + key.replace('~', '~0').replace('/', '~1')
                if key in result:
                    duplicates.append(location)
                result[key] = convert(child, location)
            return result
        if isinstance(value, list):
            return [convert(child, pointer + '/' + str(i)) for i, child in enumerate(value)]
        return value

    return convert(raw), duplicates


def load(path):
    value, duplicates = parse_json(path.read_bytes())
    assert not duplicates, path
    return value


# ---- components -------------------------------------------------------------

def verify_components(session, workspace, index_path):
    index, duplicates = source_json(index_path)
    assert not duplicates and len(index) == 382
    assert len({row['subsystem'] for row in index.values()}) == 56

    issues = session.issues('components')
    rows = {r['name']: r for r in session.sql(
        'SELECT * FROM components WHERE scan_id = ?', (session.scan_id,))}
    published = {r['name']: r for r in session.records('components')}
    assert set(rows) == set(index) == set(published)

    types, malformed, differences = Counter(), [], []
    for name, entry in sorted(index.items()):
        directory = workspace / entry['path']
        candidates = [directory / p for p in ('bundle.json', 'ohos.build')
                      if (directory / p).is_file()]
        assert len(candidates) == 1, name
        source = candidates[0]
        types[source.name] += 1
        raw, repeated = source_json(source)
        row, record = rows[name], published[name]
        assert record['name'] == name
        assert record['subsystem'] == entry['subsystem']
        assert record['manifest'] == source.relative_to(workspace).as_posix()
        if repeated:
            malformed.append((name, repeated))
            reported = [i for i in issues if i['component'] == name]
            assert {i['pointer'] for i in reported} == set(repeated)
            assert all(i['code'] == 'MANIFEST_JSON' and i['severity'] == 'error'
                       for i in reported)
            continue
        if source.name == 'bundle.json':
            declaration = raw['component']
            # record is the manifest's component object verbatim; name/subsystem
            # /manifest are overlaid at export from the authoritative index.
            assert canonical(json.loads(row['record'])) == canonical(declaration)
            assert declaration['name'] == name
            declared = declaration['subsystem']
        else:
            # ohos.build declares the subsystem at the document level and keeps
            # only the reduced shape; it is on its way out.
            assert row['record'] is not None
            declared = raw['subsystem']
        if declared != entry['subsystem']:
            # The index wins; the disagreement is reported, not silently resolved.
            differences.append(name)
    assert types == {'bundle.json': 379, 'ohos.build': 3}
    assert malformed == [('drivers_interface_display', ['/component/features'])], malformed
    assert sorted(differences) == ['product_rk3568', 'rockchip_products'], differences
    assert {i['component'] for i in issues if i['code'] == 'SUBSYSTEM_DIFFERS'} \
        == set(differences)

    # Child tables. Every row is addressable back to one array element of one
    # manifest, so the expansion must reproduce the declared list exactly --
    # including repeats, which are kept and reported rather than merged away.
    conflicts = Counter(i['code'] for i in issues)
    owner_of = {r['id']: r['name'] for r in rows.values()}
    for table, field, code in (('syscaps', 'syscap', 'SYSCAP_DUPLICATE'),
                               ('features', 'features', 'FEATURE_DUPLICATE')):
        expanded = {}
        for row in session.sql(f'SELECT * FROM {table} WHERE scan_id = ?', (session.scan_id,)):
            expanded.setdefault(owner_of[row['component_id']], []).append(
                (row['source_index'], row['value']))
        for name, record in published.items():
            declared = [(i, v) for i, v in enumerate(record.get(field) or [])
                        if isinstance(v, str)]
            assert sorted(expanded.get(name, [])) == declared, (table, name)
        repeated = {name for name, items in expanded.items()
                    if len({v for _, v in items}) != len(items)}
        cross = Counter(v for items in expanded.values() for _, v in set(items))
        reported = {i['component'] for i in issues if i['code'] == code}
        assert reported == repeated | {name for name, items in expanded.items()
                                       if any(cross[v] > 1 for _, v in items)}, table

    innerapis = session.sql('SELECT * FROM innerapis WHERE scan_id = ?', (session.scan_id,))
    for api in innerapis:
        # external_deps resolves by <component>:<label after the colon>
        label = api['name'].rsplit(':', 1)[-1] if ':' in api['name'] else api['name']
        assert api['external_name'] == f"{owner_of[api['component_id']]}:{label}", api
    ambiguous = {name for name, count in
                 Counter(a['external_name'] for a in innerapis).items() if count > 1}
    assert len(ambiguous) == conflicts['INNERAPI_EXTERNAL_NAME_CONFLICT']
    assert conflicts['SYSCAP_DUPLICATE'] == 2 and conflicts['SUBSYSTEM_DIFFERS'] == 2
    syscaps = session.sql('SELECT COUNT(*) AS n FROM syscaps WHERE scan_id = ?',
                          (session.scan_id,))[0]['n']
    features = session.sql('SELECT COUNT(*) AS n FROM features WHERE scan_id = ?',
                           (session.scan_id,))[0]['n']
    return dict(components=len(rows), subsystems=56, manifests=dict(types),
                innerapis=len(innerapis), ambiguous_innerapis=len(ambiguous),
                syscaps=syscaps, features=features,
                duplicate_fields=malformed, subsystem_differences=differences)


# ---- install modules --------------------------------------------------------

def verify_install_modules(session, workspace, package):
    """Independent re-parse of the install manifest, plus an independently
    computed attribution to check the collector's prefix match against."""
    rows, duplicates = source_json(package / 'system_module_info.json')
    assert not duplicates and isinstance(rows, list) and len(rows) == 5506

    stored = session.sql('SELECT * FROM install_modules WHERE scan_id = ? ORDER BY ordinal',
                         (session.scan_id,))
    assert len(stored) == len(rows)
    for position, (row, raw) in enumerate(zip(stored, rows)):
        assert row['ordinal'] == position
        # record is the SMI row itself, nothing added and nothing removed
        assert canonical(json.loads(row['record'], parse_float=Decimal)) == canonical(raw)
        # no attribution columns beyond the foreign key
        assert 'part_name' not in row and 'subsystem_name' not in row
        declared = raw.get('label')
        assert row['label'] == (strip_label(declared) if isinstance(declared, str) else None)
    assert sum(1 for r in stored if r['label']) == 5400
    assert sum(1 for r in stored if r['component_id'] is not None) == 5494

    # dest expansion, including directory installs and symlink_file entries
    targets = session.sql('SELECT * FROM install_targets WHERE scan_id = ?', (session.scan_id,))
    declared_dests = [d for raw in rows for d in (raw.get('dest') or [])]
    declared_links = [d for raw in rows for d in (raw.get('symlink_file') or [])]
    assert len(declared_dests) == 5809 and len(declared_links) == 776
    assert len(targets) == 6584
    assert len({t['dest'] for t in targets}) == 6580
    assert sum(t['directory'] for t in targets) == 11
    assert sum(t['link_target_path'] is not None for t in targets) == 776
    assert all(t['link_target_id'] is not None
               for t in targets if t['link_target_path'] is not None)
    assert {t['dest'] + '/' for t in targets if t['directory']} <= set(declared_dests)
    assert all(t['partition'] == t['dest'].split('/')[0] for t in targets)

    # attribution, recomputed here from the components table without the collector
    components = {c['name']: c for c in session.sql(
        'SELECT id, name, subsystem, manifest FROM components WHERE scan_id = ?',
        (session.scan_id,))}
    by_directory = {c['manifest'].rsplit('/', 1)[0]: c
                    for c in components.values() if c['manifest']}

    def nearest(label):
        parts = label[2:].split(':')[0].split('/')
        for depth in range(len(parts), 0, -1):
            found = by_directory.get('/'.join(parts[:depth]))
            if found is not None:
                return found
        return None

    expected = Counter()
    for row, raw in zip(stored, rows):
        label = strip_label(raw.get('label')) if isinstance(raw.get('label'), str) else None
        part = raw.get('part_name')
        declared = part if isinstance(part, str) and part and ',' not in part else None
        owner = nearest(label) if label else None
        name = owner['name'] if owner is not None else declared
        # Disjoint buckets, matching the design doc's table: a disagreement is
        # counted as a conflict, not also as a clean bundle match.
        expected['conflict' if owner is not None and declared and owner['name'] != declared
                 else 'bundle' if owner is not None
                 else 'part_name' if declared
                 else 'comma' if isinstance(part, str) and ',' in part
                 else 'unresolved'] += 1
        assert row['component_id'] == (components[name]['id'] if name else None), raw.get('label')
    assert expected == {'bundle': 5365, 'part_name': 121, 'comma': 10, 'unresolved': 2,
                        'conflict': 8}, expected

    tags = session.sql('SELECT * FROM install_module_tags WHERE scan_id = ?', (session.scan_id,))
    assert len(tags) == sum(len(raw.get('innerapi_tags') or []) for raw in rows) == 1061
    assert len({t['value'] for t in tags}) == 11

    issues = Counter(i['code'] for i in session.issues('install_modules'))
    assert issues == {'MODULE_SUBSYSTEM_DIFFERS': 35, 'MODULE_PART_AMBIGUOUS': 10,
                      'MODULE_COMPONENT_CONFLICT': 8, 'INSTALL_DEST_AMBIGUOUS': 8,
                      'MODULE_COMPONENT_UNRESOLVED': 2,
                      'TARGET_DIRECTORY_UNDECLARED': 1, 'TARGET_MISSING': 1}, issues
    assert all(i['advisory'] for i in session.issues('install_modules'))

    # every declaration domain reaches the module that installed its artifact,
    # and none of them keeps a label of its own any more
    links = {}
    for table, column, count in (('services', 'cfg', 163), ('hdis', 'library', 46),
                                 ('sas', 'libpath', 161)):
        columns = session.sql(f'SELECT * FROM {table} WHERE scan_id = ? LIMIT 1',
                              (session.scan_id,))[0]
        assert 'label' not in columns and 'install_module_id' in columns, table
        rows = session.sql(
            f'SELECT t.{column} AS artifact, m.label AS installed '
            f'FROM {table} t JOIN install_modules m ON m.id = t.install_module_id '
            'WHERE t.scan_id = ?', (session.scan_id,))
        assert len(rows) == count, (table, len(rows))
        assert all(r['installed'] for r in rows), table
        links[table] = len(rows)

    # the published label is the installing module's, for all three
    for domain, table, count in (('services', 'services', 163), ('hdi', 'hdis', 46),
                                 ('sas', 'sas', 161)):
        labels = {r['installed'] for r in session.sql(
            f'SELECT m.label AS installed FROM {table} t '
            'JOIN install_modules m ON m.id = t.install_module_id WHERE t.scan_id = ?',
            (session.scan_id,))}
        published = {r['label'] for r in session.records(domain) if 'label' in r}
        assert published == labels, domain
        assert len([r for r in session.records(domain) if 'label' in r]) == count, domain

    # the index answers the three questions it exists for
    assert session.install_module('//foundation/ability/ability_base:base') is not None
    assert session.owner_of('system/etc/init/access_token.cfg').name == 'access_token'
    assert [m.label for m in session.installed_at('system/app/PortalLogin/entry.hap')] == [
        '//foundation/communication/wifi/wifi/application/portal_login:portal_login_hap']
    return dict(modules=5506, targets=5809, unique_dests=5805, directory_installs=11,
                attributed=5494, tags=len(tags), attribution=dict(expected),
                linked_from=links)


# ---- installed ELF dependencies --------------------------------------------

LIB64_ORDER = (
    '/system/lib64', '/vendor/lib64', '/vendor/lib64/chipsetsdk',
    '/system/lib64/ndk', '/system/lib64/chipset-pub-sdk',
    '/system/lib64/chipset-sdk', '/system/lib64/platformsdk',
    '/system/lib64/priv-platformsdk', '/system/lib64/priv-module',
    '/system/lib64/module', '/system/lib64/module/data',
    '/system/lib64/module/multimedia', '/system/lib', '/vendor/lib',
    '/system/lib/ndk', '/system/lib/chipset-pub-sdk',
    '/system/lib/chipset-sdk', '/system/lib/platformsdk',
    '/system/lib/priv-platformsdk', '/system/lib/priv-module',
    '/system/lib/module', '/system/lib/module/data',
    '/system/lib/module/multimedia', '/lib64', '/lib', '/usr/local/lib',
    '/usr/lib',
)
LIB_ORDER = (
    '/system/lib', '/vendor/lib', '/vendor/lib/chipsetsdk',
    '/system/lib/ndk', '/system/lib/chipset-pub-sdk',
    '/system/lib/chipset-sdk', '/system/lib/platformsdk',
    '/system/lib/priv-platformsdk', '/system/lib/priv-module',
    '/system/lib/module', '/system/lib/module/data',
    '/system/lib/module/multimedia', '/lib', '/usr/local/lib', '/usr/lib',
)
# ELFWalker only walks packages/phone/system and packages/phone/vendor, so a
# library installed anywhere else can never be the file a DT_NEEDED name loads.
MATCH_PARTITIONS = ('system', 'vendor')


def _directory_rank(dest):
    path = '/' + dest
    order = LIB64_ORDER if path.find('/lib64/') > 0 else LIB_ORDER
    directory = path.rsplit('/', 1)[0]
    return order.index(directory) if directory in order else 1000


def _readelf_dynamic(path):
    completed = subprocess.run(['readelf', '-d', '--', str(path)],
                               capture_output=True, text=True)
    if completed.returncode:
        raise ValueError('READELF_FAILED')
    needed, soname = [], None
    for line in completed.stdout.splitlines():
        match = re.search(r'\(NEEDED\).*\[(.*)\]$', line)
        if match:
            needed.append(match.group(1))
            continue
        match = re.search(r'\(SONAME\).*\[(.*)\]$', line)
        if match:
            soname = match.group(1)
    return tuple(needed), soname


def verify_elf_modules(session, package):
    """Independent physical-file/readelf oracle for ELF metadata and direct edges."""
    rows, _ = source_json(package / 'system_module_info.json')
    selected = {}
    for raw in rows:
        for value in raw.get('dest') or []:
            if not isinstance(value, str) or value.endswith('/'):
                continue
            parts = [part for part in value.split('/') if part not in ('', '.')]
            if not parts or '..' in parts or value.startswith('/'):
                continue
            selected['/'.join(parts)] = value       # later declaration wins

    expected = {}
    for dest in sorted(selected):
        path = package / dest
        try:
            with path.open('rb') as handle:
                if handle.read(4) != b'\x7fELF':
                    continue
                needed, soname = _readelf_dynamic(path)
            expected[dest] = dict(needed=needed, soname=soname)
        except (OSError, ValueError):
            continue
    assert len(expected) == 3520

    symlink_aliases = {}
    for raw in rows:
        for value in raw.get('symlink_file') or []:
            if not isinstance(value, str) or value.endswith('/'):
                continue
            parts = [part for part in value.split('/') if part not in ('', '.')]
            if not parts or '..' in parts or value.startswith('/'):
                continue
            dest = '/'.join(parts)
            path = package / dest
            try:
                if not path.is_symlink():
                    continue
                target = path.resolve().relative_to(package.resolve()).as_posix()
            except (OSError, ValueError):
                continue
            if (target in expected and dest.split('/', 1)[0] in MATCH_PARTITIONS):
                symlink_aliases.setdefault(dest.rsplit('/', 1)[-1], []).append(
                    (dest, target))

    elf_columns = {row['name'] for row in session.sql('PRAGMA table_info(elf_modules)')}
    edge_columns = {row['name'] for row in session.sql(
        'PRAGMA table_info(elf_module_dependencies)')}
    assert not {'dest', 'engine'} & elf_columns
    assert 'callee_dest' not in edge_columns

    elves = session.sql(
        'SELECT e.*, t.dest FROM elf_modules e '
        'JOIN install_targets t ON t.scan_id = e.scan_id AND t.id = e.install_target_id '
        'WHERE e.scan_id = ? ORDER BY t.dest', (session.scan_id,))
    assert len(elves) == len(expected)
    assert {row['dest'] for row in elves} == set(expected)
    for row in elves:
        oracle = expected[row['dest']]
        assert json.loads(row['needed']) == list(oracle['needed']), row['dest']
        assert row['soname'] == oracle['soname'], row['dest']

    by_file_name, by_soname = {}, {}
    for dest in sorted(expected):
        if dest.split('/', 1)[0] in MATCH_PARTITIONS:
            by_file_name.setdefault(dest.rsplit('/', 1)[-1], []).append((dest, dest))
            soname = expected[dest]['soname']
            if soname is not None:
                by_soname.setdefault(soname, []).append((dest, dest))
    oracle_edges = {}
    for caller, info in expected.items():
        for ordinal, name in enumerate(info['needed']):
            wanted = name.rsplit('/', 1)[-1]
            candidates = (by_file_name.get(wanted, [])
                          + symlink_aliases.get(wanted, []))
            if not candidates:
                candidates = by_soname.get(wanted, ())
            winner = (min(enumerate(candidates),
                          key=lambda item: (_directory_rank(item[1][0]), item[0]))[1][1]
                      if candidates else None)
            oracle_edges[(caller, ordinal)] = (name, winner)

    stored = session.sql(
        'SELECT e.*, caller_t.dest AS caller_dest, callee_t.dest AS callee_dest_stored, '
        'callee.partition AS callee_partition '
        'FROM elf_module_dependencies e '
        'JOIN elf_modules caller ON caller.scan_id = e.scan_id AND caller.id = e.caller_id '
        'JOIN install_targets caller_t '
        'ON caller_t.scan_id = caller.scan_id '
        'AND caller_t.id = caller.install_target_id '
        'LEFT JOIN elf_modules callee '
        'ON callee.scan_id = e.scan_id AND callee.id = e.callee_id '
        'LEFT JOIN install_targets callee_t '
        'ON callee_t.scan_id = callee.scan_id '
        'AND callee_t.id = callee.install_target_id '
        'WHERE e.scan_id = ? ORDER BY caller_dest, needed_ordinal', (session.scan_id,))
    actual_edges = {(row['caller_dest'], row['needed_ordinal']):
                    (row['needed_name'], row['callee_dest_stored'])
                    for row in stored}
    assert actual_edges == oracle_edges
    assert len(actual_edges) == 33367
    assert sum(row['callee_id'] is not None for row in stored) == 33367
    assert all(row['callee_partition'] in MATCH_PARTITIONS
               for row in stored if row['callee_id'] is not None)

    issues = Counter(row['code'] for row in session.issues('elf_modules'))
    assert issues == Counter({'HDI_INDEX_INCOMPLETE': 1})
    unresolved = sum(row['callee_id'] is None for row in stored)
    api_rows = session.sql(
        'SELECT api_type, COUNT(*) AS count FROM elf_modules '
        'WHERE scan_id = ? GROUP BY api_type', (session.scan_id,))
    api_types = {row['api_type']: row['count'] for row in api_rows}
    categories = {
        tag: session.sql(
            'SELECT COUNT(*) AS count FROM elf_modules WHERE scan_id = ? '
            'AND EXISTS (SELECT 1 FROM json_each(category) WHERE value = ?)',
            (session.scan_id, tag))[0]['count']
        for tag in ('napi', 'ndk', 'ani', 'cangjie', 'extension',
                    'platform_sdk', 'platform_sdk_indirect', 'chipset_sdk',
                    'chipset_sdk_indirect', 'sa', 'hdi', 'hdi_proxy',
                    'hdi_stub', 'anco', 'other')
    }
    assert api_types == {
        'public_api': 1103, 'inner_api': 1265, 'internal_api': 1152}
    assert categories == {
        'napi': 626, 'ndk': 133, 'ani': 305, 'cangjie': 0,
        'extension': 39, 'platform_sdk': 514,
        'platform_sdk_indirect': 252, 'chipset_sdk': 44,
        'chipset_sdk_indirect': 28, 'sa': 157, 'hdi': 46,
        'hdi_proxy': 118, 'hdi_stub': 107, 'anco': 0, 'other': 1260}
    return dict(elf_modules=len(elves), needed=len(actual_edges),
                resolved=len(actual_edges) - unresolved, unresolved=unresolved,
                api_types=api_types, categories=categories)


# ---- services ---------------------------------------------------------------

def verify_services(session, package):
    cfgs = sorted({p for p in package.rglob('*.cfg')
                   if any(p.parts[i:i + 2] == ('etc', 'init') for i in range(len(p.parts) - 1))})
    expected = []
    for cfg in cfgs:
        document, duplicates = source_json(cfg)
        assert not duplicates, cfg
        expected.extend((cfg.relative_to(package).as_posix(), raw)
                        for raw in document.get('services', []) if isinstance(raw, dict))
    rows = session.sql('SELECT * FROM services WHERE scan_id = ? ORDER BY position',
                       (session.scan_id,))
    records = session.records('services')
    assert len(cfgs) == 148 and len(expected) == len(rows) == len(records) == 164

    for (cfg, raw), row, record in zip(expected, rows, records):
        assert row['cfg'] == cfg == record['cfg']
        # record column: the declaration itself, byte-exact
        assert canonical(json.loads(row['record'], parse_float=Decimal)) == canonical(raw)
        # published record: that declaration transformed, and reversibly so
        assert canonical(raw_service(record)) == canonical(raw)
        assert 'path' not in record and 'path' not in record.get('config', {})
        if 'path' in raw:
            assert record['executable'] == raw['path'][0]
            assert canonical(record['args']) == canonical(raw['path'][1:])
        # columns only project the record; a value a column cannot hold is NULL
        for column, key in (('name', 'name'), ('uid', 'uid')):
            if isinstance(raw.get(key), str):
                assert row[column] == raw[key]
            elif key in raw:
                assert row[column] is None

    assert len({r['name'] for r in records if isinstance(r.get('name'), str)}) == 159
    assert len({k for r in records for k in raw_service(r)}) == 29
    types = Counter(r.get('type', 'absent') for r in records)
    assert types == {'sa': 104, 'hdf': 28, 'default': 31, 'absent': 1}

    attributed = {r['cfg']: r.get('component') for r in records}
    assert sum(1 for r in records if 'component' in r) == 163
    assert attributed['system/etc/init/bootanimation.cfg']['name'] == 'graphic_2d'
    # subsystem comes from the build index, which overrides a manifest that
    # disagrees (this cfg's owner is one of the two SUBSYSTEM_DIFFERS cases)
    assert attributed['vendor/etc/init/hdf_devhost.cfg'] == dict(
        name='product_rk3568', subsystem='product_rk3568',
        manifest='vendor/hihope/rk3568/ohos.build')
    assert attributed['eng_system/etc/init/hdcd.cfg'] is None
    for record in records:
        if 'label' in record:
            assert '(' not in record['label']
    issues = session.issues('services')
    assert Counter(i['code'] for i in issues if not i['advisory']) == {'ORIGIN_UNMATCHED': 1}
    # Advisory findings carry a real source location, unlike the position-only
    # diagnostics they replace, and never degrade the scan on their own.
    advisory = Counter(i['code'] for i in issues if i['advisory'])
    assert advisory == {'DUPLICATE_SERVICE_NAME': 9, 'FIELD_MISSING': 1, 'FIELD_INVALID': 1}
    for issue in issues:
        if issue['advisory']:
            assert issue['pointer'].startswith('/services/') and issue['pointer'].count('/') >= 3
            assert (package / issue['path'].split('packages/phone/')[-1]).is_file()
    return dict(services=164, configs=148, distinct_names=159, raw_fields=29,
                types=dict(types), attributed=163, advisory=dict(advisory))


# ---- hdi --------------------------------------------------------------------

def decompiled_records(workspace, hcb):
    """Oracle: hc-gen decompiles the binary HCB the scanner parses itself.

    Handles only the known scalar device fields; host lines carrying unescaped
    initconfig quotes are deliberately not parsed as HCS.
    """
    tool = workspace / 'out/rk3568/obj/drivers/interface/tools/hc-gen/hc-gen'
    with tempfile.TemporaryDirectory(prefix='hdi-verify-') as tmp:
        subprocess.run([str(tool), '-d', str(hcb), '-o', str(Path(tmp) / 'device.hcs')],
                       check=True, capture_output=True, text=True)
        text = (Path(tmp) / 'device.d.hcs').read_text()
    stack, attributes, result = [], {}, []
    all_modules = re.findall(r'\bmoduleName\s*=\s*"([^"\n]*)"\s*;', text)
    for line in text.splitlines():
        line = line.strip()
        opening = re.fullmatch(r'(\w+)\s*\{', line)
        if opening:
            stack.append(opening[1])
            attributes[tuple(stack)] = {}
        elif line == '}':
            if len(stack) == 5 and stack[:2] == ['root', 'device_info']:
                result.append(dict(node='/' + '/'.join(stack),
                                   process=attributes[tuple(stack[:3])]['hostName'],
                                   raw=attributes[tuple(stack)]))
            stack.pop()
        elif stack and len(stack) in (3, 5):
            term = re.fullmatch(r'(\w+)\s*=\s*("[^"\n]*"|0x[0-9A-Fa-f]+)\s*;', line)
            if term:
                key, value = term.groups()
                attributes[tuple(stack)][key] = (value[1:-1] if value.startswith('"')
                                                 else int(value, 16))
    assert len(all_modules) == 61 and len(result) == 57
    return result


def verify_hdi(session, workspace, package):
    hcb = package / 'vendor/etc/hdfconfig/hdf_default.hcb'
    assert hcb.stat().st_size == 37974
    expected = decompiled_records(workspace, hcb)
    rows = session.sql('SELECT * FROM hdis WHERE scan_id = ? ORDER BY position',
                       (session.scan_id,))
    records = session.records('hdi')
    assert len(records) == len(rows) == 57
    assert Counter(i['code'] for i in session.issues('hdi')) == {'LIBRARY_UNMATCHED': 11}
    assert len({r['process'] for r in records}) == 27
    assert len({r['component']['name'] for r in records if 'component' in r}) == 26
    assert {r['component']['subsystem'] for r in records if 'component' in r} == {'hdf'}
    assert Counter(r['preload'] for r in records) == {0: 38, 2: 19}
    assert all(r['policy'] == 2 for r in records)

    services = session.records('services')
    modules = load(package / 'system_module_info.json')
    components = load(workspace / 'out/rk3568/build_configs/parts_info/components.json')
    missing = []
    for row, record, oracle in zip(rows, records, expected):
        assert record['node'] == oracle['node'] and record['process'] == oracle['process']
        assert canonical(raw_hdi(record)) == canonical(oracle['raw'])
        # the record column holds the node's own attributes, not the enclosing
        # host's name and not anything the scanner derived
        stored = json.loads(row['record'], parse_float=Decimal)
        assert not {'hcb', 'node', 'hostName', 'library', 'label', 'service',
                    'component'} & set(stored)
        assert 'process' not in row

        matches = [s for s in services
                   if s.get('type') == 'hdf' and '-n' in s.get('args', ())
                   and s['args'][s['args'].index('-n') + 1] == record['process']]
        assert len(matches) == 1
        assert record['service'] == dict(cfg=matches[0]['cfg'], name=matches[0]['name'])

        # Independent installation walk over physical *.so files, not the index.
        paths = [p for p in package.rglob(record['moduleName']) if p.is_file()]
        if not paths:
            assert not {'library', 'label', 'component'} & record.keys()
            missing.append(record['serviceName'])
            continue
        assert len(paths) == 1 and paths[0].relative_to(package).as_posix() == record['library']
        with paths[0].open('rb') as handle:
            assert handle.read(4) == b'\x7fELF'
        targets = [r for r in modules if record['library'] in r.get('dest', [])]
        assert len(targets) == 1
        label = targets[0]['label'].split('(')[0]
        assert (record['label'], record['component']['name']) == (label, targets[0]['part_name'])
        directory = workspace / label[2:].split(':')[0]
        while not (directory / 'bundle.json').is_file():
            assert directory != workspace
            directory = directory.parent
        assert load(directory / 'bundle.json')['component']['name'] == record['component']['name']
        # subsystem is authoritative from the components dependency
        assert components[record['component']['name']]['subsystem'] == \
            record['component']['subsystem']
    assert set(missing) == {
        'sample_driver_service', 'sample1_driver_service', 'usb_interface_service',
        'audio_hdi_service', 'audio_hdi_usb_service', 'audio_hdi_pnp_service',
        'hdi_media_layer_service', 'input_service', 'input_interfaces_service',
        'codec_hdi_omx_service', 'codec_hdi_service'}
    assert not [i for i in session.issues('hdi') if i['advisory']]
    return dict(hdis=57, hosts=27, parts=26, subsystems=1, missing_libraries=11)


# ---- system abilities -------------------------------------------------------

def verify_sas(session, workspace, package):
    build = workspace / 'out/rk3568'
    expected, profiles, skipped = [], 0, 0
    for path in sorted((package / 'system/profile').glob('*.json')):
        document, duplicates = source_json(path)
        assert not duplicates, path
        if 'systemability' not in document:
            skipped += 1
            continue
        profiles += 1
        expected.extend((path.relative_to(package).as_posix(), document['process'], raw)
                        for raw in document['systemability'])
    rows = session.sql('SELECT * FROM sas WHERE scan_id = ? ORDER BY position',
                       (session.scan_id,))
    records = session.records('sas')
    assert (profiles, skipped, len(records)) == (104, 10, 165)
    assert len(expected) == len(rows) == 165

    for (profile, process, raw), row, record in zip(expected, rows, records):
        assert record['profile'] == profile and record['service']['name'] == process
        assert canonical(raw_sa(record)) == canonical(raw)
        # record column: the systemability element only -- the profile-level
        # process belongs to the document and lives in its own column
        assert canonical(json.loads(row['record'], parse_float=Decimal)) == canonical(raw)
        assert 'process' not in row
        assert 'label' not in json.loads(row['record'])

    assert len({r['name'] for r in records}) == 165
    assert len({r['service']['name'] for r in records}) == 104
    assert len({r['component']['name'] for r in records}) == 113
    assert len({r['component']['subsystem'] for r in records}) == 47
    assert len({k for r in records for k in raw_sa(r)}) == 18
    assert sum(r['run-on-create'] is True for r in records) == 85
    assert sum(r['distributed'] is True for r in records) == 10

    # Reconcile every association against the install-info provenance chain.
    services = session.records('services')
    components = load(build / 'build_configs/parts_info/components.json')
    install = load(package / 'sa_profile/src_sa_install_info.json')
    assert len(install) == 131
    targets = {}
    for entry in install:
        info = load(build / entry['install_info_file'])
        label = info['label'].split('(')[0]
        directory = workspace / label[2:].split(':')[0]
        while not (directory / 'bundle.json').is_file():
            assert directory != workspace
            directory = directory.parent
        component = load(directory / 'bundle.json')['component']
        assert component['name'] == info['part_name'] == entry['part_name']
        subsystem = components[component['name']]['subsystem']
        for source in info['sa_info_files']:
            document = load(build / source)
            assert len(document['systemability']) == 1
            raw = document['systemability'][0]
            key = document['process'], raw['name']
            assert key not in targets
            targets[key] = (label, component['name'], subsystem, raw)
    for record in records:
        matching = [s for s in services if s.get('type') == 'sa' and s.get('args')
                    and s['args'][0] == '/' + record['profile']]
        assert len(matching) == 1
        assert record['service'] == dict(cfg=matching[0]['cfg'], name=matching[0]['name'])
        label, part, subsystem, raw = targets[(record['service']['name'], record['name'])]
        # Ownership still comes from the SA's own build inputs; `label` no
        # longer does -- it names the module that installed the implementation
        # library, which is a different target from the sa_profile one.
        assert (record['component']['name'], record['component']['subsystem']) == (part, subsystem)
        assert record.get('label') != label
        assert canonical(raw_sa(record)) == canonical(raw)
    examples = {r['name']: r for r in records if r['name'] in (401, 4606, 8300)}
    assert (examples[401]['service']['name']
            == examples[4606]['service']['name'] == 'foundation')
    assert examples[401]['component']['name'] == 'bundle_framework'
    assert examples[4606]['component']['name'] == 'window_manager'
    assert examples[8300]['component']['name'] == 'netmanager_ext'
    assert not [i for i in session.issues('sas') if i['advisory']]
    return dict(profiles=104, sas=165, processes=104, parts=113, subsystems=47,
                source_targets=len(targets))


# ---- cross-domain navigation ------------------------------------------------

def verify_navigation(session):
    """The unified model must agree with the foreign keys it is built on."""
    assert len(session.subsystems()) == 56
    assert set(session.collectors) == {'components', 'install_modules',
                                       'elf_modules', 'services',
                                       'hdi', 'sas', 'repos', 'args',
                                       'component_links'}
    assert session.status == 'degraded'
    graphic = session.component('graphic_2d')
    assert graphic is not None
    assert 'system/etc/init/bootanimation.cfg' in {
        s['cfg'] for s in graphic.attached('services')}
    hosted = 0
    for service in session.services():
        for sa in service.hosted('sas'):
            assert sa['service']['cfg'] == service.cfg
            assert sa.component()['name'] == sa['component']['name']
            assert sa.service().id == service.id
            hosted += 1
    assert hosted == 165
    return dict(subsystems=56, sas_navigated=hosted)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--workspace-root', type=Path, required=True)
    args = parser.parse_args()
    workspace = args.workspace_root.resolve()
    package = workspace / 'out/rk3568/packages/phone'
    index_path = workspace / 'out/rk3568/build_configs/parts_info/components.json'

    with tempfile.TemporaryDirectory(prefix='rk3568-verify-') as temporary:
        database = Database(Path(temporary) / 'knowledge.db')
        request = ScanRequest(workspace_root=workspace, product='rk3568')

        # Read-boundary audit, components only: it is the one collector that reads
        # the source tree rather than the packaged output, so "what did it open"
        # is a meaningful assertion. Running it alone keeps the opens attributable.
        opened, active = [], [False]

        def audit(event, values):
            if active[0] and event == 'open' and isinstance(values[0], (str, bytes)):
                name = values[0].decode() if isinstance(values[0], bytes) else values[0]
                opened.append(Path(name).resolve())

        sys.addaudithook(audit)
        active[0] = True
        try:
            runner.run(database, request, only=['components'])
        finally:
            active[0] = False
        out_reads = [p for p in opened if p.is_relative_to((workspace / 'out').resolve())
                     and p.suffix != '.db']
        assert out_reads == [index_path.resolve()], out_reads[:5]
        manifests = [p for p in opened if p.name in ('bundle.json', 'ohos.build')]
        assert len(manifests) == len(set(manifests)) == 382, 'manifest read more than once'

        # The real run: every collector, one scan, dependencies through the store.
        result = runner.run(database, request)
        assert result.status == 'degraded'
        assert {r.collector for r in result.runs} == {
            'repos', 'components', 'args', 'install_modules',
            'component_links', 'elf_modules', 'services', 'hdi', 'sas'}

        with ScanSession.open(database, scan_id=result.scan_id) as session:
            report = dict(
                components=verify_components(session, workspace, index_path),
                install_modules=verify_install_modules(session, workspace, package),
                elf_modules=verify_elf_modules(session, package),
                services=verify_services(session, package),
                hdi=verify_hdi(session, workspace, package),
                sas=verify_sas(session, workspace, package),
                navigation=verify_navigation(session),
                issues=dict(Counter(i['code'] for i in session.issues()
                                    if not i['advisory'])),
                advisory=dict(Counter(i['code'] for i in session.issues()
                                      if i['advisory'])),
            )

        # The CLI gate is part of the contract: a degraded scan exits 4.
        completed = subprocess.run(
            [sys.executable, '-m', 'oskm.cli', 'scan', '--workspace-root', str(workspace),
             '--product', 'rk3568', '--db', str(Path(temporary) / 'gate.db'),
             '--fail-on', 'error'],
            cwd=str(PACKAGE), capture_output=True, text=True)
        assert completed.returncode == 4, (completed.returncode, completed.stderr[-2000:])
        summary = json.loads(completed.stdout.strip().splitlines()[-1])
        assert summary['collectors']['components']['records'] == 382
        report['cli_exit'] = completed.returncode

    print(json.dumps(report, ensure_ascii=False, indent=2, default=str))


if __name__ == '__main__':
    main()
