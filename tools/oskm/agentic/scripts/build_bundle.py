#!/usr/bin/env python3
"""Build the standalone oskm query skill archive.

The resulting package contains ``agentic/`` and the neutral ``oskm_schema/``
package only. The collector pipeline under ``oskm/`` is intentionally excluded.
The archive is written deterministically so that rebuilding unchanged source
produces the same SHA-256.
"""
from __future__ import annotations

import argparse
import gzip
import hashlib
import os
import re
import shutil
import tarfile
import tempfile
from pathlib import Path


AGENTIC = Path(__file__).resolve().parents[1]
OSKM_ROOT = AGENTIC.parent
SCHEMA = OSKM_ROOT / 'oskm_schema'
DEFAULT_OUTPUT = OSKM_ROOT / 'dist'
SKIP_NAMES = {'__pycache__', '.DS_Store', '.env'}
SKIP_SUFFIXES = {'.pyc', '.pyo', '.db', '.sqlite', '.sqlite3', '.log'}
DEFAULT_EPOCH = 0


def _frontmatter_value(field: str) -> str:
    text = (AGENTIC / 'SKILL.md').read_text(encoding='utf-8')
    parts = text.split('---', 2)
    if len(parts) != 3 or parts[0].strip():
        raise ValueError('SKILL.md has no front matter')
    match = re.search(
        rf'^{re.escape(field)}:\s*["\']?([^"\'\s]+)["\']?\s*$',
        parts[1],
        flags=re.MULTILINE)
    if match is None:
        raise ValueError(f'SKILL.md front matter has no {field}')
    return match.group(1)


def skill_name() -> str:
    return _frontmatter_value('name')


def skill_version() -> str:
    return _frontmatter_value('version')


ROOT_NAME = skill_name()


def source_date_epoch() -> int:
    raw = os.environ.get('SOURCE_DATE_EPOCH')
    if not raw:
        return DEFAULT_EPOCH
    return int(raw)


def _ignore(directory, names):
    directory = Path(directory)
    ignored = {
        name for name in names
        if name in SKIP_NAMES
        or (name.startswith('.env.') and name != '.env.example')
        or any(name.endswith(suffix) for suffix in SKIP_SUFFIXES)
    }
    if directory == AGENTIC / 'query':
        ignored.add('tests')
    return ignored


def stage_bundle(destination) -> Path:
    """Create ``destination/oskm`` and return that package root."""
    destination = Path(destination)
    package = destination / ROOT_NAME
    if package.exists():
        shutil.rmtree(package)
    destination.mkdir(parents=True, exist_ok=True)

    shutil.copytree(AGENTIC, package / 'agentic', ignore=_ignore)
    shutil.copytree(SCHEMA, package / 'oskm_schema', ignore=_ignore)
    shutil.copy2(AGENTIC / 'SKILL.md', package / 'SKILL.md')
    shutil.copy2(
        AGENTIC / 'scripts' / 'bundle_README.md', package / 'README.md')

    if (package / 'oskm').exists():
        raise RuntimeError('bundle unexpectedly contains the oskm collector package')
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


def _add_package(tar, package, epoch):
    package = Path(package)
    tar.addfile(_normalized_info(tar, package, ROOT_NAME, epoch))

    paths = sorted(
        package.rglob('*'),
        key=lambda item: item.relative_to(package).as_posix())
    for path in paths:
        arcname = f'{ROOT_NAME}/{path.relative_to(package).as_posix()}'
        info = _normalized_info(tar, path, arcname, epoch)
        if info.isreg():
            with path.open('rb') as handle:
                tar.addfile(info, handle)
        else:
            tar.addfile(info)


def build_bundle(output_dir=None) -> dict:
    """Build the tar.gz and SHA256SUMS, returning release metadata."""
    version = skill_version()
    epoch = source_date_epoch()
    output = Path(output_dir) if output_dir else DEFAULT_OUTPUT
    output.mkdir(parents=True, exist_ok=True)
    archive = output / f'{ROOT_NAME}-{version}.tar.gz'
    checksums = output / 'SHA256SUMS'

    with tempfile.TemporaryDirectory(prefix='oskm-build-') as temp:
        package = stage_bundle(temp)
        with archive.open('wb') as raw:
            gz = gzip.GzipFile(
                filename='', mode='wb', fileobj=raw, mtime=epoch)
            try:
                with tarfile.open(
                        fileobj=gz, mode='w',
                        format=tarfile.USTAR_FORMAT) as tar:
                    _add_package(tar, package, epoch)
            finally:
                gz.close()

    digest = hashlib.sha256(archive.read_bytes()).hexdigest()
    checksums.write_text(f'{digest}  {archive.name}\n', encoding='utf-8')
    return {
        'version': version,
        'archive': archive.resolve(),
        'checksums': checksums.resolve(),
        'sha256': digest,
        'size': archive.stat().st_size,
    }


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(
        description='Build the standalone oskm query skill archive')
    parser.add_argument(
        '--output-dir', type=Path, default=DEFAULT_OUTPUT,
        help=f'output directory (default: {DEFAULT_OUTPUT})')
    args = parser.parse_args(argv)
    result = build_bundle(args.output_dir)
    print(f'archive: {result["archive"]}')
    print(f'size:    {result["size"]} bytes')
    print(f'sha256:  {result["sha256"]}')
    print(f'sums:    {result["checksums"]}')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
