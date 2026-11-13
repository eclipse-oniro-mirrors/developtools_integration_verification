# ohos-design-architecture-evidence-query

OpenHarmony 架构证据**运行时分发与 CLI 使用 skill**。核心职责是下载并安装
`knowledge.db`、`interface/sdk-js`、`interface/sdk_c` 和 `oskm-cli.pyz`，并提供 CLI
的整体功能说明；具体查询由 CLI 只读执行。skill 不包含采集器，不扫描、不编译、
不修改数据库或 SDK。

**2026-11-12 起拆成两个独立产物**：本 skill 负责运行时安装与 CLI 用法；查询引擎是
独立构建的 `oskm-cli.pyz`，并随 `knowledge.tar.gz` 一起发布。归档里不再有 2.5.6
时代内联的查询层目录与 `oskm_schema` 副本。分工与理由见源码仓
`docs/architecture/cli-skill-split.md`。

## 环境要求

- Python 3.10+（本次发布验收使用 Python 3.12）
- 不要求 Git，不要求 Bash，也没有第三方 Python 运行依赖
- 下载方式由 `OSKM_DOWNLOAD_SOURCE`（`OPENHARMONY_CI` 或 `INTERNAL_CI`）选择，
  端点由 `OSKM_DOWNLOAD_ENDPOINT` 提供
- `OPENHARMONY_CI` 的 component 固定为 `dayu600_7885_ai`；`INTERNAL_CI` 请求
  `$OSKM_DOWNLOAD_ENDPOINT/<YYYYMMDD>`
- CLI 随 `knowledge.tar.gz` 一起发布（归档里四样东西：`knowledge.db`、
  `oskm-cli.pyz`、`interface/sdk-js`、`interface/sdk_c`），`install` 一次装齐；
  没有单独的 CLI 下载端点
- CLI 按三级候选解析：`$OSKM_CLI` → `<runtime-root>/oskm-cli.pyz` → 源码树
  `packages/oskm/cli`。三步都不需要网络
- `install` 下载一个 `knowledge.tar.gz`，把里面的 `knowledge.db`、`oskm-cli.pyz`、
  `interface/sdk-js/`、`interface/sdk_c/` 一起装到 `<runtime-root>/`
- 在 OpenHarmony 源码根执行 `install` 时会优先使用 `out/` 下的构建 DB 和
  `interface/` SDK；本地候选不完整或 schema 不兼容时回退下载；
  安装执行完整 schema 校验（转发给 CLI 的 `validate-db`）、不做列迁移，不匹配的
  旧库需要重新扫描；本地运行时不按日期自动刷新，显式 `install` 才会重新复制源码产物

Windows 下把文中的 `python3` 换成 `py -3`。

## 名称与安装位置

skill 机器名、发布归档、解压根目录和安装目录叶子名统一为
`ohos-design-architecture-evidence-query`。父目录由宿主工具决定：

- Claude Code 项目级：`.claude/skills/ohos-design-architecture-evidence-query/`
- Claude Code 用户级：`~/.claude/skills/ohos-design-architecture-evidence-query/`
- Codex 用户级：`${CODEX_HOME:-$HOME/.codex}/skills/ohos-design-architecture-evidence-query/`
- 其余工具：`<tool-skill-root>/ohos-design-architecture-evidence-query/`
- 运行时数据：`~/.oskm/`（与 skill 安装目录分离）

发布归档名为 `ohos-design-architecture-evidence-query-<version>.tar.gz`，解压后只有
一个同名根目录。不要重命名叶子目录，否则会与 `SKILL.md` frontmatter 的 `name` 不一致。

## 快速开始

```bash
tar -xzf ohos-design-architecture-evidence-query-3.0.0.tar.gz
cd ohos-design-architecture-evidence-query

# 初次使用时按需配置下载端点（也可放到 <runtime-root>/.env）
cp oskm_runtime/.env.example oskm_runtime/.env
"${EDITOR:-vi}" oskm_runtime/.env

python3.12 bootstrap.py doctor

# 初次使用：下载安装 DB + interface/sdk-js + interface/sdk_c + CLI
# OpenHarmony CI（component 固定为 dayu600_7885_ai，无需命令行传入）
python3.12 bootstrap.py install --source OPENHARMONY_CI --runtime-root ~/.oskm
# Internal platform CI（GET <endpoint>/<YYYYMMDD>）
python3.12 bootstrap.py install --source INTERNAL_CI --runtime-root ~/.oskm

python3.12 bootstrap.py cli-path               # 看它最终用了哪个 CLI

# 查询**直接调 CLI**（bootstrap 只负责装）
CLI=~/.oskm/oskm-cli.pyz; DB=~/.oskm/knowledge.db
python3.12 "$CLI" --db "$DB" arch overview
python3.12 "$CLI" --db "$DB" ask get_scan_info
python3.12 "$CLI" ask --list
```

如果 `~/.oskm/knowledge.db` 不存在，先执行 `install`，成功后再查询。
`bootstrap.py refresh` 只对带 `.oskm-runtime.json` 的托管运行时检查是否过期，
不会因为任意缺失的 `--db` 路径联网。

`bootstrap.py` 自己补 `sys.path`，**不需要设 `PYTHONPATH`**，也不需要在特定目录下运行：

```bash
python3.12 /path/to/ohos-design-architecture-evidence-query/bootstrap.py doctor
```

查询直接调 CLI（它不下载任何数据）：

```bash
python3.12 ~/.oskm/oskm-cli.pyz --db ~/.oskm/knowledge.db ask --list
~/.oskm/oskm-cli.pyz --db ~/.oskm/knowledge.db arch overview    # shebang 直接执行
python3.12 ~/.oskm/oskm-cli.pyz --version                       # 版本问产物自己
```

CLI 与 `knowledge.db` 同类：**固定文件名、不记版本、不锁摘要**。`install` 把它装到
`<runtime-root>/oskm-cli.pyz`，与 `knowledge.db` 并排；完整性靠结构校验
（shebang + 有效 zip + 必需条目 + CRC），不靠比对某一次构建的摘要。

## 包内容

```text
ohos-design-architecture-evidence-query/
  SKILL.md                 Tier 1：运行时安装 + CLI 入口与误读边界（≤180 行）
  README.md                本文件
  bootstrap.py             唯一入口：只负责安装，不执行查询
  oskm_runtime/
    bootstrap.py           命令分派、--runtime-root 摘取（**不跑查询**）
    cli_install.py         CLI 三级定位、结构校验（verify_pyz）与载入
    environment.py         端点与 .env（DB/SDK 归档 + CLI 产物）
    db_download.py         HTTP、安全解压、SQLite 校验、原子替换
    install.py             安装与回滚、源码树探测、显式刷新
    state.py               .oskm-runtime.json、廉价刷新判定（供 refresh 用）
    doctor.py              环境自检
    .env.example           配置模板（真实 .env 不发布）
  references/
    usage.md               CLI 与运行时完整用法（人读）
    tools.md               工具索引，由 `ask --list --markdown` 生成
    spec/                  Tier 2：14 模块 52 工具的字段级规格
  examples/                CLI 查询示例（运行时安装见 usage.md）
  evals/
    evals.json            下载、安装、CLI 解析与回滚行为评估
```

发布包**不包含**查询引擎（`oskm_cli/`）、表定义（`oskm_schema/`）、采集器
（`oskm/`）、测试、构建脚本、维护者设计/打包文档或缓存文件。需要生成新库时，
回到 `packages/oskm` 源码环境使用扫描器。

## 规范评审记录（2026-11-12）

依据《OpenHarmony Agent Skill 实践指导书》完成组织规范重构。已实际执行
`skill-creator` 的 `scripts/quick_validate.py`：系统 Python 缺少 PyYAML，因此在
临时虚拟环境安装 PyYAML 后运行，结果为 `Skill is valid!`。仓库内
`test_frontmatter_passes_skill_creator_rules` 持续覆盖同一组 frontmatter 规则，
`SkillMatchesOrgGuide` 另外校验七节职责、参考文件可达性和正文平台中立性。

| 维度 | 结论 | 依据 |
|---|---|---|
| D1 知识增量 | 通过 | 保留运行时分发边界、CLI 解析顺序、证据降级与误读判据，删除通用教程和数据库统计 |
| D2 心智模型 | 通过 | §3 给出固定判断顺序，§4 按 `arch` / `ask` / `diff` / `sql` 分支选择 |
| D3 反模式质量 | 通过 | §5 每条均为真实高风险误判，并写明违反后的具体后果 |
| D4 规范符合度 | 通过 | frontmatter、七节骨架、触发式 description 和条件引用均通过门禁 |
| D5 渐进披露 | 通过 | `SKILL.md` 控制在 180 行；规格、示例、评估和完整用法按问题路由 |
| D6 自由度校准 | 通过 | §4.5 明示为启发式；§5 明示为硬约束，违规后果可判断 |
| D7 模式合理性 | 通过 | 结构服务于“先装运行时、再定位 CLI、后选查询入口”的真实使用流程 |
| D-8 实用可用性 | 通过 | 命令可直接运行，异常、退出码和查询/安装排错均有回退路径 |

准入检查无阻断项；`D1`、`D4`、`D-8` 均达到发布门槛。未发现开放规范、组织规范与
`skill-creator` 工作流之间的冲突。
