"""Advisory checks on init cfg declarations that were read correctly.

These are issues like any other, raised with advisory=True: the cfg parsed fine,
but it declares a value init would reject (importance outside -20..19, a
malformed socket entry) or a service name a second cfg also uses. The record is
never rewritten -- the declaration stands as written and the finding sits beside
it.

Only fields with verified semantics are checked. Unknown cfg declarations are
preserved in the record and intentionally ignored here.
"""
from collections import Counter
from decimal import Decimal
import re

from .records import raw_service

VERIFIED_FIELDS = frozenset((
    'name', 'path', 'ondemand', 'saspawn', 'disabled', 'once', 'critical',
    'jobs', 'start-mode', 'end-mode', 'period', 'uid', 'gid', 'setuid', 'caps', 'apl',
    'permission', 'permission_acls', 'kernel_permission', 'secon', 'sandbox',
    'd-caps', 'socket', 'file', 'console', 'importance', 'writepid', 'cgroup',
    'env', 'cpucore', 'bootevents',
))


def _strings(value, nonempty=False):
    return isinstance(value, list) and (bool(value) or not nonempty) and all(isinstance(v, str) for v in value)


def _integer(value):
    return type(value) is int


def _account(value):
    return (isinstance(value, str) and bool(value)) or (_integer(value) and value >= 0)


def _valid_value(key, value):
    if key in ('name', 'secon'):
        return isinstance(value, str) and bool(value) and (key != 'name' or len(value.encode()) <= 32)
    if key == 'path':
        return _strings(value, True) and len(value) < 20 and all(v and len(v.encode()) <= 200 for v in value)
    if key in ('ondemand', 'saspawn', 'setuid', 'cgroup'):
        return type(value) is bool
    if key in ('once', 'sandbox', 'disabled'):
        return _integer(value) and value in (0, 1)
    if key == 'console':
        return _integer(value) and value in (0, 1, 2)
    if key == 'importance':
        return _integer(value) and -20 <= value <= 19
    if key == 'period':
        return _integer(value) and value > 0
    if key == 'uid':
        return _account(value)
    if key == 'gid':
        entries = value if isinstance(value, list) else [value]
        return bool(entries) and all(_account(v) for v in entries)
    if key in ('start-mode', 'end-mode', 'apl'):
        options = {'start-mode': ('boot', 'normal', 'condition'),
                   'end-mode': ('pre-fork', 'after-fork', 'after-exec', 'ready'),
                   'apl': ('normal', 'system_basic', 'system_core')}
        return isinstance(value, str) and value in options[key]
    if key == 'critical':
        parts = value if isinstance(value, list) else [value]
        return (len(parts) in (1, 3) and all(_integer(v) for v in parts) and parts[0] in (0, 1)
                and (len(parts) == 1 or (parts[1] > 0 and parts[2] > 0)))
    if key in ('permission', 'permission_acls', 'writepid', 'd-caps'):
        return _strings(value)
    if key == 'caps':
        return isinstance(value, list) and all(isinstance(v, str) or (_integer(v) and v >= -1) for v in value)
    if key == 'bootevents':
        return isinstance(value, str) or _strings(value)
    if key == 'jobs':
        return isinstance(value, dict) and all(isinstance(v, str) for v in value.values())
    if key == 'kernel_permission':
        return isinstance(value, dict) and all(type(v) in (int, float, Decimal, bool) for v in value.values())
    if key == 'cpucore':
        return isinstance(value, list) and all(_integer(v) and v >= 0 for v in value)
    # Every VERIFIED_FIELDS entry is handled above; there is no fall-through.
    return isinstance(value, list)      # socket, file, env


def _resource_item(key, value):
    if key == 'file':
        if not isinstance(value, str):
            return None
        parts = value.split()
        if len(parts) != 5 or not re.fullmatch(r'[0-7]{3,4}', parts[2]):
            return None
        return dict(zip(('path', 'access_mode', 'mode', 'uid', 'gid'), parts), mode_bits=int(parts[2], 8))
    if not isinstance(value, dict):
        return None
    if key == 'env':
        return value if all(isinstance(value.get(k), str) for k in ('name', 'value')) else None
    required = ('name', 'family', 'type', 'protocol', 'permissions', 'uid', 'gid')
    if not all(k in value for k in required):
        return None
    if not all(isinstance(value[k], str) for k in required[:5]) or not _account(value['uid']) or not _account(value['gid']):
        return None
    if not re.fullmatch(r'[0-7]{3,4}', value['permissions']):
        return None
    if 'option' in value and not isinstance(value['option'], list):
        return None
    return dict(value, mode_bits=int(value['permissions'], 8))


def check(ctx, records):
    """records: (record, pointer) pairs as read from the cfg files."""
    names = Counter(r['name'] for r, _ in records if isinstance(r.get('name'), str))
    for record, pointer in records:
        path = ctx.package / record['cfg']
        raw = raw_service(record)

        def add(field, code, severity='error', **details):
            ctx.issue(path, code, f'{pointer}/{field}', severity=severity,
                      advisory=True, details=details or None)

        for name in ('name', 'path'):
            if name not in raw:
                add(name, 'FIELD_MISSING')
        if isinstance(raw.get('name'), str) and names[raw['name']] > 1:
            add('name', 'DUPLICATE_SERVICE_NAME', 'warning',
                service_name=raw['name'], declarations=names[raw['name']])
        for name, value in raw.items():
            if name not in VERIFIED_FIELDS:
                continue
            if not _valid_value(name, value):
                add(name, 'FIELD_INVALID')
            elif name in ('socket', 'file', 'env'):
                for i, item in enumerate(value):
                    if _resource_item(name, item) is None:
                        add(f'{name}/{i}', 'RESOURCE_INVALID')
