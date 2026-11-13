"""Install module: lookup, search, path ownership."""
from __future__ import annotations

from ..tools import register, ToolError
from ..gitlink import git_url


@register('get_install_module', '按 label 查安装模块', {
    'type': 'object',
    'properties': {'label': {'type': 'string'}},
    'required': ['label'],
})
def get_install_module(params, manager):
    session = manager.get_active()
    mod = session.install_module(params['label'])
    if mod is None:
        raise ToolError('NOT_FOUND', f'install module not found: {params["label"]}')
    targets = [{'dest': d} for d in mod.targets()]
    tags = list(mod.tags())
    comp = mod.component()
    link = git_url(session, mod.label or '')
    return {
        'id': mod.id,
        'ordinal': mod.get('ordinal'),
        'label': mod.label,
        'label_name': mod.get('label_name'),
        'type': mod.get('type'),
        'source': mod.get('source'),
        'install_enable': mod.get('install_enable'),
        'component': comp.name if comp else None,
        'component_id': mod.get('component_id'),
        'source_url': link['url'] if link else None,
        'targets': targets,
        'tags': tags,
    }


@register('search_install_modules', '模糊搜索安装模块', {
    'type': 'object',
    'properties': {
        'query': {'type': 'string'},
        'type': {'type': 'string'},
        'component': {'type': 'string'},
        'limit': {'type': 'integer', 'default': 20},
    },
    'required': ['query'],
})
def search_install_modules(params, manager):
    session = manager.get_active()
    limit = min(params.get('limit', 20), 100)
    pattern = f'%{params["query"]}%'
    clauses = ['scan_id = ?', '(label LIKE ? OR label_name LIKE ?)']
    vals = [session.scan_id, pattern, pattern]
    if params.get('type'):
        clauses.append('type = ?')
        vals.append(params['type'])
    if params.get('component'):
        clauses.append('component_id IN (SELECT id FROM components WHERE scan_id = ? AND name = ?)')
        vals.extend([session.scan_id, params['component']])
    vals.append(limit)
    rows = session.sql(
        f"SELECT id, label, label_name, type, component_id FROM install_modules "
        f"WHERE {' AND '.join(clauses)} ORDER BY label LIMIT ?", tuple(vals))
    return {'results': [dict(r) for r in rows], 'total': len(rows)}


@register('owner_of', '镜像路径→部件', {
    'type': 'object',
    'properties': {'dest': {'type': 'string', 'description': 'Image-relative path'}},
    'required': ['dest'],
})
def owner_of(params, manager):
    session = manager.get_active()
    comp = session.owner_of(params['dest'])
    if comp is None:
        raise ToolError('NOT_FOUND', f'no component owns: {params["dest"]}')
    mods = session.installed_at(params['dest'])
    mod_label = mods[0].label if mods else None
    mod_id = mods[0].id if mods else None
    return {
        'component': comp.name,
        'component_id': comp.id,
        'dest': params['dest'],
        'install_module': mod_label,
        'install_module_id': mod_id,
    }


@register('installed_at', '路径→安装模块', {
    'type': 'object',
    'properties': {'dest': {'type': 'string'}},
    'required': ['dest'],
})
def installed_at(params, manager):
    session = manager.get_active()
    mods = session.installed_at(params['dest'])
    result = []
    for m in mods:
        comp = m.component()
        result.append({
            'module_id': m.id,
            'label': m.label,
            'type': m.get('type'),
            'component': comp.name if comp else None,
            'component_id': m.get('component_id'),
            'dest': params['dest'],
            'directory': m.get('directory'),
        })
    return {'modules': result}
