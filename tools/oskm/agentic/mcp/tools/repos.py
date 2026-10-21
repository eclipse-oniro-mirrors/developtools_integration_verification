"""Repos module: repository lookup and git URL building."""
from __future__ import annotations

from ..tools import register, ToolError
from ..gitlink import git_url


@register('get_repo', '按名查找代码仓', {
    'type': 'object',
    'properties': {'name': {'type': 'string'}},
    'required': ['name'],
})
def get_repo(params, manager):
    session = manager.get_active()
    rows = session.sql(
        'SELECT * FROM repos WHERE scan_id = ? AND name = ?',
        (session.scan_id, params['name']))
    if not rows:
        raise ToolError('NOT_FOUND', f'repo not found: {params["name"]}')
    r = dict(rows[0])
    r['component_count'] = session.sql(
        'SELECT COUNT(*) AS n FROM components WHERE scan_id = ? AND repo_id = ?',
        (session.scan_id, r['id']))[0]['n']
    link = git_url(session, r.get('path', ''))
    r['url'] = link['url'] if link else None
    return r


@register('list_repos', '列出代码仓', {
    'type': 'object',
    'properties': {'limit': {'type': 'integer', 'default': 50}},
})
def list_repos(params, manager):
    session = manager.get_active()
    limit = min(params.get('limit', 50), 200)
    rows = session.sql(
        'SELECT * FROM repos WHERE scan_id = ? ORDER BY name LIMIT ?',
        (session.scan_id, limit))
    repos = []
    for r in rows:
        cc = session.sql(
            'SELECT COUNT(*) AS n FROM components WHERE scan_id = ? AND repo_id = ?',
            (session.scan_id, r['id']))[0]['n']
        link = git_url(session, r.get('path', ''))
        sha = r.get('head_commit') or ''
        repos.append({
            'id': r['id'], 'name': r['name'], 'path': r['path'],
            'remote_url': r.get('remote_url'),
            'head_commit': sha[:7] if sha else None,
            'component_count': cc,
            'url': link['url'] if link else None,
        })
    return {'repos': repos, 'total': len(repos)}


@register('git_url', '路径→git URL', {
    'type': 'object',
    'properties': {
        'path': {'type': 'string',
                 'description': 'Workspace-relative file path or GN label (//dir:target)'},
        'line': {'type': 'integer', 'description': 'Line number for #L anchor'},
    },
    'required': ['path'],
})
def git_url_tool(params, manager):
    session = manager.get_active()
    link = git_url(session, params['path'], params.get('line'))
    if not link:
        raise ToolError('NOT_FOUND', f'no repo matches path: {params["path"]}')
    return link
