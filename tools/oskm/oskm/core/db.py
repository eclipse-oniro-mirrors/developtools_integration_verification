"""SQLite store: connections, transactions, bulk writes and scan lifecycle.

Standard library only (sqlite3). Two invariants the rest of the framework relies on:

* every connection enables foreign keys -- SQLite ignores ON DELETE CASCADE unless
  `PRAGMA foreign_keys = ON` is set per connection, so declaring the constraint is
  not enough on its own;
* JSON columns are written through core/io.py:canonical(), so stored JSON is
  deterministic and preserves Decimal literals exactly.
"""
import sqlite3
from contextlib import contextmanager
from datetime import datetime, timezone
from pathlib import Path

from .io import canonical
from .schema import SCAN_COLUMN, SCANS, FRAMEWORK_TABLES


class StoreError(Exception):
    pass


def now():
    return datetime.now(timezone.utc).isoformat(timespec='seconds')


@contextmanager
def transaction(connection):
    """Explicit transaction; rolls back on any exception, including cancellation."""
    connection.execute('BEGIN')
    try:
        yield connection
    except BaseException:
        connection.execute('ROLLBACK')
        raise
    connection.execute('COMMIT')


class Database:
    def __init__(self, path):
        self.path = Path(path)

    @contextmanager
    def connect(self):
        try:
            connection = sqlite3.connect(self.path, isolation_level=None)
        except sqlite3.Error as exc:
            raise StoreError(f'CONNECT_FAILED: {exc}') from exc
        try:
            connection.row_factory = sqlite3.Row
            connection.execute('PRAGMA foreign_keys = ON')
            yield connection
        finally:
            connection.close()

    def create_all(self, connection, tables):
        for table in (*FRAMEWORK_TABLES, *tables):
            connection.execute(table.ddl())
            for statement in table.index_ddl():
                connection.execute(statement)


def _encode(table, row):
    """Map a record dict onto the table's columns, serializing JSON columns.

    An absent key and a present null are different facts in a scan result (a
    manifest may legitimately declare `"deps": null`), so they must not collapse:
    an absent key stores SQL NULL, a present null stores the JSON text 'null'.
    """
    columns = {column.name: column for column in table.all_columns}
    unknown = set(row) - set(columns)
    if unknown:
        raise StoreError(f'UNKNOWN_COLUMN: {table.name}.{sorted(unknown)[0]}')
    values = []
    for name, column in columns.items():
        if name not in row:
            values.append(None)
        elif column.type == 'JSON':
            values.append(canonical(row[name]).decode())
        else:
            values.append(row[name])
    return tuple(values)


def insert(connection, table, rows, *, scan_id=None):
    """Bulk-insert records. scan_id is injected for scan-scoped tables."""
    rows = list(rows)
    if not rows:
        return 0
    if table.scan_scoped:
        if scan_id is None:
            raise StoreError(f'SCAN_ID_REQUIRED: {table.name}')
        rows = [{SCAN_COLUMN: scan_id, **row} for row in rows]
    names = [column.name for column in table.all_columns]
    statement = (f'INSERT INTO {table.name} ({", ".join(names)}) '
                 f'VALUES ({", ".join("?" * len(names))})')
    try:
        connection.executemany(statement, [_encode(table, row) for row in rows])
    except sqlite3.Error as exc:
        raise StoreError(f'INSERT_FAILED: {table.name}: {exc}') from exc
    return len(rows)


def begin_scan(connection, product, workspace_root, *, started_at=None):
    cursor = connection.execute(
        f'INSERT INTO {SCANS.name} (product, workspace_root, started_at) VALUES (?, ?, ?)',
        (product, str(workspace_root), started_at or now()))
    return cursor.lastrowid


def finish_scan(connection, scan_id, *, finished_at=None):
    connection.execute(f'UPDATE {SCANS.name} SET finished_at = ? WHERE id = ?',
                       (finished_at or now(), scan_id))


def delete_scan(connection, tables, scan_id):
    """Remove one scan's rows from the given tables. Returns per-table counts.

    Generated from the table declarations, so a collector cannot forget a table
    the way a hand-written per-collector cleanup routine can.
    """
    counts = {}
    for table in tables:
        cursor = connection.execute(table.delete_sql(), (scan_id,))
        counts[table.name] = cursor.rowcount
    return counts


def latest_scan(connection, product=None, *, complete_only=True):
    """Most recent scan id, or None. Incomplete scans are hidden by default: a run
    interrupted midway leaves finished_at NULL and must not be read as authoritative."""
    where, parameters = [], []
    if product is not None:
        where.append('product = ?')
        parameters.append(product)
    if complete_only:
        where.append('finished_at IS NOT NULL')
    clause = (' WHERE ' + ' AND '.join(where)) if where else ''
    row = connection.execute(
        f'SELECT id FROM {SCANS.name}{clause} ORDER BY id DESC LIMIT 1', parameters).fetchone()
    return row['id'] if row else None
