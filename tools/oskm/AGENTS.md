# AGENTS.md — oskm 工程指南

改这个工程的代码前读这份。用这个库**回答架构问题**请走 `oskm` skill
（[agentic/SKILL.md](./agentic/SKILL.md)），不要读这里。

## 四大组件，各自的边界

| 组件 | 是什么 | 改它要守的规矩 | 详细文档 |
|---|---|---|---|
| **① `oskm/`** | 采集流水线：框架 + 12 个采集器 | 见下「采集侧」 | [oskm/README.md](./oskm/README.md) |
| **② `oskm_schema/`** | 25 张表的唯一定义，①③ 共用 | **所有 `Table(...)` 只能写在这里** | [oskm_schema/README.md](./oskm_schema/README.md) |
| **③ `agentic/`** | 查询 CLI + skill，只读 | **不许 import `oskm.collectors`** | [agentic/docs/README.md](./agentic/docs/README.md) |
| **④ `viewer/`** | 静态站点 | 改完跑 `npm run verify` | [viewer/README.md](./viewer/README.md) |

三条边界都有门禁盯着，不是口头约定：

```bash
python3 -m unittest discover -s agentic/query/tests -p "test_*.py"
#   test_schema_consistency      collectors 里不许出现 `X = Table(`；
#                                SQL 里的表名必须存在于 oskm_schema
#   test_no_collector_dependency agentic 不许 import oskm.collectors（动态+静态双查）
#   test_every_tool_runs         每个查询工具至少被真调一次，不许 INTERNAL
#   test_skill / test_docs_*     SKILL.md 的命令真跑、数字对真库复算、文档计数一致
```

## 采集侧要点

- `BaseCollector` 是 ABC：必须实现 `collect()`，声明 `NAME` / `TABLES` / `SCHEMA_VERSION`
- `@register` 放进 `collectors/<name>/collector.py` 即自动注册，不用改 `core/` 或 CLI
- `DEPENDS_ON` 决定拓扑序；依赖**经数据库传递**，读上游用
  `ctx.upstream.rows()` / `ctx.upstream.records()`，不嵌套扫描
- **表定义写进 `oskm_schema/<域>.py`**，`collector.py` 只 import。
  不要用软链"共享"——同一文件两个模块名会产生两份 Table 实例，
  而框架里有按表判别的分支（[原因](./oskm_schema/README.md)）
- Record + 列投射：`record` 列存原始声明，列只是索引；导出时从 record 逆向重建
- `ElementCollector`：扁平数组型源文件的模板（`SHAPE` + `FIELDS` + `sources()` + `elements()`）
- 新增领域照 [新增 collector 指南](./docs/architecture/adding-a-collector.md) 走

## 查询侧要点

- 子命令**由 `REGISTRY` 的 JSON Schema 生成**，不手写。加一个工具 =
  注册一次，CLI 与 `--help` 自动就有
- 元数据（表名白名单、哪张表按部件归属）从库里的 `collector_tables` 读，
  **不 import 采集器**——这是 `agentic/` 能独立发布的前提
- `arch` 只有六条，且**只编排 `ask` 已有的工具、不自带 SQL**
- 表名出现在 SQL 里时写字面量没问题，但必须真实存在于 `oskm_schema`（门禁会校）

## 目录结构

```
tools/oskm/
├── oskm.py  oskm_collect.py        CLI 入口（scan/list/scans/drop + ask/arch/diff/sql 分派）
├── oskm/                           ① 采集
│   ├── cli.py                      扫描类子命令
│   ├── core/                       framework / runner / session / db / io / export / shape …
│   ├── collectors/<12 个域>/        collector.py + README.md + design.md + validation.md
│   └── tests/                      单元测试 + fixtures
├── oskm_schema/                    ② 表结构（base.py 原语 + 各域表 + arkts_records.py）
├── agentic/                        ③ 查询层
│   ├── SKILL.md  reference/        skill 本体与生成的工具索引
│   ├── cli.py                      ask / arch / diff / sql
│   ├── query/                      工具注册表、会话、catalog、SQL 校验、arkts 查询侧
│   └── docs/                       usage.md / spec/ / 设计记录
├── viewer/                         ④ 可视化（Vue 3 + sql.js）
└── docs/architecture/              跨组件的架构文档
lsp/                               仓库本地扩展：clangd 索引与 MCP 集成
```

## 验证命令

```bash
cd code/developtools/integration_verification/tools/oskm
python3 -m unittest discover -s oskm/tests -p "test_*.py"            # ①② 采集与表结构
python3 -m unittest discover -s agentic/query/tests -p "test_*.py"   # ③ 查询层 + 边界门禁
cd viewer && npm run verify                                          # ④
python3 oskm/tests/verify_rk3568.py --workspace-root /path/to/code   # 产品级验收
```

## 文档索引

| 需要什么 | 看哪里 |
|---|---|
| 工程全景 / 四大组件 | [README.md](./README.md) |
| 框架架构 | [docs/architecture/sqlite-registry-architecture.md](./docs/architecture/sqlite-registry-architecture.md) |
| 新增采集器 | [docs/architecture/adding-a-collector.md](./docs/architecture/adding-a-collector.md) |
| ElementCollector 抽象 | [docs/architecture/element-collector-abstraction.md](./docs/architecture/element-collector-abstraction.md) |
| 统一模型与跨域关系 | [docs/architecture/unified-model.md](./docs/architecture/unified-model.md) · [cross-collector-links.md](./docs/architecture/cross-collector-links.md) |
| 加表 / 改表怎么保持两侧一致 | [oskm_schema/schema-single-source.md](./oskm_schema/schema-single-source.md) |
| 查询层为什么长这样 | [agentic/docs/skill-design.md](./agentic/docs/skill-design.md) · [standalone-packaging.md](./agentic/docs/standalone-packaging.md) |
| 查询工具字段级规格 | [agentic/docs/spec/](./agentic/docs/spec/) |
| 某域设计 / 验收 / 概览 | `oskm/collectors/<域>/design.md` · `validation.md` · `README.md` |
