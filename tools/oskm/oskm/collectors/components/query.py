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
"""Read-only queries over a frozen component result, including reverse deps."""
from collections import Counter
from collections.abc import Mapping
from .models import ComponentFilter
from ...core.models import UNSET, QueryError, Page, PageRequest, freeze
from ...core.query import string_choices, validate_predicates, matches, paginate, filter_key
from ...core.base_query import BaseQuery


class ComponentQuery(BaseQuery):
    def __init__(self, result):
        super().__init__(result)
        self._names = {component['name']: component for component in result.components}

    @staticmethod
    def _name(name):
        if not isinstance(name, str) or not name:
            raise QueryError('INVALID_COMPONENT_NAME')

    def close(self):
        super().close()
        self._names.clear()

    def get_component(self, name):
        self._check()
        self._name(name)
        return self._names.get(name)

    def _select(self, filters):
        self._check()
        if not isinstance(filters, ComponentFilter):
            raise QueryError('INVALID_FILTER')
        string_choices(filters, ('fields',))
        validate_predicates(filters.fields)
        selected = []
        for position, row in enumerate(self._result.components):
            if filters.names and row['name'] not in filters.names:
                continue
            if filters.subsystems and row.get('subsystem') not in filters.subsystems:
                continue
            if filters.depends_on:
                deps = row.get('deps')
                components = deps.get('components') if isinstance(deps, Mapping) else None
                if not isinstance(components, (tuple, list)) or not any(
                        isinstance(name, str) and name in filters.depends_on for name in components):
                    continue
            if all(matches(row.get(p.name, UNSET), p) for p in filters.fields):
                selected.append((position, row))
        return selected

    def list_components(self, filters=ComponentFilter(), *, page=PageRequest()):
        rows = self._select(filters)
        selected, cursor = paginate(rows, page, dict(
            method='components', filters=filter_key(filters)), self._fingerprint)
        return Page(tuple(row for _, row in selected), tuple(pos for pos, _ in selected), len(rows), cursor)

    def list_dependents(self, name, *, page=PageRequest()):
        self._check()
        self._name(name)
        return self.list_components(ComponentFilter(depends_on=(name,)), page=page)

    def count_by_subsystem(self, filters=ComponentFilter()):
        counts = Counter(row.get('subsystem') for _, row in self._select(filters))
        return tuple(freeze(dict(subsystem=key, count=counts[key]))
                     for key in sorted(counts, key=lambda key: (key is None, key or '')))
