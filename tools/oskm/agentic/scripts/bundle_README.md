# oskm

OpenHarmony 产品顶层架构的**只读查询 skill**。包内只有查询 CLI、工具文档和中立的
表结构定义，不包含采集器，也不会扫描、编译或修改数据库。

## 环境要求

- Python 3.10+
- 不要求 Git，也没有第三方 Python 依赖
- 蓝区直接使用构建 API；黄区地址不写入发布包，复制 `agentic/.env.example` 为
  本地 `agentic/.env` 并填写 `OSKM_YELLOW_DB_BASE_URL`；真实 `.env` 不会随包发布
- `install` 只下载一个 `knowledge.tar.gz`，解压后包含 `knowledge.db`、
  `interface/sdk-js/` 和 `interface/sdk_c/`

Windows 下把下文的 `python3` 换成 `py -3`。

## 名称与安装位置

skill 名称、发布归档、解压根目录和安装目录的叶子名统一使用 `oskm`。**父目录由
宿主 AI 工具决定，不能把某一家工具的路径当成通用安装路径**：

- Claude Code 项目级：`.claude/skills/oskm/`
- Claude Code 用户级：`~/.claude/skills/oskm/`
- Codex 用户级：`${CODEX_HOME:-$HOME/.codex}/skills/oskm/`
- 其他工具：`<tool-skill-root>/oskm/`
- 运行时数据：`~/.oskm/`（不是 skill 安装目录）

发布归档名为 `oskm-<version>.tar.gz`，解压后得到单根目录 `oskm/`；安装到任意
工具的 skill root 时都保留这个叶子目录名，不要改名，否则会与 `SKILL.md`
frontmatter 中的 `name: oskm` 不一致。

## 快速开始

```bash
tar -xzf oskm-*.tar.gz
cd oskm

# 仅黄区首次使用时
cp agentic/.env.example agentic/.env
"${EDITOR:-vi}" agentic/.env

# OSKM_DEFAULT_ZONE 默认 blue；切黄区时命令显式加 --zone yellow。

python3 -m agentic.runtime doctor
python3 -m agentic ask --list

# 首次使用：安装 DB + interface/sdk-js + interface/sdk_c 到推荐目录
# 黄区（已按上文将 OSKM_DEFAULT_ZONE 设为 yellow）
python3 -m agentic.runtime install --zone yellow --runtime-root ~/.oskm
# 蓝区（component 必填）
python3 -m agentic.runtime install --zone blue --runtime-root ~/.oskm --component <component>

python3 -m agentic --db ~/.oskm/knowledge.db arch overview
python3 -m agentic --db ~/.oskm/knowledge.db ask get_component --name ace_engine
```

如果 `~/.oskm/knowledge.db` 不存在，先执行上面的 `install`，成功后再查询。
查询 CLI 只自动刷新带 `.oskm-runtime.json` 的托管运行时；不会因为任意缺失的
`--db` 路径自动联网。蓝区首次安装必须同时指定 `--component`。

如果不在包根运行，把包根加入 `PYTHONPATH`：

```bash
PYTHONPATH=/path/to/oskm python3 -m agentic ask --list
```

`--product rk3568` 会依次查找当前目录和包根下的
`artifacts/rk3568/knowledge.db`。发布包通常应显式使用 `--db`。

## 构建和更新数据

```bash
# 只下载指定日期的 DB
python3 -m agentic.runtime download-db \
  --zone yellow --date 20261102 --output knowledge.db

# 一次安装 knowledge.db + interface/sdk-js + interface/sdk_c
python3 -m agentic.runtime install --zone yellow --runtime-root ~/.oskm
```

归档根目录必须严格采用以下结构；安装器会拒绝未知顶层路径、绝对路径、`..` 和
逃逸 SDK 目录树的符号链接：

```text
knowledge.tar.gz
├── knowledge.db
└── interface/
    ├── sdk-js/
    └── sdk_c/
```

`download-db` 也可以从同一个归档中只提取 `knowledge.db`，并保留对历史独立 DB/
zip/tar 下载物的兼容。

`scan` 是采集侧能力，不属于这个只读发布包；需要生成新的 `knowledge.db` 时，
请在 `packages/oskm` 源码环境中运行扫描器。

## 包内容

```text
oskm/
  SKILL.md
  README.md
  agentic/
  oskm_schema/
```

数据库事实只读查询；包内没有同名采集器模块 `oskm/oskm/`，也没有
`oskm/collectors/`。
