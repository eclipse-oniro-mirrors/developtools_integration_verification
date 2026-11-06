---
name: oskm
description: "OpenHarmony 产品顶层架构查询：某个产品由哪些子系统/部件/进程构成、某个镜像文件属于哪个部件和代码仓、改一个库会影响谁、某个 SysCap/SDK 接口由谁实现、某个 GN 编译开关控制哪些特性、某个原生库对应哪些 SDK 头文件。运行时是单个 knowledge.tar.gz，解压后为 knowledge.db 与 interface 下两套 SDK 源码；DB 事实只读查询，SDK 源用于核对声明与头文件证据；不扫描、不编译。命令 python3 -m agentic。"
author: "Created by user"
version: "2.5.4"
---

# oskm — OpenHarmony 产品顶层架构查询
## 怎么调
```bash
python3 -m agentic --db <knowledge.db> <子命令> …
```

四个子命令：`arch`（六类架构问题）· `ask`（52 个查询工具）· `diff`（两个库对比）· `sql`（受限只读 SQL）。

**必须给 `--db` 或 `--product` 之一**，不猜默认产品；给 `--product X` 时按 `artifacts/X/knowledge.db` 推导。
**首次使用：目标为 `~/.oskm/knowledge.db` 且不存在时，先执行 `python3 -m agentic.runtime install --runtime-root ~/.oskm`（蓝区补 `--component`，黄区确认 `.env` 为 yellow），成功后再查询该库。不要对任意缺失的 `--db` 路径自动下载。**

> 运行要求 Python 3.10+，不要求 Git。skill 名称、发布归档、解压根目录和 skill 目录名统一为 `oskm`；安装父目录由宿主工具决定，例如 Claude Code 项目级 `.claude/skills/oskm/`、Codex 用户级 `${CODEX_HOME:-$HOME/.codex}/skills/oskm/`，其他工具使用各自的 skill root。发布包解压后先 `cd oskm`；不在包根运行时设置 `PYTHONPATH=<…>/oskm`。Windows 把 `python3` 换成 `py -3`；先用 `python3 -m agentic.runtime doctor`（Windows `py -3 -m agentic.runtime doctor`）检查，查询、下载和自动刷新都不要求 Bash。`ask`/`arch`/`diff`/`sql` 只读已有 DB；`scan` 需要源码仓与采集器，不属于此发布包。

## 运行时输入与下载
```
knowledge.tar.gz
├── knowledge.db
└── interface/
    ├── sdk-js/       # ArkTS API/Kit 声明
    └── sdk_c/        # NDK 头文件
```

`install` 只下载一个 `knowledge.tar.gz`，安全解压后把 `knowledge.db`、`interface/sdk-js`、`interface/sdk_c` 安装到运行时根目录；不再从 Git 仓库拉取 SDK，不要求 SDK 凭据或分支。`download-db` 从同一个归档中只提取 `knowledge.db`。唯一功能入口是 `python -m agentic.runtime`，底层用 Python 标准库 `urllib.request`、`tarfile`、`zipfile`、`sqlite3`；Unix 的 `scripts/*.sh` 只是兼容包装器。

> **两区配置**：默认 `OSKM_DEFAULT_ZONE=blue`，蓝区命令可省略 `--zone`。黄区不把地址写入仓库：复制 `agentic/.env.example` 为 `agentic/.env`，设置 `OSKM_DEFAULT_ZONE=yellow` 和 `OSKM_YELLOW_DB_BASE_URL=<黄区归档公共前缀>`；真实 `.env` 已被 Git 忽略。黄区请求 `$OSKM_YELLOW_DB_BASE_URL/$date`，蓝区通过构建 API 取得 OBS 归档地址。

```bash
# 独立保存指定日期 DB（不安装 SDK）
python3 -m agentic.runtime download-db --zone yellow --date 20261102 --output knowledge.db
python3 -m agentic.runtime download-db --zone blue --date 20261102     --output knowledge.db --component dayu600_7885_ai

# 安装托管运行时（DB + 两套 SDK，一次下载）
python3 -m agentic.runtime install --zone yellow --runtime-root ~/.oskm
python3 -m agentic.runtime install --zone blue --runtime-root ~/.oskm     --date 20261102 --component dayu600_7885_ai
```

黄区 URL 为 `$OSKM_YELLOW_DB_BASE_URL/$date`，不使用旧的 latest 端点。蓝区 POST 的 `startTime`/`endTime` 是同一日期范围的两端，不是两个独立时间输入；蓝区必须给 component。

独立下载只校验 SQLite 完整性和结构（`PRAGMA integrity_check`）；托管运行时安装额外校验当前查询层 schema 后写入 `.oskm-runtime.json`。省略 `--date` 时安装器取系统当天；每次数据查询前的运行时检查会在日期不是当天、schema 不兼容或固定路径缺失时自动刷新，只覆盖最新一份。归档拒绝绝对路径、`..`、未知顶层路径和越界符号链接；失败时保留现有 DB、SDK 和状态。自动刷新失败时，若旧 DB 仍可查询则警告后继续使用，并进入 15 分钟失败退避；缺库不会自动联网下载。**SDK 源码缺失时明确报告 `SDK 源码缺失`**，不要静默降级成“没有关系”。

- `sdk-js`：按 ArkTS module 的 `source_path` 核对声明，并由 `implementation` 定位实现 `.so`；`sdk_c` 按 NDK 的 `header_path` 核对头文件，`symbol` 只是匹配策略。
- 先信 DB 的关系和扫描时 revision，再读源码补证据；`content_match=unverified`，HEAD 可漂移。

## 分层模型
```
代码仓 525 → 子系统 56 → 部件 382 → 安装模块 5,506 → 镜像文件 6,584
                                      → ELF 3,520（依赖边 33,367）
                     → 运行时：服务 164 / SA 165 / HDI 57
横切：编译参数 2,952 · 特性 1,351 · SysCap 306 · InnerAPI 1,743
SDK：Kit 51 · 模块 1,320（932 个定位到实现 .so）· NDK 映射 441 条
```

上面是 rk3568 的量级，换个产品数字会变——**先跑 `arch overview` 看当前库的真实规模**。

## 六类架构问题：`arch`
```bash
D="--db $DB"
python3 -m agentic $D arch overview                       # 1 这个产品由什么构成
python3 -m agentic $D arch trace system/lib/module/multimedia/libimage.z.so
                                                          # 2 某文件从哪来：模块→部件→子系统→仓→它实现的 SDK 接口
python3 -m agentic $D arch impact system/lib/chipset-sdk-sp/libbeget_proxy.z.so
python3 -m agentic $D arch impact init                    # 3 改它影响谁（带 / 按 ELF，不带按部件）
python3 -m agentic $D arch provides image_framework       # 4 某部件提供什么：SysCap/InnerAPI/SDK 模块
python3 -m agentic $D arch switch ace_engine_feature_asbng_path
                                                          # 5 某编译开关控制哪些特性
python3 -m agentic $D arch runtime foundation             # 6 某服务托管哪些 SA 与 HDI
```

> 上面的目标路径是 blue/arm 示例。换成 yellow/arm64 库时，系统库通常在
> `system/lib64/`，并且 ArkUI 等产物的子目录也可能不同。先跑
> `ask get_scan_info` 确认 `zone/cpu_arch`，再用 `ask search_elf_modules --query <文件名>`
> 取该库真实的 `dest`，不要把 `system/lib` 当成固定前缀。

`arch` 只有这六条，且只是对 `ask` 的编排——不会给出 `ask` 给不了的事实。

## 更细的查询：`ask`
```bash
python3 -m agentic ask --list                             # 52 个工具，按模块分组
python3 -m agentic ask get_component --help               # 参数与枚举，从 schema 生成
python3 -m agentic $D ask get_component --name ace_engine
python3 -m agentic $D ask list_arkts_modules --component ace_engine --limit 5
python3 -m agentic $D --format table ask search_elf_modules --query libimage
python3 -m agentic $D ask search_ndk_headers --query image        # 原生库 → SDK 头文件
```

数组参数用空格分隔（不用逗号——GN label 和路径里都有逗号）：
`ask aggregate --table components --group_by subsystem`。
对象参数收 JSON：`ask list_entities --table components --page '{"limit": 3}'`。

> `component_*` 这批工具收的是 `component_id` 不是名字，先用 `get_component` 换 id。
> `arch provides` / `arch impact` 已经替你做了这一跳。

## 两个库对比：`diff`
```bash
python3 -m agentic --db a.db --db b.db diff --entity components
python3 -m agentic $D diff --entity gn_args --scan-a 1 --scan-b 2
```

`--db` 给两次是跨库；给一次加 `--scan-a/--scan-b` 是同库两快照——**这两个是 `diff` 的参数，要写在 `diff` 后面**。
`--entity` 取 components / gn_args / features / services / install_modules / innerapis。
输出三段：`added` / `removed` / `changed`。

## 复杂 SQL 走文件：`sql`
```bash
python3 -m agentic $D sql --file query.sql       # - 表示 stdin
python3 -m agentic $D sql --sql "SELECT COUNT(*) AS n FROM components"
```

**多行 SQL 不要塞进命令行**——单引号、`%`、换行在 shell 里全是坑，这正是支持
`--file` 的原因；文件里可以带注释。只读校验照常生效：首个关键字必须是
SELECT/WITH（跳过开头注释后再判），表名走白名单，自动注入 `scan_id` 与 `LIMIT`。

## 容易误读的
不说清一定会误判，**每条都来自实测**。

1. **`degraded` 不等于失败。** 12 个采集器里 4 个 degraded；arkts 只是 1 份声明不是合法 UTF-8。
2. **空值有好几种含义。** 无实现 `.so` 时看 `implementation_kind`：`type_only` 不需要、
   `arkts_builtin` 由运行时提供、`unknown` 才是真不知道；空白不等于“没有”。
3. **引用条数 ≠ 对端数量。** AbilityKit 的 188 条 import 只指向 104 个模块，
   同一模块常在 static / dynamic 分支各写一次。
4. **Kit 成员有两条来路且会不一致。** `@kit` 标签 vs 入口 import；1,273 对里 662 对只有标签。
5. **依赖闭包从 1 跳起。** `libace_engine_pa_ark.z.so`：1 跳 26、2 跳 169、3 跳 297、闭包 387；
   `truncated=true` 时 `total` 才是真实数量。
6. **`out_of_scope` 不是缺陷。** 未解析的引用有四种原因，指向外部包本来就不该解析。
7. **实现路径已按 cpu_arch 归一。** blue/arm 是 `system/lib/…`，yellow/arm64 是 `system/lib64/…`；
   `arkts_links` 用完整路径精确关联，`installed_at` 来自 `install_targets.dest`。
8. **快照不是现状。** git 提交号是扫描当时的，`content_match` 恒为 `unverified`，未逐字节比对。

第 1、5、8 条最容易让人误判成"数据有问题"。

## 退出码与输出
`0` 正常 · `2` 参数错 · `3` 库打不开 · `5` 工具返回 error（详情 JSON 打到 stderr）。
默认输出 JSON，可 `| jq`；`--format table` 给人读。

## 更深入
字段级规格读本目录的 `docs/spec/<模块>.md`（14 份：component / elf / install /
gn_args / service / sa / hdi / ndk / arkts / repos / query / issues / schema / session），
完整 CLI 用法见 `docs/usage.md`，工具索引见 `reference/tools.md`。

## 不做什么
- **不扫描、不生成库**。本 skill 消费已有的 `knowledge.db`。
- **不改 DB、不改 SDK 源码**。源码只按 DB 证据路径读取；不编译、不构建。
- **不查实时设备状态**。库是一次扫描的快照。
