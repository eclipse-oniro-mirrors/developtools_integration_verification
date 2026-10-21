"""Advisory checks on HDI device nodes that were read correctly.

These are issues like any other, raised with advisory=True: the HCB decompiled
fine, but the node declares something the HDF runtime would reject, or a service
name a second node also uses.
"""
from collections import Counter

from ...core.models import UNSET
from .records import field_value


def check(ctx, records):
    counts = Counter(r['serviceName'] for r in records if isinstance(r.get('serviceName'), str))
    for record in records:
        path = ctx.package / record['hcb']
        node = record['node']

        def add(field, code, severity='error', **details):
            ctx.issue(path, code, f'{node}/{field}', severity=severity,
                      advisory=True, details=details or None)

        for key in ('serviceName', 'moduleName', 'process'):
            if not isinstance(record.get(key), str) or not record[key]:
                add(key, 'HDI_FIELD_INVALID')
        if isinstance(record.get('serviceName'), str) and counts[record['serviceName']] > 1:
            add('serviceName', 'HDI_NAME_DUPLICATE', 'warning',
                service_name=record['serviceName'], declarations=counts[record['serviceName']])
        for key in ('policy', 'preload', 'priority', 'permission'):
            value = field_value(record, key)
            if value is not UNSET and (type(value) is not int or value < 0):
                add(key, 'HDI_FIELD_INVALID')
