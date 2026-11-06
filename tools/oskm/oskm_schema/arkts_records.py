"""Regenerate published facts from raw records and explicit derived columns.

Surrogate ids never leave the store: a foreign key is published as the business
key of the row it points at. Which column maps to which key is read from the
table declarations, so adding a table cannot leave a stale literal behind.
"""
import json

from .arkts import TABLES


def _foreign_keys(tables):
    """FK column -> (owning table, its business key), for tables we own."""
    owned = {table.name: table for table in tables}
    return {column.name: (target, owned[target].primary_key[0])
            for table in tables for column in table.columns
            if column.references
            for target in (column.references.split('(')[0],)
            if target in owned and owned[target].primary_key}


FOREIGN_KEYS = _foreign_keys(TABLES)


def publish(row, table, keys=None, *, evidence=True):
    result = {}
    keys = keys or {}
    own = {column.name for column in table.columns}
    for column in table.columns:
        name = column.name
        if name.endswith('_id'):
            published = FOREIGN_KEYS.get(name, (None, None))[1]
            # A relation already carries source_path as its own column, with the
            # same value as the declaration it points at; do not publish twice.
            if published and published not in own and name in keys and row[name] is not None:
                result[published] = keys[name][row[name]]
            continue
        if name == 'record' and not evidence:
            continue
        if row[name] is not None:
            result[name] = json.loads(row[name]) if column.type == 'JSON' else row[name]
    return result


def key_maps(connection, scan_id):
    """id -> business key, for every foreign key the published records use."""
    return {column: {r['id']: r[key] for r in connection.execute(
        f'SELECT id, {key} FROM {table} WHERE scan_id=?', (scan_id,))}
        for column, (table, key) in FOREIGN_KEYS.items()}
