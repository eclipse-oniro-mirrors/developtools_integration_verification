"""Device attributes are kept separately from host and installation metadata."""
from ...core.models import UNSET

PRIMARY_FIELDS = ('serviceName', 'moduleName', 'policy', 'preload')

def field_value(record, name):
    return record.get(name, UNSET) if name in PRIMARY_FIELDS else record.get('config', {}).get(name, UNSET)

def raw_hdi(record):
    return {**{k: record[k] for k in PRIMARY_FIELDS if k in record}, **record.get('config', {})}

def make_record(hcb, node, host, raw):
    result = dict(hcb=hcb, node=node, **{k: raw[k] for k in PRIMARY_FIELDS if k in raw})
    if 'hostName' in host:
        result['process'] = host['hostName']
    extra = {k: v for k, v in raw.items() if k not in PRIMARY_FIELDS}
    if extra:
        result['config'] = extra
    return result
