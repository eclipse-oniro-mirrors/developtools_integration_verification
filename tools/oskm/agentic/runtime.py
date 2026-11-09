"""Daily runtime state shared by the query CLI and installer."""

from __future__ import annotations

import hashlib
import importlib
import json
import os
import shutil
import sqlite3
import sys
import tempfile
import time
from datetime import datetime
from pathlib import Path
from typing import Callable

from .db_download import (
    DownloadError,
    download_database,
    download_runtime_bundle,
    validate_date,
)
from .environment import (
    default_zone,
    load_env_file,
    yellow_configuration,
)


STATE_NAME = '.oskm-runtime.json'
REFRESH_RETRY_NAME = '.oskm-refresh-retry'
REFRESH_RETRY_SECONDS = 15 * 60
MINIMUM_PYTHON = (3, 10)
RUNTIME_MODULES = ('agentic', 'oskm_schema')
SDK_PATHS = {
    'sdk-js': 'interface/sdk-js',
    'sdk_c': 'interface/sdk_c',
}

REQUIRED_COLUMNS = {
    'scans': {
        'id', 'product', 'zone', 'cpu_arch', 'workspace_root',
        'started_at', 'finished_at',
    },
    'collector_runs': {
        'scan_id', 'collector', 'schema_version', 'status', 'scope',
        'record_count', 'error',
    },
    'collector_tables': {
        'scan_id', 'collector', 'table_name', 'is_primary',
        'component_column', 'service_column',
    },
    'issues': {
        'scan_id', 'collector', 'path', 'pointer', 'code', 'severity',
    },
}


def today() -> str:
    return datetime.now().astimezone().strftime('%Y%m%d')


def state_path(db_path: Path) -> Path:
    return Path(db_path).expanduser().resolve().parent / STATE_NAME


def load_state(db_path: Path) -> dict | None:
    path = state_path(db_path)
    if not path.is_file():
        return None
    try:
        state = json.loads(path.read_text(encoding='utf-8'))
    except (OSError, json.JSONDecodeError) as exc:
        raise ValueError(f'运行时状态文件不可读: {path}: {exc}') from exc
    if not isinstance(state, dict):
        raise ValueError(f'运行时状态文件格式错误: {path}')
    return state


def _artifact_path(root: Path, value: object) -> Path | None:
    if not isinstance(value, str) or not value:
        return None
    path = Path(value)
    return path if path.is_absolute() else root / path


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            digest.update(chunk)
    return digest.hexdigest()


def _write_state(path: Path, state: dict) -> None:
    descriptor, temporary_name = tempfile.mkstemp(
        prefix=f'.{path.name}.tmp.', dir=path.parent)
    temporary = Path(temporary_name)
    try:
        with os.fdopen(descriptor, 'w', encoding='utf-8') as stream:
            descriptor = -1
            json.dump(state, stream, ensure_ascii=False, indent=2)
            stream.write('\n')
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
    finally:
        if descriptor >= 0:
            os.close(descriptor)
        temporary.unlink(missing_ok=True)


def schema_problem(db_path: Path) -> str | None:
    """Describe why a database cannot be opened by the current query layer."""
    path = Path(db_path).expanduser().resolve()
    connection = None
    try:
        connection = sqlite3.connect(path.as_uri() + '?mode=ro', uri=True)
        integrity = connection.execute('PRAGMA integrity_check').fetchone()
        if not integrity or integrity[0] != 'ok':
            detail = integrity[0] if integrity else '没有返回结果'
            return f'SQLite integrity_check 未通过: {detail}'

        tables = {
            row[0] for row in connection.execute(
                "SELECT name FROM sqlite_master WHERE type='table'")
        }
        problems = []
        missing_tables = sorted(set(REQUIRED_COLUMNS) - tables)
        if missing_tables:
            problems.append('缺少表: ' + ', '.join(missing_tables))

        for table, required in REQUIRED_COLUMNS.items():
            if table not in tables:
                continue
            columns = {
                row[1] for row in connection.execute(
                    f'PRAGMA table_info({table})')
            }
            absent = sorted(required - columns)
            if absent:
                problems.append('缺少列: ' + ', '.join(
                    f'{table}.{column}' for column in absent))
        return '；'.join(problems) if problems else None
    except sqlite3.Error as exc:
        return f'SQLite 读取失败: {exc}'
    finally:
        if connection is not None:
            connection.close()


def validate_db(db_path: Path) -> None:
    problem = schema_problem(db_path)
    if problem is None:
        return
    raise ValueError(
        'knowledge.db schema 与当前 oskm 查询层不兼容：'
        f'{problem}。已停止安装并保留现有运行时。'
        '下载物可能由旧版 oskm 生成；请等待包含当前 schema 的新成功构建后重试，'
        '或在当前源码根重新扫描生成 knowledge.db。')


def needs_refresh(db_path: Path, *, today: str) -> bool:
    """Return whether a managed runtime is stale or incomplete.

    A database without a state file is an unmanaged input and is left alone for
    backwards compatibility with existing ``artifacts/*/knowledge.db`` files.
    """
    db_path = Path(db_path).expanduser().resolve()
    state = load_state(db_path)
    if state is None:
        return False

    root = db_path.parent
    db = state.get('db')
    sdk = state.get('sdk')
    if not isinstance(db, dict) or not isinstance(sdk, dict):
        return True
    if db.get('date') != today or sdk.get('date') != today:
        return True

    db_file = _artifact_path(root, db.get('path'))
    if db_file is None or not db_file.is_file():
        return True
    if schema_problem(db_file) is not None:
        return True
    for name in ('sdk-js', 'sdk_c'):
        item = sdk.get(name)
        if not isinstance(item, dict):
            return True
        sdk_dir = _artifact_path(root, item.get('path'))
        if sdk_dir is None or not sdk_dir.is_dir():
            return True
        if not any(sdk_dir.iterdir()):
            return True
    return False


def _queryable_database(db_path: Path) -> bool:
    """Return whether a stale managed database can still serve queries."""
    return db_path.is_file() and schema_problem(db_path) is None


def _retry_path(db_path: Path) -> Path:
    return db_path.parent / REFRESH_RETRY_NAME


def _refresh_retry_recent(db_path: Path) -> bool:
    path = _retry_path(db_path)
    try:
        return time.time() - path.stat().st_mtime < REFRESH_RETRY_SECONDS
    except OSError:
        return False


def _record_refresh_failure(db_path: Path) -> None:
    try:
        _retry_path(db_path).touch()
    except OSError:
        pass


def _clear_refresh_failure(db_path: Path) -> None:
    try:
        _retry_path(db_path).unlink(missing_ok=True)
    except OSError:
        pass


def check_environment() -> bool:
    """Print a cross-platform Python and module readiness report."""
    ready = True
    python_version = '.'.join(str(part) for part in sys.version_info[:3])
    if sys.version_info >= MINIMUM_PYTHON:
        print(f'Python: {python_version} (OK, requires Python 3.10+)')
    else:
        print(f'Python: {python_version} (FAIL: requires Python 3.10+)')
        ready = False

    modules = []
    module_failed = False
    for name in RUNTIME_MODULES:
        try:
            importlib.import_module(name)
        except (ImportError, RuntimeError, TypeError) as exc:
            modules.append(f'{name} (FAIL: {exc})')
            module_failed = True
        else:
            modules.append(f'{name} (OK)')
    if module_failed:
        print('Modules: ' + ', '.join(modules))
        print(
            '提示: 先 cd 到 oskm 解压目录；或在任意目录设置 '
            'PYTHONPATH=<...>/oskm。')
        ready = False
    else:
        print(f"Modules: {', '.join(RUNTIME_MODULES)} (OK)")

    zone = None
    try:
        zone = default_zone()
    except ValueError as exc:
        print(f'Zone:   FAIL: {exc}')
        ready = False
    else:
        print(f'Zone:   {zone} (默认区域)')

    yellow_valid, yellow_state = yellow_configuration(required=zone == 'yellow')
    print(f'Yellow: {yellow_state} (仅黄区需要)')
    if not yellow_valid:
        if zone == 'yellow':
            print(
                '        FAIL: 默认区域为 yellow 时必须配置 '
                'OSKM_YELLOW_DB_BASE_URL（可在 .env 中填写）')
        ready = False

    print('提示: 运行时通过单个 knowledge.tar.gz 安装，不再需要 Git 或 SDK 凭据。')
    if not ready:
        print('错误: 运行时依赖检查未通过。')
    return ready


def _validate_install_options(
    zone: str,
    component: str,
    *,
    download_db: bool,
    download_sdk: bool,
) -> None:
    if zone not in ('blue', 'yellow'):
        raise ValueError(f'--zone 只能是 blue 或 yellow: {zone}')
    if not download_db and not download_sdk:
        raise ValueError('--skip-db 与 --skip-sdk 不能同时使用')
    if zone == 'blue' and not component:
        raise ValueError('蓝区必须指定 --component')
    if zone == 'yellow' and component:
        raise ValueError('黄区不接受 --component')


def _remove_artifact(path: Path) -> None:
    if path.is_symlink() or path.is_file():
        path.unlink(missing_ok=True)
    elif path.exists():
        shutil.rmtree(path)


def _install_artifacts(
    bundle_root: Path,
    runtime_root: Path,
    *,
    install_db: bool,
    install_sdk: bool,
    state_source: Path,
) -> None:
    """Replace selected runtime artifacts and roll back a partial replacement."""
    artifacts = []
    if install_db:
        artifacts.append((
            bundle_root / 'knowledge.db',
            runtime_root / 'knowledge.db',
            'db',
        ))
    if install_sdk:
        for name, relative in SDK_PATHS.items():
            artifacts.append((
                bundle_root / relative,
                runtime_root / relative,
                name,
            ))
    artifacts.append((state_source, runtime_root / STATE_NAME, 'state'))

    backup_parent = Path(tempfile.mkdtemp(
        prefix='.oskm-runtime-backup.', dir=runtime_root))
    backups: list[tuple[Path, Path]] = []
    installed: list[Path] = []
    try:
        for source, destination, backup_name in artifacts:
            destination.parent.mkdir(parents=True, exist_ok=True)
            if destination.exists() or destination.is_symlink():
                backup = backup_parent / backup_name
                os.replace(destination, backup)
                backups.append((destination, backup))
            os.replace(source, destination)
            installed.append(destination)
    except BaseException:
        for destination in reversed(installed):
            _remove_artifact(destination)
        for destination, backup in reversed(backups):
            destination.parent.mkdir(parents=True, exist_ok=True)
            if backup.exists() or backup.is_symlink():
                os.replace(backup, destination)
        raise
    finally:
        shutil.rmtree(backup_parent, ignore_errors=True)


def install_runtime(
    runtime_root: Path,
    zone: str,
    component: str,
    date: str,
    *,
    download_db: bool = True,
    download_sdk: bool = True,
) -> None:
    """Install or refresh a managed runtime from one downloaded archive."""
    runtime_root = Path(runtime_root).expanduser().resolve()
    component = component or ''
    if not isinstance(component, str):
        raise ValueError('--component 必须是字符串')
    _validate_install_options(
        zone, component, download_db=download_db, download_sdk=download_sdk)
    validate_date(date)

    runtime_root.mkdir(parents=True, exist_ok=True)
    previous = load_state(runtime_root / 'knowledge.db') or {}
    previous_date = previous.get('date')
    previous_zone = previous.get('zone')
    if any(
            value is not None and not isinstance(value, str)
            for value in (previous_date, previous_zone)):
        raise ValueError(
            f'运行时状态文件字段类型错误: {runtime_root / STATE_NAME}')

    with tempfile.TemporaryDirectory(
            prefix='.oskm-runtime-install.', dir=runtime_root) as temp:
        work_dir = Path(temp)
        print(
            f'==> 下载 {zone} 区运行时: {date}'
            + (f' / {component}' if component else ''),
            file=sys.stderr,
        )
        bundle_root = download_runtime_bundle(
            zone=zone,
            date=date,
            output=work_dir / 'runtime',
            component=component or None,
        )
        validate_db(bundle_root / 'knowledge.db')

        state = {
            'version': 2,
            'date': date,
            'zone': zone,
            'component': component,
            'updated_at': datetime.now().astimezone().isoformat(
                timespec='seconds'),
        }
        if download_db:
            state['db'] = {
                'date': date,
                'path': 'knowledge.db',
                'sha256': _sha256(bundle_root / 'knowledge.db'),
            }
        elif isinstance(previous.get('db'), dict):
            state['db'] = previous['db']
        if download_sdk:
            state['sdk'] = {
                'date': date,
                **{
                    name: {'path': relative}
                    for name, relative in SDK_PATHS.items()
                },
            }
        elif isinstance(previous.get('sdk'), dict):
            state['sdk'] = previous['sdk']
        staged_state = work_dir / STATE_NAME
        _write_state(staged_state, state)
        _install_artifacts(
            bundle_root,
            runtime_root,
            install_db=download_db,
            install_sdk=download_sdk,
            state_source=staged_state,
        )
    print(f'==> 运行时安装完成: {runtime_root}', file=sys.stderr)


def ensure_runtime(
    db_path: Path,
    *,
    today: str | None = None,
    installer: Callable[[Path, str, str, str], None] | None = None,
) -> bool:
    """Refresh a managed runtime, falling back to a usable stale database."""
    db_path = Path(db_path).expanduser().resolve()
    current_date = today or globals()['today']()
    if not needs_refresh(db_path, today=current_date):
        return False

    state = load_state(db_path) or {}
    zone = state.get('zone')
    component = state.get('component', '')
    if zone not in ('blue', 'yellow') or not isinstance(component, str):
        raise ValueError(f'运行时状态缺少有效的 zone/component: {state_path(db_path)}')
    if zone == 'blue' and not component:
        raise ValueError(f'蓝区运行时状态缺少 component: {state_path(db_path)}')

    if _queryable_database(db_path) and _refresh_retry_recent(db_path):
        print(
            'oskm: 最近一次运行时刷新失败，'
            f'{REFRESH_RETRY_SECONDS // 60} 分钟内继续使用旧 knowledge.db；'
            f'如需立即重试，删除 {_retry_path(db_path)}',
            file=sys.stderr,
        )
        return False

    install = installer or install_runtime
    print(f'oskm: 刷新运行时到 {current_date} ({zone})', file=sys.stderr)
    try:
        install(db_path.parent, zone, component, current_date)
    except (OSError, RuntimeError, ValueError) as exc:
        if not _queryable_database(db_path):
            raise
        _record_refresh_failure(db_path)
        print(
            f'oskm: 运行时刷新失败: {exc}',
            file=sys.stderr,
        )
        print(
            'oskm: 已保留并继续使用旧 knowledge.db；依赖 SDK 源码证据的查询'
            f'可能失败。{REFRESH_RETRY_SECONDS // 60} 分钟后再自动重试。',
            file=sys.stderr,
        )
        return False
    _clear_refresh_failure(db_path)
    return True


def main(argv: list[str] | None = None) -> int:
    import argparse

    try:
        load_env_file()
    except ValueError as exc:
        print(f'错误: {exc}', file=sys.stderr)
        return 1

    arguments = list(sys.argv[1:] if argv is None else argv)
    parser = argparse.ArgumentParser(description='oskm 运行时下载、安装与校验')
    subparsers = parser.add_subparsers(dest='command', required=True)

    subparsers.add_parser('doctor', help='检查 Python、配置与内部模块依赖')

    download = subparsers.add_parser('download-db', help='下载指定日期的 DB')
    download.add_argument(
        '--zone', choices=('blue', 'yellow'),
        help='默认读取 OSKM_DEFAULT_ZONE，未配置时为 blue')
    download.add_argument('--date', required=True)
    download.add_argument('--output', required=True)
    download.add_argument('--component')

    install = subparsers.add_parser('install', help='安装或刷新托管运行时')
    install.add_argument(
        '--zone', choices=('blue', 'yellow'),
        help='默认读取 OSKM_DEFAULT_ZONE，未配置时为 blue')
    install.add_argument('--runtime-root', required=True)
    install.add_argument('--date')
    install.add_argument('--component')
    modes = install.add_mutually_exclusive_group()
    modes.add_argument('--skip-db', action='store_true')
    modes.add_argument('--skip-sdk', action='store_true')

    validation = subparsers.add_parser('validate-db', help='校验当前查询层 schema')
    validation.add_argument('path')

    if arguments and arguments[0] == '--validate-db':
        arguments = ['validate-db', arguments[1]]

    args = parser.parse_args(arguments)
    if args.command == 'doctor':
        return 0 if check_environment() else 1

    zone = getattr(args, 'zone', None)
    if args.command in ('download-db', 'install') and zone is None:
        try:
            zone = default_zone()
        except ValueError as exc:
            print(f'错误: {exc}', file=sys.stderr)
            return 1

    if args.command == 'download-db':
        try:
            output = download_database(
                zone=zone,
                date=args.date,
                output=Path(args.output).expanduser().resolve(),
                component=args.component,
            )
        except DownloadError as exc:
            print(f'错误: {exc}', file=sys.stderr)
            return 1
        print(output)
        return 0

    if args.command == 'install':
        try:
            install_runtime(
                Path(args.runtime_root).expanduser().resolve(),
                zone,
                args.component or '',
                args.date or today(),
                download_db=not args.skip_db,
                download_sdk=not args.skip_sdk,
            )
        except (DownloadError, OSError, RuntimeError, ValueError) as exc:
            print(f'错误: {exc}', file=sys.stderr)
            return 1
        return 0

    try:
        validate_db(Path(args.path))
    except ValueError as exc:
        print(f'错误: {exc}', file=sys.stderr)
        return 2
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
