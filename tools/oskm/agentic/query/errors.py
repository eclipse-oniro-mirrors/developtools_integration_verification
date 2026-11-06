"""Errors shared by the read-only query layer."""


class QueryError(Exception):
    """A stable query-layer error; the CLI/tool layer maps it to an error code."""
