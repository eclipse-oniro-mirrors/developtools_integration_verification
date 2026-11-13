#!/usr/bin/env python3
"""Build the standalone architecture-evidence **skill** archive.

    python3 skills/ohos-design-architecture-evidence-query/scripts/build_skill.py

归档里有：skill 文档 + `bootstrap.py` + `oskm_runtime/`（装配层）。
**没有查询引擎，也没有 `oskm_schema/`**——那是独立产物 `oskm-cli.pyz`
（固定文件名，不带版本）的事，由 `oskm_runtime/cli_install.py` 按三级候选去取。

两个产物**互不依赖**：本脚本不 import CLI 的 builder，也不校验任何版本锁
（`cli_pin.json` 已于 2026-11-12 删除——CLI 与 `knowledge.db` 同类，固定文件名
`oskm-cli.pyz`、不记版本）。`SHA256SUMS` 自己写自己那份，产物落在
`skills/…/dist/`，与 `cli/dist/` 各自独立。构建先后顺序因此也无所谓了。

确定性做法沿用旧 `build_bundle.py`：条目排序、`mtime/uid/gid/uname/gname`
归零、USTAR、`gzip.GzipFile(filename='', mtime=epoch)`、`SOURCE_DATE_EPOCH`。
"""
from __future__ import annotations

import argparse
import gzip
import hashlib
import os
import re
import shutil
import sys
import tarfile
import tempfile
from pathlib import Path


SCRIPTS = Path(__file__).resolve().parent
SKILL_ROOT = SCRIPTS.parent
OSKM_ROOT = SKILL_ROOT.parents[1]
CLI_ROOT = OSKM_ROOT / 'cli'
# 产物落在 skill 内部：这个目录就是产物②的全部，构建输出也不例外。
DEFAULT_OUTPUT = SKILL_ROOT / 'dist'

# `dist` 必须在里面：默认输出目录就在 skill 内部（`skills/…/dist/`），
# 不排除就会把上一次的归档打进这一次的归档——每构建一次长一截，
# 而且 `stage_bundle` 复制的是"当前磁盘状态"，这种自包含不会报错，只会静默变大。
SKIP_NAMES = {'__pycache__', '.DS_Store', '.env', 'tests', 'scripts', 'dist',
              '.pytest_cache', '.mypy_cache'}
SKIP_SUFFIXES = {'.pyc', '.pyo', '.db', '.sqlite', '.sqlite3', '.log',
                 '.tar.gz', '.tgz', '.pyz'}
DEFAULT_EPOCH = 0
# 归档里绝不该出现的东西。`agentic` 与 `oskm_schema` 是 2.5.6 时代的产物，
# 留在这里当门禁：谁再把查询引擎塞回 skill，构建就当场失败。
FORBIDDEN_PARTS = {'agentic', 'oskm_schema', 'collectors', 'oskm', 'tests',
                   'scripts', 'dist', '__pycache__'}
FORBIDDEN_NAMES = {'.DS_Store', 'skill-design.md', 'standalone-packaging.md',
                   'build_bundle.py', 'build_cli.py', 'build_skill.py',
                   'SHA256SUMS', 'cli_pin.json'}
_VERSION_RE = re.compile(r"^__version__\s*=\s*['\"]([^'\"]+)['\"]", re.M)


def _frontmatter() -> dict:
    """Read the small YAML subset used by this skill without PyYAML.

    ``name`` is accepted only at the top level and ``version`` only below
    ``metadata``. This keeps governance fields from drifting back to the
    frontmatter top level.
    """
    text = (SKILL_ROOT / 'SKILL.md').read_text(encoding='utf-8')
    parts = text.split('---', 2)
    if len(parts) != 3 or parts[0].strip():
        raise ValueError('SKILL.md has no front matter')
    data: dict = {'': {}}
    section = ''
    for line in parts[1].splitlines():
        if not line.strip() or line.lstrip().startswith('#'):
            continue
        indent = len(line) - len(line.lstrip(' '))
        key, separator, raw = line.strip().partition(':')
        if not separator:
            raise ValueError(f'invalid front matter line: {line!r}')
        value = raw.strip().strip('"\'')
        if indent == 0:
            section = key
            data.setdefault(section, {})
            if value:
                data[''][key] = value
        elif section:
            data[section][key] = value
    return data


def skill_name() -> str:
    value = _frontmatter()[''].get('name')
    if not value:
        raise ValueError('SKILL.md front matter has no name')
    return value


def skill_version() -> str:
    value = _frontmatter().get('metadata', {}).get('version')
    if not value:
        raise ValueError('SKILL.md metadata has no version')
    return value


def source_date_epoch() -> int:
    raw = os.environ.get('SOURCE_DATE_EPOCH')
    return int(raw) if raw else DEFAULT_EPOCH


def _ignore(directory, names):
    directory = Path(directory).resolve()
    ignored = {
        name for name in names
        if name in SKIP_NAMES
        or (name.startswith('.env.') and name != '.env.example')
        or any(name.endswith(suffix) for suffix in SKIP_SUFFIXES)
    }
    return ignored


def _validate_package(package: Path) -> None:
    package = package.resolve()
    paths = sorted(package.rglob('*'))
    relative = [path.relative_to(package) for path in paths]

    skill_files = [path for path in paths if path.name == 'SKILL.md']
    if skill_files != [package / 'SKILL.md']:
        raise RuntimeError(f'expected exactly one root SKILL.md, found: {skill_files}')

    for path in relative:
        parts = path.parts
        if any(part in FORBIDDEN_PARTS for part in parts):
            raise RuntimeError(f'bundle contains forbidden path: {path}')
        if path.name in FORBIDDEN_NAMES:
            raise RuntimeError(f'bundle contains maintainer/cache file: {path}')
        if path.suffix in {'.pyc', '.pyo', '.db', '.sqlite', '.sqlite3',
                           '.log', '.pyz', '.tgz'} or path.name.endswith('.tar.gz'):
            raise RuntimeError(f'bundle contains generated/data file: {path}')
        if path.name == '.env':
            raise RuntimeError(f'bundle contains a real .env: {path}')

    required = ('SKILL.md', 'bootstrap.py', 'oskm_runtime/cli_install.py',
                'oskm_runtime/.env.example')
    missing = [name for name in required if not (package / name).is_file()]
    if missing:
        raise RuntimeError(f'bundle is missing required files: {missing}')


def stage_bundle(destination) -> Path:
    """Create ``destination/<skill-name>`` and return that package root."""
    destination = Path(destination)
    package = destination / skill_name()
    if package.exists():
        shutil.rmtree(package)
    destination.mkdir(parents=True, exist_ok=True)
    shutil.copytree(SKILL_ROOT, package, ignore=_ignore)
    _validate_package(package)
    return package


def _normalized_info(tar, source, arcname, epoch):
    source = Path(source)
    info = tar.gettarinfo(source, arcname=arcname)
    info.mtime = epoch
    info.uid = 0
    info.gid = 0
    info.uname = ''
    info.gname = ''
    info.devmajor = 0
    info.devminor = 0
    if info.isdir():
        info.mode = 0o755
    elif info.isreg():
        info.mode = 0o755 if source.stat().st_mode & 0o111 else 0o644
    else:
        info.mode = 0o644
    return info


def _add_package(tar, package, root_name, epoch):
    package = Path(package)
    tar.addfile(_normalized_info(tar, package, root_name, epoch))
    paths = sorted(
        package.rglob('*'),
        key=lambda item: item.relative_to(package).as_posix())
    for path in paths:
        arcname = f'{root_name}/{path.relative_to(package).as_posix()}'
        info = _normalized_info(tar, path, arcname, epoch)
        if info.isreg():
            with path.open('rb') as handle:
                tar.addfile(info, handle)
        else:
            tar.addfile(info)


def write_checksums(output_dir, entries: dict) -> Path:
    """Write ``<output_dir>/SHA256SUMS``, dropping entries whose file is gone.

    与 `cli/scripts/build_cli.py` 里的同名函数是**故意各写一份**：两个产物
    各自独立发布，连构建期都不该互相 import。这十行的重复换来的是
    "只拿到 skill 源码也能构建 skill"。
    合并而不是覆盖，是为了允许同一个 `dist/` 里并存多个版本；但文件已经
    不存在的条目必须丢掉，否则 `sha256sum -c` 会报 "No such file or directory"，
    看起来像构建坏了。
    """
    output_dir = Path(output_dir)
    checksums = output_dir / 'SHA256SUMS'
    merged = dict(entries)
    if checksums.is_file():
        for line in checksums.read_text(encoding='utf-8').splitlines():
            digest, _, name = line.partition('  ')
            name = name.strip()
            if name and name not in merged and (output_dir / name).is_file():
                merged[name] = digest.strip()
    checksums.write_text(
        ''.join(f'{merged[name]}  {name}\n' for name in sorted(merged)),
        encoding='utf-8')
    return checksums


def _write_archive(package, archive, root_name, epoch):
    with archive.open('wb') as raw:
        gz = gzip.GzipFile(filename='', mode='wb', fileobj=raw, mtime=epoch)
        try:
            with tarfile.open(fileobj=gz, mode='w', format=tarfile.USTAR_FORMAT) as tar:
                _add_package(tar, package, root_name, epoch)
        finally:
            gz.close()


def _package_members(package):
    return sorted(item.relative_to(package).as_posix()
                  for item in package.rglob('*'))


def build_bundle(output_dir=None) -> dict:
    """Build the tar.gz and write SHA256SUMS, returning release metadata."""
    root_name = skill_name()
    version = skill_version()
    epoch = source_date_epoch()
    output = Path(output_dir) if output_dir else DEFAULT_OUTPUT
    output.mkdir(parents=True, exist_ok=True)
    archive = output / f'{root_name}-{version}.tar.gz'
    with tempfile.TemporaryDirectory(prefix='oskm-skill-build-') as temp:
        package = stage_bundle(temp)
        _write_archive(package, archive, root_name, epoch)
        members = _package_members(package)
    digest = hashlib.sha256(archive.read_bytes()).hexdigest()
    write_checksums(output, {archive.name: digest})
    return {'version': version, 'archive': archive.resolve(),
            'sha256': digest, 'size': archive.stat().st_size,
            'members': len(members)}


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(
        description='Build the standalone architecture-evidence skill archive')
    parser.add_argument('--output-dir', type=Path, default=DEFAULT_OUTPUT,
                        help=f'output directory (default: {DEFAULT_OUTPUT})')
    args = parser.parse_args(argv)
    result = build_bundle(args.output_dir)
    print(f'archive: {result["archive"]}')
    print(f'version: {result["version"]}')
    print(f'members: {result["members"]}')
    print(f'size:    {result["size"]} bytes')
    print(f'sha256:  {result["sha256"]}')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
