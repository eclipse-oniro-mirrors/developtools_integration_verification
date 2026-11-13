#!/usr/bin/env python3
"""Build the standalone read-only query CLI as a deterministic zipapp.

    python3 cli/scripts/build_cli.py                     # → cli/dist/oskm-cli.pyz
    python3 cli/scripts/build_cli.py --output-dir /tmp/x

产物只有一个：`cli/dist/oskm-cli.pyz`。里面有三样东西：

    __main__.py        zipapp 入口（含 Python 版本守卫）
    oskm_cli/**        查询层（cli.py / database.py / query/**）
    oskm_schema/**     表结构定义（构建时 stage 一份副本）

`oskm_schema` 必须进归档：schema 契约只有 CLI 这一处（`oskm_cli/database.py`），
skill 的 `validate-db` 是转发过来的。不带它，pyz 就跑不起来。

**文件名不带版本号**，与 `knowledge.db` 同类：skill 把它装到
`<runtime-root>/oskm-cli.pyz`，文档与调用方始终不用钉版本。版本仍然在
`oskm_cli.__version__` 里，`--version` 随时可查；发布记录靠 `SHA256SUMS`。

**确定性仍然保留**：`zipapp.create_archive` 控制不了 `ZipInfo`（时间戳来自
源文件 mtime），所以这里手写 zip——固定 `date_time`、固定 `external_attr`、
固定 compresslevel、条目按名字排序。同样的源码 → 同样的字节 → 同样的 sha256，
`SHA256SUMS` 才有意义，"装的是不是刚构建的那份"才可查。

> 曾经有两条现已删掉的机制：npm 分发通道（`cli/npm/` + `bin/oskm-cli.js`）
> 与 `cli_pin.json` 版本锁。前者 2026-11-12 删，因为 pyz 自己就能直接执行；
> 后者同日删，因为 CLI 与 DB 同类——**不记版本**，装到固定名字，
> 由 `bootstrap.py cli-path` 报告实际用了哪一个。
"""
from __future__ import annotations

import argparse
import hashlib
import io
import json
import re
import sys
import zipfile
from pathlib import Path


CLI_ROOT = Path(__file__).resolve().parents[1]
PACKAGE = CLI_ROOT / 'oskm_cli'
OSKM_ROOT = CLI_ROOT.parent
SCHEMA = OSKM_ROOT / 'oskm_schema'
# 产物落在 cli/ 内部：这个目录就是产物①的全部，构建输出也不例外。
DEFAULT_OUTPUT = CLI_ROOT / 'dist'

# 固定名，不带版本（与 knowledge.db 同类）。
ARTIFACT_NAME = 'oskm-cli.pyz'
SHEBANG = b'#!/usr/bin/env python3\n'
# 这个字符串是 pyz 的根 `__main__.py`。版本守卫必须写在**任何 oskm 导入之前**，
# 而且只能用 3.9 也认的语法——否则在旧解释器上炸出来的是 `oskm_schema/base.py`
# 里 `str | None` 的 TypeError，而真正的原因是"这台机器的 python3 太老"。
# 实测：本机 `python3` 是 3.9.14，直接 `./oskm-cli.pyz` 会走到那条路上。
MAIN_SOURCE = """\"\"\"zipapp 入口：`python3 oskm-cli.pyz …`。\"\"\"
import sys

if sys.version_info < (3, 10):
    print('oskm-cli 需要 Python 3.10+，当前是 {}.{}.{}'.format(*sys.version_info[:3]),
          file=sys.stderr)
    print('请用 python3.12 oskm-cli.pyz …，'
          '或先跑 skill 的 `python3 bootstrap.py doctor` 看环境。',
          file=sys.stderr)
    raise SystemExit(2)

from oskm_cli.cli import main

if __name__ == '__main__':
    raise SystemExit(main())
"""
# 固定成 1980-01-01：zip 的时间戳粒度是 2 秒，再晚就带进了构建时刻。
ZIP_EPOCH = (1980, 1, 1, 0, 0, 0)
ZIP_MODE = 0o644
COMPRESSLEVEL = 9

SKIP_NAMES = {'__pycache__', '.DS_Store'}
SKIP_SUFFIXES = {'.pyc', '.pyo', '.db', '.sqlite', '.sqlite3', '.log'}
# 维护者文档不随产物发布（它们讲的是"为什么这么设计"，不是"怎么用"）。
SKIP_RELATIVE = {
    'oskm_schema/README.md',
    'oskm_schema/schema-single-source.md',
}
_VERSION_RE = re.compile(r"^__version__\s*=\s*['\"]([^'\"]+)['\"]", re.M)


def cli_version() -> str:
    """Read ``oskm_cli.__version__`` without importing the package."""
    text = (PACKAGE / '__init__.py').read_text(encoding='utf-8')
    match = _VERSION_RE.search(text)
    if not match:
        raise RuntimeError(f'{PACKAGE / "__init__.py"} 没有 __version__')
    return match.group(1)


def artifact_name(version: str | None = None) -> str:
    """The artifact filename. Version-independent by design."""
    return ARTIFACT_NAME


def _keep(relative: str) -> bool:
    parts = Path(relative).parts
    if any(part in SKIP_NAMES for part in parts):
        return False
    if Path(relative).suffix in SKIP_SUFFIXES:
        return False
    return relative not in SKIP_RELATIVE


def _entries() -> list[tuple[str, bytes]]:
    found = [('__main__.py', MAIN_SOURCE.encode('utf-8'))]
    for root, prefix in ((PACKAGE, 'oskm_cli'), (SCHEMA, 'oskm_schema')):
        if not root.is_dir():
            raise RuntimeError(f'缺少要打进去的源码目录: {root}')
        for path in sorted(root.rglob('*')):
            if not path.is_file():
                continue
            relative = f'{prefix}/{path.relative_to(root).as_posix()}'
            if _keep(relative):
                found.append((relative, path.read_bytes()))
    found.sort(key=lambda item: item[0])
    return found


def build_pyz(output: Path, version: str | None = None) -> dict:
    """Write the deterministic zipapp and return its release metadata."""
    version = version or cli_version()      # 只用于 --version 报告，不进文件名
    output = Path(output)
    output.parent.mkdir(parents=True, exist_ok=True)

    entries = _entries()
    buffer = io.BytesIO()
    with zipfile.ZipFile(buffer, 'w', zipfile.ZIP_DEFLATED,
                         compresslevel=COMPRESSLEVEL) as archive:
        for name, data in entries:
            info = zipfile.ZipInfo(name, date_time=ZIP_EPOCH)
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = (ZIP_MODE & 0xFFFF) << 16
            archive.writestr(info, data)
    output.write_bytes(SHEBANG + buffer.getvalue())
    output.chmod(0o755)

    return {
        'version': version,
        'archive': output.resolve(),
        'sha256': hashlib.sha256(output.read_bytes()).hexdigest(),
        'size': output.stat().st_size,
        'entries': len(entries),
    }


def write_checksums(output_dir, entries: dict[str, str]) -> Path:
    """Merge this artifact into ``<output_dir>/SHA256SUMS`` (sorted).

    合并而不是覆盖，但**不能只加不减**：旧版本的归档删掉之后，它那一行如果
    还留着，`sha256sum -c` 就会报 "No such file or directory"，看起来像构建坏了。
    所以顺手丢掉文件已经不存在的条目。
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


def build(output_dir=None) -> dict:
    output = Path(output_dir) if output_dir else DEFAULT_OUTPUT
    result = build_pyz(output / artifact_name())
    write_checksums(output, {result['archive'].name: result['sha256']})
    return result


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(
        description='Build the standalone oskm query CLI zipapp')
    parser.add_argument('--output-dir', type=Path, default=DEFAULT_OUTPUT,
                        help=f'output directory (default: {DEFAULT_OUTPUT})')
    args = parser.parse_args(argv)
    result = build(args.output_dir)
    print(f'archive: {result["archive"]}')
    print(f'version: {result["version"]}')
    print(f'entries: {result["entries"]}')
    print(f'size:    {result["size"]} bytes')
    print(f'sha256:  {result["sha256"]}')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
