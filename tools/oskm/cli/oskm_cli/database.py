"""库的 schema 契约：**整个工程只有这一处**知道查询层要求哪些表和列。

为什么放在 CLI 里而不是 skill 里：skill 负责把库下载到位，但"这个库能不能被
当前查询层使用"是查询层自己的事。放在 skill 就会变成两份清单（历史上
`runtime.REQUIRED_COLUMNS` 与 `query/` 对 `oskm_schema` 的直接依赖就是两份），
改一张表要同时想到两处。现在 skill 的 `validate-db` 转发到这里，一处都不多。

代价：CLI 必须能 import `oskm_schema`。所以 `build_cli.py` 在打 pyz 时把它
stage 进归档（见 cli-skill-split.md §6.1）。

`schema_problem()` 会跑 `PRAGMA integrity_check`——19 MB 的库要几百毫秒。
因此它只在两处被调用：`install` 落盘前、以及显式 `validate-db`。
**每次查询前不跑**（旧实现跑，是纯浪费；见 cli-skill-split.md §5.3）。
"""
from __future__ import annotations

import importlib
import sqlite3
from pathlib import Path

from oskm_schema import FRAMEWORK_TABLES

# 与 `oskm_testing/fixture.py` 的 SCHEMA_MODULES、以及
# `cli/tests/test_schema_consistency.py::declared_tables()` 里的模块名是同一份
# 清单的三份手抄。两边都不该 import 对方（fixture 是测试专用、不随产物发布），
# 所以一致性只能靠门禁：
#   · `test_schema_covers_the_live_database`      declared_tables() vs 真库
#   · `test_required_columns_covers_the_live_database`  REQUIRED_COLUMNS vs 真库
# 少第二条的话，往 `oskm_schema/` 加一个域模块却忘了加进这里，`validate-db`
# 会**放过一个缺表的库**——而这正是本模块存在的意义。
SCHEMA_MODULES = (
    'args', 'arkts', 'components', 'elf_modules', 'hdi', 'install_modules',
    'links', 'ndk', 'repos', 'sas', 'services',
)

REQUIRED_COLUMNS = {
    table.name: {column.name for column in table.all_columns}
    for table in (
        *FRAMEWORK_TABLES,
        *(table for module_name in SCHEMA_MODULES
          for table in importlib.import_module(f'oskm_schema.{module_name}').TABLES),
    )
}


def schema_problem(db_path) -> str | None:
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


def validate_db(db_path) -> None:
    """Raise ``ValueError`` unless the database satisfies the query contract."""
    problem = schema_problem(db_path)
    if problem is None:
        return
    raise ValueError(
        'knowledge.db schema 与当前 oskm 查询层不兼容：'
        f'{problem}。已停止安装并保留现有运行时。'
        '下载物可能由旧版 oskm 生成；请等待包含当前 schema 的新成功构建后重试，'
        '或在当前源码根重新扫描生成 knowledge.db。')
