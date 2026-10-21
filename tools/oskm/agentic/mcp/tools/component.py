"""Component module: lookup, search, dependencies, features, innerapis."""
from __future__ import annotations

from ..tools import register, ToolError
from ..gitlink import git_url
from oskm.core import framework


def _component_by_id(session, cid):
    rows = session.sql(
        'SELECT name FROM components WHERE scan_id = ? AND id = ?',
        (session.scan_id, cid))
    if not rows:
        raise ToolError('INVALID_COMPONENT_ID', f'component_id {cid} not found')
    return session.component(rows[0]['name'])


def _attached_counts(session, component_id):
    """Count records per collector via SQL (bypasses export_record)."""
    counts = {}
    for name in framework.names():
        cls = framework.get(name)
        if cls.COMPONENT_COLUMN:
            table = cls.TABLES[0].name
            n = session.sql(
                f'SELECT COUNT(*) AS n FROM {table} '
                f'WHERE scan_id = ? AND {cls.COMPONENT_COLUMN} = ?',
                (session.scan_id, component_id))
            if n and n[0]['n'] > 0:
                counts[name] = n[0]['n']
    return counts


def _attached_records(session, component_id, collector=None):
    """Get raw rows per collector via SQL (bypasses export_record)."""
    result = {}
    for name in framework.names():
        cls = framework.get(name)
        if cls.COMPONENT_COLUMN and (collector is None or name == collector):
            table = cls.TABLES[0].name
            rows = session.sql(
                f'SELECT * FROM {table} '
                f'WHERE scan_id = ? AND {cls.COMPONENT_COLUMN} = ?',
                (session.scan_id, component_id))
            if rows:
                result[name] = [dict(r) for r in rows]
    return result


@register('get_component', '按名查找部件', {
    'type': 'object',
    'properties': {'name': {'type': 'string'}},
    'required': ['name'],
})
def get_component(params, manager):
    session = manager.get_active()
    comp = session.component(params['name'])
    if comp is None:
        raise ToolError('NOT_FOUND', f'component not found: {params["name"]}')
    counts = _attached_counts(session, comp.id)
    link = git_url(session, comp.get('manifest', '')) if comp.get('manifest') else None
    return {
        'id': comp.id,
        'name': comp.name,
        'subsystem': comp.subsystem,
        'manifest': comp.get('manifest'),
        'manifest_url': link['url'] if link else None,
        'repo': comp.get('repo_id'),
        'deps': comp.get('deps'),
        'attached_counts': counts,
    }


@register('search_components', '模糊搜索部件', {
    'type': 'object',
    'properties': {
        'query': {'type': 'string'},
        'limit': {'type': 'integer', 'default': 20},
        'subsystem': {'type': 'string'},
    },
    'required': ['query'],
})
def search_components(params, manager):
    session = manager.get_active()
    limit = min(params.get('limit', 20), 100)
    pattern = f'%{params["query"]}%'
    subsys = params.get('subsystem')
    if subsys:
        rows = session.sql(
            'SELECT id, name, subsystem, manifest FROM components '
            'WHERE scan_id = ? AND name LIKE ? AND subsystem = ? '
            'ORDER BY name LIMIT ?',
            (session.scan_id, pattern, subsys, limit))
    else:
        rows = session.sql(
            'SELECT id, name, subsystem, manifest FROM components '
            'WHERE scan_id = ? AND name LIKE ? ORDER BY name LIMIT ?',
            (session.scan_id, pattern, limit))
    return {'results': [dict(r) for r in rows], 'total': len(rows)}


@register('component_attached', '部件关联的各域记录', {
    'type': 'object',
    'properties': {
        'component_id': {'type': 'integer'},
        'collector': {'type': 'string', 'description': 'Filter to one collector'},
    },
    'required': ['component_id'],
})
def component_attached(params, manager):
    session = manager.get_active()
    comp = _component_by_id(session, params['component_id'])
    collector = params.get('collector')
    return _attached_records(session, comp.id, collector)


@register('component_dependencies', '正向依赖', {
    'type': 'object',
    'properties': {'component_id': {'type': 'integer'}},
    'required': ['component_id'],
})
def component_dependencies(params, manager):
    session = manager.get_active()
    comp = _component_by_id(session, params['component_id'])
    deps = comp.record.get('deps') or {}
    components = deps.get('components') if isinstance(deps, dict) else None
    third_party = deps.get('third_party') if isinstance(deps, dict) else None
    names_set = {r['name'] for r in session.sql(
        'SELECT name FROM components WHERE scan_id = ?', (session.scan_id,))}
    unresolved = [n for n in (components or []) if n not in names_set]
    return {
        'components': list(components or []),
        'third_party': list(third_party or []),
        'unresolved': unresolved,
    }


@register('component_dependents', '反向依赖', {
    'type': 'object',
    'properties': {'component_id': {'type': 'integer'}},
    'required': ['component_id'],
})
def component_dependents(params, manager):
    session = manager.get_active()
    comp = _component_by_id(session, params['component_id'])
    deps = [d.name for d in comp.dependents()]
    return {'dependents': deps}


@register('component_features', '特性名+编译参数值', {
    'type': 'object',
    'properties': {'component_id': {'type': 'integer'}},
    'required': ['component_id'],
})
def component_features(params, manager):
    session = manager.get_active()
    rows = session.sql(
        'SELECT f.value, g.current_value, g.value_type, g.has_override, f.gn_arg_id '
        'FROM features f '
        'LEFT JOIN gn_args g ON g.scan_id = f.scan_id AND g.id = f.gn_arg_id '
        'WHERE f.scan_id = ? AND f.component_id = ? '
        'ORDER BY f.source_index',
        (session.scan_id, params['component_id']))
    return {'features': [dict(r) for r in rows]}


@register('component_syscaps', 'SysCap 声明', {
    'type': 'object',
    'properties': {'component_id': {'type': 'integer'}},
    'required': ['component_id'],
})
def component_syscaps(params, manager):
    session = manager.get_active()
    rows = session.sql(
        'SELECT value FROM syscaps WHERE scan_id = ? AND component_id = ? '
        'ORDER BY source_index',
        (session.scan_id, params['component_id']))
    return {'syscaps': [{'name': r['value']} for r in rows]}


@register('component_innerapis', 'InnerAPI+安装模块', {
    'type': 'object',
    'properties': {'component_id': {'type': 'integer'}},
    'required': ['component_id'],
})
def component_innerapis(params, manager):
    session = manager.get_active()
    rows = session.sql(
        'SELECT i.id, i.name, i.external_name, i.field, i.source_index, '
        '       i.install_module_id, m.label AS install_module_label '
        'FROM innerapis i '
        'LEFT JOIN install_modules m ON m.scan_id = i.scan_id AND m.id = i.install_module_id '
        'WHERE i.scan_id = ? AND i.component_id = ? '
        'ORDER BY i.field, i.source_index',
        (session.scan_id, params['component_id']))
    result = []
    for r in rows:
        d = dict(r)
        link = git_url(session, r['name'])
        d['source_url'] = link['url'] if link else None
        result.append(d)
    return {'innerapis': result}
