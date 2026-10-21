"""HDI requests, immutable results and small query contracts."""
from dataclasses import dataclass
from ...core.models import FieldPredicate, ScanRequest, ScanResult

# Field-identical across domains, so the shared contract is used directly.
HDIScanRequest = ScanRequest


@dataclass(frozen=True)
class HDIResult(ScanResult):
    FIELD = 'hdis'
    QUERY = '.query:HDIQuery'

    @property
    def hdis(self):
        return self.records


@dataclass(frozen=True)
class HDIFilter:
    names: tuple[str, ...] = ()
    modules: tuple[str, ...] = ()
    processes: tuple[str, ...] = ()
    components: tuple[str, ...] = ()
    subsystems: tuple[str, ...] = ()
    hcbs: tuple[str, ...] = ()
    libraries: tuple[str, ...] = ()
    service_names: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()

@dataclass(frozen=True)
class HDIAggregatePage:
    groups: tuple
    denominator: int
    matched_hdi_count: int
    total_groups: int
    next_cursor: str | None
