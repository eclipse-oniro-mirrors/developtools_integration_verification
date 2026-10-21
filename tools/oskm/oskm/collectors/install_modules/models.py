"""Install-module scan contracts; field-identical to the shared ones."""
from dataclasses import dataclass

from ...core.models import FieldPredicate, ScanRequest, ScanResult

InstallModuleScanRequest = ScanRequest


@dataclass(frozen=True)
class InstallModuleResult(ScanResult):
    FIELD = 'install_modules'
    QUERY = '.query:InstallModuleQuery'

    @property
    def install_modules(self):
        return self.records


@dataclass(frozen=True)
class InstallModuleFilter:
    """components / subsystems filter on the joined component, never on SMI's
    own part_name / subsystem_name -- those disagree with the build index."""
    labels: tuple[str, ...] = ()
    types: tuple[str, ...] = ()
    partitions: tuple[str, ...] = ()
    dests: tuple[str, ...] = ()
    tags: tuple[str, ...] = ()
    components: tuple[str, ...] = ()
    subsystems: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()


@dataclass(frozen=True)
class InstallModuleAggregatePage:
    groups: tuple
    denominator: int
    matched_module_count: int
    total_groups: int
    next_cursor: str | None
