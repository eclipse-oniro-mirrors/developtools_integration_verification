# AGENTS.md — oskm 工程指南

改这个工程的代码前读这份。用这个库**回答架构问题**请走 `ohos-design-architecture-evidence-query` skill
（[skills/ohos-design-architecture-evidence-query/SKILL.md](./skills/ohos-design-architecture-evidence-query/SKILL.md)），不要读这里。

## 五大组件，各自的边界

| 组件 | 是什么 | 改它要守的规矩 | 详细文档 |
|---|---|---|---|
| **① `oskm/`** | 采集流水线：框架 + 12 个采集器 | 见下「采集侧」 | [oskm/README.md](./oskm/README.md) |
| **② `oskm_schema/`** | 25 张表的唯一定义，①③④ 共用 | **所有 `Table(...)` 只能写在这里** | [oskm_schema/README.md](./oskm_schema/README.md) |
| **③ `cli/`** | 查询 CLI（独立产物）：只读封装 `knowledge.db` | **不许 import `oskm.collectors`，也不许 import `oskm_runtime`**；不联网、不写盘 | [cli/README.md](./cli/README.md) |
| **④ `skills/ohos-design-architecture-evidence-query/`** | Agent skill（独立产物）：装 DB/SDK/CLI | **不许复制 schema 契约**，`validate-db` 转发给 ③ | [skill/references/usage.md](./skills/ohos-design-architecture-evidence-query/references/usage.md) |
| **⑤ `viewer/`** | 静态站点 | 改完跑 `npm run verify` | [viewer/README.md](./viewer/README.md) |

四条边界都有门禁盯着，不是口头约定：

```bash
export OSKM_TEST_DB="$HOME/.oskm/knowledge.db"
python3.12 -m unittest discover -s cli/tests -p "test_*.py"
#   test_schema_consistency      collectors 里不许出现 `X = Table(`；
#                                SQL 里的表名必须存在于 oskm_schema
#   test_no_collector_dependency ③④ 都不许 import oskm.collectors；③ 不许 import
#                                oskm_runtime（静态 + 子进程动态双查）
#   test_every_tool_runs         每个查询工具至少被真调一次，不许 INTERNAL
#   test_docs_match_registry     文档里的「N 个工具」与逐模块表 == REGISTRY
#   test_cli_bundle              pyz 可复现、可独立运行、pin 不漂、产物落在 cli/dist

python3.12 -m unittest discover -s skills/ohos-design-architecture-evidence-query/tests -p "test_*.py"
#   test_skill / test_docs_links SKILL.md 的命令真跑、数字对真库复算、链接不悬空
#   test_bootstrap               托管命令与透传的边界（--runtime-root 不外泄等）
#   test_cli_install             CLI 五级定位、sha256 校验、版本漂移硬失败
#   test_skill_bundle            归档里**不含**查询引擎；解压 + 单独 pyz 能跑通
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

## 查询侧要点（③）

- 子命令**由 `REGISTRY` 的 JSON Schema 生成**，不手写。加一个工具 =
  注册一次，CLI 与 `--help` 自动就有
- 元数据（表名白名单、哪张表按部件归属）从库里的 `collector_tables` 读，
  **不 import 采集器**——这是 ③ 能独立发布的前提
- `arch` 只有六条，且**只编排 `ask` 已有的工具、不自带 SQL**
- 表名出现在 SQL 里时写字面量没问题，但必须真实存在于 `oskm_schema`（门禁会校）
- schema 契约（哪些表、哪些列）只在 `cli/oskm_cli/database.py` 一处
- **不联网、不写盘、不认识 `~/.oskm`**：那是 ④ 的职责

## skill 侧要点（④）

- 唯一入口是 `bootstrap.py`（自举 `sys.path`，不要求 `PYTHONPATH`、不要求 Bash）
- CLI 随 `knowledge.tar.gz` 一起发布（归档里四样东西：`knowledge.db` +
  `oskm-cli.pyz` + 两套 SDK），`install` 一次装齐
- CLI 按三级候选解析：`$OSKM_CLI` → `<runtime-root>/oskm-cli.pyz` → 源码树
- CLI 与 `knowledge.db` 同类：**固定文件名 `oskm-cli.pyz`、不记版本、不锁摘要**；
  完整性靠结构校验（`verify_pyz`：shebang + 有效 zip + 必需条目 + CRC）
- 刷新判定只做廉价检查，**不跑 `PRAGMA integrity_check`**（见
  [cli-skill-split.md §5.3](./docs/architecture/cli-skill-split.md)）
- **bootstrap 不跑查询**：`ask/arch/diff/sql` 一律直接调
  `<runtime-root>/oskm-cli.pyz`。透传删掉之后就不必手抄 CLI 的解析器知识了

## 目录结构

```
packages/oskm/
├── oskm_collect.py                 hb 构建驱动的采集入口（直接调 oskm.cli，不经分派壳）
│                                   采集侧命令行入口是 `python3 -m oskm.cli`
├── oskm/                           ① 采集
│   ├── cli.py                      扫描类子命令
│   ├── core/                       framework / runner / session / db / io / export / shape …
│   ├── collectors/<12 个域>/        collector.py + README.md + design.md + validation.md
│   └── tests/                      单元测试 + fixtures
├── oskm_schema/                    ② 表结构（base.py 原语 + 各域表 + arkts_records.py）
├── cli/                            ③ 查询 CLI（独立产物）
│   ├── oskm_cli/                   cli.py / database.py / query/（注册表、会话、SQL 校验、arkts）
│   ├── scripts/build_cli.py        → cli/dist/oskm-cli.pyz（固定名，不带版本）
│   ├── tests/
│   └── dist/                       构建输出（gitignore）
├── skills/ohos-design-architecture-evidence-query/   ④ Agent skill（独立产物）
│   ├── SKILL.md                    唯一入口与按需加载规则（Tier 1，≤150 行）
│   ├── bootstrap.py                入口；托管命令 + 透传
│   ├── oskm_runtime/               environment / db_download / cli_install /
│   │                               install / state / doctor / bootstrap
│   ├── references/                 usage / tools / 13 份字段规格
│   ├── examples/  evals/           可执行示例与验收用例
│   ├── scripts/build_skill.py      → skills/…/dist/ohos-design-architecture-evidence-query-<v>.tar.gz
│   └── tests/
├── oskm_testing/                   两个产物共用的合成库与真库辅助（都不发布）
├── viewer/                         ⑤ 可视化（前端框架 3 + sql.js）
└── docs/architecture/              跨组件的架构文档
```

## 验证命令

```bash
cd packages/oskm
export OSKM_TEST_DB="$HOME/.oskm/knowledge.db"
python3.12 -m unittest discover -s oskm/tests -p "test_*.py"            # ①②
python3.12 -m unittest discover -s cli/tests -p "test_*.py"             # ③
python3.12 -m unittest discover \
    -s skills/ohos-design-architecture-evidence-query/tests -p "test_*.py"   # ④
cd viewer && npm run verify                                            # ⑤

# 构建两个产物（互不依赖，顺序无所谓）
python3.12 cli/scripts/build_cli.py
python3.12 skills/ohos-design-architecture-evidence-query/scripts/build_skill.py
```

> 一律用 `python3.12`：本机 `python3` 可能是 3.9，而 `oskm_schema/base.py`
> 用了 `str | None`。

产品级验收需要真实 OpenHarmony 代码树（`python3 -m oskm.cli scan …` 全量跑一遍），
见 [oskm/README.md](./oskm/README.md) 末节。

## 文档索引

| 需要什么 | 看哪里 |
|---|---|
| 工程全景 / 五大组件 | [README.md](./README.md) |
| **CLI 与 skill 为什么拆、怎么拆** | [docs/architecture/cli-skill-split.md](./docs/architecture/cli-skill-split.md) |
| 框架架构 | [docs/architecture/sqlite-registry-architecture.md](./docs/architecture/sqlite-registry-architecture.md) |
| 新增采集器 | [docs/architecture/adding-a-collector.md](./docs/architecture/adding-a-collector.md) |
| ElementCollector 抽象 | [docs/architecture/element-collector-abstraction.md](./docs/architecture/element-collector-abstraction.md) |
| 统一模型与跨域关系 | [docs/architecture/unified-model.md](./docs/architecture/unified-model.md) · [cross-collector-links.md](./docs/architecture/cross-collector-links.md) |
| 加表 / 改表怎么保持两侧一致 | [oskm_schema/schema-single-source.md](./oskm_schema/schema-single-source.md) |
| 查询层为什么长这样 | [docs/architecture/query-skill-design.md](./docs/architecture/query-skill-design.md) · [standalone-packaging.md](./docs/architecture/standalone-packaging.md) |
| 查询工具字段级规格 | [skill/references/spec/](./skills/ohos-design-architecture-evidence-query/references/spec/) |
| 某域设计 / 验收 / 概览 | `oskm/collectors/<域>/design.md` · `validation.md` · `README.md` |
