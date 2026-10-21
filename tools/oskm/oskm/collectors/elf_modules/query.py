"""Read-only queries over installed ELF metadata and direct dependency edges."""
from collections import deque

from .models import ElfModuleFilter
from ...core.base_query import BaseQuery
from ...core.models import Page, PageRequest, QueryError
from ...core.query import filter_key, matches, paginate, string_choices, validate_predicates


class ElfModuleQuery(BaseQuery):
    def _select(self, filters=ElfModuleFilter()):
        self._check()
        if not isinstance(filters, ElfModuleFilter):
            raise QueryError('INVALID_FILTER')
        string_choices(filters)
        validate_predicates(filters.fields)
        selected = []
        for position, record in enumerate(self._result.elf_modules):
            component = record.get('component', {})
            scalar = (
                (filters.dests, record.get('dest')),
                (filters.partitions, record.get('partition')),
                (filters.file_names, record.get('file_name')),
                (filters.sonames, record.get('soname')),
                (filters.formats, record.get('format')),
                (filters.components, component.get('name')),
                (filters.subsystems, component.get('subsystem')),
            )
            if any(options and value not in options for options, value in scalar):
                continue
            if (filters.api_types
                    and record.get('api_type') not in filters.api_types):
                continue
            if (filters.categories
                    and not set(record.get('category') or ())
                    .intersection(filters.categories)):
                continue
            if all(matches(record, predicate) for predicate in filters.fields):
                selected.append((position, record))
        return selected

    def get_elf_module(self, dest):
        self._check()
        found = [record for record in self._result.elf_modules
                 if record.get('dest') == dest]
        return found[0] if found else None

    def list_elf_modules(self, filters=ElfModuleFilter(), *, page=PageRequest()):
        rows = self._select(filters)
        selected, cursor = paginate(rows, page, dict(method='elf-modules',
                                                     filters=filter_key(filters)),
                                    self._fingerprint)
        return Page(tuple(record for _, record in selected),
                    tuple(position for position, _ in selected), len(rows), cursor)

    def direct_dependencies(self, dest):
        record = self.get_elf_module(dest)
        return tuple(record.get('dependencies', ())) if record else ()

    def direct_dependents(self, dest):
        result = []
        for record in self._result.elf_modules:
            for dependency in record.get('dependencies', ()):
                if dependency.get('target') == dest:
                    result.append(dict(record, dependency=dependency))
                    break
        return tuple(result)

    def reachable(self, dest, *, direction='forward', max_distance=None):
        """ELF records reachable along direct edges, with distance and one path."""
        if direction not in ('forward', 'reverse'):
            raise QueryError('INVALID_DIRECTION')
        start = self.get_elf_module(dest)
        if start is None:
            return ()
        by_dest = {record['dest']: record for record in self._result.elf_modules}
        queue = deque(((start, 0),))
        found = {start['dest']: (0, ())}
        while queue:
            current, distance = queue.popleft()
            if max_distance is not None and distance >= max_distance:
                continue
            if direction == 'forward':
                edges = ((edge.get('target'), edge.get('needed_name'))
                         for edge in current.get('dependencies', ())
                         if edge.get('target'))
            else:
                edges = ((record['dest'], edge.get('needed_name'))
                         for record in self._result.elf_modules
                         for edge in record.get('dependencies', ())
                         if edge.get('target') == current['dest'])
            for target, needed_name in edges:
                if target not in by_dest:
                    continue
                candidate = found.get(target)
                path = found[current['dest']][1] + ((current['dest'], needed_name),)
                if candidate is None or (distance + 1, path) < candidate:
                    found[target] = (distance + 1, path)
                    queue.append((by_dest[target], distance + 1))
        return tuple(
            dict(by_dest[target], distance=distance,
                 via=tuple(source for source, _ in path))
            for target, (distance, path) in sorted(found.items(),
                                                   key=lambda item: (item[1][0], item[0]))
            if target != dest
        )
