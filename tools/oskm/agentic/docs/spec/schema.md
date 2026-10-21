# schema 模块 — MCP 工具规格

数据库结构自描述。让 Agent 了解可查的表、列、外键关系，辅助构造 SQL 与理解返回结构。

## 工具清单

| 工具 | 说明 |
|------|------|
| `get_schema` | 返回全部表的列定义与外键关系图 |
| `get_tables` | 返回已注册表名列表（轻量版） |

---

## get_schema

返回数据库全部表的完整 schema：列定义、外键关系（正反双向）、索引。供 Agent 自主构造 JOIN 查询。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `table` | string | | 只返回指定表的 schema。省略时返回全部表 |

**返回**

```json
{
  "tables": [
    {
      "name": "components",
      "columns": [
        {"name": "id", "type": "INTEGER", "nullable": false, "primary_key": true},
        {"name": "scan_id", "type": "INTEGER", "nullable": false, "references": "scans(id)"},
        {"name": "name", "type": "TEXT", "nullable": false},
        {"name": "subsystem", "type": "TEXT", "nullable": true},
        {"name": "manifest", "type": "TEXT", "nullable": true},
        {"name": "repo_id", "type": "INTEGER", "nullable": true, "references": "repos(id)"},
        {"name": "deps", "type": "JSON", "nullable": true},
        {"name": "record", "type": "JSON", "nullable": true}
      ],
      "primary_key": ["id"],
      "indexes": [
        {"name": "idx_components_subsystem", "columns": ["scan_id", "subsystem"]},
        {"name": "idx_components_repo", "columns": ["scan_id", "repo_id"]}
      ],
      "outgoing_fks": [
        {"column": "repo_id", "table": "repos", "to": "id", "on_delete": "CASCADE"}
      ],
      "incoming_fks": [
        {"table": "innerapis", "column": "component_id", "to": "id"},
        {"table": "features", "column": "component_id", "to": "id"},
        {"table": "syscaps", "column": "component_id", "to": "id"},
        {"table": "install_modules", "column": "component_id", "to": "id"},
        {"table": "services", "column": "component_id", "to": "id"}
      ]
    }
  ]
}
```

`outgoing_fks` 是本表指向其他表的外键（正方向）。`incoming_fks` 是其他表指向本表的外键（反方向）。`on_delete` 取 `CASCADE` 或 `SET NULL`。`type` 取 `TEXT` / `INTEGER` / `JSON`（JSON 实际存储为 TEXT）。

Agent 可用此工具自行构造多表 JOIN：从 `outgoing_fks`/`incoming_fks` 找到关联表与列，拼出 SQL 后通过 `sql_query` 执行。

---

## get_tables

返回已注册表名列表，按名字排序。比 `get_schema` 轻量——Agent 只需知道有哪些表可查时用。

**参数**：无

**返回**

```json
{
  "tables": [
    "component_links_run",
    "components",
    "elf_module_dependencies",
    "elf_modules",
    "features",
    "gn_args",
    "hdis",
    "innerapis",
    "install_module_tags",
    "install_modules",
    "install_targets",
    "issues",
    "repos",
    "sas",
    "scans",
    "collector_runs",
    "services",
    "syscaps"
  ]
}
```

框架表（`scans`、`collector_runs`、`issues`）也在列表中——Agent 可通过 `sql_query` 查询扫描元数据，但 typed 工具是更好的入口。
