"""把 DB + SDK + CLI 装进托管运行时根目录，并支持按日期显式刷新。

三条不可协商的性质，都是踩出来的：

1. **原子安装 + 回滚。** `_install_artifacts()` 先把旧产物 `os.replace` 到
   同目录的备份目录，任一步失败就逆序还原。半装的运行时比没装更坏——
   查询会返回看起来合理的空结果。
2. **schema 契约向 CLI 借，不自己实现。** `validate` 默认是
   `oskm_cli.database.validate_db`（经 `cli_install` 载入）。skill 里没有
   第二份表/列清单。
3. **失败不破坏已有运行时。** `_install_artifacts` 的回滚保证这一点；
   `refresh` 失败时旧库原样留着，用户修好网络再跑一次即可。
   （早先还有一条"刷新失败后 15 分钟内不再重试"的退避逻辑，那是查询透传
   时代的产物——刷新挂在每条查询前面，不退避就会每条命令都去试一次下载。
   透传删除后刷新是显式动作，退避随之删除。）
"""

from __future__ import annotations

import os
import shutil
import sys
import tempfile
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Callable

from . import cli_install, state
from .db_download import (
    DownloadError,
    download_runtime_bundle,
    validate_date,
)
from .environment import DOWNLOAD_SOURCES, download_config


Validator = Callable[[Path], None]


@dataclass(frozen=True)
class LocalRuntime:
    source_root: Path
    db_path: Path


def default_validator() -> Validator:
    """The CLI's own schema gate -- the only copy of the contract."""
    return cli_install.load_database().validate_db


def bundle_validator(bundle_root) -> Validator:
    """校验器取自**下载下来的那个归档**自带的 `oskm-cli.pyz`。

    归档里有 `knowledge.db` + `oskm-cli.pyz` + 两套 SDK，所以 install 不需要
    "先单独装 CLI 再去下载 DB"——那个顺序是"CLI 单独下载"时代的产物。
    自带校验器还有个额外好处：**校验这批数据的，就是和这批数据一起发布的
    那一个 CLI**，不会出现"新 CLI 校验旧库"的错配。
    """
    pyz = Path(bundle_root) / cli_install.ARTIFACT_NAME
    if not pyz.is_file():
        # 归档里暂时没放 CLI（服务器端还在补）。退回已装/源码树的那一个，
        # schema 契约仍然只有 CLI 那一份。
        return default_validator()
    cli_install.verify_pyz(pyz)
    location = cli_install.CliLocation(
        path=pyz, kind=cli_install.DOWNLOADED,
        version=cli_install.pyz_version(pyz), sys_path=(str(pyz),))
    try:
        return cli_install.load_database(location).validate_db
    except cli_install.CliInstallError:
        # 归档里的 CLI 可能是裁剪版（没有 `oskm_cli.database`，测试夹具就是
        # 这种）。退回已装/源码树的校验器——schema 契约仍然只有 CLI 那一份，
        # 只是这次用哪个 CLI 来问而已。发布产物始终带 `database.py`。
        return default_validator()


def _directory_has_entries(path: Path) -> bool:
    try:
        return path.is_dir() and next(path.iterdir(), None) is not None
    except OSError:
        return False


def is_openharmony_source_root(source_root) -> bool:
    """Return whether a directory has the reusable OpenHarmony source layout."""
    root = Path(source_root).expanduser().resolve()
    return (
        (root / '.gn').is_file()
        and (root / 'interface/sdk-js').is_dir()
        and (root / 'interface/sdk_c').is_dir()
        and (root / 'out').is_dir()
    )


def _source_db_candidates(source_root: Path) -> list[Path]:
    """Find source build databases in supported one/two-level out/ layouts."""
    out = source_root / 'out'
    candidates = set()
    for pattern in ('*/oskm/knowledge.db', '*/*/oskm/knowledge.db'):
        candidates.update(path for path in out.glob(pattern) if path.is_file())
    return sorted(candidates)


def find_local_runtime(source_root=None, *, validate: Validator | None = None) -> LocalRuntime | None:
    """Find a complete source-tree runtime, preferring the newest valid DB."""
    root = Path(source_root if source_root is not None else Path.cwd())
    root = root.expanduser().resolve()
    if not is_openharmony_source_root(root):
        return None
    if not all(
            _directory_has_entries(root / relative)
            for relative in state.SDK_PATHS.values()):
        return None

    validate = validate or default_validator()

    def modified(path: Path) -> int:
        try:
            return path.stat().st_mtime_ns
        except OSError:
            return -1

    for db_path in sorted(
            _source_db_candidates(root), key=modified, reverse=True):
        try:
            validate(db_path)
        except ValueError:
            continue
        return LocalRuntime(source_root=root, db_path=db_path)
    return None


def _stage_local_runtime(
    local: LocalRuntime,
    output: Path,
    *,
    install_db: bool,
    install_sdk: bool,
) -> Path:
    """Copy a source runtime so installation never moves source-tree files."""
    output.mkdir(parents=True)
    if install_db:
        shutil.copy2(local.db_path, output / 'knowledge.db')
    if install_sdk:
        for relative in state.SDK_PATHS.values():
            destination = output / relative
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copytree(local.source_root / relative, destination)
            if not _directory_has_entries(destination):
                raise OSError(f'源码 SDK 目录为空: {local.source_root / relative}')
    return output


def _validate_install_options(source: str, *, download_db: bool,
                              download_sdk: bool) -> None:
    if source not in DOWNLOAD_SOURCES:
        raise ValueError(
            f'--source 只能是 {" 或 ".join(DOWNLOAD_SOURCES)}: {source}')
    if not download_db and not download_sdk:
        raise ValueError('--skip-db 与 --skip-sdk 不能同时使用')


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
    install_cli: bool,
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
    if install_cli:
        # CLI 与 knowledge.db 一起发布、一起落盘：固定文件名，不记版本。
        artifacts.append((
            bundle_root / cli_install.ARTIFACT_NAME,
            cli_install.installed_path(runtime_root),
            'cli',
        ))
    if install_sdk:
        for name, relative in state.SDK_PATHS.items():
            artifacts.append((
                bundle_root / relative,
                runtime_root / relative,
                name,
            ))
    artifacts.append((state_source, runtime_root / state.STATE_NAME, 'state'))

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
        # 逆序还原：安装是有序的，回滚就必须反着来，否则后装的备份
        # 会把先还原好的产物再压掉。
        for destination in reversed(installed):
            _remove_artifact(destination)
        for destination, backup in reversed(backups):
            destination.parent.mkdir(parents=True, exist_ok=True)
            if backup.exists() or backup.is_symlink():
                os.replace(backup, destination)
        raise
    finally:
        shutil.rmtree(backup_parent, ignore_errors=True)


def build_state(
    *,
    source: str,
    date: str,
    bundle_root: Path | None,
    download_db: bool,
    download_sdk: bool,
    previous: dict,
    local: LocalRuntime | None = None,
    bundle_cli: Path | None = None,
) -> dict:
    """Assemble a version-3 state document, carrying over skipped sections."""
    document = {
        'version': state.STATE_VERSION,
        'source': source,
        'date': date,
        'updated_at': datetime.now().astimezone().isoformat(
            timespec='seconds'),
    }
    if local is not None:
        document['source'] = 'local'
        document['source_root'] = str(local.source_root)
    if download_db and bundle_root is not None:
        document['db'] = {
            'date': date,
            'path': 'knowledge.db',
            'sha256': state.sha256(bundle_root / 'knowledge.db'),
        }
    elif isinstance(previous.get('db'), dict):
        document['db'] = previous['db']
    if download_sdk:
        document['sdk'] = {
            'date': date,
            **{name: {'path': relative}
               for name, relative in state.SDK_PATHS.items()},
        }
    elif isinstance(previous.get('sdk'), dict):
        document['sdk'] = previous['sdk']
    if bundle_cli is not None:
        # 出处记录，不是版本锁：CLI 与 knowledge.db 同类，固定文件名、不记版本。
        document['cli'] = {'path': cli_install.ARTIFACT_NAME,
                           'sha256': state.sha256(bundle_cli)}
    elif isinstance(previous.get('cli'), dict):
        # 源码树里的 CLI 不写进状态（它没有被安装到运行时根目录），
        # 但**已有的** cli 段要留着，否则每次 --skip-db 都会抹掉它。
        document['cli'] = previous['cli']
    return document


def _try_local_runtime(work_dir, *, download_db, download_sdk, validate):
    local_runtime = find_local_runtime(validate=validate)
    if local_runtime is None:
        return None, None
    print(f'==> 使用源码本地运行时: {local_runtime.db_path}', file=sys.stderr)
    local_stage = work_dir / 'local-runtime'
    try:
        bundle_root = _stage_local_runtime(
            local_runtime,
            local_stage,
            install_db=download_db,
            install_sdk=download_sdk,
        )
        if download_db:
            (validate or default_validator())(bundle_root / 'knowledge.db')
        return local_runtime, bundle_root
    except (shutil.Error, ValueError) as exc:
        shutil.rmtree(local_stage, ignore_errors=True)
        print(f'==> 源码本地运行时不可用，回退下载: {exc}', file=sys.stderr)
        return None, None


def _download_bundle(work_dir, source, date, validate):
    print(f'==> 下载 {source} 运行时: {date}', file=sys.stderr)
    bundle_root = download_runtime_bundle(
        source=source,
        date=date,
        output=work_dir / 'runtime',
    )
    (validate or bundle_validator(bundle_root))(bundle_root / 'knowledge.db')
    return bundle_root


def _bundled_cli(bundle_root, installed_local):
    candidate = bundle_root / cli_install.ARTIFACT_NAME
    return candidate if installed_local is None and candidate.is_file() else None


def install_runtime(
    runtime_root,
    source: str,
    date: str,
    *,
    download_db: bool = True,
    download_sdk: bool = True,
    validate: Validator | None = None,
) -> None:
    """Install or refresh a managed runtime from one downloaded archive."""
    runtime_root = Path(runtime_root).expanduser().resolve()
    _validate_install_options(
        source, download_db=download_db, download_sdk=download_sdk)
    validate_date(date)
    runtime_root.mkdir(parents=True, exist_ok=True)
    previous = state.load_state(runtime_root / 'knowledge.db') or {}
    previous_date = previous.get('date')
    if previous_date is not None and not isinstance(previous_date, str):
        raise ValueError(
            f'运行时状态文件字段类型错误: {runtime_root / state.STATE_NAME}')
    with tempfile.TemporaryDirectory(
            prefix='.oskm-runtime-install.', dir=runtime_root) as temp:
        work_dir = Path(temp)
        installed_local, bundle_root = _try_local_runtime(
            work_dir, download_db=download_db, download_sdk=download_sdk,
            validate=validate)
        if bundle_root is None:
            bundle_root = _download_bundle(work_dir, source, date, validate)
        bundle_cli = _bundled_cli(bundle_root, installed_local)
        document = build_state(
            source=source, date=date, bundle_root=bundle_root,
            download_db=download_db, download_sdk=download_sdk,
            previous=previous, local=installed_local, bundle_cli=bundle_cli)
        staged_state = work_dir / state.STATE_NAME
        state.write_state(staged_state, document)
        _install_artifacts(
            bundle_root, runtime_root,
            install_db=download_db, install_sdk=download_sdk,
            install_cli=bundle_cli is not None, state_source=staged_state)
    print(f'==> 运行时安装完成: {runtime_root}', file=sys.stderr)
