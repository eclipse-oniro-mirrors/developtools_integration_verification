"""Put the CLI and shared packages on sys.path for isolated unittest discovery."""
import sys
from pathlib import Path

_HERE = Path(__file__).resolve().parent
for _path in (
        str(_HERE.parent), str(_HERE.parent.parent),
        str(_HERE.parent / 'scripts')):
    if _path not in sys.path:
        sys.path.insert(0, _path)
