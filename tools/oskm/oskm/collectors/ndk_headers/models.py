"""NDK-header scan contracts."""
from dataclasses import dataclass

from ...core.models import ScanRequest, ScanResult


NdkHeaderScanRequest = ScanRequest


@dataclass(frozen=True)
class NdkHeaderResult(ScanResult):
    FIELD = "ndk_headers"

    @property
    def ndk_headers(self):
        return self.records

