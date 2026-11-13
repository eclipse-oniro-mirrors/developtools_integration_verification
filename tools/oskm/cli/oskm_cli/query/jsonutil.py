"""Strict JSON helpers used by the standalone read-only query package."""
from __future__ import annotations

import json
from collections.abc import Mapping
from decimal import Decimal


def canonical(value, *, indent=None):
    """Return deterministic exact UTF-8 JSON.

    Decimal values are emitted as their exact decimal spelling and non-finite
    numbers are rejected. Mapping keys are sorted, so page_token hashes and output
    do not depend on insertion order.
    """
    def container(left, right, items, depth):
        if not items:
            return left + right
        if indent is None:
            return left + ','.join(items) + right
        padding = ' ' * indent * (depth + 1)
        return (left + '\n' + padding + (',\n' + padding).join(items)
                + '\n' + ' ' * indent * depth + right)

    def encode(item, depth=0):
        if isinstance(item, Mapping):
            separator = ':' if indent is None else ': '
            items = [
                json.dumps(key, ensure_ascii=False) + separator
                + encode(item[key], depth + 1)
                for key in sorted(item)
            ]
            return container('{', '}', items, depth)
        if isinstance(item, (list, tuple)):
            return container(
                '[', ']', [encode(child, depth + 1) for child in item], depth)
        if isinstance(item, Decimal):
            if not item.is_finite():
                raise ValueError('NON_FINITE_NUMBER')
            return str(item)
        return json.dumps(
            item, ensure_ascii=False, allow_nan=False, separators=(',', ':'))

    return encode(value).encode('utf-8')


def parse_json(value):
    """Decode a stored JSON column while preserving non-integer numbers."""
    def reject_constant(token):
        raise ValueError(f'Non-JSON constant {token}')

    if isinstance(value, bytes):
        value = value.decode('utf-8')
    return json.loads(
        value, parse_float=Decimal, parse_constant=reject_constant)
