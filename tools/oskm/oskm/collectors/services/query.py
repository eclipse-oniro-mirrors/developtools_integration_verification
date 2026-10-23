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
"""One in-memory evaluator for API and JSON results."""
from collections.abc import Mapping
from decimal import Decimal
from .models import ServiceFilter, ServiceAggregateRequest, ServiceAggregatePage
from .records import field_value
from ...core.io import canonical
from ...core.models import UNSET, QueryError, PageRequest, Page, freeze
from ...core.query import (numeric_key, string_choices, validate_predicates,
                           filter_key, matches, paginate)
from ...core.base_query import BaseQuery


def validate_filter(f):
    if not isinstance(f, ServiceFilter):
        raise QueryError('INVALID_FILTER')
    string_choices(f, ('fields',))
    if not isinstance(f.fields, tuple):
        raise QueryError('INVALID_FIELD_FILTERS')
    validate_predicates(f.fields)


class ServiceQuery(BaseQuery):
    def get_service(self, position):
        self._check()
        if type(position) is not int or position < 0:
            raise QueryError('INVALID_POSITION')
        return self._result.services[position] if position < len(self._result.services) else None

    def get_component(self, position):
        record = self.get_service(position)
        return record.get('component') if record is not None else None

    @staticmethod
    def _field_match(record, predicate):
        return matches(field_value(record, predicate.name), predicate)

    def _select(self, filters):
        self._check()
        validate_filter(filters)
        rows = []
        for position, record in enumerate(self._result.services):
            component = record.get('component', {})
            tests = [(filters.cfgs, record['cfg']), (filters.partitions, record['cfg'].split('/')[0]),
                     (filters.types, record.get('type')), (filters.components, component.get('name')),
                     (filters.subsystems, component.get('subsystem'))]
            if all(not options or value in options for options, value in tests) and all(
                    self._field_match(record, p) for p in filters.fields):
                rows.append((position, record))
        return rows

    def _page(self, rows, page, context):
        return paginate(rows, page, context, self._fingerprint)

    def list_services(self, filters=ServiceFilter(), *, page=PageRequest()):
        rows = self._select(filters)
        selected, cursor = self._page(rows, page, dict(method='services', filters=filter_key(filters)))
        return Page(tuple(r for _, r in selected), tuple(p for p, _ in selected), len(rows), cursor)

    def aggregate_services(self, request=ServiceAggregateRequest()):
        _validate_aggregate_request(request)
        rows = self._select(request.filters)
        groups, denominator = {}, 0
        for _, record in rows:
            units = 1
            if request.grain == 'resource_item':
                value = field_value(record, request.resource_field)
                units = len(value) if isinstance(value, (tuple, list)) else 0
            denominator += units
            keys = []
            for dimension in request.group_by:
                value = (field_value(record, dimension[6:]) if dimension.startswith('field:') else
                         record['cfg'].split('/')[0] if dimension == 'partition' else
                         record.get('type', UNSET) if dimension == 'type' else
                         record.get('label', UNSET) if dimension == 'label' else
                         record.get('component', {}).get('name', UNSET) if dimension == 'component' else
                         record.get('component', {}).get('subsystem', UNSET))
                if isinstance(value, (Mapping, tuple, list)):
                    raise QueryError('NON_SCALAR_DIMENSION')
                keys.append(
                    dict(
                        kind='absent') if value is UNSET else dict(
                        kind='null') if value is None else dict(
                        kind='value',
                        value=value))
            if units:
                # Numeric equality matches predicates; booleans retain their own bucket.
                identity = [dict(k, value=numeric_key(k['value']))
                            if type(k.get('value')) in (int, float, Decimal) else k for k in keys]
                group = groups.setdefault(canonical(identity), dict(key=keys, count=0, service_count=0))
                group['count'] += units
                group['service_count'] += 1
        ordered = [freeze(g) for _, g in sorted(groups.items())]
        context = dict(method='aggregate', filters=filter_key(request.filters), dimensions=request.group_by,
                       grain=request.grain, resource_field=request.resource_field)
        selected, cursor = self._page(ordered, request.page, context)
        return ServiceAggregatePage(tuple(selected), denominator, len(rows), len(groups), cursor)

def _validate_aggregate_request(request):
    """Validate the aggregate request parameters."""
    if not isinstance(request, ServiceAggregateRequest) or             request.grain not in ('service', 'resource_item'):
        raise QueryError('INVALID_AGGREGATE_REQUEST')
    if (request.grain == 'resource_item' and
            (not isinstance(request.resource_field, str) or
             not request.resource_field)) or (
            request.grain == 'service' and
            request.resource_field is not None):
        raise QueryError('INVALID_RESOURCE_GRAIN')
    if not isinstance(request.group_by, tuple) or             not 1 <= len(request.group_by) <= 3 or             any(not isinstance(d, str) or not (
                d in ('partition', 'type', 'label', 'component',
                      'subsystem') or
                d.startswith('field:') and len(d) > 6)
                for d in request.group_by):
        raise QueryError('INVALID_DIMENSION')
