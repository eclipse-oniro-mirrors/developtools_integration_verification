"""Small immutable component scan contracts; storage remains independent."""
from dataclasses import dataclass
from ...core.models import FieldPredicate, ScanRequest, ScanResult


# Field-identical across domains, so the shared contract is used directly.
ComponentScanRequest = ScanRequest


@dataclass(frozen=True)
class ComponentResult(ScanResult):
    FIELD = 'components'
    QUERY = '.query:ComponentQuery'

    @property
    def components(self):
        return self.records


@dataclass(frozen=True)
class ComponentFilter:
    names: tuple[str, ...] = ()
    subsystems: tuple[str, ...] = ()
    depends_on: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()
