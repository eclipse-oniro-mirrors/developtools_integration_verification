"""Schema module: database self-description tools."""
from __future__ import annotations

import re

from .. import catalog
from ..tools import register, ToolError


@register('get_tables', '已注册表名列表', {
    'type': 'object', 'properties': {}, 'additionalProperties': False
})
def get_tables(params, manager):
    session = manager.get_active()
    names = sorted(catalog.table_names(session))
    return {'tables': names}


@register('get_schema', '表结构自描述', {
    'type': 'object',
    'properties': {
        'table': {'type': 'string', 'description': 'Table name; omit for all tables'}
    },
    'additionalProperties': False
})
def _schema_columns(cols):
    columns = []
    for column in cols:
        item = {'name': column['name'], 'type': column['type'] or 'TEXT',
                'nullable': not column['notnull']}
        if column['pk']:
            item['primary_key'] = True
        if column['dflt_value'] is not None:
            item['default'] = column['dflt_value']
        columns.append(item)
    return columns


def _schema_indexes(connection, indexes):
    return [
        {'name': index['name'],
         'columns': [column['name'] for column in connection.execute(
             f'PRAGMA index_info({index["name"]})').fetchall()]}
        for index in indexes
    ]


def _incoming_foreign_keys(connection, all_tables, table_name):
    incoming = []
    for other in all_tables:
        if other == table_name:
            continue
        for foreign_key in connection.execute(
                f'PRAGMA foreign_key_list({other})').fetchall():
            if foreign_key['table'] == table_name:
                incoming.append({'table': other, 'column': foreign_key['from'],
                                 'to': foreign_key['to'] or 'id'})
    return incoming


def _describe_table(connection, all_tables, table_name):
    columns = connection.execute(f'PRAGMA table_info({table_name})').fetchall()
    foreign_keys = connection.execute(
        f'PRAGMA foreign_key_list({table_name})').fetchall()
    indexes = connection.execute(f'PRAGMA index_list({table_name})').fetchall()
    outgoing = [
        {'column': foreign_key['from'], 'table': foreign_key['table'],
         'to': foreign_key['to'] or 'id',
         'on_delete': foreign_key['on_update'] or 'CASCADE'}
        for foreign_key in foreign_keys if foreign_key['table'] != 'scans'
    ]
    return {
        'name': table_name, 'columns': _schema_columns(columns),
        'primary_key': [column['name'] for column in columns if column['pk']],
        'indexes': _schema_indexes(connection, indexes),
        'outgoing_fks': outgoing,
        'incoming_fks': _incoming_foreign_keys(connection, all_tables, table_name),
    }


def get_schema(params, manager):
    session = manager.get_active()
    all_tables = list(catalog.table_names(session))
    table_filter = params.get('table')
    if table_filter:
        if table_filter not in all_tables:
            raise ToolError('INVALID_TABLE', f'unknown table: {table_filter}')
        tables_to_query = [table_filter]
    else:
        tables_to_query = sorted(all_tables)
    return {'tables': [_describe_table(session.connection, all_tables, table)
                       for table in tables_to_query]}
