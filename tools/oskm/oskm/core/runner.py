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
"""Scan orchestration: dependency order, scan lifecycle and per-collector writes.

Each collector runs exactly once per scan, in topological order, and reads its
dependencies from the tables the upstream collectors already committed under the
same scan_id. Re-running a single collector is idempotent (its rows for that scan
are deleted and rewritten), which is what makes --reuse-upstream safe.
"""
from dataclasses import dataclass

from . import db, framework
from .models import RequestError, ScanFatalError, ScanProgress
from .schema import COLLECTOR_RUNS, ISSUES


@dataclass(frozen=True)
class CollectorRun:
    collector: str
    status: str
    record_count: int
    issue_count: int
    # Audit trail of what was actually read; consumed by the published documents'
    # overlap checks. Not persisted: it describes this run, not the stored rows.
    inputs: tuple = ()
    scan_directories: tuple = ()


@dataclass(frozen=True)
class ScanRun:
    scan_id: int
    runs: tuple[CollectorRun, ...]

    @property
    def status(self):
        return 'degraded' if any(r.status == 'degraded' for r in self.runs) else 'complete'

    def __getitem__(self, collector):
        for run in self.runs:
            if run.collector == collector:
                return run
        raise KeyError(collector)


def _persist(connection, collector, ctx, scan_id):
    declared = {table.name: table for table in collector.TABLES}
    unknown = set(ctx.records) - set(declared)
    if unknown:
        raise framework.RegistryError(
            f'UNDECLARED_TABLE: {collector.NAME} emitted {sorted(unknown)[0]}')
    status = 'degraded' if ctx.degraded() else 'complete'
    count = 0
    with db.transaction(connection):
        # Idempotent rewrite: drop whatever this collector wrote for this scan.
        db.delete_scan(connection, collector.TABLES, scan_id)
        for table in (ISSUES, COLLECTOR_RUNS):
            connection.execute(
                f'DELETE FROM {table.name} WHERE scan_id = ? AND collector = ?',
                (scan_id, collector.NAME))
        # Declaration order matters: a table may reference one declared before
        # it, and the referenced ids only exist after that insert.
        keys = {}
        for name, table in declared.items():
            rows = collector.resolve_rows(name, ctx.records.get(name, ()), keys)
            written = db.insert(connection, table, rows, scan_id=scan_id)
            # Only the primary table holds published records; auxiliary tables
            # (e.g. an expanded child relation) must not inflate the count.
            if table is collector.TABLES[0]:
                count = written
            if table.surrogate and table.primary_key:
                business = table.primary_key[0]
                keys[name] = {r[business]: r['id'] for r in connection.execute(
                    f'SELECT id, {business} FROM {table.name} WHERE scan_id = ?', (scan_id,))}
        db.insert(connection, ISSUES, list(ctx.issues.values()), scan_id=scan_id)
        # Optional post-insert hook: a collector that needs to update rows
        # after all ids are assigned (e.g. self-referencing FKs) can define
        # post_insert(connection, scan_id).
        hook = getattr(collector, 'post_insert', None)
        if callable(hook):
            hook(connection, scan_id)
        db.insert(connection, COLLECTOR_RUNS, [dict(
            collector=collector.NAME, schema_version=collector.SCHEMA_VERSION,
            status=status, scope=collector().scope(ctx),
            record_count=count)], scan_id=scan_id)
    return CollectorRun(collector.NAME, status, count, len(ctx.issues),
                        tuple(sorted(ctx.inputs)), tuple(sorted(ctx.scan_directories)))


def _record_failure(connection, collector, scan_id, error):
    """A dependency that blew up is recorded, not propagated: the dependent decides
    whether it can still do useful work without those rows."""
    with db.transaction(connection):
        db.insert(connection, COLLECTOR_RUNS, [dict(
            collector=collector.NAME, schema_version=collector.SCHEMA_VERSION,
            status='failed', scope=None, record_count=0,
            error=str(error))], scan_id=scan_id)
    return CollectorRun(collector.NAME, 'failed', 0, 0)


def run(database, request, *, only=None, without=(), scan_id=None, reuse_upstream=False,
        on_progress=None, on_diagnostic=None, cancelled=None):
    """Execute collectors into the store and return a ScanRun.

    only            collector names to run; None means every registered collector.
    without         dependencies to skip; dependents see them as not run.
    scan_id         reuse an existing scan instead of opening a new one.
    reuse_upstream  run only the named collectors, trusting their dependencies to
                    be present already; otherwise dependencies are run too.
    """
    framework.discover()
    selected = list(framework.names() if only is None else only)
    order = selected if reuse_upstream else [
        name for name in framework.resolve_order(selected) if name not in without]
    if reuse_upstream:
        for name in order:
            framework.get(name)
        if scan_id is None:
            raise framework.RegistryError('REUSE_UPSTREAM_REQUIRES_SCAN_ID')

    with database.connect() as connection:
        database.create_all(connection, framework.tables())
        own_scan = scan_id is None
        if own_scan:
            with db.transaction(connection):
                scan_id = db.begin_scan(connection, request.product, request.workspace_root)
        runs = []
        for name in order:
            collector = framework.get(name)
            # A dependency's progress is reported under its own name, so a caller
            # watching one collector still sees a single 'finalize' for it.
            progress = on_progress
            if on_progress is not None and name not in selected:
                def progress(event, _name=name):
                    on_progress(ScanProgress(f'{_name}:{event.phase}', event.completed,
                                             event.total, event.current_input))
            try:
                ctx = collector.CONTEXT_TYPE(
                    scan_id=scan_id, connection=connection, request=request, collector=name,
                    issue_fields=collector.ISSUE_FIELDS, on_progress=progress,
                    on_diagnostic=on_diagnostic, cancelled=cancelled)
                collector().collect(ctx)
            except (ScanFatalError, RequestError) as exc:
                # Explicitly requested collectors still fail the run; a dependency
                # only marks itself failed so dependents can degrade gracefully.
                if name in selected:
                    raise
                runs.append(_record_failure(connection, collector, scan_id, exc))
                continue
            emitted = len(ctx.records.get(collector.TABLES[0].name, ()))
            ctx.progress('finalize', emitted, emitted)
            runs.append(_persist(connection, collector, ctx, scan_id))
        with db.transaction(connection):
            db.finish_scan(connection, scan_id)
    return ScanRun(scan_id, tuple(runs))
