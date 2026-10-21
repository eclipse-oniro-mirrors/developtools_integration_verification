"""Args scan contracts."""
from dataclasses import dataclass
from ...core.models import ScanRequest, ScanResult

ArgsScanRequest = ScanRequest


@dataclass(frozen=True)
class ArgsResult(ScanResult):
    FIELD = 'gn_args'
    QUERY = '.query:ArgsQuery'

    @property
    def gn_args(self):
        return self.records


@dataclass(frozen=True)
class ArgsFilter:
    names: tuple[str, ...] = ()
    component_ids: tuple[int, ...] = ()
    value_types: tuple[str, ...] = ()
    has_override: tuple[int, ...] = ()
