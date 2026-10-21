"""Rebuild the published JSON documents from the SQLite store.

SQLite files are not byte-reproducible (page layout, autoincrement, timestamps),
so the determinism guarantee lives here instead: a document exported from the
store is byte-identical to what the pre-SQLite scanner wrote, because canonical()
sorts keys and JSON columns keep their original text (Decimal literals included).

Absent and present-null round-trip correctly: a NULL column means the key was not
in the record, the JSON text 'null' means it was present and null.
"""
from .io import parse_json
from .schema import SCAN_COLUMN


def _value(row, column):
    raw = row[column.name]
    if raw is None:
        return None
    return parse_json(raw.encode())[0] if column.type == 'JSON' else raw


def record_from_row(row, table, *, skip=()):
    """Generic row to record: drop absent columns, decode JSON columns verbatim."""
    record = {}
    for column in table.all_columns:
        if column.name == SCAN_COLUMN or column.name in skip:
            continue
        if row[column.name] is not None:
            record[column.name] = _value(row, column)
    return record


def rejoin_component(record, row, collector, connection, scan_id):
    """Re-attach the published component object from the stored foreign key.

    Records store only component_id; the {name, subsystem, manifest} object is
    rebuilt here so a re-run of one collector cannot leave a stale copy behind.
    The provider is resolved through the registry's ROLE, not by table name.
    """
    from .framework import by_role
    identifier = row[collector.COMPONENT_COLUMN] if collector.COMPONENT_COLUMN else None
    provider = by_role('component')
    if identifier is None or provider is None:
        return record
    table = provider.TABLES[0].name
    found = connection.execute(
        f'SELECT name, subsystem, manifest FROM {table} WHERE id = ?', (identifier,)).fetchone()
    if found is not None:
        record['component'] = {key: found[key] for key in ('name', 'subsystem', 'manifest')
                               if found[key] is not None}
    return record


def rejoin_service(record, row, collector, connection, scan_id):
    """Refresh the {cfg, name} host reference from the stored foreign key.

    The record keeps the reference as scanned; this overwrites it from the
    foreign key so that re-running one collector against an updated services
    table cannot publish a stale copy.
    """
    from .framework import by_role
    identifier = row[collector.SERVICE_COLUMN] if collector.SERVICE_COLUMN else None
    provider = by_role('service')
    if identifier is None or provider is None:
        return record
    found = connection.execute(
        f'SELECT cfg, name FROM {provider.TABLES[0].name} WHERE id = ?', (identifier,)).fetchone()
    if found is not None:
        record['service'] = {'cfg': found['cfg'], 'name': found['name']}
    return record


def rejoin_install(record, row, collector, connection, scan_id):
    """Re-attach the installing module's GN label from the stored foreign key.

    `label` is not stored per domain any more: it belongs to the build target
    that installed the artifact, so it is read back through install_module_id.
    A record whose artifact no module installs simply has no label.
    """
    from .framework import by_role
    identifier = row[collector.INSTALL_COLUMN] if collector.INSTALL_COLUMN else None
    provider = by_role('install_index')
    if identifier is None or provider is None:
        return record
    found = connection.execute(
        f'SELECT label FROM {provider.TABLES[0].name} WHERE id = ?', (identifier,)).fetchone()
    if found is not None and found['label'] is not None:
        record['label'] = found['label']
    return record


def issues(connection, scan_id, collector):
    """Issue rows shaped per the collector's published contract.

    Domains disagree on which fields they publish (components carries severity and
    the owning component, the others carry only path/code/pointer) and on the sort
    key, so both come from the collector declaration rather than being assumed.
    """
    order = ', '.join(collector.ISSUE_ORDER)
    rows = connection.execute(
        f'SELECT * FROM issues WHERE scan_id = ? AND collector = ? ORDER BY {order}',
        (scan_id, collector.NAME)).fetchall()
    published = []
    for row in rows:
        issue = {}
        for name in collector.ISSUE_FIELDS:
            value = row[name]
            if value is None or (value == '' and name in ('pointer', 'component')):
                continue          # omitted keys, matching the published schemas
            if name == 'advisory':
                # Present only when true: the default reading of an issue is
                # "the scan fell short", and that needs no marker.
                if value:
                    issue[name] = True
                continue
            issue[name] = parse_json(value.encode())[0] if name == 'details' else value
        published.append(issue)
    return published


def snapshot(connection, scan_id, collector):
    run = connection.execute(
        'SELECT * FROM collector_runs WHERE scan_id = ? AND collector = ?',
        (scan_id, collector.NAME)).fetchone()
    if run is None:
        raise LookupError(f'NO_RUN: {collector.NAME}@{scan_id}')
    product = connection.execute(
        'SELECT product FROM scans WHERE id = ?', (scan_id,)).fetchone()['product']
    document = dict(schema_version=run['schema_version'], product=product,
                    scope=parse_json(run['scope'].encode())[0], status=run['status'])
    published = issues(connection, scan_id, collector)
    if published:
        document['issues'] = published
    return document


def export(connection, scan_id, collector):
    """The full published document: snapshot plus the collector's record array."""
    table = collector.TABLES[0]
    rows = connection.execute(
        f'SELECT * FROM {table.name} WHERE {SCAN_COLUMN} = ? ORDER BY {collector.EXPORT_ORDER}',
        (scan_id,)).fetchall()
    records = [collector.export_record(row, connection, scan_id) for row in rows]
    return {'snapshot': snapshot(connection, scan_id, collector),
            collector.RESULT_FIELD: records}
