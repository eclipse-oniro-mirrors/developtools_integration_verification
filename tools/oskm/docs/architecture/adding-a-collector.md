# 新增 collector 指南

日期：2026-10-17（第五版：SQLite 注册表框架。前四版描述的约定式基类 `core/collector.py`、`core/base_context.py`、`core/cli.py` 已删除——那套"可选 hook + 文档约定"被实践证伪：新增 `modules` 时整套约定都没被遵守。现在 `BaseCollector` 是 ABC，不实现 `collect()` 无法实例化，不声明 `TABLES` 无法注册。）

写给要在 `packages/oskm/oskm/collectors/` 下新增一个领域采集器的实现者。先读[SQLite 注册表架构](./sqlite-registry-architecture.md)了解为什么是这个形态。

## 0. 三个设计问题

1. **这个领域的记录身份是什么？** 快照内位置（services/hdi/sas 用 `position`）还是天然稳定键（components 用 `name`）？决定主键与 `EXPORT_ORDER`。
2. **需要 component 归属吗？** 需要 → 声明 `COMPONENT_COLUMN`，走第 4 节。
3. **需要依赖其他领域吗？** 需要 → 声明 `DEPENDS_ON`，通过 `ctx.upstream` 读表，**绝不要嵌套调用别的扫描**。

## 1. 目录结构

```
oskm/collectors/<name>/
├── __init__.py
├── collector.py    # 必需：表声明 + @register + BaseCollector 子类（第 2 节）
├── discovery.py    # 领域专属：发现与解析
├── records.py      # 可选：make_record()/raw_*() 一对互逆的纯函数（第 3 节）
├── ownership.py    # 可选：归属解析
├── linking.py      # 可选：关联其他领域
├── models.py       # 可选：<Name>Filter（Request/Limits/Result 都用共享的）
├── query.py        # 可选：内存记录上的查询（走 BaseQuery）
└── quality.py      # 可选：advisory 质量检查（第 8 节）
```

**放进这个目录即自动生效**：`framework.discover()` 用 `pkgutil` 扫描子包并导入 `<pkg>.collector`，`@register` 在导入时执行。不需要改 `core/` 或 `cli.py` 任何一行。

## 2. 表结构：写进 `oskm_schema/`，不写在采集器里

**表定义不放在 `collector.py`**（2026-10-30 起）。采集侧与查询侧共用同一份，
放在中立包里，两边都 import——这样 `cli/oskm_cli/`（查询层 + skill）能独立发布，
而且改一列两边必然同步。

```python
# oskm_schema/widgets.py
from .base import Column, Index, Table

WIDGETS = Table(
    'widgets',
    columns=(
        Column('position', 'INTEGER', nullable=False),
        Column('name'),                      # 投影列：供索引与 JOIN
        Column('component_id', 'INTEGER', references='components(id)'),  # 归属外键
        Column('record', 'JSON', nullable=False),   # 源文件里该实体的原始声明
    ),
    primary_key=('position',),
    surrogate=True,                      # 加 id 代理主键，供别的表引用
    indexes=(Index('idx_widgets_component', ('scan_id', 'component_id')),),
)

TABLES = (WIDGETS,)
```

> **别用软链把这个文件"共享"到采集器目录下。** 实测过：同一文件经两个模块名
> 加载会产生**两份 Table 实例**，而 `runner.py` 有 `if table is collector.TABLES[0]`
> 这类身份比较，跨模块恒为 `False` 且**不报错**。
> 详见 [docs/architecture/standalone-packaging.md §5](../../docs/architecture/standalone-packaging.md)。

有一条门禁盯着这件事：`cli/tests/test_schema_consistency.py`
断言 `oskm/collectors/` 下不出现 `X = Table(`。

## 3. collector.py：唯一必需的文件

```python
from ...core.framework import BaseCollector, ScanContext, register
from oskm_schema.widgets import WIDGETS


class WidgetContext(ScanContext):
    def setup(self):
        """可选 hook：解析领域专属输入根，校验失败抛 RequestError。"""
        if not self.package.is_dir():
            raise RequestError('INPUT_ROOT_MISSING')


@register
class WidgetCollector(BaseCollector):
    NAME = 'widgets'                   # 注册名、CLI 子命令、collector_runs.collector
    DESCRIPTION = 'Extract ...'
    DEPENDS_ON = ('components',)       # 拓扑排序依据
    SCHEMA_VERSION = '1.0.0'
    TABLES = (WIDGETS,)                # 驱动建表与按 scan 删除
    CONTEXT_TYPE = WidgetContext
    RESULT_FIELD = 'widgets'           # 记录集合的名字（session.records 等用）
    EXPORT_ORDER = 'position'          # 复现已发布记录顺序的 ORDER BY
    COMPONENT_COLUMN = 'component_id'    # 让它自动进入跨域导航

    def collect(self, ctx):            # 唯一的抽象方法
        ...
```

### 必须声明的类属性

| 属性 | 作用 | 缺失后果 |
| --- | --- | --- |
| `NAME` | 注册键、CLI 子命令 | `register()` 抛 `MISSING_NAME` |
| `SCHEMA_VERSION` | 写入 `collector_runs` | `register()` 抛 `MISSING_SCHEMA_VERSION` |
| `TABLES` | 生成 DDL 与按 scan 删除 | `register()` 抛 `INVALID_TABLES` |
| `collect()` | 采集实现 | **实例化即 `TypeError`**（ABC） |

### 可选但常用

| 属性/方法 | 默认 | 说明 |
| --- | --- | --- |
| `DEPENDS_ON` | `()` | 拓扑排序；框架保证依赖先跑完并已落库 |
| `CONTEXT_TYPE` | `ScanContext` | 需要领域专属根路径或 IO 时覆写 |
| `scope(ctx)` | `None` | 写入 `collector_runs.scope`，描述本次覆盖范围 |
| `export_record(row, connection, scan_id)` | 列直映射 | 存了 `record` 列就要覆写：从 `record` 重新生成发布形状，并用 `rejoin_component`/`rejoin_service` 回接外键 |
| `ISSUE_FIELDS` / `ISSUE_ORDER` | `('path','pointer','code')` | 该领域对外呈现的 issue 形状与排序 |
| `ATTRIBUTION_PREFIXES` | `()` | 哪些 issue 前缀**不**影响"清单完整性"（第 5 节） |
| `ROLE` / `COMPONENT_COLUMN` / `SERVICE_COLUMN` / `INSTALL_COLUMN` | `None` | 加入 unified model 导航（第 6 节） |
| `lookup(connection, scan_id)` | `None` | 本域给下游用的索引对象；下游经 `ctx.<role>_index()` 取，不 import 本包 |
| `add_arguments(parser)` | 空 | 声明领域专属 CLI 选项，落到 `request.options[NAME]` |
| `advisory=True` | `False` | `ctx.issue()` 的参数，标记"读到了但数据可疑"，驱动 `--fail-on`（第 8 节） |

**不需要**实现 `delete_by_scan_id`——框架从 `TABLES` 自动生成。（参考架构 SystemPulse 让每个采集器手写，sample 为删一张表写了约 70 行。）

## 4. 表设计：`record` 原始全集 + 投射列

oskm 的核心契约是"原样保留声明"，不能全关系化。**统一原则：`record` 是原始全集，部分关键字段被提取成列，只是为了更高性能的访问。**

- **`record` JSON 列** = 加载原始文件时**该实体自己的那一段声明，不多不少**。扫描器推导出来的东西（文件路径、字段拆分、分类、`label`、宿主、归属）一律不写进去。
- **投射列** = 对 `record` 的投射，不是搬运。用 `project_columns(record, FIELDS)` 生成；原值放不进列（类型不符、整数超 8 字节）时列留 `NULL`，`record` 里的值依然精确。因此列可随时增删而不损失信息。
- **`surrogate=True`** 加一个 `id` rowid 别名；跨表引用一律用它，业务键降为 UNIQUE。
- **发布记录**由 `export_record()` 从 `record` + 派生列重新生成（领域的纯函数 `make_record()`），与扫描当场产出的结果逐字节一致。

```python
# records.py：一对互逆的纯函数，是这套模式的全部实现
def make_record(cfg, raw):   # 原始声明 -> 发布形状（扫描与导出共用同一份）
    ...
def raw_service(record):     # 发布形状 -> 原始声明，emit 时用它还原 record 列
    ...
```

三条硬约束：

1. **禁止 `REAL` 列。** `Column(..., 'REAL')` 直接抛 `SchemaError`——扫描保留 JSON 数字字面量的精确值（`parse_json` 解析为 `Decimal`），IEEE-754 双精度会静默截断 `1.12345678901234567890123456789`。非整数一律留在 JSON 列。
2. **JSON 列用 `'JSON'` 声明，它映射到 TEXT 存储。** 不要改成字面量 `JSON` 列类型：SQLite 没有 JSON 类型，那样会落到 NUMERIC affinity，把文档 `3` 存成整数、`1.5` 存成 double。
3. **键缺失与值为 null 是两回事。** `emit()` 时不要传 `key=None` 表示"没有这个字段"——不传这个键才是。前者存 JSON 文本 `'null'`，后者存 SQL NULL，导出时分别重建为"字段存在且为 null"和"字段不存在"。manifest 里合法的 `"deps": null` 依赖这个区分。

## 5. collect(ctx)：可用的全部能力

```python
def collect(self, ctx):
    ctx.progress('discover', 0, total)        # 上报进度（内含取消检查）
    ctx.check()                               # 主动检查取消
    data = ctx.read_bytes(path, ctx.package)  # 有界、计数、确认在 root 内
    obj = ctx.read_json(path, ctx.package)    # 同上 + 重复键检测
    ctx.issue(abs_path, 'CODE', pointer, severity='error', component=...,
          details=..., advisory=False)      # advisory=True：见第 9 节
    ctx.emit('widgets', {...})                # 缓冲，由 runner 在一个事务里写入
```

`ctx` 还提供 `workspace` / `build` / `package` / `limits` / `inputs` / `scan_directories`。`build` 已按 `ScanRequest.product` 自动解析 `out/` 下的一层或两层布局，采集器一律使用它，不要自行拼接构建路径。
`read_bytes` 同时执行单文件上限（`limits.file_bytes`）与全扫描累计预算（`limits.total_bytes`）。

**依赖通过 `ctx.upstream` 读取，不要嵌套调用别的 `scan_*()`：**

```python
ctx.upstream.ran('components')          # 跑过且成功
ctx.upstream.failed('components')       # 跑了但失败（与"没选"不同！）
ctx.upstream.index('components', 'name')  # {name: row}
ctx.upstream.records('services')        # 上游发布的记录列表
ctx.upstream.inventory_complete('services')  # 清单完整性（第 5 节）
ctx.component_index(location=...)       # 归属索引，三态
ctx.install_index()                     # 安装索引，三态；由 install_modules 的 lookup() 提供
                                        # 不自带 issue：缺索引的代价各域不同，自己报
```

依赖有**三种状态且不可混同**：没选中（完全不做这一步）、跑了但失败（能做的部分照做并报降级）、正常。参照 `services/collector.py` 的三分支写法。

## 6. 清单完整性 vs 归属完整性

HDI/SA 需要 services 的**清单**完整（每个 cfg 都被找到并解析），但不关心每条 service 的**归属**是否解析成功。如果用整体 `status` 判断，一个 cfg 归属不到就会让 HDI 误报降级。

所以依赖方用 `ctx.upstream.inventory_complete('services')`，而被依赖方声明哪些 issue 属于"富化"而非"发现"：

```python
class ServicesCollector(BaseCollector):
    ATTRIBUTION_PREFIXES = ('MODULE_', 'ORIGIN_', 'COMPONENT_', 'BUNDLE_')
```

## 7. 加入 unified model 导航

声明三个属性即可，导航层不需要任何修改：

```python
ROLE = 'component'              # 该领域是 component 提供方（唯一）
ROLE = 'service'                # 该领域是 service 提供方（唯一）
COMPONENT_COLUMN = 'component_id'     # 归属外键列（指向 components.id）
SERVICE_COLUMN = 'service_id'         # 宿主外键列（指向 services.id）
```

声明后自动获得：`session.component(x).attached()` 里出现本领域、`session.service(...).hosted()` 里出现本领域、以及 `entity.component()` / `entity.service()` 反向导航。

## 8. 归属：只存外键

```python
from ...core.ownership import resolve_component

identifier = resolve_component(ctx, location, pointer, candidate, index)  # 返回 components.id；不在索引里则报 COMPONENT_NOT_REGISTERED
if identifier is not None:
    record['component_id'] = identifier
```

**不要**把 `{name, subsystem, manifest}` 内嵌进记录——那是旧形状。库里只存 `component_id` 外键，嵌套对象由 `export_record()` JOIN `components` 表重建。单领域重扫（`--reuse-upstream`）时内嵌副本会过期，外键不会；而且数据库会直接拒绝悬空引用。

两条建表硬约束（见 `core/schema.py` 顶部注释）：**禁止 `REAL` 列**（声明即 `SchemaError`），**JSON 列必须用 `'JSON'` 类型声明**（它映射到 TEXT 存储）。不要把它"修正"成字面量 `JSON` 列类型——SQLite 无 JSON 类型，那样会得到 NUMERIC affinity 并把裸数字文档转成数字。

## 9. 质量模型：一张表，两种问题

**只有一套质量模型**：采集器发现的一切都是 `issues` 行。两种问题用 `advisory` 标志区分，不是两套机制：

| | `ctx.issue(...)` | `ctx.issue(..., advisory=True)` |
| --- | --- | --- |
| 回答的问题 | **扫描**有没有读全、读懂 | 读全读懂了，但**数据**本身可疑 |
| 典型例子 | cfg 读不动、JSON 重复键、归属解析不出来 | `importance` 超出 `-20..19`、两个 profile 抢同一个 SA id、deps 指向本产品不存在的部件、syscap 重复声明 |
| 是否让快照 `degraded` | 是（severity 非 info 时） | **否** |
| 是否影响 `inventory_complete()` | 是 | **否** |
| `--fail-on` | 不计入（已由 `status`/退出码 4 表达） | 按 severity 计入，退出码 5 |
| 存在哪 | `issues` 表 | 同一张 `issues` 表，`advisory = 1` |

两者都带 `path` + `pointer` + `details`，都持久化、都进发布文档（`advisory` 为真时才出现在文档里），消费者直接 `WHERE advisory = 0/1` 就能分开。

**什么时候报：** 能在读的当下定位到 `path`+`pointer` 的就地报；必须等全集才能下的判断（重名、跨记录引用）放到 `collect()` 末尾统一报——但依然带上那条记录自己的 `path`+`pointer`，**不要退化成只有数组下标**。

```python
# collectors/<name>/quality.py —— 纯检查逻辑，和发现/解析分开
def check(ctx, records):
    counts = Counter(r['name'] for r in records)
    for record in records:
        if counts[record['name']] > 1:
            ctx.issue(ctx.package / record['source'], 'WIDGET_NAME_DUPLICATE',
                      f"{record['pointer']}/name", severity='warning',
                      advisory=True, details=dict(declarations=counts[record['name']]))
```

```python
# collector.py
from . import quality

    def collect(self, ctx):
        records = ...
        quality.check(ctx, records)     # 全集到齐之后
        for record in records:
            ctx.emit('widgets', ...)
```

`core/` 和 `cli.py` 都不需要知道领域名：`--fail-on` 只是对 `issues` 表按 `advisory = 1 AND severity IN (...)` 计数。

## 10. 验证

```
oskm list                                    # 确认已注册、依赖与拓扑序正确
oskm scan --workspace-root X --product Y --only <name>
```

`oskm/tests/test_<name>.py` 至少覆盖：发现边界、依赖三状态（没选/失败/正常）、外键完整性与按 scan 删除级联、`ScanSession` 能读回记录。参照 `oskm/tests/test_session.py` 的 fixture 写法。

## 11. 文档

- 在 `collectors/<name>/` 目录下放 `README.md`、`design.md`（表结构+查询接口+issue 规则）、可选 `validation.md`
- 对齐现有采集器（如 `collectors/hdi/`）的文档结构
