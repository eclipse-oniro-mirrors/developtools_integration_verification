"""Read-only install-manifest queries, same predicate and cursor semantics as
the other domains.

`components` / `subsystems` filter the *joined* component, never SMI's own
part_name / subsystem_name -- those are a third copy that disagrees with the
build index on 35 rk3568 rows, so matching on them would answer a different
question than the caller asked.
"""
from collections.abc import Mapping
from decimal import Decimal

from .models import InstallModuleFilter, InstallModuleAggregatePage
from .records import field_value
from .targets import normalize_dest
from ...core.base_query import BaseQuery
from ...core.io import canonical
from ...core.models import UNSET, Page, PageRequest, QueryError, freeze
from ...core.query import (filter_key, matches, numeric_key, paginate,
                           string_choices, validate_predicates)

# Dimensions a module can hold several of at once; a module counts once per
# distinct value rather than being forced into a single bucket.
LIST_DIMENSIONS = ('partition', 'tag')
DIMENSIONS = ('type', 'component', 'subsystem') + LIST_DIMENSIONS


def _dests(record):
    """(normalised path, is directory) per declared dest.

    Normalised here too, so an in-memory query and a SQL one answer the same
    question: the published record keeps the declaration, trailing slash and
    all, while install_targets.dest stores the canonical form.
    """
    value = record.get('dest')
    if not isinstance(value, (tuple, list)):
        return ()
    found = []
    for item in value:
        normalized = normalize_dest(item)
        if normalized is not None:
            found.append(normalized)
    return tuple(found)


def _paths(record):
    return tuple(dest for dest, _ in _dests(record))


def _partitions(record):
    return tuple(dict.fromkeys(dest.split('/')[0] for dest in _paths(record) if '/' in dest))


def _tags(record):
    value = (record.get('config') or {}).get('innerapi_tags')
    return tuple(t for t in value if isinstance(t, str)) if isinstance(value, (tuple, list)) else ()


class InstallModuleQuery(BaseQuery):
    def get_module(self, ordinal):
        self._check()
        if type(ordinal) is not int or ordinal < 0:
            raise QueryError('INVALID_POSITION')
        records = self._result.install_modules
        return records[ordinal] if ordinal < len(records) else None

    def modules_at(self, dest):
        """Modules installing `dest`, with the directory-install fallback."""
        self._check()
        if not isinstance(dest, str) or not dest:
            raise QueryError('INVALID_DEST')
        exact = [r for r in self._result.install_modules if dest in _paths(r)]
        if exact:
            return tuple(exact)
        covering = [(len(path), r) for r in self._result.install_modules
                    for path, directory in _dests(r)
                    if directory and dest.startswith(path + '/')]
        if not covering:
            return ()
        longest = max(length for length, _ in covering)
        return tuple(r for length, r in covering if length == longest)

    def _select(self, filters):
        self._check()
        if not isinstance(filters, InstallModuleFilter):
            raise QueryError('INVALID_FILTER')
        string_choices(filters, ('fields',))
        validate_predicates(filters.fields)
        rows = []
        for position, record in enumerate(self._result.install_modules):
            component = record.get('component', {})
            scalar = [(filters.labels, record.get('label')), (filters.types, record.get('type')),
                      (filters.components, component.get('name')),
                      (filters.subsystems, component.get('subsystem'))]
            if any(options and value not in options for options, value in scalar):
                continue
            lists = [(filters.dests, _paths(record)), (filters.partitions, _partitions(record)),
                     (filters.tags, _tags(record))]
            if any(options and not set(options) & set(values) for options, values in lists):
                continue
            if all(matches(field_value(record, p.name), p) for p in filters.fields):
                rows.append((position, record))
        return rows

    def list_modules(self, filters=InstallModuleFilter(), *, page=PageRequest()):
        rows = self._select(filters)
        selected, cursor = paginate(rows, page, dict(method='install-modules',
                                                     filters=filter_key(filters)),
                                    self._fingerprint)
        return Page(tuple(r for _, r in selected), tuple(p for p, _ in selected),
                    len(rows), cursor)

    def aggregate_modules(self, group_by=('component',), *,
                          filters=InstallModuleFilter(), page=PageRequest()):
        if (not isinstance(group_by, tuple) or not 1 <= len(group_by) <= 3
                or any(not isinstance(d, str)
                       or not (d in DIMENSIONS or d.startswith('field:') and len(d) > 6)
                       for d in group_by)):
            raise QueryError('INVALID_DIMENSION')
        rows = self._select(filters)
        groups, denominator = {}, 0
        for _, record in rows:
            component = record.get('component', {})
            axes = []
            for dimension in group_by:
                if dimension == 'partition':
                    values = _partitions(record) or (UNSET,)
                elif dimension == 'tag':
                    values = _tags(record) or (UNSET,)
                else:
                    value = (field_value(record, dimension[6:]) if dimension.startswith('field:')
                             else component.get('name', UNSET) if dimension == 'component'
                             else component.get('subsystem', UNSET) if dimension == 'subsystem'
                             else record.get(dimension, UNSET))
                    if isinstance(value, (Mapping, tuple, list)):
                        raise QueryError('NON_SCALAR_DIMENSION')
                    values = (value,)
                axes.append(values)
            combinations = [[]]
            for values in axes:
                combinations = [c + [v] for c in combinations for v in values]
            for combination in combinations:
                keys = [dict(kind='absent') if v is UNSET
                        else dict(kind='null') if v is None else dict(kind='value', value=v)
                        for v in combination]
                identity = [dict(k, value=numeric_key(k['value']))
                            if type(k.get('value')) in (int, float, Decimal) else k for k in keys]
                group = groups.setdefault(canonical(identity), dict(key=keys, count=0))
                group['count'] += 1
                denominator += 1
        ordered = [freeze(group) for _, group in sorted(groups.items())]
        selected, cursor = paginate(ordered, page,
                                    dict(method='install-modules-aggregate',
                                         filters=filter_key(filters), dimensions=group_by),
                                    self._fingerprint)
        return InstallModuleAggregatePage(tuple(selected), denominator, len(rows),
                                          len(groups), cursor)
