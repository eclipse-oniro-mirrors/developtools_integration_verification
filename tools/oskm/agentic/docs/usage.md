# oskm MCP Server 使用指南

## 1. 前置条件

```bash
cd packages/oskm
# oskm 本身零依赖，MCP server 也是纯标准库实现
python3 -c "from oskm.core.session import ScanSession; print('OK')"
```

需要一个已扫描的 `knowledge.db` 文件（由 `oskm scan` 生成）。

## 2. 启动方式

### 2.1 命令行直接运行

```bash
python3 -m agentic.mcp.server --db /path/to/knowledge.db
```

Server 启动后通过 stdin/stdout 收发 JSON-RPC 消息。手动测试：

```bash
echo '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' | \
  python3 -m agentic.mcp.server --db /path/to/knowledge.db 2>/dev/null
```

### 2.2 Claude Desktop 配置

编辑 `~/Library/Application Support/Claude/claude_desktop_config.json`（macOS）：

```json
{
  "mcpServers": {
    "oskm": {
      "command": "python3",
      "args": [
        "-m", "agentic.mcp.server",
        "--db", "/path/to/KnowledgeBase/artifacts/rk3568/knowledge.db"
      ],
      "cwd": "/path/to/KnowledgeBase/packages/oskm"
    }
  }
}
```

重启 Claude Desktop 后，oskm 的 43 个工具自动可用。

### 2.3 opencode 配置

编辑 `.opencode/opencode.json` 或 `~/.config/opencode/opencode.json`：

```json
{
  "mcp": {
    "oskm": {
      "type": "stdio",
      "command": "python3",
      "args": ["-m", "agentic.mcp.server",
               "--db", "/path/to/knowledge.db"],
      "cwd": "/path/to/KnowledgeBase/packages/oskm"
    }
  }
}
```

## 3. 典型问答

启动后直接问 Agent 以下问题，Agent 会自动选择合适的工具：

### 3.1 路径归属

> "system/lib/libcamera.z.so 属于哪个部件？"

Agent 调用 `owner_of` → 返回部件名、安装模块 GN label。

### 3.2 部件信息

> "ability_runtime 部件有哪些 feature？它们的值是什么？"

Agent 调用 `get_component` → `component_features` → 返回特性名 + gn_arg 当前值。

> "ability_runtime 的 bundle.json 在 gitcode 上的地址是什么？"

Agent 调用 `get_component` → 返回值含 `manifest_url` 字段。

### 3.3 服务与 SA

> "foundation 进程跑哪些 SA？"

Agent 调用 `search_services(query="foundation")` → `service_hosted(service_id, "sas")`。

> "SA 1401 是什么？"

Agent 调用 `get_sa(sa_id=1401)` → 返回 libpath、profile、宿主服务、归属部件。

### 3.4 ELF 依赖

> "libfoo.z.so 依赖哪些库？"

Agent 调用 `search_elf_modules(query="libfoo")` → `elf_dependencies(dest, max_distance=3)`。

### 3.5 编译参数

> "ace_engine_feature_enable_web 的当前值是什么？声明在哪个文件？"

Agent 调用 `get_gn_arg(name="ace_engine_feature_enable_web")` → 返回 current_value + decl_file + source_url。

### 3.6 依赖关系

> "哪些部件依赖 ace_engine？"

Agent 调用 `get_component(name="ace_engine")` → `component_dependents(component_id)`。

### 3.7 搜索

> "找到名字含 audio 的部件"

Agent 调用 `search_components(query="audio")`。

### 3.8 质量问题

> "扫描有哪些质量问题？"

Agent 调用 `list_issues()` → 返回所有 issue，含 advisory 区分。

### 3.9 自定义 SQL

> "按子系统统计每个部件数，并按数量降序排列"

Agent 调用 `aggregate(table="components", group_by=["subsystem"])` 或 `sql_query`。

## 4. 多库对比

> "本次扫描和上次扫描之间，哪些部件是新增的？"

Agent 调用：

```
1. open_session(db_path="/path/to/current.db", scan_id=2)  → session_id=1
2. attach_secondary(db_path="/path/to/baseline.db", alias="baseline")
3. diff_scans(entity="components", scan_a=2, scan_b=1, db_b="baseline")
   → {added: ["new_part"], removed: ["old_part"], changed: [...]}
4. detach_secondary(alias="baseline")
```

> "哪些编译参数的值变了？"

```
diff_scans(entity="gn_args", scan_a=2, scan_b=1, db_b="baseline")
→ {changed: [{key: "ace_engine_feature_enable_web", changes: [{field: "current_value", before: true, after: false}]}]}
```

> "跨库 JOIN：哪些 feature 在两次扫描中值不同？"

```
1. attach_secondary(db_path="/path/to/baseline.db", alias="b")
2. sql_query(sql="SELECT f.value, g.current_value AS new, g2.current_value AS old
     FROM features f
     JOIN gn_args g ON g.id = f.gn_arg_id
     JOIN b.features f2 ON f2.value = f.value AND f2.scan_id = 1
     JOIN b.gn_args g2 ON g2.id = f2.gn_arg_id AND g2.scan_id = 1
     WHERE f.scan_id = 2 AND g.current_value != g2.current_value")
3. detach_secondary(alias="b")
```

## 5. 工具速查

共 43 个工具，12 个模块。完整规格见 `agentic/docs/spec/`。

| 模块 | 工具 | 一句话 |
|------|------|--------|
| session | `open_session` | 连接数据库 |
| session | `get_scan_info` | 扫描元数据 |
| session | `get_link_stats` | 关联命中率 |
| session | `attach_secondary` | 挂载对比库 |
| session | `diff_scans` | 结构化差异 |
| repos | `get_repo` / `list_repos` | 代码仓 |
| repos | `git_url` | 路径→git URL |
| component | `get_component` / `search_components` | 部件查找 |
| component | `component_attached` | 各域记录 |
| component | `component_dependencies` / `dependents` | 依赖关系 |
| component | `component_features` / `syscaps` / `innerapis` | 特性 / SysCap / InnerAPI |
| service | `get_service` / `search_services` | 系统服务 |
| service | `service_hosted` | SA/HDI |
| install | `get_install_module` / `search_install_modules` | 安装模块 |
| install | `owner_of` / `installed_at` | 路径归属 |
| gn_args | `get_gn_arg` / `search_gn_args` | 编译参数 |
| elf | `search_elf_modules` / `elf_dependencies` / `elf_dependents` | ELF 依赖图 |
| sa | `get_sa` / `search_sas` | SA 服务 |
| hdi | `get_hdi` / `search_hdis` | HDI 设备 |
| query | `list_entities` / `aggregate` | 通用查询 |
| query | `sql_query` | 受限 SQL 逃生口 |
| issues | `list_issues` | 质量问题 |
| schema | `get_schema` / `get_tables` | 数据库自描述 |

## 6. 切换扫描

同一数据库有多次扫描时，可切换：

```bash
# 启动时不指定 scan_id → 自动选最新
python3 -m agentic.mcp.server --db /path/to/knowledge.db

# 指定 scan_id
python3 -m agentic.mcp.server --db /path/to/knowledge.db --scan-id 1
```

运行时也可通过 `open_session` 切换：

```
open_session(db_path="/path/to/knowledge.db", scan_id=1)  → session_id=2
switch_session(session_id=2)
```

## 7. 测试

```bash
# MCP 测试（安全 + 端到端 + 多库对比）
python3 -m unittest discover -s agentic/mcp/tests -p "test_*.py"

# oskm 核心测试
python3 -m unittest discover -s oskm/tests -p "test_*.py"
```
