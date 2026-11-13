"""Put the skill, CLI, and shared packages on sys.path for test discovery."""
import sys
from pathlib import Path

_HERE = Path(__file__).resolve().parent
_SKILL = _HERE.parent
_OSKM = _HERE.parents[2]
for _path in (
        str(_SKILL), str(_OSKM / 'cli'), str(_OSKM),
        str(_OSKM / 'cli' / 'scripts'), str(_SKILL / 'scripts')):
    if _path not in sys.path:
        sys.path.insert(0, _path)
