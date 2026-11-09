"""采集器元数据，从库里读，不 import 采集器。

查询层要的只有两样：表名白名单，和"哪张表按部件归属"。
原先靠 `oskm.core.framework.discover()` 拿——那会逐个 import 全部 11 个采集器，
实测 **72 个模块、9,751 行闭包**，只为读几个类属性，还把 Node 后端、
解析器、napi-map.json 一并拖进内存。

现在这些元数据由采集器在扫描时写进 `collector_tables`（见
`oskm/core/runner.py::_table_catalog`），查询层只读库。好处有两条：
对采集器的 Python 依赖降到零；元数据与数据同快照，**结构上不可能漂**。

两条走不通的捷径，别再试（实测见 docs/standalone-packaging.md §2）：

- **用 `sqlite_master` 当白名单**：注册表 20 张 ⊂ 库里 23 张，
  会把 scans / collector_runs / issues 三张框架表放进 `sql_query` 的白名单。
- **按"有没有 component_id 列"推部件表**：实测 5 张会变成 9 张——
  gn_args / innerapis / syscaps / features 都带这一列，但它们是次表。
  "哪张是主表"是采集器知道、库 schema 推不出来的。
"""
from .tools import ToolError

CATALOG = 'collector_tables'


def _rows(session):
    present = session.sql(
        "SELECT name FROM sqlite_master WHERE type='table' AND name = ?", (CATALOG,))
    if not present:
        raise ToolError(
            'SCHEMA_TOO_OLD',
            f'这个库没有 {CATALOG} 表，是旧版采集器扫的。重新扫描即可：'
            'python3 oskm.py scan --workspace-root <源码根> --product <产品>')
    return session.sql(
        f'SELECT collector, table_name, is_primary, component_column, service_column '
        f'FROM {CATALOG} WHERE scan_id = ? ORDER BY collector, table_name',
        (session.scan_id,))


def table_names(session):
    """白名单：采集器声明过的表，不含 scans / collector_runs / issues。"""
    return tuple(sorted({row['table_name'] for row in _rows(session)}))


def collectors(session):
    return tuple(sorted({row['collector'] for row in _rows(session)}))


def _primary_by(session, column):
    return {row['collector']: (row['table_name'], row[column])
            for row in _rows(session) if row['is_primary'] and row[column]}


def component_tables(session):
    """{采集器: (主表名, 部件列)}，只含按部件归属的那几个。

    rk3568 实测 5 个：elf_modules / hdis / install_modules / sas / services。
    """
    return _primary_by(session, 'component_column')


def service_tables(session):
    """{采集器: (主表名, 宿主服务列)}，用于"这个进程托管了什么"。"""
    return _primary_by(session, 'service_column')
