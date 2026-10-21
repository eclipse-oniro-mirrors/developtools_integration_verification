"""Collector plugin framework: the enforced base class, the registry and the
per-collector scan context.

Unlike the previous convention-based base classes (optional hooks plus a written
guide), BaseCollector is an ABC: a collector that does not implement collect()
cannot be instantiated, and one that is not registered is never run. Declaring
TABLES is likewise mandatory, which is what lets the framework generate both the
DDL and the per-scan cleanup instead of asking every collector to hand-write them.
"""
import importlib
import pkgutil
from abc import ABC, abstractmethod
from collections.abc import Mapping
from dataclasses import fields
from pathlib import Path

from . import db
from .io import InputFailure, parse_json, read_bytes, valid_product
from .models import (RequestError, ScanCancelled, ScanFatalError, ScanLimits,
                     ScanProgress, freeze)
from .schema import Table

# Errors a bounded read can raise; shared by every domain's parse loop.
READ_ERRORS = (InputFailure, ValueError, UnicodeError, RecursionError)

# SQLite stores integers in 8 bytes; anything wider cannot become a column value.
_INT_MIN, _INT_MAX = -2 ** 63, 2 ** 63 - 1


def project_columns(record, fields, bucket=None):
    """Column values projected from a scanned record.

    The columns are an index over `record`, which keeps the declaration whole:
    a value a column cannot hold simply leaves that column NULL and stays exact
    in the record, so nothing needs a fallback store.

    `bucket` names the record key holding the element's remaining fields (see
    core.shape). Passing it lets one declaration cover both levels; without it
    every bucket-level column needs a hand-written projection() call.
    """
    projected = {}
    for column, key, kind in fields:
        if key in record:
            value = record[key]
        else:
            nested = record.get(bucket) if bucket else None
            if not isinstance(nested, Mapping) or key not in nested:
                continue
            value = nested[key]
        projected[column] = value if kind == 'json' else projection(value, kind)
    return projected


def projection(value, kind='text'):
    """Scalar projection of a record value for a promoted column, or None.

    Promoted columns are an index over the record, never the record itself: a
    value that does not conform to the column's type (wrong type, or an integer
    too wide for SQLite) projects to NULL and stays readable in `record`. That
    keeps the published shape independent of what any column can hold.
    """
    if kind == 'text':
        return value if isinstance(value, str) else None
    if kind == 'bool':
        # type(), not isinstance(): bool is a subclass of int and the two are
        # distinct values in a scan result.
        return int(value) if type(value) is bool else None
    if kind == 'int':
        return value if type(value) is int and _INT_MIN <= value <= _INT_MAX else None
    raise ValueError(f'UNKNOWN_PROJECTION_KIND: {kind}')


class RegistryError(Exception):
    pass


_COLLECTORS = {}


# ---- registry ---------------------------------------------------------------

def register(cls):
    """Class decorator: validate a collector's declaration and register it."""
    for attribute in ('NAME', 'SCHEMA_VERSION'):
        value = getattr(cls, attribute, None)
        if not isinstance(value, str) or not value:
            raise RegistryError(f'MISSING_{attribute}: {cls.__name__}')
    if not isinstance(cls.DEPENDS_ON, tuple) or any(not isinstance(d, str) for d in cls.DEPENDS_ON):
        raise RegistryError(f'INVALID_DEPENDS_ON: {cls.__name__}')
    if cls.NAME in cls.DEPENDS_ON:
        raise RegistryError(f'SELF_DEPENDENCY: {cls.NAME}')
    if not isinstance(cls.TABLES, tuple) or not cls.TABLES or any(
            not isinstance(t, Table) for t in cls.TABLES):
        raise RegistryError(f'INVALID_TABLES: {cls.__name__}')
    existing = _COLLECTORS.get(cls.NAME)
    if existing is not None and existing is not cls:
        raise RegistryError(f'DUPLICATE_COLLECTOR: {cls.NAME}')
    _COLLECTORS[cls.NAME] = cls
    return cls


def get(name):
    try:
        return _COLLECTORS[name]
    except KeyError:
        raise RegistryError(f'UNKNOWN_COLLECTOR: {name}') from None


def names():
    return tuple(sorted(_COLLECTORS))


def by_role(role):
    """The collector occupying a semantic role, or None if it is not registered."""
    for name in names():
        if _COLLECTORS[name].ROLE == role:
            return _COLLECTORS[name]
    return None


def tables(selected=None):
    """Every declared table across the selected collectors, deduplicated."""
    seen = {}
    for name in (names() if selected is None else selected):
        for table in get(name).TABLES:
            seen.setdefault(table.name, table)
    return tuple(seen.values())


def resolve_order(selected=None):
    """Topological execution order including transitive dependencies.

    Deterministic: among collectors whose dependencies are already satisfied the
    alphabetically first runs next, so the same selection always produces the same
    order (and therefore the same scan_id-to-row assignment) across runs.
    """
    requested = list(names() if selected is None else selected)
    for name in requested:
        get(name)
    needed, stack = set(), list(requested)
    while stack:
        name = stack.pop()
        if name in needed:
            continue
        collector = _COLLECTORS.get(name)
        if collector is None:
            raise RegistryError(f'UNKNOWN_DEPENDENCY: {name}')
        needed.add(name)
        stack.extend(collector.DEPENDS_ON)
    order, done = [], set()
    while len(order) < len(needed):
        ready = sorted(n for n in needed - done
                       if all(d in done for d in _COLLECTORS[n].DEPENDS_ON))
        if not ready:
            raise RegistryError(f'DEPENDENCY_CYCLE: {sorted(needed - done)}')
        order.extend(ready)
        done.update(ready)
    return tuple(order)


def discover(package=None):
    """Import every collector package so its @register decorator runs.

    This is the only place the framework touches the collectors tree, and it
    enumerates no domain names: dropping a package in is enough to register it.
    """
    if package is None:
        from .. import collectors as package
    for info in pkgutil.iter_modules(package.__path__):
        if not info.ispkg:
            continue
        module = f'{package.__name__}.{info.name}.collector'
        try:
            importlib.import_module(module)
        except ModuleNotFoundError as exc:
            # A package without collector.py has not been migrated yet; skip it
            # rather than breaking discovery of the ones that have.
            if exc.name != module:
                raise
    return names()


# ---- collector-facing context -----------------------------------------------

class Upstream:
    """Read-only access to already-written tables of the same scan.

    This is how a collector consumes its dependencies: the upstream collector has
    already committed its rows under this scan_id, so there is nothing to pass in
    memory and nothing to re-scan.
    """

    def __init__(self, connection, scan_id):
        self._connection = connection
        self._scan_id = scan_id

    def rows(self, table, order_by=None, **equals):
        clauses = ['scan_id = ?']
        parameters = [self._scan_id]
        for column, value in sorted(equals.items()):
            clauses.append(f'{column} = ?')
            parameters.append(value)
        statement = f'SELECT * FROM {table} WHERE {" AND ".join(clauses)}'
        if order_by:
            statement += f' ORDER BY {order_by}'
        return tuple(dict(row) for row in self._connection.execute(statement, parameters))

    def index(self, table, key, order_by=None):
        """Rows keyed by one column; replaces the hand-built dependency indexes."""
        return {row[key]: row for row in self.rows(table, order_by=order_by)}

    def records(self, collector):
        """A dependency's published records, rebuilt from its rows.

        Lets a dependent consume exactly what the upstream collector publishes
        without re-scanning it or knowing its table layout.
        """
        cls = get(collector)
        rows = self._connection.execute(
            f'SELECT * FROM {cls.TABLES[0].name} WHERE scan_id = ? ORDER BY {cls.EXPORT_ORDER}',
            (self._scan_id,)).fetchall()
        return [cls.export_record(row, self._connection, self._scan_id) for row in rows]

    def identified(self, collector):
        """(row id, published record) pairs, so a dependent can store a real
        foreign key instead of re-deriving a business key."""
        cls = get(collector)
        rows = self._connection.execute(
            f'SELECT * FROM {cls.TABLES[0].name} WHERE scan_id = ? ORDER BY {cls.EXPORT_ORDER}',
            (self._scan_id,)).fetchall()
        return [(row['id'], cls.export_record(row, self._connection, self._scan_id))
                for row in rows]

    def status(self, collector):
        return self._status(collector)

    def inventory_complete(self, collector):
        """Whether a dependency's record set is trustworthy for a consumer that
        only needs the records themselves."""
        return get(collector).inventory_complete(self._connection, self._scan_id)

    def _status(self, collector):
        row = self._connection.execute(
            'SELECT status FROM collector_runs WHERE scan_id = ? AND collector = ?',
            (self._scan_id, collector)).fetchone()
        return row['status'] if row else None

    def failed(self, collector):
        """The dependency ran but could not produce usable rows."""
        return self._status(collector) == 'failed'

    def ran(self, collector):
        """Whether a collector produced rows in this scan. A dependency that was
        deselected is absent, which is different from one that ran and found
        nothing: the former must disable the dependent step, not fail every
        lookup against it."""
        return self._status(collector) not in (None, 'failed')


class ScanContext:
    """Per-collector scan state: roots, bounded IO, progress, issues, emitted rows.

    Rows are buffered and written by the runner in one transaction, so a collector
    that fails midway leaves no partial rows behind.
    """
    INPUT_LIMIT_CODE = 'INPUT_COUNT_LIMIT'

    def __init__(self, *, scan_id, connection, request, collector,
                 issue_fields=('path', 'pointer', 'code'),
                 on_progress=None, on_diagnostic=None, cancelled=None):
        if not valid_product(request.product):
            raise RequestError('INVALID_PRODUCT')
        if not isinstance(request.limits, ScanLimits) or any(
                type(getattr(request.limits, item.name)) is not int
                or getattr(request.limits, item.name) <= 0 for item in fields(ScanLimits)):
            raise RequestError('INVALID_LIMITS')
        try:
            self.workspace = Path(request.workspace_root).resolve()
            if not self.workspace.is_dir():
                raise ValueError()
        except (TypeError, ValueError, OSError, RuntimeError) as exc:
            raise RequestError('INPUT_ROOT_MISSING') from exc
        self.scan_id = scan_id
        self.connection = connection
        self.request = request
        self.limits = request.limits
        self.collector = collector
        self.issue_fields = issue_fields
        self.on_progress, self.on_diagnostic, self.cancelled = on_progress, on_diagnostic, cancelled
        self.build = self.workspace / 'out' / request.product
        package = request.package_root if request.package_root is not None else self.build / 'packages/phone'
        self.package = (self.workspace / package).resolve()
        if not self.package.is_relative_to(self.workspace):
            raise RequestError('PACKAGE_OUTSIDE_WORKSPACE')
        self.upstream = Upstream(connection, scan_id)
        self.inputs = set()
        self.scan_directories = set()
        self.records = {}
        self.issues = {}
        self.used_bytes = 0
        self.setup()

    def setup(self):
        """Domain hook: resolve extra roots, validate them, initialise domain state.
        Raise RequestError when an input root is missing or escapes the workspace."""

    # -- lifecycle --
    def call(self, callback, *args):
        if callback is not None:
            try:
                return callback(*args)
            except Exception as exc:
                raise ScanFatalError('CALLBACK_FAILED') from exc

    def check(self):
        if self.call(self.cancelled):
            raise ScanCancelled('CANCELLED')

    def progress(self, phase, completed, total=None, path=None):
        self.check()
        self.call(self.on_progress, ScanProgress(phase, completed, total, path))

    # -- bounded input --
    def track(self, paths):
        self.inputs.update(str(p) for p in paths)
        if len(self.inputs) > self.limits.input_files:
            raise ScanFatalError(self.INPUT_LIMIT_CODE)

    def read_bytes(self, path, root):
        """Bounded, tracked read. Enforces both the per-file cap and the scan-wide
        cumulative budget, so one collector cannot exhaust memory on a large tree."""
        self.check()
        self.track((path,))
        remaining = self.limits.total_bytes - self.used_bytes
        if remaining <= 0:
            raise ScanFatalError('INPUT_LIMIT')
        cap = min(self.limits.file_bytes, remaining)
        try:
            data = read_bytes(path, cap, root)
        except InputFailure as exc:
            if exc.code == 'SIZE_LIMIT' and remaining < self.limits.file_bytes:
                raise ScanFatalError('INPUT_LIMIT') from exc
            raise
        self.used_bytes += len(data)
        return data

    def read_json(self, path, root):
        obj, duplicates = parse_json(self.read_bytes(path, root))
        if duplicates:
            raise InputFailure('DUPLICATE_JSON_KEY', path)
        return obj

    def relative(self, path):
        return Path(path).relative_to(self.workspace).as_posix()

    def component_index(self, *, location=None):
        """Lookup for attribution: a dict, None when the dependency ran but
        failed, or False when it was not selected at all.

        The three states are not interchangeable -- "not selected" means skip
        attribution silently, "failed" means report it and continue without
        binding -- so the distinction is made once, here.
        """
        provider = by_role('component')
        if provider is None:
            return False
        if self.upstream.failed(provider.NAME):
            if location is not None:
                self.issue(location, 'COMPONENT_INDEX_UNAVAILABLE')
            return None
        if self.upstream.ran(provider.NAME):
            # name -> row; callers bind the surrogate id, not the name, so the
            # reference survives the component table being rewritten.
            return self.upstream.index(provider.NAME, 'name')
        return False

    def install_index(self):
        """Index of what the build installed where, or None/False.

        Three states, like component_index(): the index, None when it exists but
        cannot be trusted, False when the provider was not selected at all.
        "Cannot be trusted" folds in outright failure and a partially read
        manifest, since neither lets a consumer tell "not installed" from
        "not known".

        No issue is raised here: what a missing index costs differs per domain
        (for services and HDI it is the only source of attribution, for SA it is
        a supplementary link), so the caller reports it.
        """
        provider = by_role('install_index')
        if provider is None or not self.upstream.ran(provider.NAME):
            return False
        if (self.upstream.failed(provider.NAME)
                or not self.upstream.inventory_complete(provider.NAME)):
            return None
        return provider.lookup(self.connection, self.scan_id)

    # -- output --
    def emit(self, table, row):
        self.records.setdefault(table, []).append(row)

    def issue(self, path, code, pointer=None, *, severity='error', component=None,
              details=None, advisory=False):
        """Record one problem. `path` is an absolute Path inside the workspace.

        Deduplicated on (path, pointer, code), matching the issues table's primary
        key, so the first occurrence wins and the insert cannot collide.

        advisory=True means "everything was read fine, but what it says is
        questionable" -- a semantic judgement about the data rather than a gap in
        the scan. Those do not make the scan degraded and do not make the
        inventory incomplete; they still fail --fail-on at their severity.
        """
        row = dict(collector=self.collector, path=self.relative(path), pointer=pointer or '',
                   code=code, severity=severity, component=component or '',
                   advisory=int(advisory))
        # Omit rather than store null: _encode treats a present key as a real value,
        # so details=None would persist the JSON text 'null' instead of SQL NULL.
        if details is not None:
            row['details'] = details
        # Keyed exactly like the issues table's primary key. Dropping `component`
        # would merge two components that fail on the same shared manifest.
        key = (row['component'], row['path'], row['pointer'], row['code'])
        if key not in self.issues:
            self.issues[key] = row
            # Shaped exactly like export.issues(), so a live callback and the
            # stored document never disagree: omitted empties, advisory only
            # when true (its default reading needs no marker).
            published = {}
            for name in self.issue_fields:
                value = row.get(name)
                if value is None or (value == '' and name in ('pointer', 'component')):
                    continue
                if name == 'advisory':
                    if value:
                        published[name] = True
                    continue
                published[name] = value
            self.call(self.on_diagnostic, freeze(published))

    def degraded(self):
        """Whether the scan itself fell short. Advisory findings are excluded:
        a cfg declaring an out-of-range value was still read perfectly."""
        return any(row['severity'] != 'info' and not row['advisory']
                   for row in self.issues.values())


# ---- the enforced base class -------------------------------------------------

class BaseCollector(ABC):
    NAME = None                      # registry key, CLI subcommand, collector_runs.collector
    DESCRIPTION = ''
    DEPENDS_ON = ()                  # names of collectors whose tables this one reads
    SCHEMA_VERSION = None
    TABLES = ()                      # drives DDL and per-scan cleanup
    CONTEXT_TYPE = ScanContext       # override to add domain roots and IO helpers

    # -- published JSON contract (see core/export.py) --
    RESULT_FIELD = None              # name of the record collection
    RESULT_TYPE = None               # in-memory Result type (see core/api.py)
    REQUEST_TYPE = None              # accepted request dataclass
    REQUEST_TYPE_ERROR = 'EXPECTED_SCAN_REQUEST'
    EXPORT_ORDER = 'rowid'           # ORDER BY reproducing the published record order
    ISSUE_FIELDS = ('path', 'pointer', 'code', 'advisory')
    ISSUE_ORDER = ('path', 'pointer', 'code')

    @abstractmethod
    def collect(self, ctx):
        """Read the source tree and ctx.upstream, then ctx.emit()/ctx.issue().

        Returns nothing: status, timing, row writing and transaction handling are
        the runner's responsibility.
        """

    def scope(self, ctx):
        """Value stored in collector_runs.scope; override when the domain has one."""
        return None

    # -- unified-model links (see core/session.py) --
    # ROLE names the semantic position a collector occupies in the model, so the
    # navigation layer resolves "the component provider" through the registry
    # rather than hard-coding a domain name.
    ROLE = None                 # 'component' | 'service' | 'install_index' | None
    COMPONENT_COLUMN = None     # column holding the owning component's id
    SERVICE_COLUMN = None       # column holding the hosting service's id
    INSTALL_COLUMN = None       # column holding the installing module's id

    # Issue codes that indicate the record set itself is incomplete. Empty means
    # "any issue counts"; a collector whose issues are partly about enrichment
    # rather than discovery narrows this.
    ATTRIBUTION_PREFIXES = ()

    @classmethod
    def inventory_complete(cls, connection, scan_id):
        """Whether this collector found and parsed every record it should have.

        Distinct from the published status: a consumer doing host matching needs
        the inventory to be complete, but does not care whether each record's
        owning component could be resolved.
        """
        rows = connection.execute(
            'SELECT code FROM issues WHERE scan_id = ? AND collector = ? AND advisory = 0',
            (scan_id, cls.NAME)).fetchall()
        return not any(not row['code'].startswith(cls.ATTRIBUTION_PREFIXES)
                       for row in rows) if cls.ATTRIBUTION_PREFIXES else not rows

    @classmethod
    def resolve_rows(cls, table, rows, keys):
        """Last chance to rewrite rows before insert, with `keys` holding the
        {business key: id} map of every already-inserted table of this collector.
        Lets one table carry a real foreign key to another it is emitted with."""
        return rows

    @classmethod
    def export_record(cls, row, connection, scan_id):
        """Rebuild one published record from a stored row.

        The default maps columns straight back. A collector that keeps the source
        declaration in a `record` column regenerates the published shape from it
        instead -- the columns are only a projection, so they cannot be the source
        of truth for the export. Those collectors override this.
        """
        from .export import record_from_row
        return record_from_row(row, cls.TABLES[0])

    @classmethod
    def lookup(cls, connection, scan_id):
        """A consumer-facing index over this collector's committed rows.

        Overridden by providers whose rows other domains join against, so the
        join rule lives with the domain that owns it instead of being copied
        into every consumer (or into core, which must not know domain names).
        """
        return None

    @classmethod
    def add_arguments(cls, parser):
        """Optional: declare collector-specific CLI options (see SystemPulse's
        per-collector argparse). Options land in request.options[NAME]."""

    @classmethod
    def delete_scan(cls, connection, scan_id):
        """Remove this collector's rows for one scan. Generated from TABLES."""
        return db.delete_scan(connection, cls.TABLES, scan_id)


class ElementCollector(BaseCollector):
    """Template for the `source file -> document -> element array -> row` shape.

    collect() and export_record() are generated from SHAPE and FIELDS; a domain
    implements discovery and parsing only. Opt in by subclassing -- a domain
    that does not fit (components reads a build index, keeps the whole manifest
    object as its record and writes four related tables) subclasses
    BaseCollector directly rather than half-implementing this one. Half-filled
    hooks are how the previous convention-based base class failed.
    """
    SHAPE = None                  # core.shape.RecordShape
    FIELDS = ()                   # (column, declared key, kind)
    LINK_COLUMNS = ()             # attribution/host foreign keys set by enrich()
    OVERLAY = ()                  # derived columns re-applied to the exported record

    @abstractmethod
    def sources(self, ctx):
        """Source paths to read. Unreadable or out-of-bounds inputs issue here."""

    @abstractmethod
    def elements(self, ctx, path):
        """Parse one source into (context values, document values, element, pointer).

        The only format-coupled step: JSON documents, binary HCB trees and
        anything added later are absorbed here, not in the pipeline.
        """

    def enrich(self, ctx, records):
        """Optional: attribution and cross-domain links (ownership/linking)."""

    def quality(self, ctx, records):
        """Optional: advisory checks over the complete record set."""

    def columns(self, ctx, record):
        """Optional: columns no declaration covers."""
        return {}

    def collect(self, ctx):
        records = []
        for path in self.sources(ctx):
            records.extend((self.SHAPE.make(context, document, raw), pointer)
                           for context, document, raw, pointer in self.elements(ctx, path))
        self.enrich(ctx, records)
        self.quality(ctx, records)
        table = self.TABLES[0]
        # The business key is whatever the table declares, not a fixed name:
        # array position is the identity, but domains spell it differently.
        key = table.primary_key[0]
        for position, (record, _) in enumerate(records):
            # Links are popped: they are database identity, never part of the
            # declaration, so they must not reach SHAPE.raw().
            links = {column: record.pop(column, None) for column in self.LINK_COLUMNS}
            ctx.emit(table.name, {
                key: position, 'record': self.SHAPE.raw(record), **links,
                **project_columns(record, self.FIELDS, self.SHAPE.bucket),
                **self.columns(ctx, record)})

    @classmethod
    def export_record(cls, row, connection, scan_id):
        """Regenerate the published record from the stored declaration.

        The columns are only a projection, so they cannot be the source of
        truth here: the record is rebuilt by replaying SHAPE.make() over the
        `record` column, then the derived columns are laid back on top.
        """
        from .export import rejoin_component, rejoin_install, rejoin_service
        raw = parse_json(row['record'].encode())[0]
        context = tuple(row[column] for column in cls.SHAPE.context)
        # The column is named for the record key, but make() reads the document
        # by its own key (an HDF host calls it hostName), so translate back.
        document = {}
        for key, source in cls.SHAPE.document.items():
            if key in row.keys() and row[key] is not None:
                document[source] = parse_json(row[key].encode())[0]
        record = cls.SHAPE.make(context, document, raw)
        for column in cls.OVERLAY:
            if row[column] is not None:
                record[column] = row[column]
        rejoin_install(record, row, cls, connection, scan_id)
        rejoin_service(record, row, cls, connection, scan_id)
        return rejoin_component(record, row, cls, connection, scan_id)
