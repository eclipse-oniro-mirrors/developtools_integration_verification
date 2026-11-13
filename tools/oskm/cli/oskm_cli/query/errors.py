"""Errors shared by the read-only query layer."""
from __future__ import annotations


class QueryError(Exception):
    """A stable query-layer error.

    The string form is ``CODE: message``.  The colon form is retained for
    compatibility with existing callers, while ``code``/``message`` let the
    session manager map errors without parsing prose.
    """

    def __init__(self, code: str, message: str | None = None):
        super().__init__(f'{code}: {message}' if message else code)
        self.code = code
        self.message = message or code

    @classmethod
    def parse(cls, value: str) -> 'QueryError':
        code, separator, message = str(value).partition(':')
        if separator and code and ' ' not in code:
            return cls(code, message.strip() or code)
        return cls('DB_CORRUPT', str(value))
