"""Tracked, bounded input reads and strict JSON decoding."""
import hashlib
import json
from decimal import Decimal
from collections.abc import Mapping
from pathlib import Path


def valid_product(value):
    """Shared product-name shape check reused by request validation and by domains
    that also validate an already-scanned product field (e.g. components)."""
    return (isinstance(value, str) and bool(value) and value not in ('.', '..')
            and not any(c in value for c in '/\\\x00'))


def canonical(value, *, indent=None):
    """Deterministic exact JSON; optional indentation changes whitespace only."""
    def container(left, right, items, depth):
        if not items:
            return left + right
        if indent is None:
            return left + ','.join(items) + right
        padding = ' ' * indent * (depth + 1)
        return left + '\n' + padding + (',\n' + padding).join(items) + '\n' + ' ' * indent * depth + right

    def encode(v, depth=0):
        if isinstance(v, Mapping):
            separator = ':' if indent is None else ': '
            items = [json.dumps(k, ensure_ascii=False) + separator + encode(v[k], depth + 1) for k in sorted(v)]
            return container('{', '}', items, depth)
        if isinstance(v, (list, tuple)):
            return container('[', ']', [encode(x, depth + 1) for x in v], depth)
        if isinstance(v, Decimal):
            if not v.is_finite():
                raise ValueError('NON_FINITE_NUMBER')
            return str(v)
        return json.dumps(v, ensure_ascii=False, allow_nan=False, separators=(',', ':'))
    return encode(value).encode('utf-8')


def digest(value):
    return hashlib.sha256(value).hexdigest()


def pointer(value):
    return str(value).replace('~', '~0').replace('/', '~1')


class Pairs(list):
    pass


def parse_json(data):
    duplicates = []
    def invalid_constant(value):
        raise ValueError(f'Non-JSON constant {value}')
    raw = json.loads(data.decode('utf-8'), object_pairs_hook=Pairs, parse_float=Decimal, parse_constant=invalid_constant)
    def convert(value, path):
        if isinstance(value, Pairs):
            result = {}
            for key, child in value:
                loc = path + '/' + pointer(key)
                if key in result:
                    duplicates.append(loc)
                result[key] = convert(child, loc)
            return result
        if isinstance(value, list):
            return [convert(child, path + '/' + str(i)) for i, child in enumerate(value)]
        return value
    return convert(raw, ''), duplicates


class InputFailure(Exception):
    def __init__(self, code, path):
        super().__init__(f'{code}: {path}')
        self.code = code
        self.path = str(path)



def read_bytes(path, limit, root):
    """Bounded read, confined to root, detecting changes during the read."""
    path = Path(path)
    try:
        if not path.resolve().is_relative_to(root.resolve()):
            raise InputFailure('OUTSIDE_ALLOWED_ROOT', path)
        before = path.stat()
        if not path.is_file():
            raise InputFailure('NOT_A_FILE', path)
        if before.st_size > limit:
            raise InputFailure('SIZE_LIMIT', path)
        with path.open('rb') as handle:
            data = handle.read(limit + 1)
        after = path.stat()
        if len(data) > limit:
            raise InputFailure('SIZE_LIMIT', path)
        if (before.st_ino, before.st_size, before.st_mtime_ns) != (after.st_ino, after.st_size, after.st_mtime_ns):
            raise InputFailure('INPUT_CHANGED', path)
        return data
    except (OSError, RuntimeError) as exc:
        raise InputFailure('UNREADABLE', path) from exc
