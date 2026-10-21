"""Scan one collector and get its records back in memory.

The store is the system of record; this is the convenience path for a caller who
wants a single domain's result without managing a database file. It runs the
registered collector into an in-memory store and wraps the rows in that domain's
Result type, so the rich in-memory query API (predicates, cursors, aggregation)
stays available.

One function covers every domain: the Result type and record field come from the
collector declaration, so a new collector needs nothing here.
"""
import sqlite3
from contextlib import contextmanager
from dataclasses import replace

from . import export, framework, runner
from .db import Database
from .models import RequestError, ScanLimits, ScanRequest


class _Memory(Database):
    """Database holding one connection open, so :memory: survives reuse."""

    def __init__(self):
        super().__init__(':memory:')
        self._connection = None

    @contextmanager
    def connect(self):
        if self._connection is None:
            self._connection = sqlite3.connect(':memory:', isolation_level=None)
            self._connection.row_factory = sqlite3.Row
            self._connection.execute('PRAGMA foreign_keys = ON')
        yield self._connection

    def close(self):
        if self._connection is not None:
            self._connection.close()
            self._connection = None


def scan(collector, request, *, without=(), on_progress=None, on_diagnostic=None,
         cancelled=None):
    """Run one collector (plus its dependencies) and return its Result.

    `collector` is a registry name or a collector class.
    """
    framework.discover()
    if isinstance(collector, str):
        collector = framework.get(collector)
    if collector.REQUEST_TYPE is not None and not isinstance(request, collector.REQUEST_TYPE):
        raise RequestError(collector.REQUEST_TYPE_ERROR)
    if not getattr(request, 'resolve_component', True):
        # Opting out of attribution means not running the component provider.
        provider = framework.by_role('component')
        if provider is not None:
            without = tuple(without) + (provider.NAME,)
    store = _Memory()
    try:
        unified = ScanRequest(
            workspace_root=request.workspace_root, product=request.product,
            package_root=getattr(request, 'package_root', None),
            limits=getattr(request, 'limits', None) or ScanLimits(),
            options=getattr(request, 'options', None) or {})
        result = runner.run(store, unified, only=[collector.NAME], without=without,
                            on_progress=on_progress, on_diagnostic=on_diagnostic,
                            cancelled=cancelled)
        run = result[collector.NAME]
        # Inputs stay per-collector ("which files did this domain read"); scan
        # directories union across the dependency closure, because an output
        # written into any scanned directory is unsafe regardless of who scanned it.
        directories = set().union(*(set(r.scan_directories) for r in result.runs))
        run = replace(run, scan_directories=tuple(sorted(directories)))
        with store.connect() as connection:
            document = export.export(connection, result.scan_id, collector)
        return collector.RESULT_TYPE(document['snapshot'],
                                     tuple(document[collector.RESULT_FIELD]),
                                     run.inputs, run.scan_directories)
    finally:
        store.close()
