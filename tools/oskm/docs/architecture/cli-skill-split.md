# CLI 与 Skill 拆成两个独立产物

日期：2026-11-12
状态：**设计文档**，本次重构的依据。实施完成后本文即为交付记录。
基线：`main` @ `c146675d`，`agentic/query/tests` 277 项全绿（真实库 = wukong100）。

---

## 0. 一句话结论

把今天混在一起的 `agentic/` 拆成**两个能各自发布、各自版本化的产物**：

| 产物 | 是什么 | 交付形态 | 版本 |
|---|---|---|---|
| **CLI** `packages/oskm/cli/` | 只读封装 `knowledge.db` 的 Python 命令行 | `cli/dist/oskm-cli-<v>.pyz`（zipapp，自带 `oskm_schema`） | `oskm_cli.__version__ = 1.0.0` |
| **Skill** `packages/oskm/skills/ohos-design-architecture-evidence-query/` | 教 Agent 怎么用 CLI，并负责 DB / SDK / **CLI 本身**的下载安装 | `skills/…/dist/ohos-design-architecture-evidence-query-<v>.tar.gz` | `metadata.version = 3.0.0` |

**CLI 相关的文件全部在 `cli/` 内部**：源码 `oskm_cli/`、构建脚本 `scripts/`、
测试 `tests/`、构建输出 `dist/`。skill 相关的同理，全部在
`skills/ohos-design-architecture-evidence-query/` 内部（含它自己的 `dist/`）。
两个产物因此各自自洽——拿到哪一个目录，就能构建、测试、发布哪一个。

> 实施过程中先做了一版 npm 分发通道（`cli/npm/bin/oskm-cli.js` 启动器 +
> `vendor/*.pyz`，实测 `npm install` 与退出码透传都通），**随后按需求去掉了**：
> pyz 自带 shebang、本来就能直接执行，多一条通道就多一处会漂的版本号、
> 一份要维护的启动器，还要为定位它起 `npm root -g` 子进程并缓存结果。
> 它没有带来 pyz 给不了的能力。相关代码、测试与文档已一并清除，
> 只在本节与 `cli_install.py` 的模块 docstring 里留一句"曾经有过、为什么去掉"。

`agentic/` 整体删除，不留兼容 shim（已发布的 2.5.6 归档自带 `agentic/`，删源码树
不影响任何已安装用户）。

## 1. 为什么要拆

今天 `agentic/` 一个包里塞了四种性质完全不同的东西：

| 现状文件 | 性质 | 谁需要它 |
|---|---|---|
| `cli.py` + `query/**` | 只读查询 | 任何有 `knowledge.db` 的人／CI／脚本 |
| `db_download.py` `environment.py` | 网络下载与端点配置 | 只有首次安装的人 |
| `runtime.py` | 运行时状态、自动刷新、schema 校验 | 只有托管安装的人 |
| `scripts/build_bundle.py` | 打包 | 维护者 |

由此产生三个实测到的问题：

1. **想只要查询能力也得吃下整个下载器。** `cli.py:24` `from . import runtime`，
   而 `runtime.py:19` `from oskm_schema import FRAMEWORK_TABLES`、
   `runtime.py:22` `from .db_download import ...`。导入 CLI 就把 HTTP／解压／状态机
   全拉进来。`test_no_collector_dependency.py` 里那条「导入 cli 不加载 oskm」的探针
   之所以成立，只是因为它没检查 `db_download`。
2. **每次查询都对 19 MB 库跑一遍 `PRAGMA integrity_check`。**
   `cli.open_session()` → `runtime.ensure_runtime()` → `needs_refresh()` →
   `schema_problem()`。这是纯粹的浪费：库是上一次 `install` 校验通过后才落盘的。
3. **schema 契约有两份。** `runtime.REQUIRED_COLUMNS` 从 `oskm_schema` 现算一份，
   `query/` 层又直接 import `oskm_schema.arkts*` / `oskm_schema.ndk`。改一张表要同时
   想到两处。

拆开后：CLI 是**纯函数式的只读工具**（给它一个库路径，它给答案，不联网、不写盘、
不认识 `~/.oskm`）；Skill 是**装配工**（把 CLI、DB、SDK 装到位，并教 Agent 怎么问）。

## 2. 职责边界（硬约束，有门禁）

### 2.1 CLI 做

- 定位并只读打开 `knowledge.db`（`--db` / `--product`）
- `ask`（52 个工具，子命令与参数**全部由 `REGISTRY` 的 JSON Schema 生成**）
- `arch`（**只有 6 条**：overview / trace / impact / provides / switch / runtime，
  只编排已有工具，不写新 SQL）
- `diff`（跨库或跨快照）、`sql`（受限只读 SQL）
- `validate-db PATH`：完整 schema 契约校验（`PRAGMA integrity_check` + 表 + 列）
- `--version`

### 2.2 CLI **不做**

- 不下载任何东西（DB / SDK / CLI 自己）
- 不读 `OSKM_DOWNLOAD_SOURCE` / `OSKM_DOWNLOAD_ENDPOINT` / 任何 `.env`
- 不认识 `~/.oskm`、不读写 `.oskm-runtime.json`、不自动刷新
- 不 import `oskm.collectors`（既有门禁保留）
- **不 import skill 侧任何模块**（新增门禁，见 §7.3）

### 2.3 Skill 做

- `bootstrap.py`：唯一入口，既跑托管命令也把查询命令转给 CLI
- 下载／校验／原子安装 `knowledge.db` + `interface/sdk-js` + `interface/sdk_c`
- **定位、校验、下载 CLI 产物本身**（新增能力，见 §4.3）
- 维护 `~/.oskm/.oskm-runtime.json`（升到 version 3）与刷新退避标记
- 按需刷新的廉价检查（见 §5.2 的行为变更）
- SKILL.md / references / examples / evals：Agent 的使用说明

### 2.4 Skill **不做**

- **不再自己实现 schema 校验**：`validate-db` 转发给 CLI。
  → skill 归档不再需要携带 `oskm_schema/`，schema 契约只有一处（CLI）。
- 不复制查询逻辑、不解析工具参数（一律透传 argv）
- 不要求 Git、不要求 Bash（`.sh` 包装器删除）

## 3. 目录结构

```
packages/oskm/
├── oskm_collect.py                # hb 构建驱动的采集入口（直接调 oskm.cli）
│                                  # 采集侧命令行入口 = `python3 -m oskm.cli`
│                                  # （oskm.py 分派壳已于 2026-11-12 删除，见 §14.8）
├── oskm/  oskm_schema/            # ①② 不动
│
├── cli/                           # ★ 产物 1
│   ├── README.md
│   ├── oskm_cli/
│   │   ├── __init__.py            # __version__ = '1.0.0'
│   │   ├── __main__.py            # python3 -m oskm_cli
│   │   ├── cli.py                 # ← agentic/cli.py（去掉 runtime/environment）
│   │   ├── database.py            # ← runtime.py 里的 schema_problem/validate_db/REQUIRED_COLUMNS
│   │   └── query/                 # ← agentic/query/（catalog errors gitlink jsonutil
│   │                              #    readonly_session security session arkts/ tools/）
│   ├── scripts/build_cli.py       # → cli/dist/oskm-cli-1.0.0.pyz + SHA256SUMS
│   │                              #   --update-pin 写 skill 的 cli_pin.json
│   ├── tests/                     # 查询层门禁 + pyz 载体门禁
│   └── dist/                      # 构建输出（gitignore）
│
├── skills/ohos-design-architecture-evidence-query/   # ★ 产物 2
│   ├── SKILL.md                   # metadata.version → "3.0.0"
│   ├── README.md
│   ├── bootstrap.py               # 唯一入口；自举 sys.path 后转交 oskm_runtime.bootstrap
│   ├── oskm_runtime/              # 刻意不叫裸 `runtime`（顶层名太容易撞）
│   │   ├── __init__.py
│   │   ├── __main__.py            # python3 -m oskm_runtime
│   │   ├── bootstrap.py           # 命令分派 + argv 透传 + CLI 载入
│   │   ├── environment.py         # ← agentic/environment.py（+ OSKM_CLI_ENDPOINT）
│   │   ├── db_download.py         # ← agentic/db_download.py
│   │   ├── cli_install.py         # ★新：CLI 定位／下载／sha256 校验
│   │   ├── install.py             # ← runtime.py 的安装／本地源码探测／回滚
│   │   ├── state.py               # ← runtime.py 的状态读写／刷新判定／退避
│   │   ├── cli_pin.json           # ★ build_cli.py 生成：{version, sha256}
│   │   └── .env.example           # + OSKM_CLI_ENDPOINT
│   ├── references/  examples/  evals/
│   ├── scripts/build_skill.py
│   ├── tests/
│   └── dist/                      # 构建输出（gitignore）
│
└── docs/architecture/
    ├── cli-skill-split.md         # 本文
    ├── query-skill-design.md      # ← agentic/docs/skill-design.md
    └── standalone-packaging.md    # ← agentic/docs/standalone-packaging.md（加"已被取代"横幅）
```

`agentic/docs/README.md` 的内容并入 `cli/README.md` 与 skill 的 `README.md`，
`agentic/mcp/`（空目录）、`agentic/scripts/*.sh` 一并删除。

## 4. 接口契约

### 4.1 CLI

```bash
oskm-cli [--db PATH]... [--product NAME] [--scan-id N] [--format json|table] <command>
oskm-cli ask --list [--markdown]
oskm-cli ask <tool> [--参数…]          # 52 个，由 REGISTRY 生成
oskm-cli arch <overview|trace|impact|provides|switch|runtime> [target]
oskm-cli diff --entity E [--scan-a A] [--scan-b B] [--fields F…]
oskm-cli sql (--file PATH|- | --sql TEXT) [--param P]… [--limit N]
oskm-cli validate-db PATH              # ★新：退出码 0 / 2
oskm-cli --version
```

- `prog` 从 `oskm` 改为 `oskm-cli`（`--help` 的 usage 随之变化）。
- **退出码不变**：`0` 正常 / `2` 参数错 / `3` 库打不开（含 schema 不兼容）/ `5` 工具返回 error。
- `resolve_db()` 里 `--product` 的源码树候选从 `parents[1]` 改 `parents[2]`
  （`cli.py` 比原来深一层：`cli/oskm_cli/cli.py`）。pyz 内解析不到也无害——
  后面每个候选都有 `is_file()` 守卫。
- 库不存在时的报错文案改为指向 skill：
  `python3 <skill>/bootstrap.py install --runtime-root ~/.oskm`，并明确
  「CLI 本身不下载数据」。保留 `~/.oskm/knowledge.db` 的特判分支。
- `open_session()` **不再调 `ensure_runtime()`**，也不再跑 `integrity_check`。

### 4.2 Skill `bootstrap.py`

两种命令：**托管命令**（bootstrap 自己实现）与**透传命令**（转给 CLI）。

```bash
OSKM="python3 <skill>/bootstrap.py"

# 托管
$OSKM doctor
$OSKM install --runtime-root ~/.oskm [--source S] [--date YYYYMMDD] [--skip-db|--skip-sdk]
$OSKM update-cli --runtime-root ~/.oskm        # 只补/换 CLI
$OSKM download-db --date YYYYMMDD --output PATH
$OSKM validate-db PATH                         # 转发 CLI，不在 skill 内重复 schema 知识
$OSKM cli-path [--runtime-root ~/.oskm]        # 打印解析到的 CLI 位置

# 透传（先做廉价刷新检查，再交给 CLI）
$OSKM arch overview
$OSKM ask --list
$OSKM --db /tmp/x.db sql --sql "SELECT 1"
```

- `--runtime-root` 默认 `~/.oskm`（`OSKM_RUNTIME_ROOT` 可覆盖）。
- 透传时若 argv 里既无 `--db` 也无 `--product`，自动注入
  `--db <runtime-root>/knowledge.db`。
- 透传命令在 CLI 之前先跑 `state.needs_refresh()`（廉价，见 §5.2）；
  需要刷新且刷新失败时，按既有退避策略保留旧库并警告，**不阻断查询**。
- SKILL.md 里统一写 `python3 bootstrap.py …`，Agent 读到的命令是短且能直接跑的。

### 4.3 CLI 的定位顺序（`cli_install.py`）

> ⚠️ **本节与 §5.1 / §5.2 描述的是 2026-11-12 上午的方案，同日已被 §16 取代。**
> 具体三处变化：产物改为**固定文件名 `oskm-cli.pyz`**（不带版本）、
> `cli_pin.json` 版本锁**删除**（完整性改为结构校验 `verify_pyz`）、
> 安装位置从 `<runtime-root>/cli/` 改为 `<runtime-root>/`（与 `knowledge.db` 并排）。
> 保留原文是为了留下"为什么先做了 pin、又为什么删掉"的推理链；
> **要看现行契约请读 §16.3。**

四级候选，按序尝试，全失败则报错并**列出所有尝试过的位置与原因**：

| # | 候选 | sha256 校验 | 需要网络 |
|---|---|---|---|
| 1 | `$OSKM_CLI`（`.pyz` 或源码目录） | **不校验**——显式覆盖即"我知道我在干什么" | 否 |
| 2 | `<runtime-root>/cli/oskm-cli-<pinned>.pyz` | 必须与 `cli_pin.json` 一致 | 否 |
| 3 | **源码树**：向上找 `cli/oskm_cli/__init__.py` | 版本必须 == pin，否则**硬失败** | 否 |
| 4 | `$OSKM_CLI_ENDPOINT/oskm-cli-<version>.pyz` | 下载后校验再原子装入 `<runtime-root>/cli/` | **是** |

第 3 级硬失败是有意的：源码树版本与 pin 漂移是**最难查**的一类故障——
命令能跑、结果不对、报错在几百公里外。宁可当场拒绝并提示
`python3 cli/scripts/build_cli.py --update-pin`。

`OSKM_CLI_ENDPOINT` 未配置时跳过第 4 步（不视为错误）。

四级里有三级不需要网络，所以"装好之后离线可用"是默认情形，不是特例。

载入方式：把解析到的位置插到 `sys.path` 前，`importlib.import_module('oskm_cli.cli')`，
调 `main(argv)`。**同进程**，不再起一个解释器——省掉每次查询 100–200 ms 的启动开销，
CLI 仍然是能独立 `python3 oskm-cli-1.0.0.pyz …` 或 `oskm-cli …` 运行的完整产物。
源码树模式额外把 `packages/oskm` 加进 `sys.path`（`oskm_schema` 在那里）。

> 想绕开 skill 直接用 CLI 也可以：`python3.12 cli/dist/oskm-cli-1.0.0.pyz …`
> 或直接 `./cli/dist/oskm-cli-1.0.0.pyz …`（shebang）。CLI 自己不下载任何数据，
> 所以这条路只适合已经有库的人。

## 5. 运行时布局与状态

> ⚠️ 本节的布局与状态字段已被 §16.3 更新：`cli/oskm-cli-<版本>.pyz` →
> `oskm-cli.pyz`（并排放在运行时根目录），`.oskm-refresh-retry` 已删除，
> 状态文件 `cli` 段不再记 `version`。

### 5.1 布局

```
~/.oskm/
├── knowledge.db
├── interface/{sdk-js,sdk_c}/
├── cli/oskm-cli-1.0.0.pyz          # ★新增
├── .env                            # 可选，真实配置
├── .oskm-runtime.json              # version 3
└── .oskm-refresh-retry             # 刷新失败退避标记
```

`.env` 查找顺序：真实环境变量 > `~/.oskm/.env` > `<skill>/oskm_runtime/.env`。
真实 `.env` 绝不提交（root `.gitignore` 已覆盖）。

### 5.2 状态文件 version 3

```json
{
  "version": 3,
  "source": "OPENHARMONY_CI",
  "date": "20261112",
  "updated_at": "2026-11-12T10:00:00+08:00",
  "db":  {"date": "20261112", "path": "knowledge.db", "sha256": "…"},
  "sdk": {"date": "20261112", "sdk-js": {"path": "interface/sdk-js"}, "sdk_c": {"path": "interface/sdk_c"}},
  "cli": {"version": "1.0.0", "path": "cli/oskm-cli-1.0.0.pyz", "sha256": "…"}
}
```

- 必须能读 **version 2**：缺 `cli` 段 → 由 `cli_install.ensure_cli()`
  **单独补齐**（幂等，只装 CLI 那一个文件），**不触发 DB/SDK 重新下载**。
  这保证今天已装好 `~/.oskm` 的用户下一次查询会自动补齐 CLI，不用手工干预。

  > 实施时修正了本文初稿的一个设计错误：初稿写的是"缺 `cli` → 视为需要安装
  > → 触发刷新"。那会让所有 2.5.6 用户在升级后的第一次查询撞一次注定失败的
  > 全量下载（他们的 DB 和 SDK 明明都好着）。`needs_refresh()` 因此**只看
  > db / sdk / date**，CLI 的补齐是独立一步。
- `_state_source()` 的报错文案里 `python3 -m agentic.runtime install` 改成
  `python3 bootstrap.py install`。

### 5.3 行为变更：刷新检查降级为廉价检查（**故意**）

| | 现状（`agentic/runtime.py`） | 拆分后 |
|---|---|---|
| `install` 时 | `validate_db()`：`integrity_check` + 全表全列 | 同（改由 CLI 的 `validate-db` 执行） |
| **每次查询前** | `needs_refresh()` → `schema_problem()` → **全量 `integrity_check`**（19 MB 库） | 只做廉价检查：state 结构合法、日期是否今天、DB 文件存在、两套 SDK 目录非空、`sqlite3` 能打开且 `scans` 表可读 |
| 打开库 | `ensure_runtime` + `SessionManager.open` | CLI 只 `SessionManager.open`（自带 `isfile` 检查） |

理由：库是 `install` 校验通过后才原子落盘的，之后没有任何代码路径会改它；
每次查询再跑一遍 `integrity_check` 只是把安装期已经付过的成本按查询次数重付。
降级后仍能捕获真正会发生的故障（文件被删/被截断/被别的进程写坏到打不开）。

**影响**：`test_runtime.py` 里「当天日期但 schema 不兼容 → 需要刷新」的用例改为
廉价检查能覆盖的等价情形（截断文件、缺 `scans` 表）。完整的 schema 契约校验仍在
`install` 与显式 `validate-db` 时执行，一处都没少。

## 6. 构建与发布

**每个产物把输出写进自己目录的 `dist/`**，不共用一个顶层 `dist/`——共用就等于
在文件系统层面把两个"独立产物"又绑在一起，而且 `.gitignore` 要为它们各写一条
锚定规则，漏一条就会把二进制提交上去。

```
cli/dist/
├── oskm-cli-1.0.0.pyz                    # 可复现
└── SHA256SUMS

skills/ohos-design-architecture-evidence-query/dist/
├── ohos-design-architecture-evidence-query-3.0.0.tar.gz
└── SHA256SUMS
```

构建顺序：**CLI 先，Skill 后**（skill 归档要带 `cli_pin.json`，而它由 CLI builder 写）。

```bash
python3 cli/scripts/build_cli.py                 # → cli/dist/
python3 cli/scripts/build_cli.py --update-pin    # 并刷新 skill 的 cli_pin.json
python3 cli/scripts/build_cli.py --output-dir /tmp/x
python3 skills/ohos-design-architecture-evidence-query/scripts/build_skill.py
```

两个 builder **互不 import**：`build_skill.py` 用正则从
`cli/oskm_cli/__init__.py` 读版本号，`SHA256SUMS` 各写各的（十行重复代码换
"只拿到 skill 源码也能构建 skill"）。`SHA256SUMS` 是合并写入，但**会丢掉
文件已不存在的条目**——只加不减的话，删掉旧版本归档之后 `sha256sum -c`
会报 "No such file or directory"，看起来像构建坏了。

### 6.1 pyz 内容

`__main__.py`（shebang `#!/usr/bin/env python3`）+ `oskm_cli/**` + `oskm_schema/**`
（构建时 stage 一份副本；排除 `README.md` / `schema-single-source.md`）。

**确定性**：`zipapp.create_archive` 控制不了 `ZipInfo`，所以手写 zip ——
`date_time=(1980,1,1,0,0,0)`、固定 `external_attr`、`ZIP_DEFLATED` 固定 compresslevel、
条目名排序。同样源码重建得到同样 sha256，`cli_pin.json` 才有意义。

`__main__.py` 里有一道 **Python 版本守卫**，写在任何 oskm 导入之前：本机
`python3` 可能是 3.9（macOS Command Line Tools 就是），没有守卫时
`./oskm-cli-1.0.0.pyz` 炸出来的是 `oskm_schema/base.py` 里 `str | None` 的
`TypeError: unsupported operand type(s) for |`，完全看不出真因是解释器太老。

### 6.2 skill tar.gz 内容

含：`SKILL.md README.md bootstrap.py oskm_runtime/** references/** examples/** evals/**`
排除：`tests/ scripts/ dist/ __pycache__ .DS_Store .env *.pyc *.db *.pyz *.tar.gz`

**不再含 `agentic/` 与 `oskm_schema/`** → 归档从 116 KB 降到只剩文档 + 运行时装配代码。

> `dist` 必须在排除列表里，这是踩出来的：默认输出目录就在 skill 内部，
> 而 `stage_bundle` 复制的是**当前磁盘状态**，于是上一次的归档会被打进这一次的
> 归档——**每构建一次长一截，而且不报错**。第一次构建时它只多了一个空的
> `dist/` 目录条目，第二次就会把整个旧 tar.gz 吃进去。
> 门禁：`test_the_archive_never_contains_its_own_output_directory` +
> `test_rebuilding_into_the_same_directory_does_not_grow_the_archive`。

沿用既有确定性做法：sorted、`mtime/uid/gid/uname/gname` 归零、USTAR、
`gzip.GzipFile(filename='', mtime=epoch)`、`SOURCE_DATE_EPOCH`。

### 6.4 pin 防漂

- `cli_pin.json` = `{"version": "1.0.0", "sha256": "<真实摘要>"}`，只能由
  `build_cli.py --update-pin` 写。
- `build_skill.py` 构建前校验 `pin.version == oskm_cli.__version__` **且** sha256
  非空，不一致直接失败。
- `cli/tests/test_cli_bundle.py::PinStaysCurrent` 现场重新构建一次 pyz 并比对
  sha256——**改了 `oskm_cli/**` 却忘了 `--update-pin` 会在这里被点名**。
  实测触发过一次：改的是 `query/arkts/__init__.py` 里的一句注释，症状却是
  skill 那边报"已安装的 CLI 校验失败"，错误信息指向一个跟改动毫无关系的摘要。

## 7. 测试拆分

基线 277 项，拆分后 **CLI + Skill 两套之和 ≥ 277**。

### 7.1 `cli/tests/`

```
fixture.py testdb.py                                    # ROOT 推导改一层
test_cli test_e2e test_elf_tools test_ndk_tools
test_arkts_implementation_paths test_search_totals
test_security test_readonly_session test_every_tool_runs
test_mr380_review test_schema_consistency
test_no_collector_dependency                            # 静态扫 cli/oskm_cli/** + skills/**/oskm_runtime/**
test_docs_match_registry                                # 见 §7.4
test_cli_bundle.py                                      # ★新：pyz 构建、确定性、可运行
```

### 7.2 `skills/ohos-design-architecture-evidence-query/tests/`

```
test_runtime test_runtime_install test_environment test_db_download
test_bootstrap.py       # ★新：托管命令、透传、--db 注入、runtime-root 默认
test_cli_install.py     # ★新：四级定位顺序、sha256 校验、版本不匹配硬失败
test_skill_bundle.py    # ★新：tar.gz 内容、确定性、不含 CLI 源码
test_skill.py           # 改成经 bootstrap 跑 SKILL.md 里的命令
test_docs_links.py      # ← 从 test_docs_match_registry.py 拆出（见 §7.4）
```

### 7.3 跨产物规则

- skill 侧测试**可以**把 `packages/oskm/cli` 加进 `sys.path` 后 import `oskm_cli`
  （源树开发路径；发布的 skill 归档不含 CLI 源码，所以这只是源树测试行为）。
- CLI 侧测试**绝不** import skill 运行时 —— 由新增门禁静态检查。

### 7.4 已知怪异，顺手修

`test_docs_match_registry.py` 文件中部有一句 `if __name__ == '__main__': unittest.main()`，
其**后**才定义 `class DocumentLinksResolve`（`discover` 下仍会跑，直接执行则不会）。
迁移时拆成两个文件：计数/索引断言留在 `cli/tests/test_docs_match_registry.py`，
链接断言进 `skills/.../tests/test_docs_links.py`。

### 7.5 `test_skill.py` 的门禁不能空转

它**真跑** SKILL.md 里所有以固定前缀开头的命令行。前缀从 `python3 -m agentic `
改成 `python3 bootstrap.py ` 时，`commands()` 的判断与 `run()` 的 strip 逻辑必须同步改；
保留 `test_commands_were_found >= 10` 作为防呆（正则失效时整条断言会静默空转）。
`_ELF_SAMPLES` + `sample_elf_dest()` 这套「按文件名换成当前库真实 dest」的机制
**原样保留** —— wukong100 是 `arm64`，示例路径必须是 `system/lib64/…`。

## 8. 版本策略

| 产物 | 版本 | 理由 |
|---|---|---|
| CLI | `1.0.0` | 首个独立版本；查询接口（子命令、退出码、输出格式）相对 2.5.6 不变 |
| Skill | `3.0.0` | **breaking**：入口命令从 `python3 -m agentic` 变成 `python3 bootstrap.py`，`agentic/` 目录消失 |

## 9. 需要改的外部引用

| 文件 | 改什么 |
|---|---|
| `/AGENTS.md`（root，**< 40 行**硬门禁） | 安装命令改 `bootstrap.py`；必须仍含 ``ohos-design-architecture-evidence-query` skill``、`bootstrap.py` 与 `-m oskm.cli`；不得含 `claude mcp add`，也不得含任何已删入口（`oskm.py` / `-m agentic` / `agentic.runtime`） |
| `packages/oskm/AGENTS.md` | 目录结构、门禁命令、文档索引；**删掉悬空的 `oskm/tests/verify_rk3568.py`**（已在 `c146675d` 删除） |
| `packages/oskm/README.md` | 「四大组件」→ 五段（+CLI）；快速上手改 wukong100；验证命令改两套 tests |
| ~~`packages/oskm/oskm.py`~~ | 先改成 `from oskm_cli.cli import main`，随后**整个文件删除**（见 §14.8） |
| `oskm/tests/test_arkts.py` `verify_arkts.py` | `agentic.query.arkts` → `oskm_cli.query.arkts`（加 `cli/` 到 `sys.path`） |
| `oskm/core/runner.py` `oskm/collectors/arkts/*` `oskm_schema/*.py` | 注释与文档里的 `agentic/` 路径改成 `cli/oskm_cli/` |
| `docs/architecture/adding-a-collector.md` | 门禁路径、`standalone-packaging.md` 链接 |
| skill 的 `SKILL.md` `README.md` `references/{usage,tools,spec/schema}.md` `examples/*` `evals/*` | 所有 `python3 -m agentic` → `python3 bootstrap.py`；`agentic.runtime` → `bootstrap.py` |

`os/` `organization/` `ppt/` 里的 "agentic AI" 是无关散文，**不动**。
`oskm/collectors/*/validation.md` 里的 rk3568 历史实测数字属于采集侧历史记录，
本次**不改写**（控范围），只修悬空命令引用。

## 10. rk3568 → wukong100

用户明确要求以 wukong100 为测试基线。

- `packages/oskm/README.md`「快速上手」的 `--product rk3568` 与末尾
  「rk3568 实测：525 仓 · 382 部件 …」整段换成 wukong100 的真实数字。
- `packages/oskm/AGENTS.md` 的 `verify_rk3568.py` 命令删除（脚本已不存在）。
- SKILL.md 的分层模型已经是 wukong100 量级；示例路径统一 `system/lib64/…`
  （`scans.cpu_arch = arm64`）。
- evals 已是 wukong100 基线（`date=20261111`），保持。
- 真实库 = `~/.oskm/knowledge.db`（19,038,208 B，`product=wukong100`, `cpu_arch=arm64`）。

## 11. 验证

```bash
cd packages/oskm
export OSKM_TEST_DB="$HOME/.oskm/knowledge.db"

python3.12 -m unittest discover -s cli/tests -p "test_*.py"       # 188 项
python3.12 -m unittest discover \
    -s skills/ohos-design-architecture-evidence-query/tests -p "test_*.py"   # 205 项
python3.12 -m unittest discover -s oskm/tests -p "test_*.py"      # 300 项（25 skip：需要 Node 后端）

python3.12 cli/scripts/build_cli.py --update-pin                    # → cli/dist/
python3.12 skills/ohos-design-architecture-evidence-query/scripts/build_skill.py

CLI=cli/dist/oskm-cli-1.0.0.pyz
python3.12 $CLI --version
python3.12 $CLI ask --list
python3.12 $CLI --db "$HOME/.oskm/knowledge.db" arch overview
python3.12 $CLI validate-db "$HOME/.oskm/knowledge.db"
(cd cli/dist && shasum -a 256 -c SHA256SUMS)

# 两个产物拼起来在干净环境里跑（无源码树、无 PYTHONPATH）
tmp=$(mktemp -d) && tar -xzf skills/ohos-design-architecture-evidence-query/dist/*.tar.gz -C "$tmp"
mkdir -p "$tmp/runtime/cli" && cp "$CLI" "$tmp/runtime/cli/"
env -i PATH="$PATH" HOME="$tmp" python3.12 \
    "$tmp/ohos-design-architecture-evidence-query/bootstrap.py" \
    --runtime-root "$tmp/runtime" arch overview
```

**实施后的实测结果**：CLI 188 项 + skill 205 项 = **393 项全绿**；
基线（拆分前 `agentic/query/tests`）是 277 项。多出来的 116 项覆盖的是拆分
本身引入的新面：CLI 四级定位与 sha256 校验、pin 防漂、pyz 的确定性与可独立运行、
bootstrap 的托管命令与透传边界、skill 归档"不含查询引擎 / 不含自己的 dist"
这两条反向断言。

> 本机 `python3` 是 3.9.14，跑不了本仓（`oskm_schema/base.py` 用 `str | None`）。
> **一律用 `python3.12`。**

## 12. 实施顺序

每步跑完测试再进下一步。

1. 本文档
2. `git mv agentic/query → cli/oskm_cli/query`、`git mv agentic/cli.py → cli/oskm_cli/cli.py`；
   新建 `__init__.py`（版本）/ `__main__.py` / `database.py`；
   全仓 `agentic.query` → `oskm_cli.query`、`agentic.cli` → `oskm_cli.cli`
3. 从 CLI 剥离 runtime / download / environment；删 `ensure_runtime` 与 `load_env_file`；
   加 `validate-db` 与 `--version`
4. 建 `skills/.../oskm_runtime/` + `bootstrap.py` + `.env.example` + `cli_pin.json`
5. 拆测试到两侧；修 `testdb.py` / `fixture.py` 的路径推导
6. 拆 build 脚本：`build_cli.py`（pyz + `--update-pin`）、`build_skill.py`
7. 全量文档更新（含 rk3568 → wukong100）；`agentic/docs/*` 迁到 `docs/architecture/`；
   删 `agentic/`
8. 三套测试全绿；构建两个产物并在隔离目录验证 pyz 可独立运行
9. 版本落定：CLI `1.0.0`、Skill `3.0.0`

## 13. 风险

| 风险 | 处置 |
|---|---|
| `test_skill.py` 门禁静默空转 | 保留 `test_commands_were_found >= 10`；改前缀时同批改 `commands()` 与 `run()` |
| `test_standalone_bundle.py` 大量硬编码（`'2.5.6'`、`agentic/cli.py`、`Modules: agentic, oskm_schema (OK)`、`.env.example` 键集合、`.sh` 内容） | 拆成 `test_cli_bundle.py` + `test_skill_bundle.py` 重写，不逐行改 |
| `test_runtime*.py` patch `cli.runtime.ensure_runtime` | 解耦后该 patch 点消失；改成 patch `state.needs_refresh` / `install.install_runtime`，并新增 bootstrap 层的透传用例 |
| 廉价刷新检查是行为变更 | §5.3 显式记录理由与影响；受影响的断言改为等价情形 |
| pyz 内 `Path(__file__).resolve().parents[N]` 语义与源树不同 | `resolve_db` 每个候选都有 `is_file()` 守卫，解析失败退回 `cwd()` 候选 |
| 源码树 CLI 版本与 pin 漂移 | 定位第 3 级硬失败 + `build_skill.py` 校验 + `PinStaysCurrent` 现场重构建比对 |
| 改了 `oskm_cli/**` 忘了 `--update-pin` | `cli/tests/test_cli_bundle.py::PinStaysCurrent`（已实测触发过一次） |
| 用户机器上 `python3` 是 3.9 | pyz `__main__.py` 版本守卫（实测：不守卫时报的是 `oskm_schema/base.py` 的 TypeError） |
| skill 归档吃进自己的 `dist/` | `SKIP_NAMES` 含 `dist` + `FORBIDDEN_PARTS` 含 `dist` + 两条门禁（其中一条连构建两次比对大小） |
| `SHA256SUMS` 攒下已删除版本的条目 | `write_checksums` 丢掉文件不存在的行 + `ReleaseLayoutTests` 钉住 |

---

## 14. 实施记录（2026-11-12）

按 §12 的顺序走完，结果如下。**所有数字都是实测**，不是估算。

### 14.1 测试

| 套件 | 拆分前 | 拆分后 | 说明 |
|---|---:|---:|---|
| `agentic/query/tests` | 277 | — | 已删除，拆成下面两套 |
| `cli/tests` | — | **188** | 查询层 + CLI 载体门禁 |
| `skills/…/tests` | — | **205** | 装配层 + skill 载体门禁 |
| 合计（③+④） | 277 | **393** | 多出 116 项，全部覆盖拆分引入的新面 |
| `oskm/tests` | 300 | **300** | 25 项 skip（需要 Node + ohos-typescript 后端） |

逐文件（都是实测计数）：

| `cli/tests/` | 项 | | `skills/…/tests/` | 项 |
|---|---:|---|---|---:|
| test_security | 35 | | test_skill | 44 |
| test_e2e | 32 | | test_bootstrap ★ | 41 |
| test_cli | 24 | | test_cli_install ★ | 29 |
| test_mr380_review | 24 | | test_skill_bundle ★ | 26 |
| test_cli_bundle ★ | 17 | | test_runtime | 25 |
| test_no_collector_dependency | 11 | | test_runtime_install | 16 |
| test_elf_tools | 10 | | test_db_download | 11 |
| test_search_totals | 7 | | test_environment | 9 |
| test_ndk_tools | 6 | | test_docs_links ★ | 4 |
| test_readonly_session | 6 | | | |
| test_docs_match_registry | 5 | | | |
| test_schema_consistency | 5 | | | |
| test_arkts_implementation_paths | 3 | | | |
| test_every_tool_runs | 3 | | | |

★ = 拆分新增。共用的合成库/真库辅助在 `packages/oskm/oskm_testing/`
（`fixture.py` + `testdb.py`），两个产物都不发布它。

### 14.2 产物

| 产物 | 大小 | sha256（前 12 位） |
|---|---:|---|
| `cli/dist/oskm-cli-1.0.0.pyz` | 84,306 B（45 条目） | `e054930952c3` |
| `skills/…/dist/ohos-design-architecture-evidence-query-3.0.0.tar.gz` | 73,749 B（40 成员） | `2e7c3183e982` |

> 归档摘要会随任何一次源文件改动而变（`oskm_runtime/**` 就在归档里），
> 所以这两个值只是**本次验收的快照**，不是常量。要复核就重跑一遍构建：
> 两者都可复现，同源码两次构建字节相同。
| 对照：2.5.6 的单个归档（含 `agentic/` + `oskm_schema/`） | 116,139 B | — |

skill 归档小了 **37%**，而且这次它连查询引擎都不带了。

两个产物都验证过可复现（同源码两次构建字节相同），各自的
`shasum -a 256 -c SHA256SUMS` 都 OK。另外在**完全隔离**的环境里验证过两个产物
拼起来能用：解压 skill 归档到临时目录、把 pyz 放进 `<root>/cli/`、
`env -i`（清空环境、无源码树、无 `PYTHONPATH`）跑 `bootstrap.py doctor`
与 `arch overview`，都通过。

### 14.3 性能：廉价刷新检查的实际收益

| 操作 | 旧（每次查询前） | 新（每次查询前） |
|---|---:|---:|
| `needs_refresh()` | ~128 ms（`PRAGMA integrity_check` 全量扫 19.0 MB） | **0.3 ms** |
| `database_is_usable()` | 同上（复用 `schema_problem`） | **1.0 ms**（读 16 B 头 + 开库 + `SELECT 1 FROM scans LIMIT 1`） |

端到端：`bootstrap.py --db ~/.oskm/knowledge.db arch overview` 冷启动
**0.26 s**（含一次注定失败的刷新尝试）。

### 14.4 与设计初稿的偏差

| 初稿写的 | 实际做的 | 为什么 |
|---|---|---|
| CLI 定位**四**级 | 仍是**四**级（中途加过第 3 级 npm，又去掉） | npm 通道做完并实测通过后按需求撤掉：pyz 自带 shebang 本来就能直接执行，多一条通道就多一处会漂的版本、一份要维护的启动器，还要为定位它起 `npm root -g` 子进程并缓存。它没带来 pyz 给不了的能力。相关代码/测试/文档已全部清除，只在 §0 与 `cli_install.py` docstring 留一句"曾经有过、为什么去掉" |
| 共用一个 `packages/oskm/dist/` | **每个产物写自己目录的 `dist/`**（`cli/dist/`、`skills/…/dist/`） | 共用一个输出目录等于在文件系统层面把两个"独立产物"又绑回去，而且 `.gitignore` 要为它们各写一条锚定规则、漏一条就提交二进制。副作用是 `stage_bundle` 会看到自己的输出目录——必须显式排除 `dist`，否则归档每构建一次长一截（已实测，见 §6.2） |
| 两个 builder 合并写一份 `SHA256SUMS` | 各写各的 | 同上；顺带去掉了 `build_skill.py` 对 `build_cli.py` 的 import，两个产物连构建期都不互相依赖 |
| 缺 `cli` 段 → 触发刷新 | 缺 `cli` 段 → `ensure_cli()` 单独补齐，**不触发 DB/SDK 重下** | 初稿那样会让所有 2.5.6 用户升级后第一次查询撞一次注定失败的全量下载（他们的 DB/SDK 明明都好着）。见 §5.2 的修订说明 |
| `validate-db` 走 CLI **子进程** | 走**同进程** import（`cli_install.load_database()`） | 子进程每次多 100–200 ms 启动开销，而"契约只有一处"这个目标由 import 同样能保证；有门禁盯着 skill 侧不许出现 `REQUIRED_COLUMNS` 或 `import oskm_schema` |
| `doctor` 里下载配置缺失一律 FAIL | 运行时已完整时降为 **WARN**，退出码 0 | 一个能正常查询的只读环境被判"未就绪"，会让人去修一个没坏的东西 |
| pyz 直接可执行即可 | pyz `__main__.py` 加 **Python 版本守卫** | 本机 `python3` 是 3.9.14；没有守卫时 `./oskm-cli-1.0.0.pyz` 炸出的是 `oskm_schema/base.py` 里 `str | None` 的 TypeError，完全看不出真因是解释器太老 |

### 14.5 顺手修掉的悬空引用

- `packages/oskm/AGENTS.md` 与 `oskm/README.md`、四个采集器的 `validation.md`、
  `viewer/docs/elf-modules-view.md` 里对 **`oskm/tests/verify_rk3568.py`** 的调用
  ——该脚本已在 `c146675d` 删除。改成"跑一次全量扫描 + `ask get_scan_info` /
  `ask list_issues`"，并注明验收基线从 rk3568 换成 wukong100。
- 同上文件里 `discover -s KnowledgeBase/packages/oskm/tests` 的路径也是错的
  （真实路径是 `packages/oskm/oskm/tests`）。
- `test_docs_match_registry.py` 中部那句 `if __name__ == '__main__'` 之后还定义了
  一个测试类——拆成 `cli/tests/test_docs_match_registry.py`（计数与索引）与
  `skills/…/tests/test_docs_links.py`（链接）。

### 14.7 隔离环境端到端验收（实测）

在 `mktemp -d` 里解压 skill 归档、把 pyz 放进 `<root>/cli/`、
`env -i`（清空环境，无源码树、无 `PYTHONPATH`、无端点配置）跑：

| 命令 | 结果 |
|---|---|
| `bootstrap.py validate-db ../runtime/knowledge.db` | `{"ok": true}` |
| `bootstrap.py cli-path --runtime-root ../runtime` | 指向 `<root>/cli/oskm-cli-1.0.0.pyz`（第 2 级候选） |
| `bootstrap.py --runtime-root ../runtime arch overview` | `product=wukong100, subsystems=57, repos=527 …` |
| `bootstrap.py --runtime-root ../runtime ask --list` | 52 个工具 |
| `bootstrap.py doctor --runtime-root ../runtime` | 退出码 0；端点缺失降级为 WARN |
| `python3.12 <root>/cli/oskm-cli-1.0.0.pyz --version` | `oskm-cli 1.0.0`（完全绕开 skill） |

这一轮验出并修掉了一个真实的不一致：`validate-db PATH` 原来**不**把 `PATH`
的父目录当作运行时根，于是 CLI 装在 `R/cli/` 时，
`--runtime-root R validate-db R/knowledge.db` 能通、
`validate-db R/knowledge.db` 却报"找不到可用的 oskm-cli 产物"。
现在 `resolve_root()` 把 `--db PATH` 与 `validate-db PATH` 同等对待
（`bootstrap.py::_validate_db_target`），并有
`test_validate_db_target_also_selects_the_runtime_root` 钉住。

### 14.6 wukong100 基线数字（本次全部实测复算）

```
527 仓 · 57 子系统 · 385 部件 · 5,936 安装模块 · 7,025 镜像落点
3,687 ELF（32,076 依赖边）· 171 服务 / 166 SA / 59 HDI
3,004 编译参数 · 1,385 特性 · 310 SysCap · 1,763 InnerAPI
50 Kit · 1,328 SDK 模块（935 个定位到实现 .so = napi 526 + arkui 409）
1,577 份声明文件 · 444 条 NDK 映射 · 21 行 collector_tables
Kit 成员配对：1,282 对（both 614 / declared_only 667 / referenced_only 1）
@kit.AbilityKit：member_routes 239 / 107 / 132 / 0；
                 entry_reference 195 条 → 107 个模块
                 declared_membership 248 条 → 239 个模块
库 19,038,208 B；scans: id=1, product=wukong100, cpu_arch=arm64,
                   status=degraded（12 个采集器），扫描耗时 33 秒
```

这些数字现在**有门禁**：`test_skill.py::SkillNumbersAreCurrent` 复算
`arch overview` 的计数与依赖闭包跳数，新增的三条复算 Kit 配对、AbilityKit 的
"引用条数 ≠ 模块数"、以及模块/声明文件两层规模。
`cpu_arch=arm64` 所以示例路径统一是 `system/lib64/…`；
`test_skill.py` 的 `sample_elf_dest()` 机制保留，换库时按文件名找真实 `dest`，
不把测试绑死在某一种架构目录上。

### 14.8 追加：删除 `oskm.py` 分派壳（2026-11-12）

拆分完成后 `packages/oskm/oskm.py` 只剩下一个职责：按子命令名把 argv 分派给
采集侧（`oskm.cli`）或查询侧（`oskm_cli.cli`）。它**已删除**。

**来历**（`git log --follow`）：

| 提交 | 日期 | 它是什么 |
|---|---|---|
| `3f4ddf51` | 2026-10-17 | 诞生。5 行薄壳 `from oskm.cli import main`，只为省掉 `-m` |
| `ffa58390` | 2026-10-30 | 变成**分派器**：查询侧出现，两个 CLI 需要在一个命令下会合 |
| `33a81673` | 2026-11-12 | 改指 `oskm_cli.cli`、`QUERY` 加 `validate-db`、加 `sys.path` 自举 |
| （本次） | 2026-11-12 | **删除** |

**为什么删**：它靠一份手抄的 `QUERY = ('ask','arch','diff','sql','validate-db')`
工作，而真源是 `oskm_cli/cli.py` 里的 `sub.add_parser(...)`。这是本仓第 4 份
手抄清单（前三份是工具数 43/43/49/49，真值 50）。漂了会怎样，实测：

```
$ python3 oskm.py --db ~/.oskm/knowledge.db <不在 QUERY 里的子命令>
usage: oskm [-h] {scan,list,scans,drop} ...
oskm: error: argument command: invalid choice: '/Users/song/.oskm/knowledge.db'
```

整条 argv 被交给**扫描侧**解析器，它把 `--db` 的取值当成了位置参数，于是报错
点名一个**路径**、说它不是合法**命令**。使用者会去查自己的 `--db` 写错了没有——
方向完全错。

**能力上没有损失**，两个替代入口都实测可用：

```bash
cd packages/oskm
python3 -m oskm.cli list                    # 采集侧（oskm/cli.py 自带 __main__）
PYTHONPATH=cli python3 -m oskm_cli --version # 查询侧（源树，不用先构建）
python3 cli/dist/oskm-cli-1.0.0.pyz --version
python3 skills/…/bootstrap.py arch overview  # 查询侧（skill 会自动定位 CLI）
```

`oskm_collect.py`（hb 构建驱动的入口）**本来就不经过它**——
`from oskm.cli import main as oskm_main` 直接调包内 main，不受影响。

**代价**（都已处理）：

| 位置 | 改法 |
|---|---|
| `cli/tests/test_cli.py::EntryPointDispatch` | 整个类删除（分派器不存在了，`_is_query` 也没有了） |
| `cli/tests/test_docs_match_registry.py::test_agents_md_points_at_the_skill` | `assertIn('oskm.py')` → `assertIn('bootstrap.py')` + `assertIn('-m oskm.cli')`；**新增** `test_agents_md_names_no_removed_entry_point` 拦住 `oskm.py` / `-m agentic` / `agentic.runtime` / `build_bundle` |
| `oskm/tests/test_arkts.py::test_entry_script_derives_paths_…` | 子进程从 `[python, <abs>/oskm.py, 'scan', …]` 改为 `[python, '-m', 'oskm.cli', 'scan', …]`，并显式给 `PYTHONPATH`（旧写法靠"脚本所在目录自动进 `sys.path[0]`"省掉了这一步） |
| `cli/oskm_cli/query/catalog.py` | `SCHEMA_TOO_OLD` 的报错文案从 `python3 oskm.py scan …` 改为 `python3 -m oskm.cli scan …（在 packages/oskm 目录下执行）` |
| 文档 ~50 处 / 12 个文件 | root `AGENTS.md`、两份 `README.md`、`cli/README.md`、`oskm/README.md`、6 份采集器 `validation.md`/`README.md`、skill `usage.md`、`docs/oskm-ppt-outline.md`、本文 §3/§9 |

采集侧文档里原本写 `python3 $PKG/oskm.py scan …`（cwd 在 OH 工程根）。
`-m` 形式要求 `packages/oskm` 在 `sys.path` 上，所以 `oskm/README.md` 改为先定义
一个壳函数，示例正文只写 `oskm scan …`：

```bash
PKG=KnowledgeBase/packages/oskm
oskm() { PYTHONPATH="$PKG" python3 -m oskm.cli "$@"; }
```

> 注意这与"删掉 `.sh` 包装器"不矛盾：那条约束针对的是 **skill 发布物**
> （Windows 上 `py -3 bootstrap.py` 必须能用）。这里是源码仓里给维护者看的
> 命令行速记，本来就通篇是 bash 语法（`$PWD`、`${PYTHONPATH:+…}`）。

### 14.9 追加：补上 `REQUIRED_COLUMNS` 对真库的门禁

写 §14.8 时顺带查出来的缺口。"schema 契约只有 CLI 一处"这句话对**契约本身**
成立（只有 `oskm_cli/database.py` 算 `REQUIRED_COLUMNS`），但**喂给它的模块名
清单被手抄了三份**：

| 位置 | 内容 | 有无门禁 |
|---|---|---|
| `cli/oskm_cli/database.py` `SCHEMA_MODULES` | 11 个域模块 | **原先没有** |
| `oskm_testing/fixture.py` `SCHEMA_MODULES` | 11 个域模块（与上面一致） | 间接（造不出库就测不过） |
| `cli/tests/test_schema_consistency.py` `declared_tables()` | 12 个（多 `base`） | `test_schema_covers_the_live_database` |

`'base'` 那个差异不是 bug：另两处另外通过 `from oskm_schema import
FRAMEWORK_TABLES` 拿到 `scans/collector_runs/collector_tables/issues`，覆盖面相同。

真正的缺口是第一条**没有门禁**：往 `oskm_schema/` 加一个域模块（比如
`permissions.py`）却忘了加进 `database.py` 的 `SCHEMA_MODULES`，
`REQUIRED_COLUMNS` 就少几张表，于是 **`validate-db` 会放过一个缺表的库**
——而这正是拆分之后"契约只有一处"的全部意义。`database.py` 里原来那句
"一致性由 `test_schema_consistency.py` 与 `validate-db` 兜住"实测兜不住这一半。

补的门禁 `test_required_columns_covers_the_live_database` 双向校：

```
真库表数         25
REQUIRED_COLUMNS 25      列总数 247
live - required  ∅
required - live  ∅
```

负控（把 `arkts*` 从 `REQUIRED_COLUMNS` 里抹掉）能准确报出缺的 5 张表
（`arkts_kit_relations` / `arkts_kits` / `arkts_links_run` / `arkts_modules` /
`arkts_sources`），所以这条断言不是空转。反向那一半同样必要：契约里出现真库
没有的表，`validate-db` 会**永远失败**。

### 14.10 测试的净增删（含删除）

拆分不是只加不减。这一轮**删了 3 条、加了 2 条**：

| 动作 | 用例 | 理由 |
|---|---|---|
| 删 | `cli/tests/test_cli.py::EntryPointDispatch` | 被测对象（`oskm.py` 的 `_is_query`）已随文件删除 |
| 删 | `skills/…/tests/test_cli_install.py::LoadFromArchiveTests::test_a_built_pyz_runs_standalone` | 与 `cli/tests/test_cli_bundle.py::PyzRunsStandalone`（6 条子进程用例）测同一件事，只是慢一遍；"已安装 pyz 能被第 2 级候选认出来"由 `test_skill_bundle.py` 端到端覆盖 |
| 删 | `skills/…/tests/test_bootstrap.py::test_cli_endpoint_is_optional_by_design` | 与 `test_cli_install.py::DownloadTests::test_no_endpoint_means_no_download_and_no_error` 是同一条断言，后者还顺带证明了"未配置端点 ≠ 错误"，留更好的那份 |
| 加 | `cli/tests/test_schema_consistency.py::test_required_columns_covers_the_live_database` | §14.9 |
| 加 | `cli/tests/test_docs_match_registry.py::test_agents_md_names_no_removed_entry_point` | §14.8：拦住 `oskm.py` / `-m agentic` / `agentic.runtime` / `build_bundle` |

另有一条**修而不删**：`test_skill_bundle.py::test_a_managed_runtime_picks_up_a_locally_installed_cli`
原来把"签入的 pin 是否最新"和"第 2 级候选能否被发现"耦在一起。后果实测过：
源码改了一个 docstring 没重跑 `--update-pin`，它就报"CLI 产物校验失败"，
把注意力从真正的病因（pin 过期）引到"归档是不是坏了"。现在它把归档里的
`cli_pin.json` 改写成现场构建那一份的摘要，只测自己该测的事；pin 是否最新
由 `PinStaysCurrent` 单独负责。

> `PinStaysCurrent` **差点被当成"失败的测试"删掉**。它失败的原因是我自己
> 5 分钟前改了 `cli.py` / `catalog.py` 却没重跑 `--update-pin`——这正是它存在
> 的理由。一条门禁只有在它第一次抓到真问题时才算被验证过。

---

## 15. 追加：测试与库内容解耦（2026-11-12）

### 15.1 起因

拆分完成后复查测试，发现一类系统性问题：**功能测试把 wukong100 的具体内容写死了**。
库一换、甚至同一个库重扫一次，测试就红，而产品一个字都没变。

最坏的一处是**反门禁**：

```python
def test_examples_track_current_database_snapshot(self):   # 名字说"跟随当前库"
    self.assertIn('runtime date=20261111', arch)
    for expected in ('528 个代码仓', '5,943 个安装模块', '7,034 个\ninstall_targets',
                     '3,694 个 ELF', ...):
        self.assertIn(expected, arch)                      # 实际只钉字面量
```

实测：真库当时已经是 `repos=527 / install_modules=5,936 / install_targets=7,025 /
elf=3,687`，文档与用例都还写着 `528 / 5,943 / 7,034 / 3,694`，**两条用例全绿**。
库变了不报警；谁把文档改对了反而红。

### 15.2 定下来的规则

| 类型 | 是否允许写死库内容 | 为什么 |
|---|---|---|
| **功能测试**（`cli/tests/`、skill 的装配层测试） | **不允许**。输入一律用 `oskm_testing.testdb.sample_*` 从库里现取；断言只校契约、跨工具自洽性、算法性质 | 它验的是"工具行为对不对"，与"这个库里恰好有哪个部件"无关 |
| **文档准确性门禁**（`test_skill.py::SkillNumbersAreCurrent`） | 允许点名文档里的实体，但**期望值必须从库算**，再断言文档写着它 | 文档过期正是它该报的错；钉常量会把"库变了"误报成"产品坏了" |
| **文档示例本身**（SKILL.md / examples / evals） | 应当写死真实实体名 | 读者要能照着抄。名字失效时门禁就该报警 |
| **冻结验收记录**（examples / evals / 采集侧 `validation.md`） | 应当钉住某一次快照 | 它们的用途就是"那一次的结果"，前提是自己声明清楚基线 |

配套的选择器在 `oskm_testing/testdb.py`：`sample_component(with_features=/with_repo=/
with_dependents=/…)`、`sample_repo`、`sample_gn_arg(with_features=)`、`sample_service`、
`sample_service_with_sa`、`sample_sa_id`、`sample_install_dest`、`sample_install_label`、
`sample_elf(with_dependencies=/with_dependents=)`、`sample_ndk_library`、
`sample_ndk_mapping`、`ndk_strategies`、`sample_arkts_kit`、`sample_arkts_module`、
`sample_names`、`count`。

三条设计约束：
- 取不到样本返回 `None`，调用方 `skipTest`——**采集是允许降级的**，某一域为空不是 bug。
- 一律 `ORDER BY … LIMIT 1` 且带稳定 tiebreak，否则同一个库两次跑取到不同样本，
  失败无法复现（实测过）。
- 全量 20 个选择器跑一遍 119 ms，不构成负担。

### 15.3 断言怎么改才不弱

解耦不等于把断言放空。几处改成**更强**的形式：

| 原来 | 现在 |
|---|---|
| `aggregate` 分组数 `>= 10`（假设大库） | 分组互不重复 **且各组之和 == `count('components')`**（能抓住漏分组） |
| `arch trace` 的 component/subsystem/repo/sdk_modules 全钉字面量 | 链条每一环都在，且 `trace` 报的部件与 `owner_of` **独立报出的一致** |
| `get_ndk_headers` 的 `component == 'audio_framework'`、`search` 的 `total == 2` | `search` 与 `get` 对同一个 dest 给出**同一个** component；过滤后的 `total` == 直接数库里的行数 |
| `git_url` 的 `'bundle.json' in url` | 键齐全、`url` 由 `ref` 构成、`repo` 真能在库里找到（合成库的 manifest 是目录不是文件，原断言直接红） |
| 依赖闭包 `== [25,175,301,394]` | 跳数**单调不减**（算法性质）+ 文档写着这四个实测值 |
| `len(collectors) == 12` | 每个采集器都带 `status`；`12` 是采集器注册表的规模，钉它反而与 SKILL.md 自己那句"degraded 数量随库、产品与采集器版本变化"矛盾 |

### 15.4 删掉的冗余

| 删除 | 理由 |
|---|---|
| `test_search_totals.py::test_examples_track_current_database_snapshot`<br>`test_search_totals.py::test_eval_tracks_current_database_snapshot` | §15.1 的反门禁。替换为 `test_examples_and_evals_declare_their_measurement_baseline`：只校"声明了 `runtime date=YYYYMMDD`"与"说明了自己是冻结记录"，与库内容无关 |
| `test_e2e.py::TestToolRegistry::test_tool_names_are_unique` | 与 `test_no_duplicate_names` 是同一条断言的两种写法（`sorted(x)==sorted(set(x))` vs `len(x)==len(set(x))`） |
| `test_ndk_tools.py::test_registry_contains_ndk_tools` | "某两个工具在 REGISTRY 里"已被 `test_every_tool_runs.py::test_every_tool_is_probed_or_explicitly_skipped`（校**全部** 52 个）覆盖 |

新增两条防空转的门禁（这类断言删多了会静默失效）：
- `test_every_tool_runs.py::test_every_present_domain_is_actually_probed`
  ——**按域**判：某张表非空，依赖它的工具就必须拿到探针参数。
  不用"探到 N 个工具"的绝对阈值，那会把"库小"误判成"选择器坏了"
  （合成库只有 35/52 个工具能探到，但它一切正常）。
  这条**上线当天就抓到一个真缺口**：`owner_of` 被错挂在 `sample_elf` 上，
  于是"有 `install_targets` 但 `elf_modules` 降级为空"的库会漏探它。
- `test_every_tool_runs.py::test_skips_all_carry_a_reason`——跳过必须写理由，
  否则"跳过"会慢慢变成"漏测"的遮羞布。

### 15.5 `oskm_testing/` 的归置：留在 `packages/oskm/` 顶层

实测使用方：**`cli/tests/` 8 个文件、`skills/…/tests/` 5 个文件、`oskm/tests/` 0 个**，
且 `fixture.py` 与 `testdb.py` **都是双边使用**。所以两个备选都不成立：

- 放进 `cli/tests/`：skill 侧就要 import **另一个产物的测试目录**。设计文档 §7.3
  只允许 skill 侧 import `oskm_cli`（运行代码），没允许它 import CLI 的测试。
- 拆成两份：`fixture.py` 一旦有两份，"什么叫 schema 完整"就会各自漂，
  而 skill 侧的 `install` / `validate-db` 用例恰恰靠它造"合法但可被改坏"的库。

它与 `oskm_schema/` 是同一类东西——**两侧共用、两侧都不发布的中立包**，
所以同层、同 `oskm_*` 命名。两边各加了一条门禁盯着"不许打进发布物"。

### 15.6 验证：换一个完全不同的库跑同一套测试

`/tmp/fixture-knowledge.db` 是 `oskm_testing.fixture.create_fixture_db` 造的合成库：
2 个部件、1 个仓、3 条 install_targets、**没有** elf_modules / ndk_headers /
arkts / sas / hdis / services 的真实内容。

| 套件 | wukong100 真库 | 合成库 |
|---|---|---|
| `cli/tests` | 189 项 OK | 189 项 **OK**（12 skip） |
| `skills/…/tests` | 205 项 OK | 205 项 **OK**（8 skip） |
| `oskm/tests` | 300 项 OK（25 skip） | 同（不依赖真库） |

拆分前这套测试在合成库上会大面积红（`ace_engine` / `image_framework` /
`foundation` / `libOpenSLES.so` / `sa_id=180` / `total == 2` 全都不存在）。
现在只有**文档示例门禁**按设计 skip——因为文档点名的是 wukong100 的实体，
换库本来就该提示"去更新示例"，而不是假装通过。

---

## 16. 追加：skill 收敛回"只负责装"，CLI 变成无版本产物（2026-11-12）

### 16.1 重新划定的 skill 职责

skill 的核心就三件事：**下载**（`knowledge.db` / `interface/sdk-js` /
`interface/sdk_c` / `oskm-cli.pyz`）、**安装**、**描述 CLI 及其用法**。
按这个口径审计了一遍 `oskm_runtime/` 的 2,211 行：

| 职责 | 实现 | 行数 | 在范围内 |
|---|---|---:|---|
| 下载 DB / SDK | `db_download.py` | 526 | ✓ |
| 下载 / 定位 CLI | `cli_install.py` | 363 | ✓ |
| 安装与回滚 | `install.py` 核心 | 196 | ✓ |
| 状态文件读写 | `state.py` 核心 | 54 | ✓ |
| 端点与 `.env` | `environment.py` | 177 | ✓ |
| 托管命令入口 | `bootstrap.py` 的 `cmd_*` + `main` | 107 | ✓ |
| CLI 及功能描述 | SKILL.md + references + examples + evals | 3,294 | ✓ |
| **查询透传 + argv 解析** | `bootstrap.run_query` 等 | **119** | ✗ 已删 |
| 源码树探测 | `install.find_local_runtime` 等 | 67 | ✓（是"安装"的另一条来源） |
| `doctor` 自检 | `doctor.py` | 154 | ✓（回答"为什么装不上"） |

### 16.2 删掉查询透传

`bootstrap.py` 不再接受 `ask/arch/diff/sql`。删除的不只是 `run_query`，
还有为它服务的一整套手写 argv 扫描：`VALUED_FLAGS`、`first_command` 的跳值逻辑、
`_db_flags`、`_has_db_selection`、`_database_for`、`resolve_root` 的 `--db` 分支。

**根因是它必须手抄 CLI 的解析器知识。** `VALUED_FLAGS = ('--db', '--product',
'--scan-id', '--format', '--runtime-root')` 的真源是 `oskm_cli.cli.build_parser()`；
漂了的后果实测过：假设 CLI 新增全局 `--profile NAME`，
`bootstrap.py --profile sql arch overview` 会把 `sql` 当成子命令路由，
CLI 收到的 argv 是错的。这与被删掉的 `oskm.py`（手抄子命令清单）是同一类病。

上一个提交给这份手抄加了门禁（`test_valued_flags_mirror_the_cli_parser`）；
**透传删掉之后那条门禁也一并删了**——不再有第二份清单可校。
`first_command` 现在退化成"第一个非 flag token"，因为 bootstrap 自己没有
全局带值 flag（只有 `--runtime-root`，已先摘掉），子命令的 flag 都写在命令名之后。

查询改成直接调 CLI，SKILL.md 里统一用两个变量：

```bash
CLI=~/.oskm/oskm-cli.pyz      # 固定文件名，不带版本
DB=~/.oskm/knowledge.db
python3 $CLI --db $DB arch overview
```

**自动刷新失去了隐式触发点**，改成显式命令 `bootstrap.py refresh`：
跑同一套廉价检查，过期才重装，不过期就什么都不做（连 CLI 都不碰）。
随之删掉 15 分钟失败退避（`.oskm-refresh-retry` 与 `retry_path` /
`refresh_retry_recent` / `record_refresh_failure` / `clear_refresh_failure`）——
那是"每条查询都可能触发下载"时代的产物；显式命令不需要退避，
失败不破坏已有运行时由 `_install_artifacts` 的回滚保证。
`install.ensure_runtime` 与 `install.state_source` 一起删除（前者没有调用方了，
后者只被它用）。

新增门禁 `test_bootstrap_has_no_knowledge_of_cli_global_flags`：断言
`VALUED_FLAGS` / `_db_flags` / `_has_db_selection` / `_database_for` / `run_query`
都不存在，且源码里没有 `'--scan-id'` / `'--format'` 字面量。

### 16.3 CLI 与 `knowledge.db` 同类：固定名、不记版本、不锁摘要

> ⚠️ **本节第 3 条（"CLI 有独立的 `$OSKM_CLI_ENDPOINT` 下载通道"）已被 §17 取代。**
> 现在 CLI 打在 `knowledge.tar.gz` 里，与 DB 一起发布、一起落盘，没有第二个端点。

| | 改之前 | 改之后 |
|---|---|---|
| 构建产物 | `cli/dist/oskm-cli-1.0.0.pyz` | `cli/dist/oskm-cli.pyz` |
| 安装位置 | `<runtime-root>/cli/oskm-cli-1.0.0.pyz` | `<runtime-root>/oskm-cli.pyz`（与 `knowledge.db` 并排） |
| 端点 URL | `$OSKM_CLI_ENDPOINT/oskm-cli-1.0.0.pyz` | `$OSKM_CLI_ENDPOINT/oskm-cli.pyz` |
| 完整性 | sha256 必须等于 `cli_pin.json` | **结构校验** `verify_pyz` |
| 版本锁 | `cli_pin.json`（version + sha256），只能由 `--update-pin` 写 | **删除** |
| 源码树版本 ≠ pin | 硬失败 | 不再检查（谁在 `<runtime-root>/` 里就用谁） |
| 状态文件 `cli` 段 | `{version, path, sha256}` | `{path, sha256}`（**出处记录**，与 `db.sha256` 同性质，不参与校验） |

`verify_pyz` 与 DB 那侧的 `verify_sqlite` 是同一思路——校"它是不是一个能用的
产物"，而不是"它是不是某一次构建的那一份"：

```
shebang（#!）  +  zipfile.is_zipfile  +  CRC 完好（testzip）
              +  含 __main__.py / oskm_cli/__init__.py / oskm_cli/cli.py
```

它挡住的正是最常见的失败形态：**端点返回 200 + 一个 HTML 错误页**。
不挡住的话，症状会变成后面某处一句看不懂的 ImportError。

删掉 pin 的代价是"开发时源码树与已装产物漂移"不再有硬失败。这与 DB 的现状
一致（`~/.oskm/knowledge.db` 一直优先于新扫的 `artifacts/`），可见性由
`bootstrap.py cli-path` 与 `doctor` 提供，显式覆盖走 `$OSKM_CLI`。
换来的收益是实测过的：pin 机制让"改一句注释"变成"skill 报 CLI 校验失败，
错误信息指向一个与改动毫无关系的摘要"——本次重构过程中踩到两次。

确定性构建**保留**（手写 zip、固定 `date_time`/`external_attr`/compresslevel、
条目排序）：`SHA256SUMS` 要有意义，"装的是不是刚构建的那份"要可查。

### 16.4 命令面

```
bootstrap.py doctor                                  检查 Python / 配置 / CLI / 运行时
bootstrap.py install  [--source S] [--date D] [--skip-db|--skip-sdk]
bootstrap.py refresh  [--source S] [--date D]        ★新：install 的幂等版
bootstrap.py update-cli [--force]
bootstrap.py download-db --date D --output PATH
bootstrap.py validate-db PATH                        转发 CLI（契约只有一处）
bootstrap.py cli-path
```

未知命令（含 `ask/arch/diff/sql`）以退出码 2 拒绝，并把该敲什么直接打在错误里：

```
错误: 未知命令 arch。bootstrap.py 只负责安装，查询请直接调 CLI：
  python3 <runtime-root>/oskm-cli.pyz --db <runtime-root>/knowledge.db <ask|arch|diff|sql> …
可用命令: doctor, install, refresh, update-cli, download-db, validate-db, cli-path
```

### 16.5 规模变化

实测行数（`wc -l`）：

| 文件 | 改之前 | 改之后 | 差 |
|---|---:|---:|---:|
| `oskm_runtime/bootstrap.py` | 351 | **293** | −58 |
| `oskm_runtime/install.py` | 396 | **329** | −67 |
| `oskm_runtime/state.py` | 201 | **177** | −24 |
| `oskm_runtime/cli_install.py` | 363 | **350** | −13 |
| `oskm_runtime/doctor.py` | 154 | 157 | +3 |
| `oskm_runtime/environment.py` | 177 | 177 | 0 |
| `oskm_runtime/db_download.py` | 526 | 526 | 0 |
| 其余（`__init__` / `__main__` / 根 `bootstrap.py`） | 54 | 66 | +12 |
| **合计** | **2,211** | **2,075** | **−136** |

净减只有 136 行，**不是**"删了多少就少多少"：删掉的是透传与退避（约 200 行），
加回来的是 `verify_pyz` / `pyz_version` / `state_entry` / `cmd_refresh` 与各处
说明为什么这么改的注释（约 65 行）。真正省下的是**一份需要与 CLI 同步的
解析器知识**，那不是行数能衡量的。

| 产物 / 测试 | 改之前 | 改之后 |
|---|---:|---:|
| skill 归档 | 40 成员 / 73,749 B | **39 成员 / 74,319 B** |
| `cli/dist/oskm-cli.pyz` | 84,306 B | 84,363 B |
| `cli/tests` | 189 项 | **192 项** |
| `skills/…/tests` | 205 项 | **205 项** |

归档少了一个成员（`cli_pin.json`）却大了 570 B：`usage.md` / `README.md` 里
新增的解释比删掉的 pin 说明更长。这是有意的——"为什么 CLI 不记版本"
比"pin 怎么写"更需要写下来。

测试数**净增 3**：删掉 pin 与透传相关的 10 条，新增 `verify_pyz` 8 条、
固定名 4 条、`refresh` 5 条、拒绝查询 3 条、"bootstrap 里没有 CLI 解析器
知识" 1 条等。

### 16.6 验证

| 套件 | wukong100 真库 | 合成库 |
|---|---|---|
| `cli/tests` | 192 OK | 192 OK（12 skip） |
| `skills/…/tests` | 205 OK | 205 OK（9 skip） |
| `oskm/tests` | 300 OK（25 skip） | 同 |

隔离环境（`mktemp -d` + `env -i`，无源码树、无 `PYTHONPATH`、无端点）：
解压 skill 归档 → `cp cli/dist/oskm-cli.pyz <root>/` → `cp knowledge.db <root>/`，
`bootstrap.py cli-path` 认到 `<root>/oskm-cli.pyz`、`validate-db` 返回 `ok`、
`doctor` 退出码 0；`python3 <root>/oskm-cli.pyz --db <root>/knowledge.db
arch overview` 返回 wukong100 数据、`ask --list` 52 个工具。


---

## 17. 追加：CLI 打进运行时归档（2026-11-12）

### 17.1 新的归档契约

`knowledge.tar.gz` **一个**发布单元，根目录四样东西：

```
knowledge.tar.gz
├── knowledge.db          # 必需
├── oskm-cli.pyz          # 可执行位要保住；暂时可选（见 §17.3）
└── interface/
    ├── sdk-js/
    └── sdk_c/
```

- `install` 一次装齐四样，全部落进 `<runtime-root>/`。
- `download-db --date X` 取的是**同一个**归档，只从里面捞出 `knowledge.db`
  ——不存在"单 DB 下载物"。
- `$OSKM_CLI_ENDPOINT` 与 `cli_install.download_cli()` **删除**：CLI 不再有
  独立下载端点，解析链从四级收缩到三级（`$OSKM_CLI` → `<root>/oskm-cli.pyz`
  → 源码树），三步都不联网。

### 17.2 自带校验器

`install` 用**归档里那份 CLI** 校验随附的 DB（`install.bundle_validator`）：
把 `oskm-cli.pyz` 挂进 `sys.path`，取它的 `oskm_cli.database.validate_db`。

这有一层额外好处：**校验这批数据的，就是和这批数据一起发布的那一个 CLI**，
不会出现"新 CLI 校验旧库"。它也让 §16 里那个"先装 CLI 再下 DB"的顺序失去
意义——那个顺序只服务过"CLI 单独下载"。

### 17.3 兼容期：归档里暂时没有 CLI

服务器端还在往归档里补 `oskm-cli.pyz`。补完之前，**旧归档必须照样能装**，
所以：

| 情形 | 行为 |
|---|---|
| 归档有 `oskm-cli.pyz` | 装上它，状态写 `cli: {path, sha256}` |
| 归档没有 | DB + 两套 SDK 照常装；**已装的 CLI 原样保留**；状态不写 `cli` 段 |
| 归档有但不是普通文件（软链/目录） | 拒绝 |
| 归档里有多个 | 拒绝（"只能有一个"） |

`bundle_validator` 在缺 CLI 时退回 `default_validator()`（已装的 / 源码树的）。
这条兼容是**有期限**的，等服务器补齐就可以把可选改回必需——届时只需把
`extract_runtime` 里那段 `cli_found` 的宽松分支改成与 `knowledge.db` 同款
的硬校验，并把两条测试的期望翻过来。

### 17.4 顺带修掉的三个真 bug

都是这次端到端验证（本地起 HTTP 服务发真归档）才暴露的：

**① 换 CLI 时 `sys.path` 顺序错，静默用错产物。**
`activate()` 原来只在路径**不在** `sys.path` 时插入。同一次进程里先后解析两个
不同的 CLI（`install` 用归档自带的那个校验，`validate-db` 用装好的那个）时，
先激活的路径一直留在原地，后激活的源码树反而排在更早的临时 pyz **后面**。
清掉模块缓存后又从旧 pyz 导入，症状是 `No module named 'oskm_cli.database'`，
而错误信息指向的是**后一个**路径——完全误导。改成"移到最前"。

**② `sys.modules` 缓存跨 location 串味。**
`sys.path` 只在导入**之前**生效，一旦 `oskm_cli` 进了 `sys.modules`，插新路径
也不会换包。新增 `_evict_cached_package()`：换 location 时只清 `oskm_cli*`
（不动两个产物共用的 `oskm_schema`）。

**③ 解档丢了可执行位。**
`extract_runtime` 用 `open('wb')` 落盘，`oskm-cli.pyz` 的 0755 变成 0644，
装完 `./oskm-cli.pyz` 直接 permission denied。改成按归档里的 `member.mode`
恢复权限位，并加了断言（`test_downloaded_runtime_extracts_database_and_both_sdk_trees`
现在会检查 `st_mode & 0o111`）。

**另一处健壮性**：macOS 的 `tar` 会给每个文件加一条 AppleDouble（`._name`），
`tar czf` 打完的包会被自己的校验器以"未允许的顶层路径"拒收。现在 `._*` 与
`.DS_Store` 一律当打包噪音跳过。

### 17.5 测试

| 套件 | 结果 |
|---|---|
| `cli/tests` | 192 OK |
| `skills/…/tests` | **205** OK |
| `oskm/tests` | 300 OK（25 skip） |

新增/改写的用例：

- `test_db_download::test_downloaded_runtime_extracts_database_and_both_sdk_trees`
  现在断言解出来的**四样**都在，且 CLI 仍可执行
- `test_runtime_install::test_install_extracts_complete_runtime_bundle`
  断言 CLI 与 DB 并排落盘、状态有 `cli` 段
- `test_runtime_install::test_install_tolerates_an_archive_without_the_cli`
  —— §17.3 的兼容期契约（缺 CLI 照装、不写状态、不删旧 CLI）
- `test_cli_install::test_there_is_no_fourth_candidate_that_downloads`
  —— 解析链只有三级，`download_cli` / `cli_endpoint` / `OSKM_CLI_ENDPOINT` 都不存在
- `test_bootstrap::InstallCommand::test_install_does_not_resolve_a_cli_beforehand`
  —— 没有"先装 CLI"这一步
- `test_skill_bundle::test_env_example_documents_the_whole_archive`
  —— `.env.example` 必须讲清归档里四样东西

### 17.6 端到端验证（真下载真解包）

本地起 `python3 -m http.server`，用一个 3.4 MB 的真归档（`~/.oskm/knowledge.db`
+ `cli/dist/oskm-cli.pyz` + 两套最小 SDK 树）走完整链路：

| 场景 | 结果 |
|---|---|
| 归档**不带** CLI（模拟服务器现状） | `install` 成功；`<root>/` 里只有 DB + interface；状态无 `cli` 段 |
| 归档**带** CLI（将来形态） | `install` 成功；`<root>/oskm-cli.pyz` 为 `-rwxr-xr-x`；状态写着 `{path, sha256}` |
| 用装出来的 CLI 查询 | `python3 <root>/oskm-cli.pyz --db <root>/knowledge.db arch overview` 返回 wukong100 数据 |
| `download-db --date 20261112` | 从**同一个**归档里只捞出 DB；`components` 385 行 |
