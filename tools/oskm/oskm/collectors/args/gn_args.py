"""Call gn args --list --json, extract the JSON, parse values."""
import json
import os
import platform
import re
import subprocess

GN_PATHS = {
    'x86_64': 'prebuilts/build-tools/linux-x86/bin/gn',
    'aarch64': 'prebuilts/build-tools/linux-aarch64/bin/gn',
}

_TIMEOUT = 120


def find_gn(workspace):
    arch = 'aarch64' if platform.machine().lower() == 'aarch64' else 'x86_64'
    path = os.path.join(workspace, GN_PATHS[arch])
    return path if os.path.isfile(path) else None


def run_gn_args(gn_path, out_dir):
    """Run gn args --list --json, return raw stdout (mixed noise + JSON)."""
    try:
        result = subprocess.run(
            [gn_path, 'args', str(out_dir), '--list', '--json'],
            capture_output=True, text=True, timeout=_TIMEOUT,
        )
        return result.stdout
    except (subprocess.TimeoutExpired, OSError):
        return None


def extract_json(output):
    """Extract the JSON array from gn's mixed stdout (print noise + JSON)."""
    if not output:
        return []
    matches = list(re.finditer(r'\[\s*\{\s*"', output))
    if not matches:
        return []
    start = matches[-1].start()
    end = output.rfind(']')
    if end < start:
        return []
    try:
        return json.loads(output[start:end + 1])
    except json.JSONDecodeError:
        return []


def parse_gn_value(raw):
    """Parse a GN literal string into a Python value."""
    if not isinstance(raw, str):
        return raw
    raw = raw.strip()
    if raw == 'true':
        return True
    if raw == 'false':
        return False
    if raw.startswith('"'):
        try:
            return json.loads(raw)
        except json.JSONDecodeError:
            return raw.strip('"')
    if raw.replace('-', '').replace('.', '').isdigit():
        return int(raw) if '.' not in raw else float(raw)
    if raw.startswith('['):
        try:
            return json.loads(raw)
        except json.JSONDecodeError:
            return raw
    return raw


def classify_value(value):
    if isinstance(value, bool):
        return 'bool'
    if isinstance(value, str):
        return 'str'
    if isinstance(value, int):
        return 'int'
    if isinstance(value, list):
        return 'list'
    return 'other'
