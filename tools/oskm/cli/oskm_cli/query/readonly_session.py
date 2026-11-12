"""A small, read-only ScanSession replacement for the standalone skill.

The collector side stores published entities relationally. Query-time code only
needs a handful of those entities, so this module reads their rows directly
instead of discovering collectors and calling ``export_record`` on them. It is
deliberately limited to the three unified entity types used by the query tools:
components, services, and install modules.
"""
from __future__ import annotations

import sqlite3
from pathlib import Path

from .errors import QueryError
from .jsonutil import parse_json


BASIC_SERVICE_FIELDS = ('name', 'uid', 'gid', 'start-mode', 'ondemand')
INSTALL_PRIMARY_FIELDS = (
    'label', 'label_name', 'part_name', 'subsystem_name', 'type', 'source',
    'install_enable', 'dest', 'shlib_type',
)


def _json_object(value):
    if not value:
        return {}
    parsed = parse_json(value)
    return parsed if isinstance(parsed, dict) else {}


def _component_record(row):
    """Mirror ComponentsCollector.export_record without importing the collector."""
    record = _json_object(row['record'])
    if row['deps'] is not None and 'deps' not in record:
        record['deps'] = parse_json(row['deps'])
    record['name'] = row['name']
    if row['subsystem'] is not None:
        record['subsystem'] = row['subsystem']
    else:
        record.pop('subsystem', None)
    if row['manifest'] is not None:
        record['manifest'] = row['manifest']
    if row['repo_id'] is not None:
        record['repo_id'] = row['repo_id']
    return record


def _service_type(path):
    if (not isinstance(path, (list, tuple)) or not path
            or not isinstance(path[0], str)):
        return None
    executable = path[0]
    if not executable or executable.endswith('/') or any(
            char in executable for char in '$\x00{}'):
        return None
    return {'sa_main': 'sa', 'hdf_devhost': 'hdf'}.get(
        executable.rsplit('/', 1)[-1], 'default')


def _service_record(row):
    """Mirror the services record transformation and foreign-key rejoins."""
    raw = _json_object(row['record'])
    record = dict(
        cfg=row['cfg'],
        **{key: raw[key] for key in BASIC_SERVICE_FIELDS if key in raw})
    extra = {key: value for key, value in raw.items()
             if key not in BASIC_SERVICE_FIELDS}
    path = raw.get('path')
    if (isinstance(path, (list, tuple)) and path
            and isinstance(path[0], str)):
        extra.pop('path', None)
        record['executable'] = path[0]
        record['args'] = list(path[1:])
    if extra:
        record['config'] = extra
    kind = _service_type(path)
    if kind:
        record['type'] = kind
    return record


def _install_record(row):
    """Mirror ElementCollector.export_record for install-module rows."""
    raw = _json_object(row['record'])
    record = {'ordinal': row['ordinal']}
    record.update({key: raw[key] for key in INSTALL_PRIMARY_FIELDS
                   if key in raw})
    extra = {key: value for key, value in raw.items()
             if key not in INSTALL_PRIMARY_FIELDS}
    if extra:
        record['config'] = extra
    if row['label'] is not None:
        record['label'] = row['label']
    return record


class Entity:
    __slots__ = ('_session', '_row')

    def __init__(self, session, row):
        self._session = session
        self._row = row

    def __getitem__(self, key):
        return self.record[key]

    def get(self, key, default=None):
        return self.record.get(key, default)

    def __repr__(self):
        return f'{type(self).__name__}({self.id!r})'

    @property
    def id(self):
        return self._row['id']

    @property
    def record(self):
        raise NotImplementedError

    def component(self):
        return self._session._component_by_id(self._row['component_id'])


class Component(Entity):
    @property
    def name(self):
        return self._row['name']

    @property
    def subsystem(self):
        return self._row['subsystem']

    @property
    def record(self):
        return _component_record(self._row)

    def dependencies(self):
        deps = self.record.get('deps') or {}
        names = deps.get('components') if isinstance(deps, dict) else None
        return tuple(
            component for component in (
                self._session.component(name) for name in (names or ())
                if isinstance(name, str))
            if component is not None)

    def dependents(self):
        return tuple(
            component for component in self._session.components()
            if any(dep.name == self.name for dep in component.dependencies()))


class Service(Entity):
    @property
    def cfg(self):
        return self._row['cfg']

    @property
    def name(self):
        return self._row['name']

    @property
    def record(self):
        record = _service_record(self._row)
        row = self._row
        component_id = row['component_id']
        if component_id is not None:
            found = self._session.connection.execute(
                'SELECT name, subsystem, manifest FROM components WHERE id = ?',
                (component_id,)).fetchone()
            if found is not None:
                record['component'] = {
                    key: found[key] for key in ('name', 'subsystem', 'manifest')
                    if found[key] is not None
                }
        install_id = row['install_module_id']
        if install_id is not None:
            found = self._session.connection.execute(
                'SELECT label FROM install_modules WHERE id = ?',
                (install_id,)).fetchone()
            if found is not None and found['label'] is not None:
                record['label'] = found['label']
        return record


class InstallModule(Entity):
    @property
    def label(self):
        return self._row['label']

    @property
    def record(self):
        record = _install_record(self._row)
        component_id = self._row['component_id']
        record['component_id'] = component_id
        if component_id is not None:
            found = self._session.connection.execute(
                'SELECT name, subsystem, manifest FROM components WHERE id = ?',
                (component_id,)).fetchone()
            if found is not None:
                record['component'] = {
                    key: found[key] for key in ('name', 'subsystem', 'manifest')
                    if found[key] is not None
                }
        return record

    def targets(self):
        rows = self._session.connection.execute(
            'SELECT dest FROM install_targets WHERE scan_id = ? AND module_id = ? '
            'ORDER BY dest_index', (self._session.scan_id, self.id))
        return tuple(row['dest'] for row in rows)

    def tags(self):
        rows = self._session.connection.execute(
            'SELECT value FROM install_module_tags '
            'WHERE scan_id = ? AND module_id = ? ORDER BY source_index',
            (self._session.scan_id, self.id))
        return tuple(row['value'] for row in rows)


class ReadOnlyScanSession:
    """Read-only view over one completed scan in a knowledge database."""

    def __init__(self, connection, scan_id):
        self.connection = connection
        self.scan_id = scan_id
        self.db_path: Path | None = None
        self._closed = False

    def scan_row(self):
        row = self.connection.execute(
            'SELECT product, cpu_arch, workspace_root, started_at, finished_at '
            'FROM scans WHERE id = ?', (self.scan_id,)).fetchone()
        if row is None:
            raise QueryError(
                'SCAN_NOT_FOUND', f'scan {self.scan_id} does not exist')
        return row

    @classmethod
    def open(cls, db_path, *, scan_id=None, product=None):
        path = Path(db_path).expanduser().resolve()
        uri = path.as_uri() + '?mode=ro'
        try:
            connection = sqlite3.connect(uri, uri=True, isolation_level=None)
            connection.row_factory = sqlite3.Row
            connection.execute('PRAGMA query_only = ON')
        except sqlite3.Error as exc:
            raise QueryError(f'DB_CORRUPT: {exc}') from exc
        try:
            if scan_id is None:
                where = ['finished_at IS NOT NULL']
                parameters = []
                if product is not None:
                    where.append('product = ?')
                    parameters.append(product)
                row = connection.execute(
                    'SELECT id FROM scans WHERE ' + ' AND '.join(where)
                    + ' ORDER BY id DESC LIMIT 1', parameters).fetchone()
                if row is None:
                    raise QueryError('NO_COMPLETED_SCAN')
                scan_id = row['id']
            else:
                scan = connection.execute(
                    'SELECT id, finished_at, product FROM scans WHERE id = ?',
                    (scan_id,)).fetchone()
                if scan is None:
                    raise QueryError(
                        'SCAN_NOT_FOUND', f'scan {scan_id} does not exist')
                if scan['finished_at'] is None:
                    raise QueryError(
                        'SCAN_INCOMPLETE', f'scan {scan_id} is not finished')
                if product is not None and scan['product'] != product:
                    raise QueryError(
                        'NO_COMPLETED_SCAN',
                        f'scan {scan_id} is not product {product}')
            session = cls(connection, scan_id)
            session.db_path = path
            return session
        except Exception:
            connection.close()
            raise

    def __enter__(self):
        return self

    def __exit__(self, *_):
        self.close()

    def close(self):
        if not self._closed:
            self.connection.close()
            self._closed = True

    @property
    def collectors(self):
        return tuple(row['collector'] for row in self.connection.execute(
            'SELECT collector FROM collector_runs WHERE scan_id = ? '
            'ORDER BY collector', (self.scan_id,)))

    @property
    def status(self):
        rows = [row['status'] for row in self.connection.execute(
            'SELECT status FROM collector_runs WHERE scan_id = ?',
            (self.scan_id,))]
        if any(status == 'failed' for status in rows):
            return 'failed'
        return 'degraded' if any(status == 'degraded' for status in rows) else 'complete'

    def sql(self, statement, parameters=()):
        return tuple(dict(row) for row in self.connection.execute(
            statement, parameters))

    def components(self):
        rows = self.connection.execute(
            'SELECT * FROM components WHERE scan_id = ? ORDER BY name',
            (self.scan_id,))
        return tuple(Component(self, row) for row in rows)

    def component(self, name):
        row = self.connection.execute(
            'SELECT * FROM components WHERE scan_id = ? AND name = ?',
            (self.scan_id, name)).fetchone()
        return Component(self, row) if row is not None else None

    def _component_by_id(self, identifier):
        if identifier is None:
            return None
        row = self.connection.execute(
            'SELECT * FROM components WHERE id = ?', (identifier,)).fetchone()
        return Component(self, row) if row is not None else None

    def services(self):
        rows = self.connection.execute(
            'SELECT * FROM services WHERE scan_id = ? ORDER BY position',
            (self.scan_id,))
        return tuple(Service(self, row) for row in rows)

    def service(self, cfg, name=None):
        rows = self.connection.execute(
            'SELECT * FROM services WHERE scan_id = ? AND cfg = ? '
            'ORDER BY position', (self.scan_id, cfg))
        for row in rows:
            if name is None or row['name'] == name:
                return Service(self, row)
        return None

    def install_module(self, label):
        row = self.connection.execute(
            'SELECT * FROM install_modules WHERE scan_id = ? AND label = ? '
            'ORDER BY ordinal LIMIT 1', (self.scan_id, label)).fetchone()
        return InstallModule(self, row) if row is not None else None

    def _module_by_id(self, identifier):
        if identifier is None:
            return None
        row = self.connection.execute(
            'SELECT * FROM install_modules WHERE id = ?', (identifier,)).fetchone()
        return InstallModule(self, row) if row is not None else None

    def installed_at(self, dest):
        """Modules installing ``dest`` with the collector's directory fallback."""
        if not isinstance(dest, str) or not dest:
            return ()
        connection = self.connection
        exact = connection.execute(
            'SELECT module_id FROM install_targets '
            'WHERE scan_id = ? AND dest = ? ORDER BY module_id',
            (self.scan_id, dest)).fetchall()
        if exact:
            selected = exact
        else:
            covering = [
                row for row in connection.execute(
                    'SELECT module_id, dest FROM install_targets '
                    'WHERE scan_id = ? AND directory = 1', (self.scan_id,))
                if dest.startswith(row['dest'] + '/')
            ]
            if not covering:
                return ()
            longest = max(len(row['dest']) for row in covering)
            selected = [row for row in covering
                        if len(row['dest']) == longest]
        seen = set()
        modules = []
        for row in selected:
            if row['module_id'] in seen:
                continue
            seen.add(row['module_id'])
            module = self._module_by_id(row['module_id'])
            if module is not None:
                modules.append(module)
        return tuple(modules)

    def installed_under(self, prefix):
        """(dest, module) pairs below an image directory, in path order."""
        prefix = prefix if prefix.endswith('/') else prefix + '/'
        rows = self.connection.execute(
            'SELECT dest, module_id FROM install_targets '
            'WHERE scan_id = ? AND dest >= ? AND dest < ? ORDER BY dest',
            (self.scan_id, prefix, prefix[:-1] + '0'))
        return tuple((row['dest'], self._module_by_id(row['module_id']))
                     for row in rows)

    def owner_of(self, dest):
        for module in self.installed_at(dest):
            owner = module.component()
            if owner is not None:
                return owner
        return None
