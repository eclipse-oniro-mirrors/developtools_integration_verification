"""Shared lifecycle and fingerprint logic for read-only domain query classes."""
from .io import canonical, digest
from .models import QueryError


class BaseQuery:
    def __init__(self, result):
        self._result = result
        self._fingerprint = digest(canonical(result.to_dict()))

    def _check(self):
        if self._result is None:
            raise QueryError('RESULT_CLOSED')

    @property
    def snapshot(self):
        self._check()
        return self._result.snapshot

    def __enter__(self):
        self._check()
        return self

    def __exit__(self, *_):
        self.close()

    def close(self):
        self._result = None
