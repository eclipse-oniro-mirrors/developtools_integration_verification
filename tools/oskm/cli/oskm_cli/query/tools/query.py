"""Query module: generic list, aggregate, and SQL escape hatch."""
from __future__ import annotations

import base64
import json

from .. import catalog
from ..tools import register, ToolError
from ..security import execute_readonly_sql, SecurityError


def _quote_identifier(value: str) -> str:
    return '"' + value.replace('"', '""') + '"'


def _table_columns(session, table: str) -> set[str]:
    rows = session.connection.execute(
        f'PRAGMA table_info({_quote_identifier(table)})').fetchall()
    return {row[1] for row in rows}


def _validated_filters(filters, columns) -> dict:
    if not isinstance(filters, dict):
        raise ToolError('INVALID_FILTER', 'filters must be an object')
    for key in filters:
        if not isinstance(key, str) or key not in columns:
            raise ToolError('INVALID_FILTER', f'unknown filter column: {key}')
    return filters


def _validate_limit(value, default: int = 100) -> int:
    if value is None:
        return default
    if isinstance(value, bool) or not isinstance(value, int) or not 1 <= value <= 1000:
        raise ToolError('INVALID_PARAM', 'page.limit must be between 1 and 1000')
    return value


def _page(params) -> dict:
    page = params.get('page', {})
    if page is None:
        return {}
    if not isinstance(page, dict):
        raise ToolError('INVALID_PARAM', 'page must be an object')
    return page


def _fingerprint(payload: dict) -> str:
    canonical = json.dumps(
        payload, ensure_ascii=False, sort_keys=True, separators=(',', ':'))
    return canonical


def _encode_page_token(payload: dict) -> str:
    raw = json.dumps(
        payload, ensure_ascii=False, sort_keys=True, separators=(',', ':'))
    return base64.urlsafe_b64encode(raw.encode()).decode().rstrip('=')


def _decode_page_token(page_token: str, scan_id: int, fingerprint: str) -> int:
    if not isinstance(page_token, str) or not page_token:
        raise ToolError('INVALID_PAGE_TOKEN', 'page_token is empty')
    try:
        padding = '=' * (-len(page_token) % 4)
        payload = json.loads(
            base64.urlsafe_b64decode(page_token + padding).decode('utf-8'))
    except (UnicodeError, json.JSONDecodeError):
        raise ToolError('INVALID_PAGE_TOKEN', 'page_token is not valid base64 JSON') from None
    if not isinstance(payload, dict):
        raise ToolError('INVALID_PAGE_TOKEN', 'page_token payload must be an object')
    if payload.get('scan_id') != scan_id:
        raise ToolError('INVALID_PAGE_TOKEN', 'page_token belongs to another scan')
    if payload.get('fingerprint') != fingerprint:
        raise ToolError('INVALID_PAGE_TOKEN', 'page_token does not match query parameters')
    offset = payload.get('offset')
    if isinstance(offset, bool) or not isinstance(offset, int) or offset < 0:
        raise ToolError('INVALID_PAGE_TOKEN', 'page_token offset is invalid')
    return offset


def _where(session, table: str, filters: dict, columns: set[str]):
    filters = _validated_filters(filters, columns)
    clauses = [f'{_quote_identifier(table)}.scan_id = ?']
    values = [session.scan_id]
    for key, value in filters.items():
        clauses.append(f'{_quote_identifier(key)} = ?')
        values.append(value)
    return ' AND '.join(clauses), tuple(values)


@register('list_entities', '通用分页列表', {
    'type': 'object',
    'properties': {
        'table': {'type': 'string'},
        'filters': {'type': 'object', 'description': 'Column-value equal filters'},
        'sort': {'type': 'string'},
        'desc': {'type': 'boolean', 'default': False},
        'page': {'type': 'object', 'properties': {
            'limit': {'type': 'integer', 'default': 100},
            'page_token': {'type': 'string'},
        }},
    },
    'required': ['table'],
})
def list_entities(params, manager):
    session = manager.get_active()
    table = params['table']
    if not isinstance(table, str) or table not in set(catalog.table_names(session)):
        raise ToolError('INVALID_TABLE', f'unknown table: {table}')
    columns = _table_columns(session, table)
    page = _page(params)
    limit = _validate_limit(page.get('limit'))
    filters = params.get('filters', {})
    filters = _validated_filters(filters, columns)

    sort = params.get('sort')
    if sort is not None:
        if not isinstance(sort, str) or sort not in columns:
            raise ToolError('INVALID_SORT', f'unknown sort column: {sort}')
        direction = 'DESC' if params.get('desc') else 'ASC'
        order = f' ORDER BY {_quote_identifier(sort)} {direction}, rowid'
    else:
        order = ' ORDER BY rowid'

    payload = {
        'table': table,
        'filters': filters,
        'sort': sort,
        'desc': bool(params.get('desc')),
        'limit': limit,
    }
    fingerprint = _fingerprint(payload)
    offset = _decode_page_token(page.get('page_token'), session.scan_id, fingerprint) \
        if page.get('page_token') is not None else 0

    where, values = _where(session, table, filters, columns)
    quoted_table = _quote_identifier(table)
    sql = (f'SELECT * FROM {quoted_table} WHERE {where}{order} '
           f'LIMIT ? OFFSET ?')
    rows = session.sql(sql, values + (limit + 1, offset))
    items = [dict(row) for row in rows[:limit]]
    has_more = len(rows) > limit
    total = session.sql(
        f'SELECT COUNT(*) AS n FROM {quoted_table} WHERE {where}', values)[0]['n']
    next_page_token = None
    if has_more:
        next_page_token = _encode_page_token({
            'scan_id': session.scan_id,
            'fingerprint': fingerprint,
            'offset': offset + limit,
        })
    return {'items': items, 'total': total, 'next_page_token': next_page_token}


@register('aggregate', '通用聚合', {
    'type': 'object',
    'properties': {
        'table': {'type': 'string'},
        'group_by': {'type': 'array', 'items': {'type': 'string'}},
        'filters': {'type': 'object'},
        'page': {'type': 'object', 'properties': {
            'limit': {'type': 'integer', 'default': 100},
            'page_token': {'type': 'string'},
        }},
    },
    'required': ['table', 'group_by'],
})
def aggregate(params, manager):
    session = manager.get_active()
    table = params['table']
    if not isinstance(table, str) or table not in set(catalog.table_names(session)):
        raise ToolError('INVALID_TABLE', f'unknown table: {table}')
    columns = _table_columns(session, table)
    group_by = params.get('group_by')
    if (not isinstance(group_by, list) or not 1 <= len(group_by) <= 3
            or any(not isinstance(column, str) or column not in columns
                   for column in group_by)):
        raise ToolError('INVALID_GROUP_BY', 'group_by must contain 1-3 known columns')
    group_by = list(group_by)
    page = _page(params)
    limit = _validate_limit(page.get('limit'))
    filters = params.get('filters', {})

    payload = {'table': table, 'group_by': group_by, 'filters': filters, 'limit': limit}
    fingerprint = _fingerprint(payload)
    offset = _decode_page_token(page.get('page_token'), session.scan_id, fingerprint) \
        if page.get('page_token') is not None else 0

    where, values = _where(session, table, filters, columns)
    quoted_table = _quote_identifier(table)
    quoted_group = ', '.join(_quote_identifier(column) for column in group_by)
    sql = (f'SELECT {quoted_group}, COUNT(*) AS count FROM {quoted_table} '
           f'WHERE {where} GROUP BY {quoted_group} '
           f'ORDER BY count DESC, {quoted_group}, rowid LIMIT ? OFFSET ?')
    rows = session.sql(sql, values + (limit + 1, offset))
    groups = []
    for row in rows[:limit]:
        key = '/'.join(
            '(null)' if row[column] is None else str(row[column])
            for column in group_by)
        groups.append({'key': key, 'count': row['count']})
    has_more = len(rows) > limit
    total = session.sql(
        f'SELECT COUNT(*) AS n FROM {quoted_table} WHERE {where}', values)[0]['n']
    next_page_token = None
    if has_more:
        next_page_token = _encode_page_token({
            'scan_id': session.scan_id,
            'fingerprint': fingerprint,
            'offset': offset + limit,
        })
    return {'groups': groups, 'total': total, 'next_page_token': next_page_token}


@register('sql_query', '受限只读 SQL', {
    'type': 'object',
    'properties': {
        'sql': {'type': 'string'},
        'params': {'type': 'array'},
        'limit': {'type': 'integer', 'default': 1000},
    },
    'required': ['sql'],
})
def sql_query(params, manager):
    session = manager.get_active()
    entry = manager.get_entry()
    allowed = set(catalog.table_names(session))
    sources = [(None, entry.db_path, session.scan_id, allowed)]
    for alias, alias_session in entry.alias_sessions.items():
        sources.append((
            alias,
            entry.aliases[alias],
            alias_session.scan_id,
            set(catalog.table_names(alias_session)),
        ))
    user_params = tuple(params.get('params', ()))
    limit = params.get('limit', 1000)
    try:
        rows, truncated = execute_readonly_sql(
            sources, params['sql'], user_params, limit=limit)
    except SecurityError as e:
        return {'error': {'code': e.code, 'message': e.message}}
    return {'rows': rows, 'row_count': len(rows), 'truncated': truncated}
