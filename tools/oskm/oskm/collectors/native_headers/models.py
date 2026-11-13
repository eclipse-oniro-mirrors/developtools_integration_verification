"""Native SDK-header scan contracts."""
from dataclasses import dataclass

from ...core.models import ScanRequest, ScanResult


NativeHeaderScanRequest = ScanRequest


@dataclass(frozen=True)
class NativeHeaderResult(ScanResult):
    FIELD = "native_headers"

    @property
    def native_headers(self):
        return self.records

