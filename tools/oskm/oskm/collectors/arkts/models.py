"""Versioned P1 contracts. No compiler or subprocess is loaded on import."""
from dataclasses import dataclass
from ...core.models import ScanResult

PROFILE = 'module_kit_v1'
SDK_PATH = 'interface/sdk-js'
NODE_PATH = 'prebuilts/build-tools/common/nodejs/node-v18.20.1-linux-x64/bin/node'
TYPESCRIPT_PATH = SDK_PATH + '/build-tools/node_modules/typescript'
IR_VERSION = '1.0.0'
CAPABILITIES = ('file.header', 'kit.references', 'condition.top_level', 'source.utf8_spans')
PROFILE_CAPABILITIES = {PROFILE: {feature: '1.0.0' for feature in CAPABILITIES}}
CONDITIONS = ('unspecified', 'dynamic', 'static', 'both', 'unknown')
SUFFIXES = ('.static.d.ets', '.d.ets', '.d.ts')
# ArkTS 1.2 declarations carry the .static. infix; everything else is 1.1.
VARIANTS = {'.static.d.ets': 'static', '.d.ets': 'dynamic', '.d.ts': 'dynamic'}

# Reference data shipped with the collector, not read from the scanned tree:
# NAPI runtime module name -> the .so that implements it, as an image path.
NAPI_MAP = 'napi-map.json'
# ArkUI declarations are not in that map; the engine implements them all. These
# constants keep the reference-data layout; the scan projection rewrites the
# architecture root to match the target cpu_arch before persisting the path.
ARKUI_ENGINE_SO = 'system/lib64/platformsdk/libace_engine_pa_ark.z.so'

_LIBRARY_ROOTS = {'arm': 'system/lib/', 'arm64': 'system/lib64/'}


def arch_library_path(path, cpu_arch):
    """Return the image path rooted at the target architecture's library dir.

    The bundled map is written against a 64-bit image. `impl_so_path` is a
    per-scan fact, so a 32-bit scan must persist `system/lib/...` rather than
    keeping the map's `system/lib64/...` spelling. Unknown architectures keep
    the input path unchanged.
    """
    root = _LIBRARY_ROOTS.get(cpu_arch)
    if root is None:
        return path
    for source in _LIBRARY_ROOTS.values():
        if path.startswith(source):
            return root + path[len(source):]
    return path


def arkui_engine_so(cpu_arch):
    """Architecture-based ArkUI fallback path.

    Installed targets are resolved later by ``arkts_links`` and take precedence
    over this fallback.
    """
    return arch_library_path(ARKUI_ENGINE_SO, cpu_arch)


@dataclass(frozen=True)
class BackendLimits:
    file_bytes: int = 8 * 1024 * 1024
    request_bytes: int = 12 * 1024 * 1024
    response_bytes: int = 4 * 1024 * 1024
    stderr_bytes: int = 256 * 1024
    startup_seconds: int = 10
    file_seconds: int = 15
    heap_mb: int = 256
    evidence_bytes: int = 64 * 1024 * 1024
    fragment_bytes: int = 1024 * 1024


class ArktsModulesResult(ScanResult):
    FIELD = 'modules'
