#!/usr/bin/env bash
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
package_root=$(cd "$script_dir/../.." && pwd -P)
export PYTHONPATH="$package_root${PYTHONPATH:+:$PYTHONPATH}"
exec "${PYTHON:-python3}" -m agentic.runtime download-db "$@"
