"""Package-local environment settings for the oskm runtime."""

from __future__ import annotations

import os
from pathlib import Path


YELLOW_DB_BASE_ENV = 'OSKM_YELLOW_DB_BASE_URL'
YELLOW_ENV_KEYS = (YELLOW_DB_BASE_ENV,)
DEFAULT_ZONE_ENV = 'OSKM_DEFAULT_ZONE'
ENV_KEYS = (DEFAULT_ZONE_ENV, *YELLOW_ENV_KEYS)
ENV_FILE = Path(__file__).with_name('.env')


def _parse_line(raw: str, path: Path, line_number: int) -> tuple[str, str] | None:
    line = raw.strip()
    if not line or line.startswith('#'):
        return None
    if line.startswith('export '):
        line = line[len('export '):].lstrip()
    key, separator, value = line.partition('=')
    key = key.strip()
    if not separator or not key:
        raise ValueError(f'{path}:{line_number}: 配置行必须使用 KEY=VALUE')
    if key not in ENV_KEYS:
        raise ValueError(
            f'{path}:{line_number}: 不支持的配置项 {key}；'
            f'只允许 {", ".join(ENV_KEYS)}')

    value = value.strip()
    if value[:1] in ('"', "'"):
        quote = value[0]
        closing = value.find(quote, 1)
        if closing < 0:
            raise ValueError(f'{path}:{line_number}: 引号未闭合')
        trailing = value[closing + 1:].strip()
        if trailing and not trailing.startswith('#'):
            raise ValueError(f'{path}:{line_number}: 引号后的内容无法识别')
        value = value[1:closing]
    elif ' #' in value:
        value = value.split(' #', 1)[0].rstrip()
    return key, value


def load_env_file(path: Path | None = None) -> Path | None:
    """Load supported settings from a local .env file without overriding env."""
    path = Path(path) if path is not None else ENV_FILE
    if not path.is_file():
        return None
    try:
        lines = path.read_text(encoding='utf-8-sig').splitlines()
    except OSError as exc:
        raise ValueError(f'环境文件不可读: {path}: {exc}') from exc

    values: dict[str, str] = {}
    for line_number, raw in enumerate(lines, start=1):
        parsed = _parse_line(raw, path, line_number)
        if parsed is not None:
            key, value = parsed
            values[key] = value
    for key, value in values.items():
        os.environ.setdefault(key, value)
    return path


def default_zone() -> str:
    """Return the configured default zone, falling back to blue."""
    zone = os.environ.get(DEFAULT_ZONE_ENV, '').strip().lower() or 'blue'
    if zone not in ('blue', 'yellow'):
        raise ValueError(
            f'{DEFAULT_ZONE_ENV} 只能是 blue 或 yellow: {zone}')
    return zone


def yellow_configuration(*, required: bool = False) -> tuple[bool, str]:
    """Return yellow URL readiness without exposing configured values."""
    from urllib.parse import urlsplit

    valid = True
    states = []
    for key in YELLOW_ENV_KEYS:
        raw = os.environ.get(key, '').strip()
        if not raw:
            states.append(f'{key}=未配置')
            if required:
                valid = False
            continue
        parsed = urlsplit(raw.rstrip('/'))
        if parsed.scheme not in ('http', 'https') or not parsed.netloc:
            states.append(f'{key}=格式错误')
            valid = False
        else:
            states.append(f'{key}=已配置')
    return valid, ', '.join(states)
