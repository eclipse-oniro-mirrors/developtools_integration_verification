# oskm 查询 CLI 使用指南

> 2026-10-29 起 oskm 不再提供 MCP server（`server.py` 已删，查询层改名
> `agentic/query/`）。查询入口是 `python3 -m agentic ask / arch / diff / sql`。
> 改造背景与取舍见 [skill-design.md](./skill-design.md)。

## 1. 运行时与前置条件

oskm skill 的运行时来自一个统一归档 `knowledge.tar.gz`，解压后必须得到：

```text
knowledge.tar.gz
├── knowledge.db
└── interface/
    ├── sdk-js/       # ArkTS API / Kit 声明
    └── sdk_c/        # NDK 头文件
```

安装后的托管目录为：

```text
<runtime-root>/
  knowledge.db
  .oskm-runtime.json   # 日期、区域、component 与产物路径
  interface/
    sdk-js/
    sdk_c/
```

`install` 下载并安全解压这个归档；`download-db` 从同一个归档中只提取
`knowledge.db`。两张区域网络只负责取归档，**不再从 Git 仓库拉取 SDK**，不要求
GitCode/CodeHub 凭据，也没有 SDK 分支参数。DB 中的 `source_path` /
`header_path` 相对 `<runtime-root>` 解析，因此目录必须是
`interface/sdk-js/` 与 `interface/sdk_c/`，不能多套一层 `interface/interface/...`。

运行时下载、安装、状态和自动刷新只有一个功能入口：

```bash
python -m agentic.runtime download-db|install|doctor|validate-db ...
```

它使用 **Python 3.10+ 标准库**：HTTP 走 `urllib.request`，tar 走 `tarfile`，
历史 zip DB 走 `zipfile`，SQLite 校验走 `sqlite3`。Windows 不需要 Bash、curl、
unzip 或 tar，查询和运行时命令统一把 `python3` 换成 `py -3`。

Unix 上的 `scripts/install_runtime.sh` 和 `scripts/download_db.sh` 只是兼容启动器，
内部仅执行对应的 Python 模块，不包含 curl、解压或 Git 业务逻辑。

### 检查并安装依赖

只需要 **Python 3.10+**；查询已有 DB、下载、安装和自动刷新都不要求 Git。
Python 侧没有 pip 第三方包，但内部模块必须可导入。解压独立发布包后，在
`oskm/` 根目录运行全量检查：

```bash
cd oskm
python3 -m agentic.runtime doctor
```

`doctor` 检查当前 Python 版本、区域配置以及 `agentic`、`oskm_schema` 是否能导入；
默认区域为 `yellow` 但 `OSKM_YELLOW_DB_BASE_URL` 未配置时也会失败返回 1，并给出
`.env` 提示。诊断输出只显示 URL“已配置/未配置”，不会打印值。

macOS（Homebrew）：

```bash
brew install python@3.12
python3.12 -m agentic.runtime doctor
```

Ubuntu/Debian：

```bash
sudo apt update
sudo apt install python3.12
python3.12 -m agentic.runtime doctor
```

如果发行版仓库没有 `python3.12`，安装其提供的最新 Python（必须 ≥3.10），
并替换命令中的解释器名。

Windows PowerShell：

```powershell
winget install Python.Python.3.12
cd <oskm 解压目录>
py -3.12 -m agentic.runtime doctor
```

如果 `py -3` 指向 Python 3.9 或更早，请显式使用 `py -3.12`；查询和安装命令同理。

### 蓝区、黄区与 `.env`

仓库只提交本地模板 `agentic/.env.example`，其中默认 `OSKM_DEFAULT_ZONE=blue`；
真实 `.env` 已被 `.gitignore` 忽略，不提交。`agentic.runtime` 和查询 CLI 启动时
会自动读取它，已存在的同名环境变量优先。

蓝区不需要 URL 配置：

```dotenv
OSKM_DEFAULT_ZONE=blue
OSKM_YELLOW_DB_BASE_URL=
```

黄区首次使用时复制模板，填写归档公共前缀并切换默认区域：

```bash
cp agentic/.env.example agentic/.env
"${EDITOR:-vi}" agentic/.env
python3.12 -m agentic.runtime doctor
```

```dotenv
OSKM_DEFAULT_ZONE=yellow
OSKM_YELLOW_DB_BASE_URL=https://<黄区归档公共前缀>
```

Windows PowerShell：

```powershell
Copy-Item agentic\.env.example agentic\.env
notepad agentic\.env
py -3.12 -m agentic.runtime doctor
```

也可以只在当前 shell 设置：

```bash
export OSKM_YELLOW_DB_BASE_URL='<黄区归档公共前缀>'
```

```powershell
$env:OSKM_YELLOW_DB_BASE_URL = "<黄区归档公共前缀>"
```

黄区 URL 为 `$OSKM_YELLOW_DB_BASE_URL/$date`，响应文件名应为
`knowledge.tar.gz`，不使用旧 latest 端点。缺失或格式错误时，下载器会在联网前报错。
蓝区命令不需要这个变量。

蓝区向 `https://dcp.openharmony.cn/api/daily_build/build/list/component` POST；
`startTime` / `endTime` 是同一个日期范围的两端，不是两个独立时间输入：

```json
{
  "component": "$COMPONENT",
  "startTime": "${date}00000000",
  "endTime": "${date}235959",
  "buildStatus": "success"
}
```

蓝区从成功构建响应的 `.data.list.dataList[0].obsPath` 读取 OBS 地址；
蓝区必须指定 --component，黄区不接受 --component，参数错误会在联网前失败。

### 安装托管运行时

推荐固定使用 `~/.oskm` 作为 Agent 的运行时根目录。首次查询前先检查
`~/.oskm/knowledge.db`；如果不存在，先执行下面的 `install`，成功后再查询该库。
查询 CLI 只自动刷新带 `.oskm-runtime.json` 的托管运行时；任意 `--db` 路径缺失时
不会触发联网下载。

给 Agent 或日常查询使用托管运行时，一次安装 DB 和两套 SDK：

```bash
RUNTIME_ROOT="$HOME/.oskm"
date=20261102

# 蓝区：component 必填
python3 -m agentic.runtime install --zone blue --runtime-root "$RUNTIME_ROOT" --date "$date" --component dayu600_7885_ai

# 蓝区且 .env 使用默认 OSKM_DEFAULT_ZONE=blue 时可省略 --zone
python3 -m agentic.runtime install --runtime-root "$RUNTIME_ROOT" --date "$date" --component dayu600_7885_ai

# 黄区：不接受 component
python3 -m agentic.runtime install --zone yellow --runtime-root "$RUNTIME_ROOT" --date "$date"
```

Windows PowerShell 直接调用同一模块，不需要 Bash：

```powershell
$RuntimeRoot = "$env:USERPROFILE\oskm-runtime"
$date = "20261102"
py -3 -m agentic.runtime install --zone blue --runtime-root $RuntimeRoot `
    --date $date --component dayu600_7885_ai
py -3 -m agentic.runtime install --zone yellow --runtime-root $RuntimeRoot `
    --date $date
```

- 省略 `--date` 时，安装器取本地时区的系统当天；历史快照显式传 `YYYYMMDD`。
- `--skip-db` 只准备 SDK，`--skip-sdk` 只准备 DB；两者不能同时使用。
- 安装器先下载并校验归档，再按 `--skip-*` 选择要替换的产物；DB 与两套 SDK 在
  同一事务中逐项替换，中途失败会回滚已替换内容。
- 安全解压只接受归档根目录的 `knowledge.db` 与 `interface/sdk-js/`、
  `interface/sdk_c/`；拒绝未知顶层路径、绝对路径、`..`、硬链接、设备文件和逃逸
  SDK 目录树的符号链接。
- SDK 路径缺失、为空时明确报告 **`SDK 源码缺失`**，不会静默跳过源码证据。
- `--skip-db` / `--skip-sdk` 会保留尚未刷新的那一侧的旧状态，下一次查询仍能发现它过期并补齐。

成功安装后，安装器会原子写入 `<runtime-root>/.oskm-runtime.json`。每次数据查询前，
运行时确保逻辑都读取这个文件；只要 DB 或任一 SDK 的日期不是当天，或固定路径缺失，
运行时就直接调用 Python 安装器刷新到当天，再打开 DB。托管运行时
**只覆盖最新一份**，不建立按日期命名的历史目录。状态文件是托管标记：没有该文件的
`artifacts/*/knowledge.db` 视为用户自管，CLI 不会自动联网。

如果当天构建尚未就绪、网络失败或新归档校验失败，而旧 `knowledge.db` 仍满足当前
查询层 schema，CLI 会打印警告并继续使用旧库；依赖 SDK 源码证据的查询可能同时提示
源码不可用。失败后 15 分钟内不会在每次查询时重复下载，期间可修复网络或配置后手动
执行 `install`。旧 DB 不存在或 schema 不兼容时不会回退，也不会为缺失路径自动下载。

### 只下载指定日期的 DB

只需要保存某天的历史 DB、不需要 SDK 时，使用独立下载：

```bash
DB_OUT=/path/to/knowledge_20261102.db
date=20261102

# 黄区
python3 -m agentic.runtime download-db --zone yellow --date "$date" --output "$DB_OUT"

# 蓝区：component 必填
python3 -m agentic.runtime download-db --zone blue --date "$date" --output "$DB_OUT" --component dayu600_7885_ai
```

Windows：

```powershell
$DBOut = "$env:USERPROFILE\knowledge_20261102.db"
$date = "20261102"
py -3 -m agentic.runtime download-db --zone yellow `
    --date $date --output $DBOut
py -3 -m agentic.runtime download-db --zone blue `
    --date $date --output $DBOut --component dayu600_7885_ai
```

`download-db` 对统一归档只读取其中的 `knowledge.db`，不会安装 SDK。为兼容历史
下载物，仍按文件名后缀支持：

| 文件后缀 | 处理 |
|---|---|
| `.db` | 直接作为候选 |
| `.zip` | `zipfile` 读取 |
| `.tar`、`.tar.gz`、`.tgz`、`.tar.xz`、`.txz`、`.tar.bz2`、`.tbz2` | `tarfile` 读取 |
| 其他 | 明确失败 |

归档中必须恰有一个普通文件 `knowledge.db`。独立下载只校验 SQLite 完整性和结构：
文件头、能够只读打开，并通过 `PRAGMA integrity_check`。它**不要求历史 DB 满足当前
查询层 schema**，因此可用来保存旧日期快照。托管运行时安装额外校验当前 oskm
查询层 schema，包括 `scans.zone`、`scans.cpu_arch`、`collector_tables` 等；
不兼容的旧库会被拒绝。

独立下载和运行时安装都会先写输出目录内的临时文件，再原子替换目标。网络、HTTP、
归档、完整性或 schema 校验失败都不会破坏已有输出或运行时。

### 下载故障诊断

HTTP 默认使用系统和 `HTTPS_PROXY` / `HTTP_PROXY` / `NO_PROXY` 环境配置。失败信息会
区分 HTTP 状态、超时、TLS/证书、DNS/代理和下载不完整；检查构建日期、黄区 URL 与
`knowledge.tar.gz` 是否存在后重试。Python 路径不依赖 `curl -vI`，Windows 可直接用
`Invoke-WebRequest` 或 `Test-NetConnection` 做网络排障。

归档解压失败时先检查根目录结构：

```bash
tar -tzf knowledge.tar.gz | head -50
```

正常情况下应看到 `knowledge.db`、`interface/sdk-js/...` 和
`interface/sdk_c/...`；多套一层顶层目录不会被安装器猜测或自动剥离。

校验当前查询层 schema 可单独运行：

```bash
python3 -m agentic.runtime validate-db "$RUNTIME_ROOT/knowledge.db"
```

归档中的 SDK 快照应与 DB 的扫描 revision 配套；没有 Git HEAD 时，仍按 DB 中的
revision 比较证据，`content_match` 应视为 `unverified`。目标若为
`~/.oskm/knowledge.db` 且文件不存在，应先执行 `runtime install`；查询发布包本身
不扫描、不重建库。只有确实需要自行生成数据时，才回到源码仓使用采集入口
（rk3568 全量实测约 79 秒）：

```bash
# 仅在 packages/oskm 源码仓中可用；发布的 oskm 不含 collectors
python3 oskm.py scan --workspace-root <OH源码根> --product rk3568 \
    --db "$RUNTIME_ROOT/knowledge.db"
```

回到发布包根目录即可查询：

```bash
cd oskm
python3 -m agentic.runtime doctor
```

下文用 `DB="$RUNTIME_ROOT/knowledge.db"`；仓内示例可改成实际的 DB 路径。

## 2. 四个子命令

| 命令 | 干什么 |
|---|---|
| `oskm arch <问题> [目标]` | 六类顶层架构问题，一条命令串完多步 |
| `oskm ask <工具> [--参数]` | 直接调任意一个查询工具（52 个） |
| `oskm diff --entity <实体>` | 跨库或跨快照对比 |
| `oskm sql --file <文件>` | 受限只读 SQL |

全局参数：`--db PATH`（可给两次，见 §5）、`--product NAME`、`--scan-id N`、
`--format json|table`。

**不猜默认产品**：`--db` 和 `--product` 必须给一个。`artifacts/` 下有 5 个目录，
但只有 `rk3568/` 放 knowledge.db，其余四个是按域导出的 JSON——
目录布局很容易被误认成"5 个产品"。

## 3. `oskm arch`：六类架构问题

```bash
python3 -m agentic --db $DB arch overview
python3 -m agentic --db $DB arch trace system/lib/module/multimedia/libimage.z.so
python3 -m agentic --db $DB arch impact system/lib/chipset-sdk-sp/libbeget_proxy.z.so
python3 -m agentic --db $DB arch impact init          # 不带 / 的按部件反查
python3 -m agentic --db $DB arch provides image_framework
python3 -m agentic --db $DB arch switch ace_engine_feature_asbng_path
python3 -m agentic --db $DB arch runtime foundation
```

`arch trace` 一条命令走完五跳——镜像文件 → 安装模块 → 部件 → 子系统 → 代码仓，
外带它实现的 SDK 接口与直接依赖数：

```json
{
  "file": "system/lib/module/multimedia/libimage.z.so",
  "install_module": "//foundation/multimedia/image_framework/interfaces/kits/js/common:image_napi",
  "component": "image_framework",
  "subsystem": "multimedia",
  "repo": "multimedia_image_framework",
  "repo_url": "https://gitcode.com/openharmony/multimedia_image_framework",
  "sdk_modules": ["api/@ohos.multimedia.image"],
  "direct_dependencies": 6
}
```

**`arch` 只有六条，而且只编排 `ask` 已有的工具、不自带 SQL。**
它不会给出 `ask` 给不了的事实，只是省掉手工串多步。有测试盯着这条约束
（`test_cli.py::test_arch_writes_no_sql`）。

## 4. `oskm ask`：直接调工具

```bash
python3 -m agentic ask --list                        # 全部工具，按模块分组
python3 -m agentic ask get_component --help          # 参数与枚举，从 schema 生成
python3 -m agentic --db $DB ask get_component --name ace_engine
python3 -m agentic --db $DB ask list_arkts_modules --component ace_engine --limit 5
python3 -m agentic --db $DB --format table ask search_elf_modules --query libimage
```

子命令、参数、类型、枚举、帮助文本**全部由工具的 JSON Schema 生成**，
不是手写的——加一个工具，CLI 和 `--help` 自动就有，不会过期。
枚举错值在 argparse 这一层就被拒：

```
$ python3 -m agentic --db $DB ask list_arkts_modules --implementation_kind bogus
error: argument --implementation_kind: invalid choice: 'bogus'
       (choose from 'napi','arkui','arkts_builtin','arkts_language','type_only','unknown')
```

数组参数用空格分隔（不用逗号——逗号在 GN label 和路径里都出现）：

```bash
python3 -m agentic --db $DB ask aggregate --table components --group_by subsystem
```

对象参数收 JSON：

```bash
python3 -m agentic --db $DB ask list_entities --table components --page '{"limit": 3}'
```

### 典型问答

| 问题 | 命令 |
|---|---|
| 某文件属于哪个部件 | `ask owner_of --dest system/lib/libcamera.z.so` |
| 某部件有哪些 feature | `ask get_component --name X` 取 id → `ask component_features --component_id <id>` |
| foundation 跑哪些 SA | `arch runtime foundation` |
| SA 1401 是什么 | `ask get_sa --sa_id 1401` |
| libfoo 依赖哪些库 | `ask search_elf_modules --query libfoo` → `ask elf_dependencies --dest <路径> --max_distance 1` |
| 某编译参数当前值 | `ask get_gn_arg --name ace_engine_feature_enable_web` |
| 哪些部件依赖 ace_engine | `arch impact ace_engine` |
| 扫描有哪些质量问题 | `ask list_issues` |
| 按子系统统计部件数 | `ask aggregate --table components --group_by subsystem` |

> `component_*` 这批工具收的是 `component_id` 而不是名字，先用 `get_component`
> 换 id。`arch provides` / `arch impact` 已经替你做了这一跳。

## 5. `oskm diff`：两个库对比

```bash
python3 -m agentic --db a.db --db b.db diff --entity components
python3 -m agentic --db a.db --db b.db diff --entity gn_args --fields current_value
python3 -m agentic --db $DB diff --entity components --scan-a 1 --scan-b 2
```

`--db` 给两次就是跨库（CLI 在一次调用内 open + ATTACH，alias 不对外暴露）；
给一次加 `--scan-a/--scan-b` 就是同库两快照——**这两个是 `diff` 的参数，写在 `diff` 之后**。
`--entity` 取 components / gn_args / features / services / install_modules / innerapis。

输出是结构化三段：

```json
{"entity": "components", "added": [], "removed": ["ace_engine", "image_framework"],
 "changed": [{"key": "init", "changes": [
   {"field": "subsystem", "before": "startup", "after": "changed"}]}]}
```

需要跨库 JOIN 这种 `diff` 表达不了的对比时，用 `oskm sql`——
第二个库在同一次调用里以 `b.` 前缀可见（目前仅 `oskm diff` 会挂载，
`oskm sql` 的跨库形态尚未开放，需要时再加 `--attach`）。

## 6. `oskm sql`：复杂查询走文件

```bash
python3 -m agentic --db $DB sql --file query.sql
cat query.sql | python3 -m agentic --db $DB sql --file -
python3 -m agentic --db $DB sql --sql "SELECT COUNT(*) AS n FROM components"
python3 -m agentic --db $DB sql --file q.sql --param ace_engine --param system
```

**多行 SQL 不要塞进命令行**——单引号、`%`、换行在 shell 里全是坑，这正是
支持 `--file` 的原因。文件里可以带注释：

```sql
-- 各子系统部件数，排除三方
SELECT c.subsystem, COUNT(*) AS parts
  FROM components c
 WHERE c.subsystem != 'thirdparty'
 GROUP BY c.subsystem HAVING parts > 8 ORDER BY parts DESC
```

只读校验照常生效：首个关键字必须是 SELECT/WITH（**跳过开头注释后再判**），
表名走白名单，自动注入 `scan_id` 与 `LIMIT`。
`-- SELECT\nDROP TABLE x` 这种伪装会被拒。

## 7. 退出码

| 码 | 含义 |
|---:|---|
| 0 | 正常 |
| 2 | 参数错（含 argparse 的枚举/必填校验） |
| 3 | 库打不开 |
| 5 | 工具返回 error，详情 JSON 打到 stderr |

与 `oskm scan` 的退出码口径一致，没有另造一套。

## 8. 工具速查

共 52 个工具、14 个模块。生成式索引见
[../reference/tools.md](../reference/tools.md)（由 `oskm ask --list --markdown` 生成），
字段级规格见 [spec/](./spec/)。

会话类的那 7 个（`open_session` / `attach_secondary` / `diff_scans` …）
在 CLI 里**退化成参数**——`--db` / `--scan-id` 和 `oskm diff`。
它们仍在注册表里、`ask` 也能直通，但不作为日常用法介绍。

## 9. 测试

```bash
python3 -m unittest discover -s agentic/query/tests -p "test_*.py"   # 查询层 + CLI
python3 -m unittest discover -s oskm/tests -p "test_*.py"            # 采集器核心
```
