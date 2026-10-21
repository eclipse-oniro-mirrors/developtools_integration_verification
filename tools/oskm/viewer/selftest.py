#!/usr/bin/env python3
"""oskm viewer self-test: simulate the browser logic with real .db data.

Run: python3 viewer/selftest.py
Exit 0 = all checks pass; non-zero = failure.
"""
import sqlite3, sys, json, os

DB = os.path.join(os.path.dirname(__file__), 'knowledge.db')
db = sqlite3.connect(DB)
db.row_factory = sqlite3.Row

def q(sql, params=()):
    return [dict(r) for r in db.execute(sql, params).fetchall()]

def q1(sql, params=()):
    rows = q(sql, params)
    return rows[0] if rows else None

passed = failed = 0

def check(name, ok, detail=''):
    global passed, failed
    if ok:
        passed += 1
        print(f'  ✅ {name}')
    else:
        failed += 1
        print(f'  ❌ {name} {detail}')

# 1. Database loads
check('database opens', os.path.isfile(DB))

# 2. Scans table
scans = q('SELECT * FROM scans ORDER BY id DESC')
check('scans exist', len(scans) > 0, f'{len(scans)} scans')
scan_id = scans[0]['id']

# 3. Collector runs
runs = q('SELECT * FROM collector_runs WHERE scan_id = ?', (scan_id,))
# 不写死采集器个数：每加一个域就要改一次（elf_modules 上线时 6→7），而这个断言真正
# 要拦的是"某个采集器没跑或跑挂了"。degraded 是正常状态——它表示采到了数据、
# 同时记了 issues（读不到的文件之类），complete 才是全绿。
check('collector_runs', len(runs) >= 6 and all(r['status'] in ('complete', 'degraded') for r in runs),
      f"{len(runs)} collectors, status {sorted({r['status'] for r in runs})}")

# 4. Row counts
for table, expected in [('repos',525),('components',382),('install_modules',5506),
    ('install_targets',6584),('services',164),('sas',165),('hdis',57)]:
    count = q(f'SELECT COUNT(*) as c FROM {table} WHERE scan_id = ?', (scan_id,))[0]['c']
    check(f'{table} rows', count == expected, f'got {count}, expected {expected}')

# issues 的条数不由 schema 决定，而由被扫工作区当时的状态决定（读不到的文件、
# 缺失的安装目标…）：同一份代码扫两次都可能不同（164 → 169）。只验"有"。
issues = q('SELECT COUNT(*) as c FROM issues WHERE scan_id = ?', (scan_id,))[0]['c']
check('issues rows', issues > 0, f'{issues} issues')

# 5. Subsystem tree (the first thing the viewer renders)
subs = q('SELECT subsystem, COUNT(*) as c FROM components WHERE scan_id = ? AND subsystem IS NOT NULL GROUP BY subsystem ORDER BY subsystem', (scan_id,))
check('subsystem groups', len(subs) > 0, f'{len(subs)} subsystems')

# 6. Expand a subsystem → components
first_sub = subs[0]['subsystem']
comps = q('SELECT id, name, subsystem FROM components WHERE scan_id = ? AND subsystem = ? ORDER BY name', (scan_id, first_sub))
check(f'components in "{first_sub}"', len(comps) > 0, f'{len(comps)} components')

# 7. Component detail → sub-tables
comp = comps[0]
for fk_table, fk_col, label in [('services','component_id','services'),
    ('sas','component_id','sas'),('hdis','component_id','hdis'),
    ('install_modules','component_id','modules'),
    ('innerapis','component_id','innerapis')]:
    count = q(f'SELECT COUNT(*) as c FROM {fk_table} WHERE scan_id = ? AND {fk_col} = ?', (scan_id, comp['id']))[0]['c']
    check(f'component {comp["name"]} → {label}', count >= 0, f'{count} rows')

# 8. Service detail → host relationships
svc = q('SELECT * FROM services WHERE scan_id = ? AND component_id IS NOT NULL LIMIT 1', (scan_id,))
if svc:
    svc = svc[0]
    if svc['type'] == 'sa':
        sas = q('SELECT * FROM sas WHERE scan_id = ? AND service_id = ?', (scan_id, svc['id']))
        check(f'service {svc["name"]} (sa) → hosted SAs', len(sas) >= 0, f'{len(sas)} SAs')
    elif svc['type'] == 'hdf':
        hdis = q('SELECT * FROM hdis WHERE scan_id = ? AND service_id = ?', (scan_id, svc['id']))
        check(f'service {svc["name"]} (hdf) → hosted HDIs', len(hdis) >= 0, f'{len(hdis)} HDIs')
    check('service has record', svc.get('record') is not None)

# 9. Repo → components
repo = q('SELECT * FROM repos WHERE scan_id = ? LIMIT 1', (scan_id,))[0]
repo_comps = q('SELECT id, name FROM components WHERE scan_id = ? AND repo_id = ? ORDER BY name', (scan_id, repo['id']))
check(f'repo {repo["name"]} → components', len(repo_comps) > 0, f'{len(repo_comps)} components')

# 10. Issues for a component
comp_issues = q('SELECT * FROM issues WHERE scan_id = ? AND component = ? ORDER BY severity', (scan_id, comp['name']))
check(f'issues for {comp["name"]}', len(comp_issues) >= 0, f'{len(comp_issues)} issues')

# 11. Install module → install targets
mod = q('SELECT * FROM install_modules WHERE scan_id = ? AND component_id IS NOT NULL LIMIT 1', (scan_id,))
if mod:
    mod = mod[0]
    targets = q('SELECT * FROM install_targets WHERE scan_id = ? AND module_id = ? ORDER BY dest_index', (scan_id, mod['id']))
    check(f'install_module → targets', len(targets) > 0, f'{len(targets)} targets')

# 12. Search simulation
for kw, tables in [
    ('ability', [('components',['name']),('repos',['name','path'])]),
    ('hdcd', [('services',['name','cfg'])]),
]:
    total_matches = 0
    for table, cols in tables:
        where = ' OR '.join(f'{c} LIKE ?' for c in cols)
        rows = q(f'SELECT id, {cols[0]} as label FROM {table} WHERE scan_id = ? AND ({where}) LIMIT 5',
            (scan_id, *([f'%{kw}%'] * len(cols))))
        total_matches += len(rows)
    check(f'search "{kw}"', total_matches > 0, f'{total_matches} matches across {len(tables)} tables')

# 13. ELF viewer queries: physical columns are slim, display values are JOINed back.
elf_columns = {r['name'] for r in q('PRAGMA table_info(elf_modules)')}
edge_columns = {r['name'] for r in q('PRAGMA table_info(elf_module_dependencies)')}
check('ELF redundant columns removed',
      not {'dest', 'engine'} & elf_columns
      and not {'callee_dest', 'resolution'} & edge_columns,
      f'elf={sorted(elf_columns)}, edge={sorted(edge_columns)}')

elf_rows = q('''
    SELECT e.id, t.dest, e.partition, e.file_name, e.soname, e.format, e.type,
           e.machine, e.dynamic, e.needed, e.install_target_id, e.install_module_id,
           e.component_id
      FROM elf_modules e
      JOIN install_targets t
        ON t.scan_id = e.scan_id AND t.id = e.install_target_id
     WHERE e.scan_id = ?
     ORDER BY t.dest LIMIT 20''', (scan_id,))
elf_total = q('SELECT COUNT(*) AS c FROM elf_modules WHERE scan_id = ?', (scan_id,))[0]['c']
check('ELF list reconstructs dest', len(elf_rows) == min(20, elf_total)
      and all(r['dest'] for r in elf_rows), f'{len(elf_rows)} rows / {elf_total} total')

edge_rows = q('''
    SELECT d.id, d.needed_name, callee_t.dest AS callee_dest
      FROM elf_module_dependencies d
      LEFT JOIN elf_modules callee
        ON callee.scan_id = d.scan_id AND callee.id = d.callee_id
      LEFT JOIN install_targets callee_t
        ON callee_t.scan_id = callee.scan_id
       AND callee_t.id = callee.install_target_id
     WHERE d.scan_id = ?
     ORDER BY d.id LIMIT 50''', (scan_id,))
edge_total = q('SELECT COUNT(*) AS c FROM elf_module_dependencies WHERE scan_id = ?',
               (scan_id,))[0]['c']
check('ELF edges reconstruct callee_dest',
      len(edge_rows) == min(50, edge_total)
      and all(r['callee_dest'] is not None for r in edge_rows),
      f'{len(edge_rows)} rows')

print(f'\n{"="*40}')
print(f'Passed: {passed}  Failed: {failed}')
sys.exit(1 if failed else 0)
