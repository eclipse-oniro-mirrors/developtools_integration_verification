"""ELF-module scan and query contracts."""
from dataclasses import dataclass

from ...core.models import FieldPredicate, ScanRequest, ScanResult


ElfModuleScanRequest = ScanRequest


@dataclass(frozen=True)
class ElfModuleResult(ScanResult):
    FIELD = 'elf_modules'
    QUERY = '.query:ElfModuleQuery'

    @property
    def elf_modules(self):
        return self.records


@dataclass(frozen=True)
class ElfModuleFilter:
    dests: tuple[str, ...] = ()
    partitions: tuple[str, ...] = ()
    file_names: tuple[str, ...] = ()
    sonames: tuple[str, ...] = ()
    formats: tuple[str, ...] = ()
    api_types: tuple[str, ...] = ()
    categories: tuple[str, ...] = ()
    components: tuple[str, ...] = ()
    subsystems: tuple[str, ...] = ()
    fields: tuple[FieldPredicate, ...] = ()
