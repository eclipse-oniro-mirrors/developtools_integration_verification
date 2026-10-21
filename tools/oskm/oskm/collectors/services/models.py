"""Service-specific scan contracts; shared primitives remain in core.models."""
from dataclasses import dataclass, field
from ...core.models import FieldPredicate, PageRequest, ScanRequest, ScanResult

BASIC_FIELDS = ('name', 'uid', 'gid', 'start-mode', 'ondemand')


# Field-identical across domains, so the shared contract is used directly.
ServiceScanRequest = ScanRequest


@dataclass(frozen=True)
class ServiceResult(ScanResult):
    FIELD = 'services'
    QUERY = '.query:ServiceQuery'

    @property
    def services(self):
        return self.records


@dataclass(frozen=True)
class ServiceFilter:
    cfgs: tuple[str, ...] = ()
    partitions: tuple[str, ...] = ()
    types: tuple[str, ...] = ()
    components: tuple[str, ...] = ()
    subsystems: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()


@dataclass(frozen=True)
class ServiceAggregateRequest:
    filters: ServiceFilter = field(default_factory=ServiceFilter)
    group_by: tuple[str, ...] = ('partition',)
    grain: str = 'service'
    resource_field: str | None = None
    page: PageRequest = field(default_factory=PageRequest)


@dataclass(frozen=True)
class ServiceAggregatePage:
    groups: tuple
    denominator: int
    matched_service_count: int
    total_groups: int
    next_cursor: str | None
