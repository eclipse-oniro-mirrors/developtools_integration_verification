"""Pure comparison, predicate and pagination helpers shared by two domains."""
import base64
import binascii
import re
from collections.abc import Mapping
from dataclasses import fields as dataclass_fields
from decimal import Decimal
from .io import canonical, digest, parse_json
from .models import UNSET, QueryError, FieldPredicate, PageRequest, thaw

def equal(a, b):
    if isinstance(a, bool) or isinstance(b, bool):
        return type(a) is type(b) and a == b
    if isinstance(a, (int, float, Decimal)) and isinstance(b, (int, float, Decimal)):
        return Decimal(str(a)) == Decimal(str(b))
    if isinstance(a, Mapping) and isinstance(b, Mapping):
        return a.keys() == b.keys() and all(equal(a[k], b[k]) for k in a)
    if isinstance(a, (tuple, list)) and isinstance(b, (tuple, list)):
        return len(a) == len(b) and all(equal(x, y) for x, y in zip(a, b))
    return type(a) is type(b) and a == b


def numeric_key(value):
    sign, digits, exponent = Decimal(str(value)).as_tuple()
    digits = list(digits)
    while digits and digits[-1] == 0:
        digits.pop()
        exponent += 1
    return [sign if digits else 0, digits, exponent if digits else 0]


def at_pointer(value, pointer):
    if pointer and (not pointer.startswith('/') or re.search(r'~(?![01])', pointer)):
        raise QueryError('INVALID_POINTER')
    for part in pointer.split('/')[1:]:
        part = part.replace('~1', '/').replace('~0', '~')
        try:
            if isinstance(value, (tuple, list)):
                if not re.fullmatch(r'0|[1-9][0-9]*', part):
                    return UNSET
                value = value[int(part)]
            elif isinstance(value, Mapping):
                value = value[part]
            else:
                return UNSET
        except (KeyError, IndexError):
            return UNSET
    return value


def string_choices(obj, skip=()):
    for field in dataclass_fields(obj):
        if field.name in skip:
            continue
        values = getattr(obj, field.name)
        if not isinstance(values, tuple) or not all(isinstance(v, str) for v in values):
            raise QueryError('EXPECTED_STRING_TUPLE: ' + field.name)


def validate_predicates(predicates):
    if not isinstance(predicates, tuple):
        raise QueryError('INVALID_FIELD_FILTERS')
    for p in predicates:
        if not isinstance(p, FieldPredicate) or not isinstance(p.name, str):
            raise QueryError('INVALID_FIELD_PREDICATE')
        if p.op not in ('eq', 'in', 'contains', 'present', 'absent', 'is_null'):
            raise QueryError('INVALID_OPERATOR')
        if not isinstance(p.pointer, str):
            raise QueryError('INVALID_POINTER')
        at_pointer({}, p.pointer)
        if p.op in ('present', 'absent', 'is_null'):
            if p.value is not UNSET:
                raise QueryError('UNEXPECTED_PREDICATE_VALUE')
        elif p.value is UNSET:
            raise QueryError('MISSING_PREDICATE_VALUE')
        if p.op == 'in' and not isinstance(p.value, (tuple, list)):
            raise QueryError('IN_REQUIRES_ARRAY')
        if p.value is not UNSET:
            try:
                canonical(p.value)
            except (TypeError, ValueError):
                raise QueryError('INVALID_JSON_VALUE') from None


def filter_key(f):
    obj = thaw(f)
    for p in obj['fields']:
        if p['value'] is UNSET:
            p.pop('value')
    return obj



def matches(value, predicate):
    value = at_pointer(value, predicate.pointer)
    if predicate.op == 'absent':
        return value is UNSET
    if predicate.op == 'present':
        return value is not UNSET
    if value is UNSET:
        return False
    if predicate.op == 'is_null':
        return value is None
    if predicate.op == 'eq':
        return equal(value, predicate.value)
    if predicate.op == 'in':
        return any(equal(value, v) for v in predicate.value)
    return isinstance(value, (list, tuple)) and any(equal(v, predicate.value) for v in value)


def paginate(rows, page, context, result_fingerprint):
    if not isinstance(page, PageRequest) or type(page.limit) is not int or not 1 <= page.limit <= 1000:
        raise QueryError('INVALID_PAGE_LIMIT')
    fingerprint = digest(canonical([result_fingerprint, context]))
    offset = 0
    if page.cursor is not None:
        try:
            cursor, duplicates = parse_json(base64.b64decode(page.cursor, altchars=b'-_', validate=True))
            if duplicates or not isinstance(cursor, dict) or cursor.get('query') != fingerprint or type(cursor.get('offset')) is not int or not 0 <= cursor['offset'] <= len(rows):
                raise ValueError()
            offset = cursor['offset']
        except (ValueError, TypeError, binascii.Error, UnicodeError):
            raise QueryError('INVALID_CURSOR') from None
    end = offset + page.limit
    cursor = base64.urlsafe_b64encode(canonical(dict(query=fingerprint, offset=end))).decode() if end < len(rows) else None
    return rows[offset:end], cursor

