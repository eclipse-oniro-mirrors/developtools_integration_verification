"""Issues module: scan quality issues."""
from __future__ import annotations

from ..tools import register


@register('list_issues', '质量问题清单', {
    'type': 'object',
    'properties': {
        'collector': {'type': 'string'},
        'severity': {'type': 'string', 'description': 'info / warning / error'},
        'advisory': {'type': 'boolean'},
        'component': {'type': 'string'},
        'limit': {'type': 'integer', 'default': 50},
    },
})
def list_issues(params, manager):
    session = manager.get_active()
    limit = min(params.get('limit', 50), 200)
    clauses = ['scan_id = ?']
    vals = [session.scan_id]
    if params.get('collector'):
        clauses.append('collector = ?')
        vals.append(params['collector'])
    if params.get('severity'):
        clauses.append('severity = ?')
        vals.append(params['severity'])
    if params.get('advisory') is not None:
        clauses.append('advisory = ?')
        vals.append(1 if params['advisory'] else 0)
    if params.get('component'):
        clauses.append('component = ?')
        vals.append(params['component'])
    vals.append(limit)
    rows = session.sql(
        f"SELECT collector, path, pointer, code, severity, component, advisory, details "
        f"FROM issues WHERE {' AND '.join(clauses)} "
        f"ORDER BY component, path, code LIMIT ?", tuple(vals))
    return {'issues': [dict(r) for r in rows], 'total': len(rows)}
