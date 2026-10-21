"""Query module: generic list, aggregate, and SQL escape hatch."""
from __future__ import annotations

from ..tools import register, ToolError
from ..security import check_sql, SecurityError
from .. import session as _session_mod


@register('list_entities', '通用分页列表', {
    'type': 'object',
    'properties': {
        'table': {'type': 'string'},
        'filters': {'type': 'object', 'description': 'Column-value equal filters'},
        'sort': {'type': 'string'},
        'desc': {'type': 'boolean', 'default': False},
        'page': {'type': 'object', 'properties': {
            'limit': {'type': 'integer', 'default': 100},
            'cursor': {'type': 'string'},
        }},
    },
    'required': ['table'],
})
def list_entities(params, manager):
    session = manager.get_active()
    table = params['table']
    from oskm.core.framework import tables as ft, discover
    discover()
    valid = {t.name for t in ft()}
    if table not in valid:
        raise ToolError('INVALID_TABLE', f'unknown table: {table}')

    filters = params.get('filters', {})
    page = params.get('page', {})
    limit = min(page.get('limit', 100), 1000)
    offset = 0

    clauses = ['scan_id = ?']
    vals = [session.scan_id]
    for k, v in filters.items():
        clauses.append(f'{k} = ?')
        vals.append(v)
    where = ' AND '.join(clauses)

    sort = params.get('sort')
    order = f' ORDER BY {sort} {"DESC" if params.get("desc") else "ASC"}' if sort else ''
    sql = f'SELECT * FROM {table} WHERE {where}{order} LIMIT ? OFFSET ?'
    vals.extend([limit, offset])
    rows = session.sql(sql, tuple(vals))
    total = session.sql(f'SELECT COUNT(*) AS n FROM {table} WHERE {where}',
                        tuple(vals[:-2]))[0]['n']
    return {'items': [dict(r) for r in rows], 'total': total, 'next_cursor': None}


@register('aggregate', '通用聚合', {
    'type': 'object',
    'properties': {
        'table': {'type': 'string'},
        'group_by': {'type': 'array', 'items': {'type': 'string'}},
        'filters': {'type': 'object'},
    },
    'required': ['table', 'group_by'],
})
def aggregate(params, manager):
    session = manager.get_active()
    table = params['table']
    from oskm.core.framework import tables as ft, discover
    discover()
    valid = {t.name for t in ft()}
    if table not in valid:
        raise ToolError('INVALID_TABLE', f'unknown table: {table}')
    group_by = params.get('group_by', [])
    if not group_by or len(group_by) > 3:
        raise ToolError('INVALID_GROUP_BY', '1-3 group_by columns required')

    filters = params.get('filters', {})
    clauses = ['scan_id = ?']
    vals = [session.scan_id]
    for k, v in filters.items():
        clauses.append(f'{k} = ?')
        vals.append(v)
    where = ' AND '.join(clauses)
    cols = ', '.join(group_by)
    sql = f'SELECT {cols}, COUNT(*) AS count FROM {table} WHERE {where} GROUP BY {cols} ORDER BY count DESC LIMIT 100'
    rows = session.sql(sql, tuple(vals))
    groups = []
    for r in rows:
        key = '/'.join(str(r[c]) for c in group_by)
        groups.append({'key': key, 'count': r['count']})
    total = session.sql(f'SELECT COUNT(*) AS n FROM {table} WHERE {where}',
                        tuple(vals))[0]['n']
    return {'groups': groups, 'total': total}


@register('sql_query', '受限只读 SQL', {
    'type': 'object',
    'properties': {
        'sql': {'type': 'string'},
        'params': {'type': 'array'},
        'limit': {'type': 'integer', 'default': 1000},
    },
    'required': ['sql'],
})
def sql_query(params, manager):
    session = manager.get_active()
    entry = manager.get_entry()
    from oskm.core.framework import tables as ft, discover
    discover()
    allowed = {t.name for t in ft()}
    aliases = set(entry.aliases)
    sql = params['sql']
    user_params = tuple(params.get('params', []))
    try:
        safe_sql, extra_params = check_sql(sql, allowed, aliases, session.scan_id)
    except SecurityError as e:
        return {'error': {'code': e.code, 'message': e.message}}
    rows = session.sql(safe_sql, extra_params + user_params)
    return {'rows': [dict(r) for r in rows], 'row_count': len(rows), 'truncated': len(rows) >= 1000}
