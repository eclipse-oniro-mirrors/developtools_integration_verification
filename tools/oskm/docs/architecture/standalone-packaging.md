# 独立发布 skill：去掉 collector 与 viewer 的依赖

日期：2026-10-30
问题：`cli/oskm_cli/` 要能单独上架，不携带采集器与 viewer。
全部数字为实测，方法见 §10。

---

> ## ⚠️ 2026-11-12：本文的**载体结论已被取代**
>
> 本文回答的问题是"怎么让查询层不依赖采集器"，那部分分析（§2 白名单、
> §3 schema 归属、§5 软链为什么不行、§9 只读 session 内联）**全部仍然成立**，
> 也正是今天 `cli/oskm_cli/` 长成这样的原因。
>
> 被取代的是**发布载体**：本文假设 skill 归档里内联一份查询层
> （当时的 `agentic/` + `oskm_schema/`）。2026-11-12 起改成了**两个独立产物**：
> 查询层单独发布为 `oskm-cli.pyz`（`cli/dist/`），
> skill 归档只含文档与装配层；CLI 随运行时归档 `knowledge.tar.gz` 一起发布。
> §6 的"最终发布结构"与 §11 的构建/验收命令描述的是**旧载体**，
> 现行做法见 [cli-skill-split.md](./cli-skill-split.md) §3、§6。
>
> 保留本文而不是删掉，是因为"为什么 `oskm_schema` 必须是中立第三包"
> 这个结论在新载体下**更重要了**——pyz 里 stage 的就是它。

---

> **2026-10-30 已实施方案 C + D（S3 载体）。**
> `cli/oskm_cli/` 对 `oskm.collectors` 的 import **归零**，
> 常用路径闭包 **85 模块 / 9,406 行 → 12 模块 / 2,182 行，采集器 0**。
> 当时唯一例外是走实体 API 的 3 个工具（见 §3.F）；2026-11-02 已由方案 F 补齐。
> 实施记录见 §4、§5.6。
>
> **2026-11-02 方案 F 完成。** 实体 API 改走内联的只读
> `cli/oskm_cli/query/readonly_session.py`，`cli/oskm_cli/` 对 `oskm` 的全部 import 归零。
> 发布包只需 `cli/oskm_cli/` + `oskm_schema/`，不再携带 `oskm/core` 或
> `oskm/collectors/`。构建、解压和验收见 §11。

## 0. 结论

**viewer 本来就无关**（`cli/oskm_cli/` 与 `oskm/core` 里只有一行注释提到它是 `gitlink.js` 的移植来源，无任何 import）。真正的问题只有 collectors。

**而 collectors 的依赖比看上去浅得多**：查询层其实只需要采集器的**元数据**（表名、`component_column`），以及 arkts 的**查询侧代码**。今天之所以把 72 个采集器模块全拉进来，是因为 `framework.discover()` 靠 import 模块来建注册表。

| 口径 | 模块 | 行数 |
|---|---:|---:|
| 现状闭包（`discover()` 拉进 11 个采集器） | 86 | **9,751** |
| 不调 `discover()` 时的 core 闭包 | 9 | 1,937 |
| arkts **查询侧**（export/query/records/tables） | 4 | 615 |
| arkts **采集侧**（查询时一个都没加载） | 9 | — |
| `cli/oskm_cli/` 自身 | — | 3,813 |

**去掉 72 个采集器模块后，skill 包约 6,400 行**（agentic 3,813 + core ~1,900 + arkts 查询侧 615），比现在少三分之一，而且不再携带 Node 后端、napi-map.json、解析器等纯采集资产。

推荐 **方案 C + D**（元数据入库 + arkts 查询侧归位），理由见 §4。

**最终实现**在此基础上增加了方案 F：把查询层真正需要的 component / service /
install-module 读模型内联为只读 session。发布物是单根目录 `oskm/`，
包含 `SKILL.md`、`README.md`、`cli/oskm_cli/`、`oskm_schema/`，不含任何采集器。

---

## 1. `cli/oskm_cli` 对 `oskm` 的全部依赖

14 处 import，只有四种形态：

| 用途 | 位置 | 本质 |
|---|---|---|
| `framework.tables()` 取表名白名单 | `session.py`、`tools/query.py`×3、`tools/schema.py`×2 | **元数据** |
| `framework.names()` + `get(n).COMPONENT_COLUMN` / `.TABLES[0]` | `tools/component.py`×2、`tools/service.py` | **元数据** |
| `ScanSession` / `Database` / `QueryError` | `query/session.py`、`tools/arkts.py` | 真代码，core |
| `ArktsQuery` | `tools/arkts.py` | 真代码，collectors |

**前两类——也就是 9/14 处——全是元数据查询，不需要采集器的任何逻辑。**
但 `framework.discover()` 的实现是"逐个 import 采集器模块、读它们的类属性"，
所以为了拿这点元数据，整套采集器（含 Node 后端、解析器、映射表）都被拖进内存。

### 1.1 arkts 已经天然分成两半

`from oskm.collectors.arkts import ArktsQuery` 只加载四个模块：

```
加载：export.py  query.py  records.py  tables.py          615 行
未碰：backend.py collector.py discovery.py ir.py linking.py
      models.py  napi.py    projection.py quality.py
```

**查询侧和采集侧本来就是分开的**，只是住在同一个包里。
这让方案 D 变得很便宜——搬 615 行，不是拆一个纠缠的模块。

---

## 2. 两个看似可行、实测不成立的捷径

写方案前先排掉两条容易想当然的路。

### 2.1 ✗ 用 `sqlite_master` 当表名白名单

看起来等价（库自己知道有哪些表），**实测不等价**：

```
注册表 20 张 | 库里 23 张
只在库里：collector_runs、issues、scans
```

改读 `sqlite_master` 会把 `sql_query` 的白名单**放宽 3 张框架表**。
不一定有害，但这是行为变更，不能当成"无损替换"顺手做掉。

### 2.2 ✗ 从库 schema 推 `COMPONENT_COLUMN`

"凡是有 `component_id` 列的表就是挂在部件上的"——听着成立，**实测会从 5 张变成 9 张**：

```
采集器声明：elf_modules, hdis, install_modules, sas, services                （5）
从库推导  ：+ gn_args, innerapis, syscaps, features                          （9）
```

多出来的四张是采集器的**次表**，不是 `TABLES[0]`。
`component_attached` 会凭空多报四类记录。

**这条区分（"哪张是这个采集器的主表"）是采集器知道、库不知道的信息**，
所以元数据必须显式传递——要么静态清单，要么写进库（方案 C）。

---

## 3. 四个方案

### A. 原样打包：skill 带上整个 `packages/oskm`

| | |
|---|---|
| 改动 | 0 |
| 包体 | 9,751 行闭包 + Node 后端 + napi-map.json（约 1 MB 级） |
| 问题 | 上架一个"查询 skill"却带着整套扫描器，使用者装完会问"这些 collector 要我干嘛" |

**作为过渡可以，作为发布形态不合适。**

### B. 元数据静态化：把 framework 的两处用途换成包内常量

在 `cli/oskm_cli/query/` 里放一份 `catalog.py`：

```python
# 由 oskm 侧生成，不手写
TABLES = ('components', 'repos', 'install_modules', …)          # 20 张
COMPONENT_TABLES = {'elf_modules': 'component_id', 'hdis': …}   # 5 张
```

| | |
|---|---|
| 改动 | 替换 9 处 import；加一个生成脚本 + 一致性门禁 |
| 收益 | collectors 完全不进闭包 |
| 代价 | **多一处会漂的副本**——这正是这个仓反复踩过的坑（工具数漂过四次） |
| 缓解 | 生成 + 门禁（和 skill `references/tools.md` 同一套做法，已验证可行） |

可行，但它把"采集器加了张表"变成"记得重新生成 catalog"。

### C. 元数据入库：扫描时写一张 `collector_tables` 表 ★

```sql
CREATE TABLE collector_tables (
    scan_id INTEGER, collector TEXT, table_name TEXT,
    is_primary INTEGER, component_column TEXT, schema_version TEXT);
```

查询层改读这张表，**对 Python 侧的 collectors 零依赖**。

| | |
|---|---|
| 改动 | 采集框架加一处写入（约 20 行）；查询层替换 9 处 import |
| 收益 | 元数据与数据同源同快照，**结构上不可能漂** |
| 额外好处 | 打开一个旧库时能知道"它是用哪版采集器扫的、有哪些表"，这是现在缺的 |
| 代价 | 旧库没有这张表 → 需要降级路径（缺表时回退到包内常量或报 `CAPABILITY_UNAVAILABLE`） |

**这是唯一从结构上消除漂移的方案**，而且顺手解决了"查询层打开陌生库"的问题。

### D. arkts 查询侧归位：615 行搬进 `cli/oskm_cli/query/arkts/` ★

`ArktsQuery` 是**查询代码**，住在采集器包里本来就错位——
它和 `query/tools/arkts.py` 的关系，比和 `collectors/arkts/projection.py` 的关系近得多。

| | |
|---|---|
| 改动 | 搬 4 个文件（export/query/records/tables）+ 改 import |
| 风险 | `tables.py` 是**采集与查询共用**的 schema 定义——搬走后采集侧要反向 import，方向就倒了 |
| 解法 | `tables.py` 留在采集器侧，或两边都从一个中立位置（`oskm/schemas/arkts.py`）引用 |

**`tables.py` 的归属是这个方案唯一需要想清楚的点**，不是搬文件本身。

### E. 拆成三个发行包

`oskm-core`（schema/session/db）+ `oskm-collectors` + `oskm`（skill 包）。

标准做法，但本仓目前是单目录、零依赖、靠 `sys.path` 跑的形态，
引入打包体系（pyproject / 版本约束 / 发布流程）是另一个量级的工程。
**除非真的要上 PyPI，否则不划算。**

---

### F. 绕开 `export_record`：三个工具直接读 `record` 列

`get_component` / `get_install_module` / `owner_of` 走 `ScanSession` 的实体 API，
`Entity.__init__` 每次都调 `collector.export_record()`——那是每个采集器
按自己的 `SHAPE` 重放 `record` 列的代码，**元数据替不了**，所以方案 C 之后
这三个工具仍会拉满 72 个模块。

设想是让它们直接读 `record` 列 + 行上的列，不经实体 API。
**但实测表明没那么简单**：

```
components: 发布版比原始 record 多 ['manifest', 'repo_id']
            —— 两个都是行上的列，合并即可
services:   发布版多 ['args','cfg','component','config','executable','label','type']
            —— 其中 component / config / label 不是列
```

那三个是 `export_record` 现算的：`core/export.py::rejoin_service` 拿外键
回查 services 表，**按当前数据刷新宿主引用**（防止单独重跑一个采集器时
发布出过期副本）。查询层照抄这段逻辑，等于把采集器代码复制一份——
正是要避免的事。

> 本文初稿只验了 components 就下了"绕得过去"的结论，**那是错的**。
> 逐个采集器比对之后才发现 services 这条不成立。

可能更对的方向：`rejoin_*` 本来就住在 `core/export.py`，
它依赖的只是 `by_role()` 找 provider——而 provider 现在可以从
`collector_tables` 拿。**把这几个函数改成元数据驱动**，
比在查询层重写一遍干净。需要再量一轮才能定。

## 4. 实施结果与修正

### 4.1 分析漏了一层：实体 API 需要真代码，不是元数据

本文 §1 把 14 处 import 分成"9 处元数据 + 真代码"，**漏判了一处**：
`ScanSession` 的实体 API（`component()` / `owner_of()` / `service()` …）
也靠注册表找"角色 → 主表 + 外键列"，看着也是元数据——
但 `Entity.__init__` 每次都调 `collector.export_record()`，
那是**每个采集器自己的代码**（按 `SHAPE` 重放 `record` 列），
descriptor 替不了。

一度以为绕得过去：`components.record` 原始列里已经有 `deps`，
发布版多出的 `manifest` / `repo_id` 本来就是行上的列，合并即可。
**但那只验了 components。** 把 services 也验过之后结论反了——
发布版多出的 `component` / `config` / `label` 不是列，
是 `rejoin_service` 回查外键现算的。方案与新判断见 §3.F。

### 4.2 已完成

| 动作 | 结果 |
|---|---|
| `collector_tables` 表（schema + runner 写入） | 20 行元数据：表名、是否主表、`component_column`、`service_column`、schema 版本 |
| `cli/oskm_cli/query/catalog.py` + 替换 9 处 import | 查询层的元数据全部来自库 |
| `ScanSession.__init__` 不再无条件 `discover()` | 开会话与 `sql()` **零采集器模块** |
| `SessionManager.open` 去掉 `discover()` | 46 个工具里 43 个从 72 个模块降到 **6** |
| `discover()` 记忆化 | 见下 |

**实测闭包**（开会话 + 一次 `sql_query`）：

| | 模块 | 行 | 其中 collectors |
|---|---:|---:|---:|
| 改造前 | 85 | 9,406 | 72 |
| 现在 | **15** | **2,599** | **6** |

剩下的 6 个全是 arkts 查询侧（`oskm.collectors` / `.arkts` / query / export /
records / tables），正是方案 D 要处理的。
另有 3 个工具（`get_component` / `get_install_module` / `owner_of`）
仍会拉满 72，原因见 §4.1。

### 4.3 实施中引入又修掉的一个回归

把 `discover()` 从"会话初始化一次"改成"按需"之后，
一次 `component_dependents` 会调它 **5,958 次**——
`sys.modules` 只省掉重复 import，`pkgutil.iter_modules` 每次仍扫一遍目录，
0.63 ms 一次，合计 3.7 秒。那条查询从 **1.15 s 变成 5.23 s**，
是 skill 门禁的 5 秒阈值先报出来的。

加了默认路径的记忆化后回到 **1.23 s**，并补了两条测试
（重复调用不再扫目录；显式传 package 仍然扫，测试换采集器树时要靠它），
做过反证。

**教训**：把一次性初始化改成按需时，要同时确认那个"按需"是幂等且廉价的。

## 5. 共享 schema 怎么放（对"软链"提案的评估）

提案：共用部分放 `cli/oskm_cli/` 下的独立目录，`collector` 侧加软链接保证一致。
**方向是对的——单一真相源、agentic 自带——但载体不该是软链。** 实测两个硬问题。

### 5.1 先纠正一个前提：共享问题只有 arkts 一家

| 采集器 | 表定义在哪 | 查询侧在哪 |
|---|---|---|
| **arkts** | 单独的 `tables.py`（137 行） | **在采集器包里**（query/records/export，615 行） |
| 其余 10 个 | 都写在各自 `collector.py` 里 | 不在——agentic 走 `session.sql()` + `catalog` |

`cli/oskm_cli/` 对 `oskm.collectors` 的 import **只有一处**：`tools/arkts.py` 的 `ArktsQuery`。
所以要建的不是一个通用共享层，**是给 arkts 一家解决问题**。
别为十个不存在的用户设计目录结构。

### 5.2 `tables.py` 内部没有可拆的缝

四个使用方要的是同一批东西：

```
query.py     → TABLES, MODULES, KITS, SOURCES, RELATIONS
records.py   → TABLES
export.py    → TABLES
collector.py → TABLES            ← 唯一的采集侧
```

没有"采集专用"的表、也没有"查询专用"的列。
**真正的缝不在 `tables.py` 内部，而在 arkts 包的查询侧与采集侧之间**，
而那条缝已经存在了——`arkts/__init__.py` 只 import `query` 和 `export`，
`collector.py` / `projection.py` / `backend.py` 一个都不碰（实测）。

所以"拆 tables.py"落不了地；该拆的是**把 schema 提到两边都够得着的位置**。

### 5.3 软链的两个硬问题（实测）

**问题一：相对 import 跟着目录深度走，软链过去就断。**

`tables.py` 第一行是 `from ...core.schema import Column, Index, Table`——
三级相对，解析成 `oskm.core.schema`。软链到 `cli/oskm_cli/schema/` 下深度变了，
直接 `ImportError: attempted relative import beyond top-level package`。

改成绝对 import `from oskm.core.schema import ...` 能跑，
但那等于把 `oskm` 依赖焊死在共享文件里——**agentic 独立发布时带不走**，
正好和目标相反。

**问题二：同一文件两个模块名 = 两份 Table 实例，而代码里有身份比较。**

Python 按**模块名**缓存，不按文件路径。软链让同一份代码以
`oskm.collectors.arkts.tables` 和 `agentic.schema.arkts.tables` 两个名字各加载一次
（当时的查询层包名；今天是 `cli/oskm_cli/`）：

```
模块对象相同          False
Table 实例相同        False
名字与列数一致        True        ← 看起来没事
```

而代码里确实有身份比较：

```
oskm/collectors/arkts/query.py:85    if table is KITS and rows:
oskm/collectors/arkts/query.py:98    if table is MODULES and rows:
oskm/core/runner.py:83               if table is collector.TABLES[0]:
```

跨模块比较恒为 `False`：

```
B.arkts_kits is A.KITS  →  False
```

**不报错，分支静默失效。** `_page()` 里 KITS / MODULES 的特殊处理会被跳过，
查询照常返回、只是少了该补的字段。这类 bug 最难查。

**问题三（次要）**：本仓 git 里目前**零个** `120000` 条目，软链是新先例；
Windows 检出要 `core.symlinks=true`。

### 5.4 四个替代载体

| | 做法 | 真相源 | 双实例风险 | agentic 可独立 | 代价 |
|---|---|---|---|---|---|
| **S1 软链**（提案） | collector 侧软链到 agentic | 一份 | **有**（§5.3） | 否（相对 import 断） | 不可行 |
| **S2 依赖倒置** | schema 放 agentic，collector `from agentic.schema...` | 一份 | 无 | 是 | 扫描器依赖 skill 包，方向别扭 |
| **S3 中立第三包** ★ | 新建 `oskm_schema/`，两边都依赖它 | 一份 | 无 | 是（带上它） | 多一个顶层包 |
| **S4 构建期复制** | 发布时把文件拷进 agentic + 一致性门禁 | 一份源两份物 | 无（不同时加载） | 是 | 多一步构建、门禁要盯 |

**S3 的关键依据**：`oskm/core/schema.py` 是**纯叶子**——
全文只 import `re` 和 `dataclasses`，276 行，被 16 个文件依赖。
把它和 arkts 的 137 行 schema 一起放进 `oskm_schema/`（约 413 行），
两边都 `from oskm_schema...` 导入，**一个模块名、一份实例、无倒置**。
skill 发布时把这 413 行一并打包即可。

S4 也可行，而且不动现有结构——但"一份源两份物"要靠门禁保证，
而这个仓的经验是**结构上不可能漂 > 靠门禁盯着不漂**（工具数漂过四次）。

### 5.5 建议

走 **S3**：
1. 新建 `oskm_schema/`（与 `oskm/`、`cli/oskm_cli/` 平级），放 `schema.py`（原语）。
2. arkts 的 `tables.py` 移入 `oskm_schema/arkts.py`。
3. 两边改 import；`cli/oskm_cli/query/arkts/` 收下 query/records/export 三个文件。
4. 顺手把 `query.py` 的 `table is KITS` 改成按 `table.name` 比较——
   **身份比较本来就脆**，换个载体只是让它暂时不犯。

做完之后 `cli/oskm_cli/` 的采集器 import 归零，包含 `cli/oskm_cli/` + `oskm_schema/`
即可去掉 collectors。当时仍判断需要 `oskm/core` 的 session/db；后续方案 F
用内联只读 session 消掉了这部分依赖，见 §6 与 §11。

---

### 5.6 实施结果（S3 已落地）

```
oskm_schema/                 ← 新建的中立包，不依赖 oskm 也不依赖 agentic
  base.py                    原 oskm/core/schema.py（纯叶子，只 import re/dataclasses）
  arkts.py                   原 oskm/collectors/arkts/tables.py
  arkts_records.py           原 .../records.py —— 行↔发布记录的投射，由表定义推出，
                             采集侧（collector.export_record）与查询侧都用
cli/oskm_cli/query/arkts/         ← arkts 查询侧
  query.py  export.py        原 oskm/collectors/arkts/{query,export}.py
```

改动面：16 处 `core.schema` 的 import、4 处 arkts 表 import、3 个测试文件的入口。

**顺带修掉的两处脆弱点**：

1. `query.py` 的 `if table is KITS` / `is MODULES` 与 `runner.py` 的
   `if table is collector.TABLES[0]` 全部改成按 `table.name` 比较。
   换个载体只是让身份比较暂时不犯——按名字比较对"同一 schema 被加载两次"免疫。
2. arkts 采集器把自己的源码摘要进 `input_digest`，清单里写死了 `tables.py`。
   文件搬走后摘要直接 `FileNotFoundError`（19 条测试报错）。
   改为单列 `schema_digest` 覆盖中立包的两个文件，并反证过
   **改一行 schema 摘要就变**——否则改表结构不会让游标失效。

**实测闭包**：

| 路径 | 模块 | 行 | collectors |
|---|---:|---:|---:|
| 开会话 + `sql_query` | 12 | 2,182 | **0** |
| `arch overview` | 12 | 2,182 | **0** |
| `get_arkts_module` | 12 | 2,182 | **0** |
| 实体 API：`get_component` / `get_service` / install / owner | 内联只读 session | — | **0** |

门禁 `test_no_collector_dependency.py` 同时覆盖静态 import 扫描、CLI 子进程探针，
以及基于合成 DB 的实体 API 探针。动态探针**各起一个子进程**，避免
`sys.modules` 被前一条用例污染；实体工具只要重新引入 `oskm` 就会失败。
`test_standalone_bundle.py` 还会解压真实 tar.gz，在隔离的 `PYTHONPATH` 下运行
`ask --list`、`runtime doctor` 和五个实体工具。

---

## 6. 关键步骤与最终结果

| 步 | 内容 | 之后 |
|---|---|---|
| ~~**D**~~ ✅ | arkts 查询侧归位 + 中立包 `oskm_schema` | 已完成，见 §5.6 |
| ~~**F**~~ ✅ | 内联只读 session，绕开 `export_record`（§3.F） | 实体 API 也降到 **0** |

> 原先这里把第二步编成 **E**，与 §3 的"拆成三个发行包"撞号了，已改为 **F**。

F 没有复制 `oskm/core`，而是实现了只覆盖查询需要的三个实体的
`ReadOnlyScanSession`：只读打开 SQLite、默认取最新完整 scan，并在读取时重建
component / service / install-module 的发布记录、外键 join、目录安装最长匹配。
采集侧的 `export_record()` 与 `rejoin_*()` 继续留在源码仓，发布包不需要它们。

最终发布结构（**2026-10-30 的旧载体**；2026-11-12 起 skill 归档不再内联
查询层，见文首横幅）：

```text
ohos-design-architecture-evidence-query/
  SKILL.md
  README.md
  agentic/            ← 今天已移出归档，改为独立产物 oskm-cli.pyz
  oskm_schema/        ← 今天只打进 pyz
```

包根下没有同名采集器模块 `oskm/`（即不存在 `oskm/oskm/`），也没有
`collectors/` 或查询测试——这两条在新载体下依然成立，而且有门禁盯着
（`skills/…/tests/test_skill_bundle.py`）。

## 7. 原方案：C + D，分两步

| 步 | 内容 | 之后的闭包 |
|---|---|---|
| **1** | 方案 C：元数据入库 + 查询层改读库；缺表时回退 | core 9 模块 1,937 行 + arkts 615 行，**collectors 不再进闭包** |
| **2** | 方案 D：arkts 查询侧归位，`tables.py` 的归属按 §3.D 处理 | 彻底不碰 `oskm/collectors/` |

两步做完，skill 包 = `cli/oskm_cli/` + `oskm_schema/`。
`framework.py` 与 `oskm/core` 都不在发布包中——它们的全部查询期用途分别由
`collector_tables` 元数据和内联只读 session 替代。

> **最终偏离原方案**：没有 vendored core。查询期只需要只读实体读取，
> 因此改用无副本的精简 session；这同时避免了 core 的写路径和采集器元数据发现逻辑。

---

## 8. 不建议顺手做的事

1. **不要用 `sqlite_master` 替白名单**（§2.1），那是行为变更。
2. **不要从 schema 推 `COMPONENT_COLUMN`**（§2.2），5 张会变 9 张。
3. **不要只做方案 B 就收工**——它把结构问题换成了纪律问题，而纪律在这个仓已经失守过四次。
4. **不要为了独立而把 `oskm/core` 整包复制到 agentic**；当前选择是按查询面内联只读 session。

---

## 9. core 处理决定（已实施）

当时评估了三种 core 处理方式：

| 选项 | skill 包含 | 代价 | 结果 |
|---|---|---|---|
| **依赖** | 只有 `cli/oskm_cli/` | 使用者要先装 oskm-core，不是真·独立 | 未采用 |
| **vendored** | `cli/oskm_cli/` + core 副本 | 真独立，但 core 改了要同步两份 | 未采用 |
| **瘦身后内联** | `cli/oskm_cli/` + 一个只读的精简 session | 真独立且无副本，但要重写一个只读 session | **已采用** |

`cli/oskm_cli/query/readonly_session.py` 只实现查询实际使用的三个实体和只读 SQL 接口；
写路径、collector 发现、原始采集模型都不进入发布包。

---

## 10. 测量方法

- **import 闭包**：在干净进程里记录 `sys.modules` 前后差集，只统计 `oskm.*`，
  按 `__file__` 累加行数。**不靠读 import 语句推断**——`discover()` 是运行时动态 import，
  静态看单个入口文件并不能发现它背后的模块
- **独立包验收**：构建 tar.gz 后解压到临时目录，清空源码仓影响，只把包根加入
  `PYTHONPATH`，运行 `ask --list`、`runtime doctor` 和实体工具，并断言
  `find_spec("oskm") is None`
- **白名单等价性**：`framework.tables()` 的名字集合与库里
  `sqlite_master` 的表名集合求对称差
- **`COMPONENT_COLUMN` 可推导性**：采集器声明的 `{TABLES[0].name: COMPONENT_COLUMN}`
  与"库里所有含 `component_id` 列的表"求对称差——**先量再下结论**，
  凭直觉会以为两者相同
- **viewer 相关性**：`grep -rn viewer` 扫 `cli/oskm_cli/` 与 `oskm/core/`，
  确认只有一行注释，无 import

## 11. 构建与发布验收

> 本节命令是 2026-10-30 的旧载体（单个归档内联查询层）。现行构建见
> [cli-skill-split.md](./cli-skill-split.md) §6 与 `cli/README.md`：
>
> ```bash
> cd packages/oskm
> python3.12 cli/scripts/build_cli.py
> python3.12 skills/ohos-design-architecture-evidence-query/scripts/build_skill.py
> ```
>
> 产出 `cli/dist/oskm-cli.pyz` 与
> `skills/…/dist/ohos-design-architecture-evidence-query-<v>.tar.gz`，
> 各自带一份 `SHA256SUMS`。两个产物互不依赖，顺序无所谓。

当时在源码仓构建（该模块已于 2026-11-12 删除）：

```bash
cd packages/oskm
python3.12 -m agentic.scripts.build_bundle
```

输出：

```text
packages/oskm/skills/ohos-design-architecture-evidence-query/dist/
    ohos-design-architecture-evidence-query-<version>.tar.gz
    SHA256SUMS
```

归档名、解压根目录与安装目录的叶子名统一为
`ohos-design-architecture-evidence-query`。父目录由宿主 AI 工具决定：
Claude Code 项目级为 `.claude/skills/ohos-design-architecture-evidence-query/`、
用户级为 `~/.claude/skills/ohos-design-architecture-evidence-query/`；Codex 用户级为
`${CODEX_HOME:-$HOME/.codex}/skills/ohos-design-architecture-evidence-query/`。
运行时数据仍安装到 `~/.oskm/`，不要与 skill 安装目录混用。

`tar.gz` 按路径排序写入，归档成员的 `mtime/uid/gid/uname/gname` 被归一化，gzip
头部也不使用当前时间；源码不变时重复构建得到同一 SHA-256。如需注入外部构建
时间，可设置 `SOURCE_DATE_EPOCH`。

解压后的 `doctor` 必须提示运行时使用单个 `knowledge.tar.gz`，不再需要 Git 或
SDK 分支凭据。下载配置统一从环境变量或本地 `.env` 读取：
`OSKM_DOWNLOAD_SOURCE` 选择 `OPENHARMONY_CI`（默认）或 `HARMONYOS_CI`，
`OSKM_DOWNLOAD_ENDPOINT` 提供端点。
`OPENHARMONY_CI` 的 component 固定为 `dayu600_7885_ai`。仓库只提交
`.env.example`，不能提交真实端点。归档结构与校验同时由
`skills/ohos-design-architecture-evidence-query/tests/test_skill_bundle.py` 与
`oskm_runtime/db_download.py` 强制执行，不能只检查文档文字。

隔离验收：

```bash
tmp=$(mktemp -d)
tar -xzf skills/ohos-design-architecture-evidence-query/dist/*.tar.gz -C "$tmp"
cd "$tmp/ohos-design-architecture-evidence-query"
python3 bootstrap.py doctor
python3 bootstrap.py cli-path
# 查询直接调 CLI（bootstrap 不跑查询）；这里用 $OSKM_CLI 指向源码仓的产物
OSKM_CLI=/path/to/packages/oskm/cli/dist/oskm-cli.pyz \
  python3 "$OSKM_CLI" ask --list

# 确认归档里没有同名采集器模块，也没有误带测试缓存
tar -tzf /path/to/skills/ohos-design-architecture-evidence-query/dist/*.tar.gz \
  | grep -E 'collectors|/oskm/|cli/tests|__pycache__' && exit 1 || true
shasum -a 256 /path/to/skills/ohos-design-architecture-evidence-query/dist/*.tar.gz
```

自动门禁是 `cli/tests/test_standalone_bundle.py`；它会在临时目录中构建、
检查 tar 布局与 checksum、验证同一源码重复构建字节一致、解压后再执行查询，不依赖仓库外的安装。
