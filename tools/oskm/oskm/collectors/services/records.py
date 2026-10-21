"""Reversible cfg layout and the sole persisted service derivation."""
from .models import BASIC_FIELDS
from ...core.models import UNSET

def can_split_path(path):
    return isinstance(path, (list, tuple)) and bool(path) and isinstance(path[0], str)


def field_value(record, name):
    if name == 'path' and 'executable' in record:
        return [record['executable'], *record['args']]
    return record.get(name, UNSET) if name in BASIC_FIELDS else record.get('config', {}).get(name, UNSET)

def raw_service(record):
    raw = {**{k: record[k] for k in BASIC_FIELDS if k in record}, **record.get('config', {})}
    if 'executable' in record:
        raw['path'] = field_value(record, 'path')
    return raw

def service_type(path):
    if not isinstance(path, (list, tuple)) or not path or not isinstance(path[0], str):
        return None
    executable = path[0]
    if not executable or executable.endswith('/') or any(c in executable for c in '$\x00{}'):
        return None
    return {'sa_main': 'sa', 'hdf_devhost': 'hdf'}.get(executable.rsplit('/', 1)[-1], 'default')

def make_record(cfg, raw):
    record = dict(cfg=cfg, **{k: raw[k] for k in BASIC_FIELDS if k in raw})
    extra = {k: v for k, v in raw.items() if k not in BASIC_FIELDS}
    if can_split_path(raw.get('path')):
        path = extra.pop('path')
        record['executable'] = path[0]
        record['args'] = path[1:]
    if extra:
        record['config'] = extra
    kind = service_type(raw.get('path'))
    if kind:
        record['type'] = kind
    return record
