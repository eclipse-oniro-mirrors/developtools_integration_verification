# oskm Agent 集成文档

oskm 面向 AI Agent 的方案设计与实施文档。

## 文档索引

| 文档 | 内容 |
|------|------|
| [mcp-design.md](./mcp-design.md) | MCP Server 详细设计：架构、文件结构、模块映射、关键算法（git_url/sql_query BFS）、错误处理、多库对比、部署 |
| [usage.md](./usage.md) | 使用指南：启动配置（Claude Desktop/opencode）、典型问答、多库对比、工具速查 |
| [spec/](./spec/) | 12 模块 43 工具的功能规格表（参数/返回/错误码/示例） |

## 快速导览

### 设计层面
- **架构与进程模型** → [mcp-design §1](./mcp-design.md#1-架构)
- **文件结构** → [mcp-design §2](./mcp-design.md#2-文件结构)
- **工具 → Python API 映射** → [mcp-design §3](./mcp-design.md#3-模块映射mcp-工具--python-api)
- **git_url 算法** → [mcp-design §4.1](./mcp-design.md#41-git_url-构建)
- **sql_query 安全检查** → [mcp-design §4.2](./mcp-design.md#42-sql_query-安全检查)
- **ELF 依赖 BFS（递归 CTE）** → [mcp-design §4.3](./mcp-design.md#43-elf_dependencies-bfs-闭包)
- **错误码总表** → [mcp-design §5.2](./mcp-design.md#52-错误码总表)
- **多库对比** → [mcp-design §10](./mcp-design.md#10-多库对比与多会话)
- **设计决策记录** → [mcp-design §9](./mcp-design.md#9-设计决策记录)

### 使用层面
- **启动配置** → [usage §2](./usage.md#2-启动方式)
- **典型问答** → [usage §3](./usage.md#3-典型问答)
- **多库对比流程** → [usage §4](./usage.md#4-多库对比)

### 规格层面
- **工具速查表（43 工具）** → [spec/README.md](./spec/README.md)
- **各模块详细规格** → [spec/*.md](./spec/)
