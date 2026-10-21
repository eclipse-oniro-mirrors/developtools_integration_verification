"""SA requests, immutable results and small query contracts."""
from dataclasses import dataclass
from ...core.models import FieldPredicate, ScanRequest, ScanResult

# Field-identical across domains, so the shared contract is used directly.
SAScanRequest = ScanRequest


@dataclass(frozen=True)
class SAResult(ScanResult):
    FIELD = 'sas'
    QUERY = '.query:SAQuery'

    @property
    def sas(self):
        return self.records


@dataclass(frozen=True)
class SAFilter:
    ids: tuple[int, ...] = ()
    processes: tuple[str, ...] = ()
    components: tuple[str, ...] = ()
    subsystems: tuple[str, ...] = ()
    profiles: tuple[str, ...] = ()
    service_names: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()

@dataclass(frozen=True)
class SAAggregatePage:
    groups: tuple
    denominator: int
    matched_sa_count: int
    total_groups: int
    next_cursor: str | None
