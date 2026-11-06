# query 模块 — MCP 工具规格

通用列表/聚合查询与受限 SQL 逃生口。覆盖各域 typed 工具未封装的临时查询需求。

## 工具清单

| 工具 | 说明 |
|------|------|
| `list_entities` | 任意域的分页列表查询 |
| `aggregate` | 任意域的分组聚合 |
| `sql_query` | 受限只读原始 SQL（逃生口） |

---

## list_entities

对任意已注册域的表做分页列表查询，支持过滤与排序。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `table` | string | ✓ | 表名（如 `components`、`services`、`gn_args`、`install_modules`、`elf_modules`） |
| `filters` | object | | 过滤条件，键是列名，值是匹配值。如 `{"subsystem": "ability", "type": "sa"}` |
| `sort` | string | | 排序列名 |
| `desc` | bool | | 降序排序，默认 false |
| `page` | object | | 分页：`{"limit": 100, "cursor": null}`。limit 默认 100，上限 1000 |

**返回**

```json
{
  "items": [
    {"id": 5, "name": "ability_runtime", "subsystem": "ability", ...},
    {"id": 12, "name": "bar_runtime", "subsystem": "ability", ...}
  ],
  "total": 382,
  "next_cursor": "eyJvZmZzZXQiOjEwMH0"
}
```

`next_cursor` 为 null 表示已到末尾。`items` 每行是该表发布记录的完整 dict（含 JOIN 解析的 `component` 显示名等）。`filters` 是等值匹配；非等值过滤用 `sql_query`。

**错误码**

| code | 说明 |
|------|------|
| `INVALID_TABLE` | `table` 不是已注册的表 |
| `INVALID_FILTER` | `filters` 中有未知列名 |
| `INVALID_CURSOR` | 游标无效或扫描已变更（result fingerprint 不匹配） |
| `NO_SESSION` | 未建立会话 |

---

## aggregate

对任意域的表按 1-3 个维度做分组聚合，返回每组的行数。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `table` | string | ✓ | 表名 |
| `group_by` | [string] | ✓ | 分组维度列表，1-3 个列名（如 `["subsystem"]`、`["subsystem", "type"]`） |
| `filters` | object | | 过滤条件（同 `list_entities`） |
| `page` | object | | 分页 |

**返回**

```json
{
  "groups": [
    {"key": "ability", "count": 42},
    {"key": "arkui", "count": 15},
    {"key": "communication", "count": 23}
  ],
  "total": 382
}
```

多维分组时 `key` 是各维度值用 `/` 连接（如 `"ability/lib"`）。空值分组显示为 `(null)`。按 `count` 降序排列。

**错误码**

| code | 说明 |
|------|------|
| `INVALID_TABLE` | 表名未注册 |
| `INVALID_GROUP_BY` | 分组列不存在，或超过 3 个维度 |
| `INVALID_FILTER` | 过滤列不存在 |

---

## sql_query

受限只读 SQL 逃生口。当 typed 工具覆盖不到时（多表 JOIN + 子查询），允许 Agent 直接执行 SQL。

**安全约束**

1. **只读**：SQL 必须以 `SELECT` 或 `WITH` 开头，否则拒绝
2. **scan_id 注入**：如果 SQL 不含 `scan_id` 字面量，自动追加 `WHERE scan_id = ?`（对第一个扫描表）
3. **行数限制**：自动追加 `LIMIT`，默认 1000，可通过 `limit` 参数调低
4. **超时**：5 秒，防止全表扫描阻塞
5. **表名白名单**：FROM/JOIN 的表必须在已注册表列表中（`framework.tables()`）。**支持 `alias.table` 格式**：alias 必须是通过 `attach_secondary` 挂载的别名，table 必须在白名单中
6. **禁止 PRAGMA/ATTACH**：不允许 `PRAGMA` 语句；ATTACH 只能通过 `attach_secondary` 工具执行，Agent 不能在 SQL 中自己 ATTACH

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `sql` | string | ✓ | SQL 语句 |
| `params` | [any] | | 参数化查询的绑定值列表（`?` 占位） |
| `limit` | int | | 返回行数上限，默认 1000，最大 1000 |

**返回**

```json
{
  "rows": [
    {"component": "ability_runtime", "feature_count": 12},
    {"component": "ace_engine", "feature_count": 8}
  ],
  "row_count": 2,
  "truncated": false
}
```

`truncated` 为 true 表示实际匹配超过 `limit` 被截断。

**示例**：查每个部件的 feature 数量

```json
// 请求
{
  "sql": "SELECT c.name AS component, COUNT(f.id) AS feature_count
          FROM components c
          LEFT JOIN features f ON f.scan_id = c.scan_id AND f.component_id = c.id
          GROUP BY c.id ORDER BY feature_count DESC LIMIT 10"
}
// 响应
{
  "rows": [
    {"component": "ace_engine", "feature_count": 35},
    {"component": "ability_runtime", "feature_count": 12}
  ],
  "row_count": 2,
  "truncated": false
}
```

**错误码**

| code | 说明 |
|------|------|
| `NOT_READ_ONLY` | SQL 不是 SELECT/WITH 开头 |
| `TABLE_NOT_ALLOWED` | 引用了未注册的表，或别名未 ATTACH |
| `ALIAS_NOT_ATTACHED` | SQL 引用了未挂载的别名 |
| `PRAGMA_FORBIDDEN` | 包含 PRAGMA 语句 |
| `ATTACH_FORBIDDEN` | 包含 ATTACH/DETACH 语句（只能用 attach_secondary 工具） |
| `SQL_ERROR` | SQLite 执行报错（语法错误、列不存在等） |
| `TIMEOUT` | 执行超过 5 秒 |
| `NO_SESSION` | 未建立会话 |
