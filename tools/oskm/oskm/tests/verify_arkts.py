#!/usr/bin/env python3
"""Independent SDK inventory/AST/evidence audit, using a disposable SQLite store."""
import argparse
from collections import Counter
import hashlib
import json
import os
from pathlib import Path
import resource
import subprocess
import sys
import tempfile
import time

PACKAGE = Path(__file__).resolve().parents[2]
# `oskm_cli` 是独立产物，住在 packages/oskm/cli/；查询侧的 ArktsQuery 在那里。
sys.path.insert(0, str(PACKAGE))
sys.path.insert(0, str(PACKAGE / 'cli'))
from oskm.core.db import Database
from oskm.core.io import canonical
from oskm.core.models import ScanRequest
from oskm.core.runner import run
from oskm.core.session import ScanSession
from oskm_cli.query.arkts import ArktsQuery, export_document
from oskm.collectors.arkts.models import NODE_PATH


SDK_RELATIVE = 'interface/sdk-js/'


def verify_implementations(session, document, cpu_arch):
    """Re-derive the implementation mapping from the bundled map.

    Checks the collector's classification and link against the input file
    directly, rather than trusting the join it already performed.
    """
    from oskm.collectors.arkts.models import arch_library_path, arkui_engine_so
    from oskm.collectors.arkts.napi import NAPI_MAP_PATH
    declared = {arch_library_path(path, cpu_arch) for path in
                json.loads(NAPI_MAP_PATH.read_text())['module_to_so'].values()}
    # Installed evidence wins over the architecture fallback.  The fallback is
    # needed when ELF/install collection is unavailable, and when multiple
    # distinct ArkUI destinations make the link genuinely ambiguous.
    engine_file = 'libace_engine_pa_ark.z.so'
    destinations = tuple(row[0] for row in session.connection.execute(
        'SELECT DISTINCT t.dest FROM install_targets t '
        'JOIN elf_modules e ON e.install_target_id = t.id '
        'AND e.scan_id = t.scan_id WHERE t.scan_id = ? '
        'AND (t.dest = ? OR substr(t.dest, -length(?) - 1) = ?) '
        'ORDER BY t.dest',
        (session.scan_id, engine_file, engine_file, '/' + engine_file)).fetchall())
    engine = (destinations[0] if len(destinations) == 1
              else arkui_engine_so(cpu_arch))
    kinds = {m['module_key']: m['implementation_kind'] for m in document['modules']}
    rows = session.connection.execute(
        'SELECT module_key, impl_so_path, impl_match, impl_elf_id FROM arkts_modules '
        'WHERE scan_id = ?', (session.scan_id,)).fetchall()
    for row in rows:
        kind = kinds[row['module_key']]
        if row['impl_so_path'] is None:
            # 没有实现路径 = 不知道由谁实现，与"路径不在镜像里"是两回事
            assert kind not in ('napi', 'arkui'), (row['module_key'], kind)
            continue
        if kind == 'arkui':
            assert row['impl_so_path'] == engine, row['impl_so_path']
            assert row['impl_match'] == 'arkui_engine', row['impl_match']
        else:
            assert kind == 'napi', (row['module_key'], kind)
            assert row['impl_so_path'] in declared, row['impl_so_path']
            assert row['impl_match'] in ('module_name', 'declaration_path', 'name_suffix')
    # A resolved link must point at the exact per-scan path. Architecture
    # normalisation already happened while projecting the reference data.
    for row in session.connection.execute(
            'SELECT m.impl_so_path, t.dest FROM arkts_modules m '
            'JOIN elf_modules e ON e.id = m.impl_elf_id '
            'JOIN install_targets t ON t.id = e.install_target_id '
            'WHERE m.scan_id = ?', (session.scan_id,)):
        assert row['dest'] == row['impl_so_path'], dict(row)


def verify_domain(session, workspace, cpu_arch):
    sdk = workspace/'interface/sdk-js'
    expected = sorted(p.relative_to(sdk).as_posix() for root in ('api', 'arkts', 'kits')
                      for p in (sdk/root).rglob('*') if p.is_file() and p.name.endswith(('.d.ts', '.d.ets')))
    document = export_document(session)
    files = document['sources']
    key = lambda path: path.removeprefix(SDK_RELATIVE)
    assert sorted(key(f['source_path']) for f in files) == expected
    # The module inventory is the file inventory with the language suffix
    # removed, derived here from disk rather than from what the scan produced.
    suffixes = ('.static.d.ets', '.d.ets', '.d.ts')
    strip = lambda name: next(name[:-len(s)] for s in suffixes if name.endswith(s))
    assert sorted(m['module_key'] for m in document['modules']) == sorted(
        {strip(name) for name in expected if not name.startswith('kits/')})
    assert sorted(k['kit_key'] for k in document['kits'] if k['origin'] == 'entry_backed') == sorted(
        {Path(strip(name)).name for name in expected if name.startswith('kits/')})
    data = {f['source_path']: (workspace/f['source_path']).read_bytes() for f in files}
    # 逐文件摘要不再入库，改核对 scope 里的总摘要——它才是输入身份的凭据
    expected_digest = hashlib.sha256(canonical(sorted(
        (f['source_path'], hashlib.sha256(data[f['source_path']]).hexdigest(), f['read_status'])
        for f in files))).hexdigest()
    assert expected_digest == ArktsQuery(session).scope['files_digest'], 'files_digest 与源码不符'
    for f in files:
        if 'header_span' in f:
            start, end = f['header_span']
            # The header text is not stored; the span must still be a valid
            # character-boundary slice of the file it points into.
            assert data[f['source_path']][start:end].decode()
    for r in document['kit_relations']:
        assert data[r['source_path']][r['start_byte']:r['end_byte']].decode() == r['record']
    # Independent direct Compiler API traversal: no production adapters/extractors.
    script = r'''
const fs=require('fs'), path=require('path');
const ts=require(path.join(process.argv[1],'build-tools/node_modules/typescript/lib/typescript.js'));
const files=JSON.parse(fs.readFileSync(0,'utf8')), refs=[];
for(const name of files) {
  const text=fs.readFileSync(path.join(process.argv[1],name),'utf8');
  const sf=ts.createSourceFile(name,text,ts.ScriptTarget.Latest,true,ts.ScriptKind.TS);
  if(sf.parseDiagnostics.length) throw Error('oracle syntax failure: '+name);
  for(const n of sf.statements) if((ts.isImportDeclaration(n)||ts.isExportDeclaration(n))&&n.moduleSpecifier) {
    refs.push([name,n.moduleSpecifier.text,Buffer.byteLength(text.slice(0,n.getStart(sf))),Buffer.byteLength(text.slice(0,n.end))]);
  }
}
process.stdout.write(JSON.stringify(refs));
'''
    env = {k:v for k,v in os.environ.items() if k not in ('NODE_OPTIONS','NODE_PATH')}
    entries = [key(f['source_path']) for f in files if f['role'] == 'kit_entry']
    oracle = subprocess.run([str(workspace/NODE_PATH), '-e', script, str(sdk)], input=json.dumps(entries),
                            capture_output=True, text=True, check=True, timeout=30, env=env)
    expected_refs = sorted(json.loads(oracle.stdout))
    actual_refs = sorted([key(r['source_path']),r['target_text'],r['start_byte'],r['end_byte']]
                         for r in document['kit_relations'] if r['relation_type']=='entry_reference')
    assert expected_refs == actual_refs
    # Every entry reference must now land on exactly one module: the dual
    # dynamic/static declaration is the same module, not two candidates.
    unresolved = [r for r in document['kit_relations'] if r['relation_type']=='entry_reference'
                  and r['resolution_status']=='ambiguous']
    assert not unresolved, unresolved[:3]
    q = ArktsQuery(session)
    # Independent manual reference samples, separate from the AST oracle.
    assert '@kit.AbilityKit' in {r['kit_key'] for r in q.module_kits('api/@ohos.app.ability.UIAbility')['items']}
    assert '@kit.ArkUI' in {r['kit_key'] for r in q.module_kits('api/@internal/component/ets/button')['items']}
    assert [d['read_status'] for d in q.get_module('api/@internal/ets/global')['declarations']['items']] == ['encoding_failed']
    # A module with both language variants exposes both of its files.
    dual = q.list_modules(language_coverage='both')['items'][0]['module_key']
    assert sorted(d['language_variant'] for d in q.get_module(dual)['declarations']['items']) == ['dynamic', 'static']
    verify_implementations(session, document, cpu_arch)
    assert session.connection.execute('PRAGMA foreign_key_check').fetchall() == []
    assert session.connection.execute('SELECT count(*) FROM arkts_kit_relations r '
        'JOIN arkts_sources s ON s.id=r.source_id WHERE r.scan_id!=s.scan_id '
        "OR (r.relation_type='entry_reference' AND r.kit_id IS NOT s.kit_id) "
        "OR (r.relation_type='declared_membership' AND r.module_id IS NOT s.module_id)").fetchone()[0] == 0
    return dict(counts=q.scope['counts'], quality=q.scope['quality'], coverage=q.scope['coverage'],
        statements=dict(Counter(r['statement_kind'] for r in document['kit_relations'])),
        resolution=dict(Counter(r['resolution_status'] for r in document['kit_relations'] if r['relation_type']=='entry_reference')),
        conditions=dict(Counter(r['condition_state'] for r in document['kit_relations'] if r['relation_type']=='entry_reference')),
        input_bytes=sum(len(v) for v in data.values()), largest_file_bytes=max(map(len,data.values())),
        evidence_bytes=q.scope['evidence_bytes'], input_digest=q.scope['input_digest'],
        implementations=dict(zip(('rows', 'resolved'), session.connection.execute(
            'SELECT COUNT(impl_so_path), COUNT(impl_elf_id) FROM arkts_modules WHERE scan_id=?',
            (session.scan_id,)).fetchone())),
        kinds=dict(session.connection.execute(
            'SELECT implementation_kind, COUNT(*) FROM arkts_modules WHERE scan_id=? '
            'GROUP BY 1 ORDER BY 1', (session.scan_id,)).fetchall()),
        issues=[dict(r) for r in session.connection.execute("SELECT code,count(*) n FROM issues WHERE scan_id=? AND collector='arkts' GROUP BY code", (session.scan_id,))])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--workspace-root', type=Path, required=True)
    args = parser.parse_args()
    workspace = args.workspace_root.resolve()
    started = time.monotonic()
    with tempfile.TemporaryDirectory(prefix='oskm-arkts-verify-') as temp:
        database = Database(Path(temp)/'knowledge.db')
        request = ScanRequest(workspace, 'sdk-source')
        result = run(database, request, only=('arkts',), without=('repos',))
        scan_seconds = time.monotonic() - started
        with ScanSession.open(database, scan_id=result.scan_id) as session:
            report = verify_domain(session, workspace, request.cpu_arch)
        report.update(scan_seconds=round(scan_seconds,3), total_seconds=round(time.monotonic()-started,3),
            db_bytes=database.path.stat().st_size, python_peak_rss_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,
            child_peak_rss_kib=resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss)
    print(json.dumps(report, ensure_ascii=False, indent=2))


if __name__ == '__main__': main()
