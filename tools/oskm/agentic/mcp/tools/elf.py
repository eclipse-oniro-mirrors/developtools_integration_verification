"""ELF module: dependency graph BFS and reverse lookup."""
from __future__ import annotations

from ..tools import register, ToolError


@register('search_elf_modules', '模糊搜索 ELF 模块', {
    'type': 'object',
    'properties': {
        'query': {'type': 'string'},
        'partition': {'type': 'string'},
        'component': {'type': 'string'},
        'limit': {'type': 'integer', 'default': 20},
    },
    'required': ['query'],
})
def search_elf_modules(params, manager):
    session = manager.get_active()
    limit = min(params.get('limit', 20), 100)
    pattern = f'%{params["query"]}%'
    clauses = ['e.scan_id = ?', '(e.soname LIKE ? OR e.file_name LIKE ?)']
    vals = [session.scan_id, pattern, pattern]
    if params.get('partition'):
        clauses.append('e.partition = ?')
        vals.append(params['partition'])
    if params.get('component'):
        clauses.append('e.component_id IN (SELECT id FROM components WHERE scan_id = ? AND name = ?)')
        vals.extend([session.scan_id, params['component']])
    vals.append(limit)
    rows = session.sql(
        f"SELECT e.id, t.dest, e.soname, e.file_name, e.partition, "
        f"c.name AS component FROM elf_modules e "
        f"JOIN install_targets t ON t.scan_id = e.scan_id AND t.id = e.install_target_id "
        f"LEFT JOIN components c ON c.scan_id = e.scan_id AND c.id = e.component_id "
        f"WHERE {' AND '.join(clauses)} ORDER BY e.file_name LIMIT ?", tuple(vals))
    return {'results': [dict(r) for r in rows], 'total': len(rows)}


@register('elf_dependencies', 'ELF 依赖闭包 BFS', {
    'type': 'object',
    'properties': {
        'dest': {'type': 'string', 'description': 'Image ELF file path'},
        'direction': {'type': 'string', 'default': 'forward',
                      'description': 'forward or reverse'},
        'max_distance': {'type': 'integer'},
    },
    'required': ['dest'],
})
def elf_dependencies(params, manager):
    session = manager.get_active()
    dest = params['dest']
    direction = params.get('direction', 'forward')
    max_dist = params.get('max_distance')

    root = session.sql(
        'SELECT id, dest, soname, partition, component_id FROM elf_modules '
        'WHERE scan_id = ? AND dest = ?', (session.scan_id, dest))
    if not root:
        raise ToolError('NOT_FOUND', f'ELF module not found: {dest}')
    root_id = root[0]['id']

    if direction == 'reverse':
        caller_col, callee_col = 'callee_id', 'caller_id'
    else:
        caller_col, callee_col = 'caller_id', 'callee_id'

    max_clause = f'AND c.distance + 1 <= {int(max_dist)}' if max_dist else ''

    sql = f"""
    WITH RECURSIVE closure AS (
        SELECT e.id, e.dest, e.soname, e.partition, e.component_id,
               0 AS distance, '' AS path
          FROM elf_modules e WHERE e.id = ?
        UNION ALL
        SELECT c2.id, c2.dest, c2.soname, c2.partition, c2.component_id,
               c.distance + 1,
               c.path || '|' || c2.dest
          FROM elf_module_dependencies d
          JOIN elf_modules caller ON caller.scan_id = d.scan_id AND caller.id = d.{caller_col}
          JOIN closure c ON c.id = caller.id
          LEFT JOIN elf_modules c2 ON c2.scan_id = d.scan_id AND c2.id = d.{callee_col}
         WHERE d.scan_id = ? {max_clause}
    )
    SELECT * FROM closure WHERE distance > 0 ORDER BY distance, dest
    """
    rows = session.sql(sql, (root_id, session.scan_id))
    reachable = []
    for r in rows:
        path_parts = [p for p in (r['path'] or '').split('|') if p]
        path_parts.insert(0, dest)
        if r['dest']:
            path_parts.append(r['dest'])
        comp_name = None
        if r['component_id']:
            cn = session.sql('SELECT name FROM components WHERE id = ?', (r['component_id'],))
            if cn:
                comp_name = cn[0]['name']
        reachable.append({
            'dest': r['dest'], 'soname': r['soname'],
            'partition': r['partition'],
            'component': comp_name, 'component_id': r['component_id'],
            'distance': r['distance'],
            'via': ' → '.join(path_parts),
        })

    unresolved = session.sql(
        'SELECT d.needed_name, caller.dest AS caller_dest '
        'FROM elf_module_dependencies d '
        'JOIN elf_modules caller ON caller.scan_id = d.scan_id AND caller.id = d.caller_id '
        f'WHERE d.scan_id = ? AND d.callee_id IS NULL '
        f"AND caller.id IN (SELECT id FROM closure WHERE 1=1)",
        (session.scan_id,)) if direction != 'reverse' else []
    # Simplified: just get unresolved from root's direct edges
    unresolved = session.sql(
        'SELECT d.needed_name, caller.dest AS caller_dest '
        'FROM elf_module_dependencies d '
        'JOIN elf_modules caller ON caller.scan_id = d.scan_id AND caller.id = d.caller_id '
        'WHERE d.scan_id = ? AND d.callee_id IS NULL',
        (session.scan_id,)) if direction == 'forward' else []

    return {
        'root': dest,
        'direction': direction,
        'reachable': reachable,
        'unresolved': [dict(r) for r in unresolved],
    }


@register('elf_dependents', '直接反向依赖', {
    'type': 'object',
    'properties': {'dest': {'type': 'string'}},
    'required': ['dest'],
})
def elf_dependents(params, manager):
    session = manager.get_active()
    dest = params['dest']
    root = session.sql(
        'SELECT id FROM elf_modules WHERE scan_id = ? AND dest = ?',
        (session.scan_id, dest))
    if not root:
        raise ToolError('NOT_FOUND', f'ELF module not found: {dest}')
    rows = session.sql(
        'SELECT caller.id, caller.dest, caller.soname, caller.partition, '
        'caller.component_id, c.name AS component '
        'FROM elf_module_dependencies d '
        'JOIN elf_modules caller ON caller.scan_id = d.scan_id AND caller.id = d.caller_id '
        'LEFT JOIN components c ON c.scan_id = caller.scan_id AND c.id = caller.component_id '
        'WHERE d.scan_id = ? AND d.callee_id = ?',
        (session.scan_id, root[0]['id']))
    return {'dest': dest, 'dependents': [dict(r) for r in rows]}
