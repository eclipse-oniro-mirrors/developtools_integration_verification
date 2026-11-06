"""Bundled NAPI implementation map: runtime module name -> implementing .so.

This is reference data shipped with the collector, not read from the scanned
source tree, so it is version-pinned to the scanner. Its digest therefore has
to enter input_digest -- otherwise a new map would silently change results
while the scan identity stayed the same.

`class_to_so` is present in the file but not consumed: its keys are bare class
names with no module qualifier, so same-named classes across modules were
already collapsed when the map was generated.
"""
import hashlib
from pathlib import Path

from ...core.io import parse_json
from ...core.models import ScanFatalError
from .models import NAPI_MAP

NAPI_MAP_PATH = Path(__file__).parent / NAPI_MAP
# A specifier is the runtime name plus one of these; which one is not
# recorded in the map, so all three are tried.
PREFIXES = ('@ohos.', '@system.', '@arkts.')


def load():
    """Read and validate the bundled map.

    A packaging error fails the scan rather than degrading every module to
    implementation_kind='unknown', which would look like a finding about the
    SDK instead of a problem with the scanner.
    """
    try:
        data = NAPI_MAP_PATH.read_bytes()
        value, duplicates = parse_json(data)
    except (OSError, ValueError, UnicodeError) as exc:
        raise ScanFatalError('ARKTS_NAPI_MAP_UNREADABLE') from exc
    if duplicates or type(value) is not dict:
        raise ScanFatalError('ARKTS_NAPI_MAP_INVALID')
    table = value.get('module_to_so')
    if type(table) is not dict or not table:
        raise ScanFatalError('ARKTS_NAPI_MAP_INVALID')
    for name, path in table.items():
        if type(name) is not str or type(path) is not str or not path or path.startswith('/'):
            # Paths are image-relative, matching install_targets.dest.
            raise ScanFatalError('ARKTS_NAPI_MAP_INVALID')
    return dict(path=NAPI_MAP_PATH, byte_size=len(data),
                sha256=hashlib.sha256(data).hexdigest(), module_to_so=table)


def _resolve(name, modules, by_name, by_suffix):
    """Find the module a runtime name refers to, strongest rule first.

    Returns (module_key, method) or (None, reason). The rules are ordered so
    that an exact one always wins: the suffix rule is only reached by names the
    exact rules reject, which is what keeps it safe -- applied to everything it
    would make 21 already-correct entries ambiguous (`ability.wantConstant`
    matches both `@ohos.app.ability.wantConstant` and `@ohos.ability.wantConstant`).
    """
    for prefix in PREFIXES:
        if prefix + name in by_name:
            return by_name[prefix + name], 'module_name'
    # Already domain-qualified: runtime `arkts.collections` is `@arkts.collections`,
    # which the prefix rule would mangle into `@arkts.arkts.collections`.
    if '@' + name in by_name:
        return by_name['@' + name], 'module_name'
    # An auxiliary declaration's runtime name is its path with dots:
    # application.AbilityStageContext -> api/application/AbilityStageContext.
    candidate = 'api/' + name.replace('.', '/')
    if candidate in modules:
        return candidate, 'declaration_path'
    # Last resort: the runtime name often drops the SDK name's leading domain
    # segments (`@ohos.util.stream` is registered as `stream`). Accepted only
    # when exactly one module name ends with it -- `serial` matches both
    # `@ohos.busManager.serial` and `@ohos.usbManager.serial` and stays unmatched.
    candidates = by_suffix.get(name, ())
    if len(candidates) == 1:
        return by_name[candidates[0]], 'name_suffix'
    return None, 'ambiguous_suffix' if candidates else 'no_module'


def match(module_to_so, modules):
    """Align runtime module names with the modules this scan discovered.

    Returns (matched, unmatched): matched maps module_key -> (napi name, so
    path, method); unmatched maps the remaining runtime names to why they were
    rejected, so the report can separate "no public declaration" from
    "the name is ambiguous".
    """
    by_name = {row['module_name']: key for key, row in modules.items() if row['module_name']}
    by_suffix = {}
    for full in by_name:
        for position, character in enumerate(full):
            if character == '.':
                by_suffix.setdefault(full[position + 1:], []).append(full)
    matched, unmatched = {}, {}
    for name in sorted(module_to_so):
        key, method = _resolve(name, modules, by_name, by_suffix)
        if key is None:
            unmatched[name] = method
        else:
            matched.setdefault(key, (name, module_to_so[name], method))
    return matched, unmatched
