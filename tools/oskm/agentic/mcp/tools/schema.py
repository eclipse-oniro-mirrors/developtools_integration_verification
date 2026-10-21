"""Schema module: database self-description tools."""
from __future__ import annotations

import re

from ..tools import register, ToolError


@register('get_tables', '已注册表名列表', {
    'type': 'object', 'properties': {}, 'additionalProperties': False
})
def get_tables(params, manager):
    from oskm.core.framework import tables as ft
    session = manager.get_active()
    names = sorted(t.name for t in ft())
    return {'tables': names}


@register('get_schema', '表结构自描述', {
    'type': 'object',
    'properties': {
        'table': {'type': 'string', 'description': 'Table name; omit for all tables'}
    },
    'additionalProperties': False
})
def get_schema(params, manager):
    session = manager.get_active()
    conn = session.connection
    table_filter = params.get('table')

    from oskm.core.framework import tables as ft, discover
    discover()
    all_tables = [t.name for t in ft()]

    if table_filter:
        if table_filter not in all_tables:
            raise ToolError('INVALID_TABLE', f'unknown table: {table_filter}')
        tables_to_query = [table_filter]
    else:
        tables_to_query = sorted(all_tables)

    result = []
    for tname in tables_to_query:
        cols = conn.execute(f'PRAGMA table_info({tname})').fetchall()
        fks = conn.execute(f'PRAGMA foreign_key_list({tname})').fetchall()
        idxs = conn.execute(f'PRAGMA index_list({tname})').fetchall()

        pk_cols = [c['name'] for c in cols if c['pk']]
        columns = []
        for c in cols:
            col = {'name': c['name'], 'type': c['type'] or 'TEXT',
                   'nullable': not c['notnull']}
            if c['pk']:
                col['primary_key'] = True
            if c['dflt_value'] is not None:
                col['default'] = c['dflt_value']
            columns.append(col)

        outgoing = [{'column': f['from'], 'table': f['table'],
                     'to': f['to'] or 'id', 'on_delete': f['on_update'] or 'CASCADE'}
                    for f in fks if f['table'] != 'scans']

        incoming = []
        for other in all_tables:
            if other == tname:
                continue
            other_fks = conn.execute(f'PRAGMA foreign_key_list({other})').fetchall()
            for f in other_fks:
                if f['table'] == tname:
                    incoming.append({'table': other, 'column': f['from'], 'to': f['to'] or 'id'})

        indexes = [{'name': i['name'], 'columns': [c['name'] for c in
                     conn.execute(f'PRAGMA index_info({i["name"]})').fetchall()]}
                   for i in idxs]

        result.append({
            'name': tname, 'columns': columns,
            'primary_key': pk_cols, 'indexes': indexes,
            'outgoing_fks': outgoing, 'incoming_fks': incoming,
        })

    return {'tables': result}
