# oskm-cli —— OpenHarmony 产品事实库的只读查询 CLI

给它一个 `knowledge.db`，它给答案。**不联网、不写盘、不认识 `~/.oskm`、不读 `.env`**。
把 DB / SDK / CLI 本身装到位是 skill
（[`ohos-design-architecture-evidence-query`](../skills/ohos-design-architecture-evidence-query/SKILL.md)）
的职责。拆分理由与职责边界见
[docs/architecture/cli-skill-split.md](../docs/architecture/cli-skill-split.md)。

- 版本：`oskm_cli.__version__`（当前 `1.0.0`），**只由 `--version` 报告，不进文件名**
- 依赖：Python 3.10+ 标准库；无 pip 依赖；不 import `oskm.collectors`（有门禁）
- 唯一的包外依赖是 `oskm_schema`（schema 契约），打 pyz 时被 stage 进归档
- **`cli/` 就是这个产物的全部**：源码、构建脚本、测试、构建输出（`cli/dist/`）都在里面

## 装

```bash
# A) 直接用 pyz（推荐）
python3.12 cli/dist/oskm-cli.pyz --version
./cli/dist/oskm-cli.pyz --version           # shebang 走 python3；太老会给出提示

# B) 装到托管运行时，让 skill 自动发现（固定名，与 knowledge.db 并排）
cp cli/dist/oskm-cli.pyz ~/.oskm/oskm-cli.pyz

# C) 源码树里不构建也能跑（cli/ 加进 PYTHONPATH 即可）
cd packages/oskm && PYTHONPATH=cli python3.12 -m oskm_cli \
    --db ~/.oskm/knowledge.db arch overview
```

库从哪来：让 skill 装（`bootstrap.py install`），或用采集侧的
`python3 -m oskm.cli scan` 自己扫一个。**采集与查询是两个入口，没有共同命令**——
2026-11-12 之前那个在外面按子命令名分派的 `packages/oskm/oskm.py` 已删除。

> 曾经还有 npm 通道（`npm install -g oskm-cli` + `bin/oskm-cli.js` 启动器），
> 2026-11-12 去掉：pyz 自己就能直接执行，多一条通道就多一处会漂的版本和一份
> 要维护的启动器，而它没有带来 pyz 给不了的能力。

## 用

```bash
CLI="python3.12 cli/dist/oskm-cli.pyz --db $HOME/.oskm/knowledge.db"

$CLI arch overview                                  # 这个产品由什么构成
$CLI arch trace system/lib64/module/multimedia/libimage.z.so
$CLI arch impact init                               # 改它会影响谁
$CLI arch provides image_framework                  # 某部件对外提供什么
$CLI arch switch ace_engine_feature_asbng_path      # 某编译参数控制哪些特性
$CLI arch runtime foundation                        # 某服务托管哪些 SA 与 HDI

$CLI ask --list                                     # 52 个工具，按模块分组
$CLI ask --list --markdown                          # 生成 references/tools.md 用的表
$CLI ask get_component --name ace_engine
$CLI ask elf_dependencies --dest <真实 dest> --max_distance 1
$CLI --format table ask search_elf_modules --query libimage

$CLI diff --entity components --scan-a 1 --scan-b 2
python3.12 oskm-cli.pyz --db a.db --db b.db diff --entity gn_args        # 给两次即跨库
$CLI sql --file query.sql                            # - 表示 stdin
$CLI sql --sql "SELECT COUNT(*) AS n FROM components"

python3.12 cli/dist/oskm-cli.pyz validate-db "$HOME/.oskm/knowledge.db"
```

子命令与参数**全部由 `REGISTRY` 里的 JSON Schema 生成**，不手写：加一个工具 =
注册一次，CLI 和 `--help` 自动就有。`arch` 只有六条，且只编排 `ask` 已有的工具、
不自带 SQL。数组参数用空格分隔（逗号在 GN label 和路径里都出现）；对象参数收 JSON。

### 退出码

| 码 | 含义 |
|---:|---|
| 0 | 正常 |
| 2 | 参数错（含 argparse 的枚举/必填校验）；`validate-db` 不兼容也用 2 |
| 3 | 库打不开 |
| 5 | 工具返回 error，详情 JSON 打到 stderr |

与采集侧 `python3 -m oskm.cli scan` 同口径，没有另造一套。默认输出 JSON（可 `| jq`），
`--format table` 给人读。

## 目录

```
cli/
├── README.md                本文件
├── oskm_cli/
│   ├── __init__.py          __version__（唯一版本源）
│   ├── __main__.py          python3 -m oskm_cli
│   ├── cli.py               ask / arch / diff / sql / validate-db / --version
│   ├── database.py          ★ schema 契约的**唯一一份**：REQUIRED_COLUMNS + validate_db
│   └── query/
│       ├── tools/           52 个工具的注册表（__init__.py 末尾自动 import 各模块）
│       ├── arkts/           ArkTS 查询侧与文档导出
│       ├── session.py       SessionManager：打开、活动会话、ATTACH
│       ├── readonly_session.py  内联的只读实体 API（不依赖 oskm/core）
│       ├── catalog.py       从库里的 collector_tables 读元数据（不 import 采集器）
│       ├── security.py      只读 SQL 校验：关键字、表白名单、scan_id/LIMIT 注入
│       ├── gitlink.py       git_url → 网页链接
│       └── jsonutil.py errors.py
├── scripts/build_cli.py     构建 pyz（固定名 oskm-cli.pyz）+ SHA256SUMS
├── tests/                   查询层门禁 + CLI 载体门禁
└── dist/                    构建输出（gitignore）：oskm-cli.pyz + SHA256SUMS
```

## 构建

```bash
python3.12 cli/scripts/build_cli.py                 # → cli/dist/oskm-cli.pyz
python3.12 cli/scripts/build_cli.py --output-dir /tmp/x
```

产出：

```
cli/dist/oskm-cli.pyz     Python zipapp（__main__.py + oskm_cli/** + oskm_schema/**）
cli/dist/SHA256SUMS       本产物自己的校验和；已删除的旧文件条目会被清掉
```

**文件名不带版本号**，与 `knowledge.db` 同类：skill 把它装到
`<runtime-root>/oskm-cli.pyz`，文档与调用方永远不用钉版本，发版也不会让
SKILL.md 里的命令变成坏指令。版本仍然可查（`--version`）。

**pyz 是确定性的**：手写 zip（固定 `date_time=(1980,1,1,0,0,0)`、固定
`external_attr`、固定 compresslevel、条目按名字排序）。`zipapp.create_archive`
控制不了 `ZipInfo`，所以没有用它。确定性让 `SHA256SUMS` 有意义，也让
"装的是不是刚构建的那份"可查。有门禁现场重构建一次并比对摘要
（`cli/tests/test_cli_bundle.py`）。

`__main__.py` 里有一道 **Python 版本守卫**：本机 `python3` 可能是 3.9
（macOS Command Line Tools 就是），没有守卫时 `./oskm-cli.pyz` 炸出来的是
`oskm_schema/base.py` 里 `str | None` 的 `TypeError`，完全看不出真因是解释器太老。

改完记得跑：

```bash
export OSKM_TEST_DB="$HOME/.oskm/knowledge.db"
python3.12 -m unittest discover -s cli/tests -p "test_*.py"
```

## 给 Agent 用

不要直接把这份 README 塞给 Agent。走 skill：它按需加载字段级规格，并且知道
`degraded` 不等于失败、依赖闭包要从 1 跳起、引用条数不等于模块数这些只有实测
才会发现的边界。

| 你想 | 看这个 |
|---|---|
| 让 Agent 用 | [SKILL.md](../skills/ohos-design-architecture-evidence-query/SKILL.md) |
| 完整用法（人读） | [references/usage.md](../skills/ohos-design-architecture-evidence-query/references/usage.md) |
| 查某个工具的字段 | [references/spec/](../skills/ohos-design-architecture-evidence-query/references/spec/) |
| 知道查询层为什么长这样 | [docs/architecture/query-skill-design.md](../docs/architecture/query-skill-design.md) |
| 知道为什么能独立发布 | [docs/architecture/standalone-packaging.md](../docs/architecture/standalone-packaging.md) |
| 加表 / 改表怎么保持两侧一致 | [oskm_schema/schema-single-source.md](../oskm_schema/schema-single-source.md) |
