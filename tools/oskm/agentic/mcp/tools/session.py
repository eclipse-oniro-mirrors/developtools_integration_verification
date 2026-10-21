"""Session module: lifecycle, multi-session, cross-database comparison."""
from __future__ import annotations

from ..tools import register, ToolError

# Entities supported by diff_scans and their key/field configs
_DIFF_CONFIG = {
    'components': {'key': 'name', 'fields': ('subsystem', 'deps', 'repo_id')},
    'gn_args': {'key': 'name', 'fields': ('current_value', 'has_override')},
    'features': {'key': ('component_id', 'value'), 'fields': ('gn_arg_id',)},
    'services': {'key': ('cfg', 'name'), 'fields': ('type', 'executable', 'component_id')},
    'install_modules': {'key': 'label', 'fields': ('type', 'component_id')},
    'innerapis': {'key': 'name', 'fields': ('install_module_id',)},
}


@register('open_session', '连接知识库', {
    'type': 'object',
    'properties': {
        'db_path': {'type': 'string', 'description': 'Absolute path to knowledge.db'},
        'scan_id': {'type': 'integer', 'description': 'Reuse specific scan; default: latest'},
        'product': {'type': 'string', 'description': 'Filter by product name'},
    },
    'required': ['db_path'],
})
def open_session(params, manager):
    return manager.open(
        params['db_path'],
        scan_id=params.get('scan_id'),
        product=params.get('product'))


@register('close_session', '关闭会话', {
    'type': 'object',
    'properties': {'session_id': {'type': 'integer'}},
})
def close_session(params, manager):
    return manager.close(session_id=params.get('session_id'))


@register('switch_session', '切换会话', {
    'type': 'object',
    'properties': {'session_id': {'type': 'integer'}},
    'required': ['session_id'],
})
def switch_session(params, manager):
    return manager.switch(params['session_id'])


@register('list_sessions', '列出所有会话', {
    'type': 'object', 'properties': {},
})
def list_sessions(params, manager):
    return manager.list_sessions()


@register('get_scan_info', '扫描元数据', {
    'type': 'object', 'properties': {},
})
def get_scan_info(params, manager):
    session = manager.get_active()
    conn = session.connection
    sid = session.scan_id
    scan = conn.execute('SELECT * FROM scans WHERE id = ?', (sid,)).fetchone()
    runs = conn.execute(
        'SELECT collector, status, schema_version, record_count '
        'FROM collector_runs WHERE scan_id = ? ORDER BY collector', (sid,)).fetchall()
    statuses = [r['status'] for r in runs]
    status = ('failed' if 'failed' in statuses
              else 'degraded' if 'degraded' in statuses
              else 'complete') if statuses else 'unknown'
    entry = manager.get_entry()
    return {
        'session_id': entry.sid,
        'scan_id': sid,
        'product': scan['product'],
        'workspace_root': scan['workspace_root'],
        'status': status,
        'started_at': scan['started_at'],
        'finished_at': scan['finished_at'],
        'collectors': [dict(r) for r in runs],
        'attached_aliases': list(entry.aliases),
    }


@register('list_scans', '列出所有扫描', {
    'type': 'object',
    'properties': {'limit': {'type': 'integer', 'default': 20}},
})
def list_scans(params, manager):
    session = manager.get_active()
    limit = min(params.get('limit', 20), 100)
    rows = session.sql(
        'SELECT id AS scan_id, product, started_at, finished_at FROM scans ORDER BY id DESC LIMIT ?',
        (limit,))
    scans = []
    for r in rows:
        sid = r['scan_id']
        runs = session.sql(
            'SELECT status FROM collector_runs WHERE scan_id = ?', (sid,))
        statuses = [x['status'] for x in runs]
        st = ('failed' if 'failed' in statuses
              else 'degraded' if 'degraded' in statuses
              else 'complete') if statuses else 'unknown'
        scans.append({**r, 'status': st})
    return {'scans': scans}


@register('get_link_stats', '关联命中率', {
    'type': 'object', 'properties': {},
})
def get_link_stats(params, manager):
    session = manager.get_active()
    rows = session.sql(
        'SELECT linked_features, unresolved_features, linked_innerapis, unresolved_innerapis '
        'FROM component_links_run WHERE scan_id = ?', (session.scan_id,))
    if not rows:
        return {'features': None, 'innerapis': None}
    r = rows[0]
    def _stats(linked, unresolved):
        total = linked + unresolved
        return {'linked': linked, 'unresolved': unresolved, 'total': total,
                'hit_rate': round(linked / total, 3) if total else 0}
    return {
        'features': _stats(r['linked_features'], r['unresolved_features']),
        'innerapis': _stats(r['linked_innerapis'], r['unresolved_innerapis']),
    }


@register('attach_secondary', '挂载对比库', {
    'type': 'object',
    'properties': {
        'db_path': {'type': 'string', 'description': 'Path to another knowledge.db'},
        'alias': {'type': 'string', 'default': 'secondary',
                  'description': 'SQL alias for the attached database'},
    },
    'required': ['db_path'],
})
def attach_secondary(params, manager):
    return manager.attach_secondary(params['db_path'], params.get('alias', 'secondary'))


@register('detach_secondary', '卸载对比库', {
    'type': 'object',
    'properties': {'alias': {'type': 'string'}},
    'required': ['alias'],
})
def detach_secondary(params, manager):
    return manager.detach_secondary(params['alias'])


@register('diff_scans', '两次扫描差异对比', {
    'type': 'object',
    'properties': {
        'entity': {'type': 'string',
                   'description': 'components/gn_args/features/services/install_modules/innerapis'},
        'scan_a': {'type': 'integer', 'description': 'Primary scan id'},
        'scan_b': {'type': 'integer', 'description': 'Comparison scan id'},
        'db_b': {'type': 'string', 'description': 'ATTACH alias for scan_b; omit for same DB'},
        'fields': {'type': 'array', 'items': {'type': 'string'},
                   'description': 'Only compare these fields; default: entity standard set'},
    },
    'required': ['entity', 'scan_a', 'scan_b'],
})
def diff_scans(params, manager):
    entity = params['entity']
    if entity not in _DIFF_CONFIG:
        raise ToolError('INVALID_ENTITY', f'unsupported entity: {entity}')
    config = _DIFF_CONFIG[entity]
    scan_a = params['scan_a']
    scan_b = params['scan_b']
    db_b = params.get('db_b')
    fields = params.get('fields', config['fields'])
    key_cols = config['key']
    if isinstance(key_cols, str):
        key_cols = (key_cols,)

    session = manager.get_active()
    entry = manager.get_entry()
    if db_b and db_b not in entry.aliases:
        raise ToolError('ALIAS_NOT_FOUND', f'alias "{db_b}" not attached')

    table_b = f'{db_b}.{entity}' if db_b else entity
    cols = ', '.join(key_cols) + ', ' + ', '.join(fields)
    rows_a = session.sql(
        f'SELECT {cols} FROM {entity} WHERE scan_id = ?', (scan_a,))
    rows_b = session.sql(
        f'SELECT {cols} FROM {table_b} WHERE scan_id = ?', (scan_b,))

    def make_key(row):
        if len(key_cols) == 1:
            return row[key_cols[0]]
        return tuple(row[c] for c in key_cols)

    index_a = {make_key(r): r for r in rows_a}
    index_b = {make_key(r): r for r in rows_b}

    added = [list(k) if isinstance(k, tuple) else k for k in index_b if k not in index_a]
    removed = [list(k) if isinstance(k, tuple) else k for k in index_a if k not in index_b]
    changed = []
    for k in index_a:
        if k not in index_b:
            continue
        ra, rb = index_a[k], index_b[k]
        diffs = []
        for f in fields:
            va = ra.get(f)
            vb = rb.get(f)
            if va != vb:
                diffs.append({'field': f, 'before': va, 'after': vb})
        if diffs:
            changed.append({
                'key': list(k) if isinstance(k, tuple) else k,
                'changes': diffs,
            })
    return {'entity': entity, 'scan_a': scan_a, 'scan_b': scan_b,
            'added': added, 'removed': removed, 'changed': changed}
