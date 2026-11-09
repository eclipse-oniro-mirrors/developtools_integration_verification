# oskm 查询层文档

`agentic/` 是 oskm 的查询前端；发布时与中立的 `oskm_schema/` 一起打成
`oskm/`，可以脱离 `packages/oskm/` 单独运行。
运行时来自一个统一归档 `knowledge.tar.gz`，解压后为 `knowledge.db`、
`interface/sdk-js` 与 `interface/sdk_c`。安装不再从 Git 仓库拉取 SDK，也不要求平台
凭据或 SDK 分支。初始化与校验见 [usage.md](./usage.md#1-运行时与前置条件)。
黄区归档公共前缀通过 `OSKM_YELLOW_DB_BASE_URL` 在运行环境中提供，不写入仓库。
仓库只提交 `.env.example` 模板；复制为本地 `.env` 后运行器会自动读取，真实文件
由 `.gitignore` 排除。

```
agentic/
  SKILL.md          Tier 1：六类架构问题 + 容易误读的（≤150 行）
  db_download.py    跨平台 HTTP、统一归档安全解压、SQLite 校验与原子输出
  runtime.py        运行时安装、状态、自动刷新与 CLI
  scripts/          Unix 兼容包装器；Windows 直接调用 Python 模块
  reference/
    tools.md        工具索引，由 `oskm ask --list --markdown` 生成
  cli.py            ask / arch / diff / sql 四个子命令
  query/            工具注册表、会话、SQL 校验、git 链接
  docs/
    usage.md        CLI 完整用法（人读）
    spec/           Tier 2：13 模块 50 工具的字段级规格
    skill-design.md 设计与取舍，含实施中偏离方案的地方
```

发布包的根目录是 `oskm/`，只包含 `agentic/` 与 `oskm_schema/`，不包含
同名采集器模块 `oskm/oskm/`。查询层使用 `agentic/query/readonly_session.py`，只读打开已有
`knowledge.db`；需要生成新库时才回到源码仓使用扫描器。入口和构建方式：

```bash
# 在源码仓 packages/oskm 中构建
python3 -m agentic.scripts.build_bundle

# 在解压后的 oskm/ 中运行
python3 -m agentic ask|arch|diff|sql …
python3 -m agentic.runtime doctor
```

归档名、解压根目录和安装目录的叶子名统一为 `oskm`：归档是
`dist/oskm-<version>.tar.gz`，解压后得到 `oskm/`。安装父目录由宿主 AI 工具决定：
Claude Code 项目级为 `.claude/skills/oskm/`、用户级为 `~/.claude/skills/oskm/`；
Codex 用户级为 `${CODEX_HOME:-$HOME/.codex}/skills/oskm/`；其他工具使用各自的 skill
root。运行时数据仍单独放在 `~/.oskm/`。

## 从哪开始

| 你想 | 看这个 |
|---|---|
| 直接用 | [usage.md](./usage.md) |
| 让 Agent 用 | [../SKILL.md](../SKILL.md) |
| 查某个工具的字段 | [spec/](./spec/) |
| 知道为什么是这样 | [skill-design.md](./skill-design.md) |
| 想独立发布这个包 | [standalone-packaging.md](./standalone-packaging.md) —— 已实施的只读发布方案与历史分析 |
| 想加表 / 改表 | [../../oskm_schema/schema-single-source.md](../../oskm_schema/schema-single-source.md) —— 表结构单一真相源，以及改表时两边怎么保持一致 |

## 2026-10-29 删掉的文档

MCP server 一并删除时清掉了四份已失效的文档，**git 历史里仍可查**：

| 文档 | 为什么删 | 其中仍有效的内容去了哪 |
|---|---|---|
| `mcp-design.md`（829 行） | 描述的是已删除的 MCP server | §4 的算法（git_url / sql 校验 / ELF 闭包）在 [spec/repos.md](./spec/repos.md)、[spec/query.md](./spec/query.md)、[spec/elf.md](./spec/elf.md) 与代码注释里 |
| `transport-stdio-vs-http.md` | 没有传输层要选了 | §5 的 `elf_dependencies` 改造记在 `query/tools/elf.py` 的文档字符串与 `tests/test_elf_tools.py` |
| `cli-vs-mcp.md` | 结论（MCP 与 CLI 并存）已被推翻 | 量化与样机结论收进了 [skill-design.md](./skill-design.md) |
| `tool-scenarios.md` | 按 MCP 工具名组织的场景表，末尾还带着旧版 AGENTS.md 草稿 | 场景改由 SKILL.md 的六类问题承载 |

留着作废文档会让人读到相反的结论；把**仍然成立的论据**搬到现行文档里、
把**判断变化的过程**留在 git 历史里，比两边都留一份更不容易出错。
