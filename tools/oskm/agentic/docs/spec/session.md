# session 模块 — MCP 工具规格

管理 MCP server 与 oskm 数据库之间的会话生命周期，支持多会话与跨库对比。

## 工具清单

| 工具 | 说明 |
|------|------|
| `open_session` | 连接已扫描的 knowledge.db，建立只读会话，返回 session_id |
| `close_session` | 关闭指定或当前会话 |
| `switch_session` | 切换 active session |
| `list_sessions` | 列出所有已打开的会话 |
| `get_scan_info` | 返回当前会话绑定的扫描元数据 |
| `list_scans` | 列出数据库中所有已完成的扫描 |
| `get_link_stats` | 返回 component_links 的关联命中统计 |
| `attach_secondary` | ATTACH 另一个数据库到当前连接，用于跨库对比 |
| `detach_secondary` | DETACH 已挂载的别名数据库 |
| `diff_scans` | 两个扫描的结构化差异对比 |

---

## open_session

连接一个已扫描的 SQLite 数据库，建立只读会话。支持多会话并存——每次调用返回新的 `session_id`，新会话成为 active。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `db_path` | string | ✓ | `knowledge.db` 文件绝对路径 |
| `scan_id` | int | | 复用指定扫描；省略则自动选最新已完成扫描 |
| `product` | string | | 按产品名筛选最新扫描；与 `scan_id` 互斥 |

**返回**

```json
{
  "session_id": 1,
  "scan_id": 2,
  "product": "rk3568",
  "status": "complete",
  "collectors": ["repos", "components", "args", "install_modules",
                  "component_links", "elf_modules", "services", "hdi", "sas"],
  "started_at": "2026-10-20T06:11:30+00:00",
  "finished_at": "2026-10-20T06:12:02+00:00"
}
```

`session_id` 用于后续 `switch_session` / `close_session` 指定会话。最新打开的会话自动成为 active。

**错误码**

| code | 说明 |
|------|------|
| `DB_NOT_FOUND` | `db_path` 文件不存在 |
| `NO_COMPLETED_SCAN` | 库中没有已完成的扫描（`finished_at` 非空） |
| `SCAN_NOT_FOUND` | 指定的 `scan_id` 不存在 |
| `DB_CORRUPT` | SQLite 打开失败或 PRAGMA foreign_keys 报错 |

---

## close_session

关闭会话。不传 `session_id` 时关闭当前 active 会话。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `session_id` | int | | 要关闭的会话 id；省略则关闭当前 active 会话 |

**返回**

```json
{"closed": true, "session_id": 1}
```

关闭 active 会话后，如果有其他会话，最近打开的成为新 active。如果没有会话，后续工具返回 `NO_SESSION`。DETACH 的别名随连接关闭自动释放。

---

## switch_session

切换 active session。后续工具调用（不传 `session_id` 时）操作此会话。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `session_id` | int | ✓ | 要切换到的会话 id |

**返回**

```json
{"session_id": 2, "scan_id": 3, "product": "rk3568"}
```

**错误码**

| code | 说明 |
|------|------|
| `INVALID_SESSION_ID` | `session_id` 不存在或已关闭 |

---

## list_sessions

列出所有已打开的会话。

**参数**：无

**返回**

```json
{
  "sessions": [
    {"session_id": 1, "scan_id": 2, "product": "rk3568", "db_path": "/path/a.db", "active": true},
    {"session_id": 2, "scan_id": 1, "product": "rk3568", "db_path": "/path/b.db", "active": false}
  ],
  "attached_aliases": ["baseline"]
}
```

`attached_aliases` 列出当前 active session 上 ATTACH 的别名数据库（由 `attach_secondary` 挂载）。

---

## get_scan_info

返回当前 active 会话绑定的扫描的完整元数据。

**参数**：无

**返回**

```json
{
  "session_id": 1,
  "scan_id": 2,
  "product": "rk3568",
  "workspace_root": "/path/to/workspace",
  "status": "complete",
  "started_at": "2026-10-20T06:11:30+00:00",
  "finished_at": "2026-10-20T06:12:02+00:00",
  "collectors": [
    {"name": "repos", "status": "complete", "schema_version": "1.0.0", "record_count": 38},
    {"name": "components", "status": "complete", "schema_version": "2.1.0", "record_count": 382}
  ],
  "attached_aliases": ["baseline"]
}
```

**错误码**

| code | 说明 |
|------|------|
| `NO_SESSION` | 未调用 `open_session` 或已 `close_session` |

---

## list_scans

列出当前 active 会话的数据库中所有扫描（含未完成的），按 `scan_id` 降序。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `limit` | int | | 最大返回数，默认 20，上限 100 |

**返回**

```json
{
  "scans": [
    {
      "scan_id": 2,
      "product": "rk3568",
      "status": "complete",
      "started_at": "2026-10-20T06:11:30+00:00",
      "finished_at": "2026-10-20T06:12:02+00:00"
    }
  ]
}
```

---

## get_link_stats

返回 `component_links` 采集器的关联命中统计。

**参数**：无

**返回**

```json
{
  "features": {"linked": 1311, "unresolved": 40, "total": 1351, "hit_rate": 0.970},
  "innerapis": {"linked": 1234, "unresolved": 477, "total": 1711, "hit_rate": 0.721}
}
```

如果 `component_links` 采集器未运行，返回 `{"features": null, "innerapis": null}`。

---

## attach_secondary

在当前 active session 的 SQLite 连接上 `ATTACH DATABASE` 挂载另一个数据库。挂载后，`sql_query` 可用 `alias.table_name` 引用挂载库的表做跨库 JOIN。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `db_path` | string | ✓ | 另一个 `knowledge.db` 的绝对路径 |
| `alias` | string | | 别名，默认 `"secondary"`。必须是合法 SQL 标识符（`[a-z_][a-z0-9_]*`） |

**返回**

```json
{
  "alias": "baseline",
  "db_path": "/path/to/baseline.db",
  "tables": ["components", "services", "gn_args", ...]
}
```

`tables` 列出挂载库中已注册的表名，供 Agent 构造跨库 SQL 时参考。

**安全约束**

- 以只读模式挂载（`ATTACH DATABASE 'path' AS alias`，连接级 `PRAGMA query_only = ON` 生效）
- 同一别名不可重复挂载（先 `detach_secondary`）
- Agent 不能通过 `sql_query` 自己执行 ATTACH（`security.py` 的 `FORBIDDEN` 正则仍匹配 ATTACH）

**错误码**

| code | 说明 |
|------|------|
| `ALIAS_EXISTS` | 别名已被占用 |
| `DB_NOT_FOUND` | `db_path` 不存在 |
| `DB_CORRUPT` | 挂载库打开失败或 schema 不兼容 |
| `NO_SESSION` | 无 active session |

---

## detach_secondary

卸载已挂载的别名数据库。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `alias` | string | ✓ | 要卸载的别名 |

**返回**

```json
{"detached": true, "alias": "baseline"}
```

**错误码**

| code | 说明 |
|------|------|
| `ALIAS_NOT_FOUND` | 别名未挂载 |

---

## diff_scans

对两个扫描做结构化差异对比，返回新增/删除/变更的实体。支持同库对比（两个 scan_id 在同一数据库）与跨库对比（scan_b 在 ATTACH 的别名库中）。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `entity` | string | ✓ | 对比实体：`components`/`gn_args`/`features`/`services`/`install_modules`/`innerapis` |
| `scan_a` | int | ✓ | 主扫描 id（当前 active session 的数据库） |
| `scan_b` | int | ✓ | 对比扫描 id |
| `db_b` | string | | scan_b 所在的 ATTACH 别名。省略时 scan_b 在当前库 |
| `fields` | [string] | | 只对比指定字段（默认对比该 entity 的标准字段集） |

**返回**

```json
{
  "entity": "components",
  "scan_a": 2,
  "scan_b": 1,
  "added": ["new_component"],
  "removed": ["legacy_part"],
  "changed": [
    {
      "key": "ability_runtime",
      "changes": [
        {"field": "deps", "before": {"components": ["ace_engine"]}, "after": {"components": ["ace_engine", "bundle_framework"]}}
      ]
    }
  ]
}
```

`added` 是 scan_b 有但 scan_a 没有的（新增）。`removed` 是 scan_a 有但 scan_b 没有的（删除）。`changed` 是两边都有但字段值不同的。`key` 是该实体的主键值。

各 entity 的主键与默认对比字段：

| entity | 主键 | 默认对比字段 |
|--------|------|------------|
| `components` | `name` | `subsystem`, `deps`, `repo_id` |
| `gn_args` | `name` | `current_value`, `has_override` |
| `features` | `(component_id, value)` | `gn_arg_id` |
| `services` | `(cfg, name)` | `type`, `executable`, `component_id` |
| `install_modules` | `label` | `type`, `component_id` |
| `innerapis` | `name` | `install_module_id` |

`added`/`removed` 返回主键值（标量或数组）；`features` 的主键是复合键，返回 `{"component": "ability_runtime", "value": "feature_name"}`。

**错误码**

| code | 说明 |
|------|------|
| `INVALID_ENTITY` | `entity` 不在支持的列表中 |
| `SCAN_NOT_FOUND` | `scan_a` 或 `scan_b` 在对应库中不存在 |
| `ALIAS_NOT_FOUND` | `db_b` 指定的别名未 ATTACH |
| `NO_SESSION` | 无 active session |
