"""SA module: System Ability (SA) lookup and search."""
from __future__ import annotations

from ..tools import register, ToolError


@register('get_sa', '按 ID 查 SA服务', {
    'type': 'object',
    'properties': {'sa_id': {'type': 'integer'}},
    'required': ['sa_id'],
})
def get_sa(params, manager):
    session = manager.get_active()
    rows = session.sql(
        'SELECT a.*, s.cfg AS service_cfg, s.name AS service_name, '
        'c.name AS component, m.label AS install_module '
        'FROM sas a '
        'LEFT JOIN services s ON s.scan_id = a.scan_id AND s.id = a.service_id '
        'LEFT JOIN components c ON c.scan_id = a.scan_id AND c.id = a.component_id '
        'LEFT JOIN install_modules m ON m.scan_id = a.scan_id AND m.id = a.install_module_id '
        'WHERE a.scan_id = ? AND a.sa_id = ?',
        (session.scan_id, params['sa_id']))
    if not rows:
        raise ToolError('NOT_FOUND', f'SA not found: sa_id={params["sa_id"]}')
    r = dict(rows[0])
    r['service'] = {'cfg': r.pop('service_cfg'), 'name': r.pop('service_name')} if r.get('service_cfg') else None
    return r


@register('search_sas', '模糊搜索 SA服务', {
    'type': 'object',
    'properties': {
        'query': {'type': 'string'},
        'distributed': {'type': 'boolean'},
        'auto_restart': {'type': 'boolean'},
        'component': {'type': 'string'},
        'limit': {'type': 'integer', 'default': 20},
    },
    'required': ['query'],
})
def search_sas(params, manager):
    session = manager.get_active()
    limit = min(params.get('limit', 20), 100)
    pattern = f'%{params["query"]}%'
    clauses = ['scan_id = ?', '(libpath LIKE ? OR profile LIKE ? OR CAST(sa_id AS TEXT) LIKE ?)']
    vals = [session.scan_id, pattern, pattern, pattern]
    if params.get('distributed') is not None:
        clauses.append('distributed = ?')
        vals.append(1 if params['distributed'] else 0)
    if params.get('auto_restart') is not None:
        clauses.append('auto_restart = ?')
        vals.append(1 if params['auto_restart'] else 0)
    if params.get('component'):
        clauses.append('component_id IN (SELECT id FROM components WHERE scan_id = ? AND name = ?)')
        vals.extend([session.scan_id, params['component']])
    vals.append(limit)
    rows = session.sql(
        f"SELECT a.id, a.sa_id, a.libpath, a.profile, a.distributed, a.auto_restart, "
        f"c.name AS component FROM sas a "
        f"LEFT JOIN components c ON c.scan_id = a.scan_id AND c.id = a.component_id "
        f"WHERE {' AND '.join(clauses)} ORDER BY a.sa_id LIMIT ?", tuple(vals))
    return {'results': [dict(r) for r in rows], 'total': len(rows)}
