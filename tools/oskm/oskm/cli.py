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
"""Single entry point. Subcommands and collector choices come from the registry,
so a new collector package is runnable the moment it is dropped in.

SQLite is the only persistence: a scan writes rows, and everything else reads
them back through ScanSession. There is no artifact format to choose.

Exit codes: 0 ok, 2 bad request, 3 scan failure, 4 degraded result,
5 quality gate failure, 130 cancelled.
"""
import argparse
import json
import sys
from pathlib import Path

from .core import db, framework
from .core.db import Database, StoreError
from .core.models import (QueryError, RequestError, ScanCancelled, ScanError,
                          ScanLimits, ScanRequest, thaw)
from .core.runner import run

DEFAULT_DB = 'out/knowledge.db'


def _collector_list(value):
    names = tuple(n for n in value.split(',') if n)
    unknown = [n for n in names if n not in framework.names()]
    if unknown:
        raise argparse.ArgumentTypeError(
            f'unknown collector(s): {", ".join(unknown)}; '
            f'available: {", ".join(framework.names())}')
    return names


def parser():
    framework.discover()
    available = ', '.join(framework.names()) or '(none registered)'
    root = argparse.ArgumentParser(
        prog='oskm', allow_abbrev=False,
        description='OpenHarmony system knowledge scanner. '
                    f'Registered collectors: {available}.')
    sub = root.add_subparsers(dest='command', required=True)

    scan = sub.add_parser('scan', allow_abbrev=False,
                          help='scan the source tree into the store (all collectors by default)')
    scan.add_argument('--workspace-root', type=Path, required=True)
    scan.add_argument('--product', required=True)
    scan.add_argument('--db', type=Path, default=Path(DEFAULT_DB))
    scan.add_argument('--only', type=_collector_list,
                      help='comma-separated collectors; dependencies are added automatically')
    scan.add_argument('--without', type=_collector_list, default=(),
                      help='comma-separated dependencies to skip')
    scan.add_argument('--scan-id', type=int, help='write into an existing scan')
    scan.add_argument('--reuse-upstream', action='store_true',
                      help='run only --only, trusting existing upstream rows (needs --scan-id)')
    scan.add_argument('--fail-on', choices=('none', 'error', 'warning'), default='none')
    # Collector-specific options land in request.options[<name>].
    for name in framework.names():
        framework.get(name).add_arguments(scan)

    listing = sub.add_parser('list', allow_abbrev=False, help='list registered collectors')
    listing.add_argument('--db', type=Path, default=Path(DEFAULT_DB))

    scans = sub.add_parser('scans', allow_abbrev=False, help='list stored scans')
    scans.add_argument('--db', type=Path, default=Path(DEFAULT_DB))

    drop = sub.add_parser('drop', allow_abbrev=False, help='delete one stored scan')
    drop.add_argument('--db', type=Path, default=Path(DEFAULT_DB))
    drop.add_argument('--scan-id', type=int, required=True)
    return root


def _gate(database, scan_id, collectors, level):
    """Count the advisory issues that trip the requested severity threshold.

    Deliberately orthogonal to `status`: status answers "could the scan read the
    tree", the gate answers "is what it read semantically wrong". Both now live
    in the same issues table and are told apart by the advisory flag, so the two
    numbers stay independently meaningful -- a gate that also counted read
    failures would merely restate `status`.
    """
    if level == 'none':
        return {}, False
    levels = ('error',) if level == 'error' else ('error', 'warning')
    placeholders = ', '.join('?' * len(levels))
    failures = {}
    with database.connect() as connection:
        for name in collectors:
            found = connection.execute(
                f'SELECT COUNT(*) AS n FROM issues WHERE scan_id = ? AND collector = ? '
                f'AND advisory = 1 AND severity IN ({placeholders})',
                (scan_id, name, *levels)).fetchone()['n']
            if found:
                failures[name] = found
    return failures, bool(failures)


def _scan(args):
    request = ScanRequest(args.workspace_root, args.product, limits=ScanLimits())
    result = run(Database(args.db), request, only=args.only, without=args.without,
                 scan_id=args.scan_id, reuse_upstream=args.reuse_upstream,
                 on_diagnostic=lambda issue: print(json.dumps(thaw(issue), ensure_ascii=False),
                                                   file=sys.stderr))
    # The exit code reflects what was asked for; `status` still reports the whole
    # scan, so a degraded dependency is visible without failing a run that only
    # requested a healthy collector.
    requested = set(args.only) if args.only else {r.collector for r in result.runs}
    failures, failed = _gate(Database(args.db), result.scan_id,
                             [r.collector for r in result.runs if r.collector in requested],
                             args.fail_on)
    degraded = any(r.status != 'complete' for r in result.runs if r.collector in requested)
    return dict(
        db=str(args.db), scan_id=result.scan_id, status=result.status,
        collectors={r.collector: dict(status=r.status, records=r.record_count,
                                      issues=r.issue_count) for r in result.runs},
        gate_passed=not failed, gate_failures=failures,
        # Degraded outranks a gate failure: not being able to read the tree is a
        # bigger problem than what was read being questionable.
        exit_code=4 if degraded else 5 if failed else 0)


def main(argv=None):
    args = parser().parse_args(argv)
    try:
        if args.command == 'scan':
            response = _scan(args)
        elif args.command == 'list':
            response = dict(collectors={
                name: dict(description=framework.get(name).DESCRIPTION,
                           depends_on=list(framework.get(name).DEPENDS_ON),
                           schema_version=framework.get(name).SCHEMA_VERSION)
                for name in framework.names()},
                order=list(framework.resolve_order()), exit_code=0)
        elif args.command == 'scans':
            with Database(args.db).connect() as connection:
                rows = connection.execute(
                    'SELECT id, product, started_at, finished_at FROM scans ORDER BY id').fetchall()
            response = dict(scans=[dict(r) for r in rows], exit_code=0)
        else:
            with Database(args.db).connect() as connection:
                with db.transaction(connection):
                    connection.execute('PRAGMA foreign_keys = ON')
                    cursor = connection.execute('DELETE FROM scans WHERE id = ?', (args.scan_id,))
            response = dict(scan_id=args.scan_id, deleted=cursor.rowcount, exit_code=0)
    except (KeyboardInterrupt, ScanCancelled):
        response = dict(error='CANCELLED', exit_code=130)
    except (QueryError, StoreError) as exc:
        response = dict(error=str(exc), exit_code=5)
    except (ScanError, OSError, ValueError) as exc:
        print(str(exc), file=sys.stderr)
        response = dict(error=str(exc), exit_code=2 if isinstance(exc, RequestError) else 3)
    print(json.dumps(response, ensure_ascii=False, sort_keys=True))
    return response['exit_code']


if __name__ == '__main__':
    raise SystemExit(main())
