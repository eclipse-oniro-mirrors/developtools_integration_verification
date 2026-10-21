"""HDI module: HDI device lookup and search."""
from __future__ import annotations

from ..tools import register, ToolError


@register('get_hdi', '按 serviceName/node 查 HDI设备', {
    'type': 'object',
    'properties': {
        'service_name': {'type': 'string'},
        'node': {'type': 'string'},
    },
})
def get_hdi(params, manager):
    session = manager.get_active()
    sn = params.get('service_name')
    node = params.get('node')
    if not sn and not node:
        raise ToolError('NO_PARAMS', 'at least one of service_name or node is required')
    clauses = ['scan_id = ?']
    vals = [session.scan_id]
    if sn:
        clauses.append('service_name = ?')
        vals.append(sn)
    if node:
        clauses.append('node = ?')
        vals.append(node)
    rows = session.sql(
        'SELECT h.*, s.cfg AS service_cfg, s.name AS service_name, '
        'c.name AS component, m.label AS install_module '
        'FROM hdis h '
        'LEFT JOIN services s ON s.scan_id = h.scan_id AND s.id = h.service_id '
        'LEFT JOIN components c ON c.scan_id = h.scan_id AND c.id = h.component_id '
        'LEFT JOIN install_modules m ON m.scan_id = h.scan_id AND m.id = h.install_module_id '
        f"WHERE {' AND '.join(clauses)}",
        tuple(vals))
    if not rows:
        raise ToolError('NOT_FOUND', f'HDI not found: service_name={sn}, node={node}')
    result = []
    for r in rows:
        d = dict(r)
        d['service'] = {'cfg': d.pop('service_cfg'), 'name': d.pop('service_name')} if d.get('service_cfg') else None
        result.append(d)
    return {'hdis': result}


@register('search_hdis', '模糊搜索 HDI设备', {
    'type': 'object',
    'properties': {
        'query': {'type': 'string'},
        'component': {'type': 'string'},
        'hcb': {'type': 'string'},
        'limit': {'type': 'integer', 'default': 20},
    },
    'required': ['query'],
})
def search_hdis(params, manager):
    session = manager.get_active()
    limit = min(params.get('limit', 20), 100)
    pattern = f'%{params["query"]}%'
    clauses = ['scan_id = ?',
               '(library LIKE ? OR module_name LIKE ? OR node LIKE ? OR service_name LIKE ?)']
    vals = [session.scan_id, pattern, pattern, pattern, pattern]
    if params.get('component'):
        clauses.append('component_id IN (SELECT id FROM components WHERE scan_id = ? AND name = ?)')
        vals.extend([session.scan_id, params['component']])
    if params.get('hcb'):
        clauses.append('hcb = ?')
        vals.append(params['hcb'])
    vals.append(limit)
    rows = session.sql(
        f"SELECT h.id, h.node, h.service_name, h.module_name, h.library, "
        f"c.name AS component FROM hdis h "
        f"LEFT JOIN components c ON c.scan_id = h.scan_id AND c.id = h.component_id "
        f"WHERE {' AND '.join(clauses)} ORDER BY h.service_name LIMIT ?", tuple(vals))
    return {'results': [dict(r) for r in rows], 'total': len(rows)}
