"""Read-only SA queries, with the same predicate and cursor semantics as services."""
from collections.abc import Mapping
from decimal import Decimal
from .models import SAFilter, SAAggregatePage
from .records import field_value
from ...core.io import canonical
from ...core.models import UNSET, QueryError, PageRequest, Page, freeze
from ...core.query import string_choices, validate_predicates, filter_key, matches, paginate, numeric_key
from ...core.base_query import BaseQuery

class SAQuery(BaseQuery):
    def get_sa(self, position):
        self._check()
        if type(position) is not int or position < 0:
            raise QueryError('INVALID_POSITION')
        return self._result.sas[position] if position < len(self._result.sas) else None

    def get_service_ref(self, position):
        record = self.get_sa(position)
        return record.get('service') if record is not None else None

    def _select(self, filters):
        self._check()
        if not isinstance(filters, SAFilter):
            raise QueryError('INVALID_FILTER')
        string_choices(filters, ('ids', 'fields'))
        if not isinstance(filters.ids, tuple) or not all(type(n) is int and n > 0 for n in filters.ids):
            raise QueryError('INVALID_SA_IDS')
        validate_predicates(filters.fields)
        rows = []
        for position, record in enumerate(self._result.sas):
            if filters.ids and (type(record.get('name')) is not int or record['name'] not in filters.ids):
                continue
            component = record.get('component', {})
            choices = [(filters.processes, record.get('service', {}).get('name')),
                       (filters.components, component.get('name')),
                       (filters.subsystems, component.get('subsystem')), (filters.profiles, record['profile']),
                       (filters.service_names, record.get('service', {}).get('name'))]
            if all(not options or value in options for options, value in choices) and all(matches(field_value(record, p.name), p) for p in filters.fields):
                rows.append((position, record))
        return rows

    def list_sas(self, filters=SAFilter(), *, page=PageRequest()):
        rows = self._select(filters)
        selected, cursor = paginate(rows, page, dict(method='sas', filters=filter_key(filters)), self._fingerprint)
        return Page(tuple(r for _, r in selected), tuple(p for p, _ in selected), len(rows), cursor)

    def aggregate_sas(self, group_by=('component',), *, filters=SAFilter(), page=PageRequest()):
        if not isinstance(group_by, tuple) or not 1 <= len(group_by) <= 3 or any(not isinstance(d, str) or not (d in ('process', 'component', 'subsystem', 'profile', 'service') or d.startswith('field:') and len(d) > 6) for d in group_by):
            raise QueryError('INVALID_DIMENSION')
        rows = self._select(filters)
        groups = {}
        for _, record in rows:
            keys = []
            for dimension in group_by:
                value = (field_value(record, dimension[6:]) if dimension.startswith('field:') else
                         record.get('service', {}).get('name', UNSET) if dimension == 'process' else
                         record.get('component', {}).get('name', UNSET) if dimension == 'component' else
                         record.get('component', {}).get('subsystem', UNSET) if dimension == 'subsystem' else
                         record.get(dimension, UNSET))
                if dimension != 'service' and isinstance(value, (Mapping, tuple, list)):
                    raise QueryError('NON_SCALAR_DIMENSION')
                keys.append(dict(kind='absent') if value is UNSET else dict(kind='null') if value is None else dict(kind='value', value=value))
            identity = [dict(k, value=numeric_key(k['value'])) if type(k.get('value')) in (int, float, Decimal) else k for k in keys]
            group = groups.setdefault(canonical(identity), dict(key=keys, count=0))
            group['count'] += 1
        ordered = [freeze(group) for _, group in sorted(groups.items())]
        selected, cursor = paginate(ordered, page, dict(method='sas-aggregate', filters=filter_key(filters), dimensions=group_by), self._fingerprint)
        return SAAggregatePage(tuple(selected), len(rows), len(rows), len(groups), cursor)
