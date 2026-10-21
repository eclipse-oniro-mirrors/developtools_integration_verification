"""Read-only repo queries over a frozen result."""
from .models import RepoFilter
from ...core.base_query import BaseQuery
from ...core.models import UNSET, QueryError, Page, PageRequest
from ...core.query import string_choices, validate_predicates, matches, paginate, filter_key


class RepoQuery(BaseQuery):
    def get_repo(self, name):
        self._check()
        if not isinstance(name, str) or not name:
            raise QueryError('INVALID_REPO_NAME')
        for r in self._result.repos:
            if r['name'] == name:
                return r
        return None

    def _select(self, filters):
        self._check()
        if not isinstance(filters, RepoFilter):
            raise QueryError('INVALID_FILTER')
        string_choices(filters, ('fields',))
        validate_predicates(filters.fields)
        rows = []
        for position, r in enumerate(self._result.repos):
            tests = [(filters.names, r['name']), (filters.paths, r.get('path')),
                     (filters.remotes, r.get('remote')), (filters.revisions, r.get('revision'))]
            if filters.groups:
                repo_groups = set((r.get('groups') or '').split(','))
                if not any(g in repo_groups for g in filters.groups):
                    continue
            if all(not opts or val in opts for opts, val in tests) and \
               all(matches(r.get(p.name, UNSET), p) for p in filters.fields):
                rows.append((position, r))
        return rows

    def list_repos(self, filters=RepoFilter(), *, page=PageRequest()):
        rows = self._select(filters)
        selected, cursor = paginate(rows, page, dict(method='repos', filters=filter_key(filters)),
                                    self._fingerprint)
        return Page(tuple(r for _, r in selected), tuple(p for p, _ in selected), len(rows), cursor)
