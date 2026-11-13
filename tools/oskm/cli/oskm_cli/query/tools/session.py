"""Session module: lifecycle, multi-session, cross-database comparison."""
from __future__ import annotations

from ..errors import QueryError
from ..tools import register, ToolError

# Entities supported by diff_scans and their key/field configs
# Each entity is compared by stable business keys. Surrogate row ids are never
# used as cross-scan identities; foreign ids are resolved to names/labels before
# diffing.
_DIFF_CONFIG = {
    'components': {
        'key': ('name',),
        'fields': ('subsystem', 'deps', 'repo'),
        'expressions': {
            'name': 'c.name',
            'subsystem': 'c.subsystem',
            'deps': 'c.deps',
            'repo': 'r.name',
        },
        'from': ('components c LEFT JOIN repos r '
                 'ON r.scan_id = c.scan_id AND r.id = c.repo_id'),
    },
    'gn_args': {
        'key': ('name',),
        'fields': ('current_value', 'has_override'),
        'expressions': {
            'name': 'g.name',
            'current_value': 'g.current_value',
            'has_override': 'g.has_override',
        },
        'from': 'gn_args g',
    },
    'features': {
        'key': ('component', 'value'),
        'fields': ('gn_arg',),
        'expressions': {
            'component': 'c.name',
            'value': 'f.value',
            'gn_arg': 'g.name',
        },
        'from': ('features f '
                 'LEFT JOIN components c '
                 'ON c.scan_id = f.scan_id AND c.id = f.component_id '
                 'LEFT JOIN gn_args g '
                 'ON g.scan_id = f.scan_id AND g.id = f.gn_arg_id'),
    },
    'services': {
        'key': ('cfg', 'name'),
        'fields': ('type', 'component'),
        'expressions': {
            'cfg': 's.cfg',
            'name': 's.name',
            'type': 's.type',
            'component': 'c.name',
        },
        'from': ('services s LEFT JOIN components c '
                 'ON c.scan_id = s.scan_id AND c.id = s.component_id'),
    },
    'install_modules': {
        'key': ('label',),
        'fields': ('type', 'component'),
        'expressions': {
            'label': 'm.label',
            'type': 'm.type',
            'component': 'c.name',
        },
        'from': ('install_modules m LEFT JOIN components c '
                 'ON c.scan_id = m.scan_id AND c.id = m.component_id'),
    },
    'innerapis': {
        'key': ('name',),
        'fields': ('install_module',),
        'expressions': {
            'name': 'i.name',
            'install_module': 'm.label',
        },
        'from': ('innerapis i LEFT JOIN install_modules m '
                 'ON m.scan_id = i.scan_id AND m.id = i.install_module_id'),
    },
}


def _validated_scan(connection, scan_id: int, *, label: str) -> int:
    row = connection.execute(
        'SELECT id, finished_at FROM scans WHERE id = ?', (scan_id,)).fetchone()
    if row is None:
        raise ToolError('SCAN_NOT_FOUND', f'{label} scan {scan_id} does not exist')
    if row['finished_at'] is None:
        raise ToolError('SCAN_INCOMPLETE', f'{label} scan {scan_id} is incomplete')
    return int(row['id'])


def _latest_completed_scan(connection) -> int:
    row = connection.execute(
        'SELECT id FROM scans WHERE finished_at IS NOT NULL '
        'ORDER BY finished_at DESC, id DESC LIMIT 1').fetchone()
    if row is None:
        raise ToolError('NO_COMPLETED_SCAN', 'no completed scan is available')
    return int(row['id'])


def _entity_rows(session, entity: str, scan_id: int, table: str,
                 selected_fields: tuple[str, ...]):
    config = _DIFF_CONFIG[entity]
    columns = tuple(config['key']) + selected_fields
    expressions = [f'{config["expressions"][column]} AS "{column}"' for column in columns]
    return session.sql(
        f"SELECT {', '.join(expressions)} FROM {config['from']} "
        f"WHERE {table}.scan_id = ?", (scan_id,))



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
    sid = session.scan_id
    try:
        scan = session.scan_row()
    except QueryError as exc:
        raise ToolError(exc.code, f'{exc.code}: {exc.message}') from exc
    runs = session.connection.execute(
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
        'cpu_arch': scan['cpu_arch'],
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
        'SELECT id AS scan_id, product, cpu_arch, started_at, finished_at '
        'FROM scans ORDER BY id DESC LIMIT ?',
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


def _list_diff_params(params):
    entity = params['entity']
    if entity not in _DIFF_CONFIG:
        raise ToolError('INVALID_ENTITY', f'unsupported entity: {entity}')
    config = _DIFF_CONFIG[entity]
    scan_a = params['scan_a']
    if not isinstance(scan_a, int) or isinstance(scan_a, bool):
        raise ToolError('INVALID_PARAM', 'scan_a must be an integer')
    scan_b = params.get('scan_b')
    if scan_b is not None and (not isinstance(scan_b, int) or isinstance(scan_b, bool)):
        raise ToolError('INVALID_PARAM', 'scan_b must be an integer')
    fields = params.get('fields')
    if fields is None:
        fields = list(config['fields'])
    if (not isinstance(fields, list) or not fields
            or any(not isinstance(field, str) or field not in config['expressions']
                   for field in fields)):
        raise ToolError('INVALID_FIELD', 'fields must contain known entity fields')
    return config, scan_a, scan_b, params.get('db_b'), tuple(fields)


def _list_diff_rows(manager, entity, config, scan_a, scan_b, db_b, fields):
    session = manager.get_active()
    entry = manager.get_entry()
    primary_source = 'c' if entity == 'components' else (
        'g' if entity == 'gn_args' else
        'f' if entity == 'features' else
        's' if entity == 'services' else
        'm' if entity == 'install_modules' else 'i')
    _validated_scan(session.connection, scan_a, label='scan_a')
    if db_b is not None:
        if db_b not in entry.aliases:
            raise ToolError('ALIAS_NOT_FOUND', f'alias "{db_b}" not attached')
        alias_session = entry.alias_sessions[db_b]
        if scan_b is None:
            scan_b = _latest_completed_scan(alias_session.connection)
        else:
            _validated_scan(alias_session.connection, scan_b, label='scan_b')
        rows_b = _entity_rows(alias_session, entity, scan_b, primary_source, fields)
    else:
        if scan_b is None:
            raise ToolError('MISSING_PARAM', 'scan_b is required for same-database diff')
        _validated_scan(session.connection, scan_b, label='scan_b')
        rows_b = _entity_rows(session, entity, scan_b, primary_source, fields)
    rows_a = _entity_rows(session, entity, scan_a, primary_source, fields)
    return scan_b, rows_a, rows_b, config['key']


def _diff_key_value(key, key_cols):
    if len(key_cols) == 1:
        return key[0]
    return {name: value for name, value in zip(key_cols, key)}


def _diff_summary(index_a, index_b, key_cols, fields):
    added = [_diff_key_value(key, key_cols) for key in index_b if key not in index_a]
    removed = [_diff_key_value(key, key_cols) for key in index_a if key not in index_b]
    changed = []
    for key, row_a in index_a.items():
        if key not in index_b:
            continue
        row_b = index_b[key]
        changes = [
            {'field': field, 'before': row_a[field], 'after': row_b[field]}
            for field in fields if row_a[field] != row_b[field]
        ]
        if changes:
            changed.append({'key': _diff_key_value(key, key_cols), 'changes': changes})
    return added, removed, changed


@register('diff_scans', '两次扫描差异对比', {
    'type': 'object',
    'properties': {
        'entity': {'type': 'string',
                   'description': 'components/gn_args/features/services/install_modules/innerapis'},
        'scan_a': {'type': 'integer', 'description': 'Primary scan id'},
        'scan_b': {'type': 'integer',
                   'description': 'Comparison scan id; default latest when db_b is set'},
        'db_b': {'type': 'string', 'description': 'ATTACH alias for scan_b; omit for same DB'},
        'fields': {'type': 'array', 'items': {'type': 'string'},
                   'description': 'Only compare these business fields; default: entity standard set'},
    },
    'required': ['entity', 'scan_a'],
})
def diff_scans(params, manager):
    config, scan_a, scan_b, db_b, fields = _list_diff_params(params)
    scan_b, rows_a, rows_b, key_cols = _list_diff_rows(
        manager, params['entity'], config, scan_a, scan_b, db_b, fields)
    index_a = {tuple(row[column] for column in key_cols): row for row in rows_a}
    index_b = {tuple(row[column] for column in key_cols): row for row in rows_b}
    added, removed, changed = _diff_summary(index_a, index_b, key_cols, fields)
    return {'entity': params['entity'], 'scan_a': scan_a, 'scan_b': scan_b,
            'added': added, 'removed': removed, 'changed': changed}
