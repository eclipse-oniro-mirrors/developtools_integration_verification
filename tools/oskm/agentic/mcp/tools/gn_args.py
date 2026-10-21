"""GN Args module: build argument lookup and search."""
from __future__ import annotations

from ..tools import register, ToolError
from ..gitlink import git_url


@register('get_gn_arg', '按名查编译参数', {
    'type': 'object',
    'properties': {'name': {'type': 'string'}},
    'required': ['name'],
})
def get_gn_arg(params, manager):
    session = manager.get_active()
    rows = session.sql(
        'SELECT a.*, c.name AS component FROM gn_args a '
        'LEFT JOIN components c ON c.scan_id = a.scan_id AND c.id = a.component_id '
        'WHERE a.scan_id = ? AND a.name = ?',
        (session.scan_id, params['name']))
    if not rows:
        raise ToolError('NOT_FOUND', f'gn_arg not found: {params["name"]}')
    r = dict(rows[0])
    r['feature_count'] = session.sql(
        'SELECT COUNT(*) AS n FROM features WHERE scan_id = ? AND gn_arg_id = ?',
        (session.scan_id, r['id']))[0]['n']
    link = git_url(session, r.get('decl_file', ''), r.get('decl_line'))
    r['source_url'] = link['url'] if link else None
    return r


@register('search_gn_args', '模糊搜索编译参数', {
    'type': 'object',
    'properties': {
        'query': {'type': 'string'},
        'value_type': {'type': 'string'},
        'has_override': {'type': 'boolean'},
        'limit': {'type': 'integer', 'default': 20},
    },
    'required': ['query'],
})
def search_gn_args(params, manager):
    session = manager.get_active()
    limit = min(params.get('limit', 20), 100)
    pattern = f'%{params["query"]}%'
    clauses = ['scan_id = ?', 'name LIKE ?']
    vals = [session.scan_id, pattern]
    if params.get('value_type'):
        clauses.append('value_type = ?')
        vals.append(params['value_type'])
    if params.get('has_override') is not None:
        clauses.append('has_override = ?')
        vals.append(1 if params['has_override'] else 0)
    vals.append(limit)
    rows = session.sql(
        f"SELECT a.id, a.name, a.current_value, a.value_type, a.has_override, "
        f"c.name AS component FROM gn_args a "
        f"LEFT JOIN components c ON c.scan_id = a.scan_id AND c.id = a.component_id "
        f"WHERE {' AND '.join(clauses)} ORDER BY a.name LIMIT ?", tuple(vals))
    return {'results': [dict(r) for r in rows], 'total': len(rows)}
