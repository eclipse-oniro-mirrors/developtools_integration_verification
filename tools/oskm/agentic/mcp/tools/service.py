"""Service module: lookup, search, hosted SA/HDI."""
from __future__ import annotations

from ..tools import register, ToolError
from oskm.core import framework


def _service_by_id(session, sid):
    rows = session.sql(
        'SELECT cfg, name FROM services WHERE scan_id = ? AND id = ?',
        (session.scan_id, sid))
    if not rows:
        raise ToolError('INVALID_SERVICE_ID', f'service_id {sid} not found')
    return session.service(rows[0]['cfg'], rows[0]['name'])


@register('get_service', '按 cfg 查找系统服务', {
    'type': 'object',
    'properties': {
        'cfg': {'type': 'string', 'description': 'Init config file path'},
        'name': {'type': 'string', 'description': 'Service name within cfg'},
    },
    'required': ['cfg'],
})
def get_service(params, manager):
    session = manager.get_active()
    svc = session.service(params['cfg'], params.get('name'))
    if svc is None:
        raise ToolError('NOT_FOUND', f'service not found: {params["cfg"]}')
    return {'id': svc.id, 'cfg': svc.cfg, 'name': svc.name, **svc.record}


@register('search_services', '模糊搜索系统服务', {
    'type': 'object',
    'properties': {
        'query': {'type': 'string'},
        'type': {'type': 'string', 'description': 'sa / hdf / default'},
        'component': {'type': 'string'},
        'limit': {'type': 'integer', 'default': 20},
    },
    'required': ['query'],
})
def search_services(params, manager):
    session = manager.get_active()
    limit = min(params.get('limit', 20), 100)
    pattern = f'%{params["query"]}%'
    clauses = ['scan_id = ?', '(name LIKE ? OR cfg LIKE ?)']
    vals = [session.scan_id, pattern, pattern]
    if params.get('type'):
        clauses.append('type = ?')
        vals.append(params['type'])
    if params.get('component'):
        clauses.append('component_id IN (SELECT id FROM components WHERE scan_id = ? AND name = ?)')
        vals.extend([session.scan_id, params['component']])
    vals.append(limit)
    rows = session.sql(
        f"SELECT id, name, cfg, type, component_id FROM services "
        f"WHERE {' AND '.join(clauses)} ORDER BY name LIMIT ?", tuple(vals))
    return {'results': [dict(r) for r in rows], 'total': len(rows)}


@register('service_hosted', '宿主的 SA服务/HDI设备', {
    'type': 'object',
    'properties': {
        'service_id': {'type': 'integer'},
        'collector': {'type': 'string', 'description': 'sas or hdis'},
    },
    'required': ['service_id'],
})
def service_hosted(params, manager):
    session = manager.get_active()
    collector = params.get('collector')
    result = {}
    for name in framework.names():
        cls = framework.get(name)
        if cls.SERVICE_COLUMN and (collector is None or name == collector):
            table = cls.TABLES[0].name
            rows = session.sql(
                f'SELECT * FROM {table} WHERE scan_id = ? AND {cls.SERVICE_COLUMN} = ?',
                (session.scan_id, params['service_id']))
            if rows:
                result[name] = [dict(r) for r in rows]
    return result
