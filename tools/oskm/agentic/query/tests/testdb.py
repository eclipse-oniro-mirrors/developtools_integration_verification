"""Shared access to the real knowledge.db used by query-layer tests.

`OSKM_TEST_DB` selects the database.  Paths in this module are resolved from
the selected scan's install targets; they must never be rewritten from the
zone or CPU architecture.  The architecture only breaks ties when one file
name exists at both `system/lib` and `system/lib64` in a synthetic fixture.
"""
import os
import sqlite3
from pathlib import Path


AGENTIC = Path(__file__).resolve().parents[2]
OSKM = AGENTIC.parent
ROOT = OSKM.parents[1]
DEFAULT_DB = ROOT / 'artifacts/rk3568/knowledge.db'
DB = Path(os.environ.get('OSKM_TEST_DB', DEFAULT_DB)).expanduser().resolve()


def connect(db_path=None):
    connection = sqlite3.connect(str(db_path or DB))
    connection.row_factory = sqlite3.Row
    return connection


def latest_scan(db_path=None):
    """Return the newest finished scan, including its zone and CPU arch."""
    if not Path(db_path or DB).is_file():
        return None
    try:
        connection = connect(db_path)
        try:
            row = connection.execute(
                'SELECT id, product, zone, cpu_arch FROM scans '
                'WHERE finished_at IS NOT NULL ORDER BY id DESC LIMIT 1').fetchone()
            return dict(row) if row else None
        finally:
            connection.close()
    except sqlite3.OperationalError as exc:
        message = str(exc)
        if ('no such table: scans' in message
                or 'no such column: zone' in message
                or 'no such column: cpu_arch' in message):
            raise RuntimeError(
                'knowledge.db predates scans.zone/cpu_arch; rescan it with '
                '--zone blue|yellow and the matching --cpu-arch') from exc
        raise


def is_rk3568(db_path=None):
    scan = latest_scan(db_path)
    return bool(scan and scan.get('product') == 'rk3568')


def preferred_library_root(db_path=None):
    """The system library root expected for the selected scan's CPU arch."""
    scan = latest_scan(db_path)
    if not scan:
        return None
    return {'arm': 'system/lib/', 'arm64': 'system/lib64/'}.get(scan.get('cpu_arch'))


def elf_dest(file_name, db_path=None, fallback=None):
    """Resolve an ELF basename to its scan's actual `install_targets.dest`."""
    scan = latest_scan(db_path)
    if not scan:
        return fallback
    preferred = 'system/lib64/%' if scan.get('cpu_arch') == 'arm64' else 'system/lib/%'
    try:
        connection = connect(db_path)
        try:
            row = connection.execute(
                'SELECT t.dest FROM elf_modules e '
                'JOIN install_targets t ON t.scan_id=e.scan_id '
                'AND t.id=e.install_target_id '
                'WHERE e.scan_id=? AND e.file_name=? '
                'ORDER BY CASE WHEN t.dest LIKE ? THEN 0 ELSE 1 END, t.dest '
                'LIMIT 1', (scan['id'], file_name, preferred)).fetchone()
            return row['dest'] if row else fallback
        finally:
            connection.close()
    except sqlite3.Error:
        return fallback


def system_library_dests(db_path=None):
    """Return all install destinations under either system library root."""
    scan = latest_scan(db_path)
    if not scan:
        return []
    try:
        connection = connect(db_path)
        try:
            rows = connection.execute(
                "SELECT DISTINCT dest FROM install_targets "
                "WHERE scan_id=? AND (dest LIKE 'system/lib/%' "
                "OR dest LIKE 'system/lib64/%') ORDER BY dest",
                (scan['id'],)).fetchall()
            return [row['dest'] for row in rows]
        finally:
            connection.close()
    except sqlite3.OperationalError:
        return []
