#!/usr/bin/env python3
# coding=utf-8

#
# Copyright (c) 2021-2026 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
"""Read-only handle over one scan: per-domain access plus unified-model navigation.

A session works equally from a scan that just ran and from a database opened on
its own, which is the point of storing results relationally -- a consumer such as
an MCP server needs no source tree.

Navigation is registry-driven: the entity graph is built from each collector's
ROLE / COMPONENT_COLUMN / SERVICE_COLUMN declarations, so a new collector joins
the model by declaring its links, without this module naming it.
"""
from . import export, framework
from .models import QueryError


class Entity:
    """A published record plus the links the model gives it."""
    __slots__ = ('_session', '_collector', '_row', 'record')

    def __init__(self, session, collector, row):
        self._session = session
        self._collector = collector
        self._row = row
        self.record = collector.export_record(row, session.connection, session.scan_id)

    def __getitem__(self, key):
        return self.record[key]

    def get(self, key, default=None):
        return self.record.get(key, default)

    def __repr__(self):
        return f'{type(self).__name__}({self.key!r})'

    @property
    def id(self):
        return self._row['id']

    @property
    def key(self):
        return self._row[self._collector.TABLES[0].primary_key[0]]

    def component(self):
        """The owning component, or None when unattributed or unsupported."""
        column = self._collector.COMPONENT_COLUMN
        identifier = self._row[column] if column else None
        return self._session._by_id('component', identifier)

    def service(self):
        """The hosting service, or None.

        Resolved by row id, so a cfg declaring several services links to exactly
        the one that hosts this record.
        """
        column = self._collector.SERVICE_COLUMN
        return self._session._by_id('service', self._row[column] if column else None)

    def install_module(self):
        """The build target that installed this record's artifact, or None."""
        column = self._collector.INSTALL_COLUMN
        return self._session._by_id('install_index', self._row[column] if column else None)


class Component(Entity):
    @property
    def key(self):
        return self._row['name']

    @property
    def name(self):
        return self._row['name']

    @property
    def subsystem(self):
        return self._row['subsystem']

    def attached(self, collector=None):
        """Records attributed to this component, by collector name.

        Every registered collector that declares a COMPONENT_COLUMN participates
        automatically, so a new domain shows up here without changing this code.
        """
        found = {}
        for name in framework.names():
            cls = framework.get(name)
            if cls.COMPONENT_COLUMN and (collector is None or name == collector):
                rows = self._session._entities(cls, **{cls.COMPONENT_COLUMN: self.id})
                if rows:
                    found[name] = rows
        return found.get(collector, ()) if collector else found

    def dependencies(self):
        deps = self.record.get('deps') or {}
        names = deps.get('components') if isinstance(deps, dict) else None
        return tuple(c for c in (self._session.component(n) for n in (names or ())
                                 if isinstance(n, str)) if c is not None)

    def dependents(self):
        """Components declaring this one in deps.components."""
        return tuple(c for c in self._session.components()
                     if any(d.name == self.name for d in c.dependencies()))


class Service(Entity):
    @property
    def key(self):
        return self._row['cfg']

    @property
    def cfg(self):
        return self._row['cfg']

    @property
    def name(self):
        return self._row['name']

    def hosted(self, collector=None):
        """Records hosted by this service (HDI devices, SAs, ...)."""
        found = {}
        for name in framework.names():
            cls = framework.get(name)
            if cls.SERVICE_COLUMN and (collector is None or name == collector):
                rows = self._session._entities(cls, **{cls.SERVICE_COLUMN: self.id})
                if rows:
                    found[name] = rows
        return found.get(collector, ()) if collector else found


class Subsystem:
    __slots__ = ('_session', 'name')

    def __init__(self, session, name):
        self._session = session
        self.name = name

    def __repr__(self):
        return f'Subsystem({self.name!r})'

    def components(self):
        provider = self._session._provider('component')
        return tuple(self._session._entities(provider, subsystem=self.name))


class InstallModule(Entity):
    """One row of the image install manifest."""

    @property
    def key(self):
        # label is unique within a scan but 2% of rows have none (sa_info and
        # build aggregates), so the array position stays the fallback identity.
        return self._row['label'] or self._row['ordinal']

    @property
    def label(self):
        return self._row['label']

    def targets(self):
        """Image paths this module installs, in declaration order."""
        return tuple(row['dest'] for row in self._session.connection.execute(
            'SELECT dest FROM install_targets WHERE scan_id = ? AND module_id = ? '
            'ORDER BY dest_index', (self._session.scan_id, self.id)))

    def tags(self):
        """innerapi release classes declared for this module."""
        return tuple(row['value'] for row in self._session.connection.execute(
            'SELECT value FROM install_module_tags WHERE scan_id = ? AND module_id = ? '
            'ORDER BY source_index', (self._session.scan_id, self.id)))


_ENTITY_TYPES = {'component': Component, 'service': Service,
                 'install_index': InstallModule}


class ScanSession:
    """Read-only view of one scan. Use as a context manager to close the store."""

    def __init__(self, database, scan_id, *, connection=None):
        self.scan_id = scan_id
        self._context = None
        if connection is None:
            self._context = database.connect()
            connection = self._context.__enter__()
        self.connection = connection
        framework.discover()

    @classmethod
    def open(cls, database, *, scan_id=None, product=None):
        """Attach to a stored scan; defaults to the latest completed one."""
        from .db import latest_scan
        context = database.connect()
        connection = context.__enter__()
        if scan_id is None:
            import sqlite3
            try:
                scan_id = latest_scan(connection, product)
            except sqlite3.OperationalError:
                scan_id = None          # store not initialised yet
            if scan_id is None:
                context.__exit__(None, None, None)
                raise QueryError('NO_COMPLETED_SCAN')
        session = cls(database, scan_id, connection=connection)
        session._context = context
        return session

    def __enter__(self):
        return self

    def __exit__(self, *_):
        self.close()

    def close(self):
        if self._context is not None:
            self._context.__exit__(None, None, None)
            self._context = None

    # -- per-collector access --
    @property
    def collectors(self):
        return tuple(row['collector'] for row in self.connection.execute(
            'SELECT collector FROM collector_runs WHERE scan_id = ? ORDER BY collector',
            (self.scan_id,)))

    @property
    def status(self):
        rows = [r['status'] for r in self.connection.execute(
            'SELECT status FROM collector_runs WHERE scan_id = ?', (self.scan_id,))]
        if any(s == 'failed' for s in rows):
            return 'failed'
        return 'degraded' if any(s == 'degraded' for s in rows) else 'complete'

    def document(self, collector):
        """The published JSON document for one collector."""
        return export.export(self.connection, self.scan_id, self._collector(collector))

    def records(self, collector):
        return tuple(e.record for e in self._entities(self._collector(collector)))

    def issues(self, collector=None):
        where = 'scan_id = ?' + ('' if collector is None else ' AND collector = ?')
        args = (self.scan_id,) if collector is None else (self.scan_id, collector)
        return tuple(dict(r) for r in self.connection.execute(
            f'SELECT * FROM issues WHERE {where} ORDER BY collector, path, pointer, code', args))

    def sql(self, statement, parameters=()):
        """Escape hatch for cross-domain queries the entity API does not cover.
        The caller is responsible for scoping on scan_id."""
        return tuple(dict(r) for r in self.connection.execute(statement, parameters))

    # -- unified-model navigation --
    def subsystems(self):
        provider = self._provider('component')
        return tuple(Subsystem(self, row['subsystem']) for row in self.connection.execute(
            f'SELECT DISTINCT subsystem FROM {provider.TABLES[0].name} '
            'WHERE scan_id = ? AND subsystem IS NOT NULL ORDER BY subsystem', (self.scan_id,)))

    def subsystem(self, name):
        return Subsystem(self, name)

    def components(self):
        return self._entities(self._provider('component'))

    def component(self, name):
        found = self._entities(self._provider('component'), name=name)
        return found[0] if found else None

    def services(self):
        return self._entities(self._provider('service'))

    def service(self, cfg, name=None):
        found = self._entities(self._provider('service'), cfg=cfg)
        if name is not None:
            found = tuple(s for s in found if s.name == name)
        return found[0] if found else None

    # -- install manifest --
    def install_module(self, label):
        """The module built by a GN label, or None.

        The first in declaration order when a target was built for more than one
        toolchain, since stripping the toolchain makes those share a label.
        """
        found = self._entities(self._provider('install_index'), label=label)
        return found[0] if found else None

    def installed_at(self, dest):
        """Modules installing `dest`.

        Exact match first, then the longest directory install covering it: a
        declaration ending in '/' claims everything below it, so exact lookup
        alone would miss every file inside an installed HAP directory.
        """
        index = self._provider('install_index').lookup(self.connection, self.scan_id)
        return tuple(self._by_id('install_index', module['id'])
                     for module in index.at(dest))

    def installed_under(self, prefix):
        """(dest, module) pairs below an image directory, in path order."""
        provider = self._provider('install_index')
        prefix = prefix if prefix.endswith('/') else prefix + '/'
        rows = self.connection.execute(
            'SELECT dest, module_id FROM install_targets '
            'WHERE scan_id = ? AND dest >= ? AND dest < ? ORDER BY dest',
            (self.scan_id, prefix, prefix[:-1] + '0')).fetchall()
        return tuple((row['dest'], self._by_id('install_index', row['module_id']))
                     for row in rows)

    def owner_of(self, dest):
        """The component owning an installed path, or None when unattributable."""
        for module in self.installed_at(dest):
            if module is not None:
                owner = module.component()
                if owner is not None:
                    return owner
        return None

    # -- internals --
    def _collector(self, name):
        if name not in self.collectors:
            raise QueryError(f'COLLECTOR_NOT_IN_SESSION: {name}')
        return framework.get(name)

    def _by_id(self, role, identifier):
        """Resolve a foreign key to its entity, or None when unset."""
        if identifier is None:
            return None
        found = self._entities(self._provider(role), id=identifier)
        return found[0] if found else None

    def _provider(self, role):
        collector = framework.by_role(role)
        if collector is None or collector.NAME not in self.collectors:
            raise QueryError(f'NO_{role.upper()}_PROVIDER_IN_SESSION')
        return collector

    def _entities(self, collector, **equals):
        table = collector.TABLES[0]
        clauses = ['scan_id = ?']
        parameters = [self.scan_id]
        for column, value in sorted(equals.items()):
            clauses.append(f'{column} = ?')
            parameters.append(value)
        rows = self.connection.execute(
            f'SELECT * FROM {table.name} WHERE {" AND ".join(clauses)} '
            f'ORDER BY {collector.EXPORT_ORDER}', parameters).fetchall()
        kind = _ENTITY_TYPES.get(collector.ROLE, Entity)
        return tuple(kind(self, collector, row) for row in rows)
