"""Advisory checks on SA declarations that were read correctly.

These are issues like any other, raised with advisory=True: the profile parsed
fine, but what it declares is wrong (an SA id outside the valid range, a second
profile claiming the same id). Installed declarations are never rewritten -- the
finding is recorded next to the record, not applied to it.
"""
from collections import Counter


def check(ctx, records):
    """records: (record, pointer) pairs as read from the profiles."""
    names = Counter(r['name'] for r, _ in records if type(r.get('name')) is int)
    for record, pointer in records:
        path = ctx.package / record['profile']

        def add(field, code, severity='error', **details):
            ctx.issue(path, code, f'{pointer}/{field}', severity=severity,
                      advisory=True, details=details or None)

        for key in ('process', 'libpath'):
            if not isinstance(record.get(key), str) or not record[key]:
                add(key, 'SA_FIELD_INVALID')
        name = record.get('name')
        if type(name) is not int or not 1 <= name <= 0xffffff:
            add('name', 'SA_ID_INVALID')
        if type(name) is int and names[name] > 1:
            # Two profiles claiming one id: samgr resolves it to whichever
            # registers last, so both declarations are suspect. Independent of
            # the range check -- an out-of-range id can also be duplicated.
            add('name', 'SA_ID_DUPLICATE', 'warning', said=name, declarations=names[name])
        for key in ('run-on-create', 'distributed'):
            if key in record and type(record[key]) is not bool:
                add(key, 'SA_FIELD_INVALID')
