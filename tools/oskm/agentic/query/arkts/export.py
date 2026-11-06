"""Complete four-table export in a single read snapshot, without surrogate IDs."""
from contextlib import contextmanager
import json
from oskm_schema.arkts_records import key_maps, publish
from oskm_schema.arkts import TABLES


@contextmanager
def snapshot(connection):
    own = not connection.in_transaction
    if own:
        connection.execute('BEGIN')
    try:
        yield
    finally:
        if own:
            connection.execute('ROLLBACK')


def export_document(session):
    from .query import ArktsQuery
    with snapshot(session.connection):
        query = ArktsQuery(session)
        keys = key_maps(session.connection, session.scan_id)
        result = {'snapshot': dict(scan_id=session.scan_id, schema_version='1.0.0',
            status=query.run['status'], scope=query.scope,
            issues=[{**{k: row[k] for k in ('path', 'pointer', 'code', 'severity', 'advisory')},
                     'details': json.loads(row['details']) if row['details'] else None}
                    for row in session.connection.execute(
                        "SELECT * FROM issues WHERE scan_id=? AND collector='arkts' ORDER BY path,pointer,code",
                        (session.scan_id,))])}
        # The document field is the table's own name: one less list to keep in
        # step with TABLES.
        for table in TABLES:
            result[table.name.removeprefix('arkts_')] = [publish(row, table, keys)
                for row in session.connection.execute(
                    f'SELECT * FROM {table.name} WHERE scan_id=? ORDER BY {table.primary_key[0]}', (session.scan_id,))]
        return result
