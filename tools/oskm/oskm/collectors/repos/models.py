"""RepoFilter for read-only queries."""
from dataclasses import dataclass
from ...core.models import FieldPredicate


@dataclass(frozen=True)
class RepoFilter:
    names: tuple[str, ...] = ()
    paths: tuple[str, ...] = ()
    remotes: tuple[str, ...] = ()
    revisions: tuple[str, ...] = ()
    groups: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()
