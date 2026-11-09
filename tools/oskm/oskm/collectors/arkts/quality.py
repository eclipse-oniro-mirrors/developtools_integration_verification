"""Aggregate diagnostic occurrences without losing framework-deduplicated locations."""
from collections import defaultdict


class Diagnostics:
    def __init__(self):
        self.groups = defaultdict(list)

    def add(self, path, code, *, advisory=False, **details):
        self.groups[(path, code, advisory)].append(details)

    def emit(self, ctx):
        for (path, code, advisory), occurrences in sorted(self.groups.items()):
            ctx.issue(path, code, severity='warning', advisory=advisory,
                      details=dict(occurrences=occurrences[:100], total_count=len(occurrences),
                                   truncated_count=max(0, len(occurrences)-100)))
