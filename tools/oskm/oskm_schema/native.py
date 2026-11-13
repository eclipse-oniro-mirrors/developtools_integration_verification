"""Native SDK 头文件映射的表结构。

采集侧（`oskm/collectors/native_headers`）与查询侧（`cli/oskm_cli/`）共用这一份。
放在中立包而不是采集器包里，是为了让 `cli/oskm_cli/` 能独立发布——
理由与被否掉的软链方案见 `docs/architecture/standalone-packaging.md` §5。
"""
from .base import Column, Index, Table


NATIVE_HEADERS = Table(
    "native_headers",
    columns=(
        Column("elf_module_id", "INTEGER", nullable=False,
               references="elf_modules(id)"),
        Column("header_path", nullable=False),
        Column("match_strategy", nullable=False,
               check="match_strategy IN ('build_gn', 'header_library', 'symbol')"),
    ),
    primary_key=("elf_module_id", "header_path"),
    surrogate=True,
    indexes=(
        Index("idx_native_headers_header", ("scan_id", "header_path")),
    ),
)


TABLES = (NATIVE_HEADERS,)
