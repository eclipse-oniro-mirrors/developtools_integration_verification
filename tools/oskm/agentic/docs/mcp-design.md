# oskm MCP Server 详细设计方案

日期：2026-10-20
状态：**详细设计**，待实施。

关联文档：
- [agent-integration-analysis.md](./agent-integration-analysis.md) — 方案选型（Skill vs MCP）与现有能力盘点
- [spec/](./spec/) — 12 模块 38 工具的功能规格表（参数/返回/错误码/示例）

本文件聚焦实现层面：架构、文件结构、模块映射、关键算法、错误处理、部署。

## 1. 架构

### 1.1 进程模型

```
Agent (Claude Desktop / opencode / 其他)
    ↕  JSON-RPC over stdio
oskm-mcp-server (Python 单进程)
    ↕  sqlite3 (只读连接)
knowledge.db (SQLite 文件)
```

- **单进程**：一个 Python 进程服务一个 Agent 连接。stdio 传输，无需端口。
- **只读**：server 对数据库只读，不触发扫描、不写数据。
- **有状态**：`ScanSession` 在进程生命周期内复用，跨工具调用共享同一个 SQLite 连接与 scan_id。

### 1.2 生命周期

```
启动 → 读取 db_path 参数 → ScanSession.open(db) → 等待工具调用 → 关闭
```

1. Agent 配置指向 server 脚本：`python3 -m agentic.mcp.server --db /path/to/knowledge.db`
2. server 启动时 `ScanSession.open(db_path)`，绑定最新已完成扫描
3. Agent 通过 `tools/call` 调用工具，server 在 session 上执行
4. Agent 可调 `open_session` 切换 scan_id 或换库
5. 进程退出时 `ScanSession.close()` 自动释放连接

### 1.3 依赖

| 依赖 | 用途 | 是否进 oskm 核心 |
|------|------|:---:|
| `oskm` (本包) | ScanSession + 各域 Query + schema 框架 | 是（已有） |
| `mcp` (PyPI) | MCP SDK：Server、StdioServerTransport、tool decorator | 否（仅 agentic/mcp/） |

oskm 核心保持零第三方依赖。`mcp` SDK 依赖仅存在于 `agentic/mcp/`，不污染 `oskm/core/`。

## 2. 文件结构

```
agentic/
├── docs/
│   ├── README.md                          # 文档索引
│   ├── mcp-design.md                     # 本文件
│   ├── usage.md                          # 使用指南
│   └── spec/
│       ├── README.md                     # 工具索引（43 工具速查）
│       ├── session.md                    # 10 工具（含多库对比）
│       ├── repos.md                      # 3 工具（含 git_url）
│       ├── component.md                  # 8 工具
│       ├── service.md                    # 3 工具
│       ├── install.md                    # 4 工具
│       ├── gn_args.md                    # 2 工具
│       ├── elf.md                        # 3 工具
│       ├── sa.md                         # 2 工具
│       ├── hdi.md                        # 2 工具
│       ├── query.md                      # 3 工具（含 sql_query）
│       ├── issues.md                     # 1 工具
│       └── schema.md                     # 2 工具
└── mcp/
    ├── __init__.py
    ├── server.py                          # 入口：argparse + JSON-RPC over stdio
    ├── session.py                         # 多会话管理（open/close/switch + ATTACH/detach）
    ├── gitlink.py                         # git URL 构建（移植自 viewer/gitlink.js）
    ├── security.py                        # sql_query 安全检查
    ├── tests/
    │   ├── __init__.py
    │   ├── test_security.py              # 22 个安全测试
    │   └── test_e2e.py                    # 28 个端到端测试（含多库对比）
    └── tools/
        ├── __init__.py                    # 注册表 + Tool dataclass + 自动导入全部模块
        ├── session.py                     # 10 工具（含 attach/detach/diff_scans）
        ├── repos.py                       # 3 工具
        ├── component.py                   # 8 工具
        ├── service.py                     # 3 工具
        ├── install.py                     # 4 工具
        ├── gn_args.py                     # 2 工具
        ├── elf.py                         # 3 工具
        ├── sa.py                          # 2 工具
        ├── hdi.py                         # 2 工具
        ├── query.py                       # 3 工具
        ├── issues.py                      # 1 工具
        └── schema.py                      # 2 工具
```

## 3. 模块映射：MCP 工具 → Python API

每个工具模块是一个薄封装层，把 MCP JSON-RPC 参数转成 Python API 调用，再把结果序列化为 JSON。下表列出每个工具的 Python API 来源与封装方式。

### 3.1 session 模块

| MCP 工具 | Python API | 封装方式 |
|---------|-----------|---------|
| `open_session` | `ScanSession.open(db, scan_id?, product?)` | 替换当前 session 引用，返回扫描元数据 |
| `close_session` | `session.close()` | 置空 session 引用，后续调用返回 `NO_SESSION` |
| `get_scan_info` | `session.collectors` + `session.status` + `collector_runs` SQL | 聚合返回 |
| `list_scans` | `db.latest_scan()` 风格 SQL：`SELECT * FROM scans ORDER BY id DESC` | 直接 SQL |
| `get_link_stats` | `SELECT * FROM component_links_run WHERE scan_id = ?` | 直接 SQL |

### 3.2 repos 模块

| MCP 工具 | Python API | 封装方式 |
|---------|-----------|---------|
| `get_repo` | `session.sql('SELECT * FROM repos WHERE scan_id=? AND name=?')` + 组件计数子查询 + `gitlink.git_url(path)` | SQL + URL 构建 |
| `list_repos` | `session.sql('SELECT * FROM repos WHERE scan_id=? ORDER BY name')` + 组件计数 | SQL |
| `git_url` | `gitlink.git_url(path, line)` | 见 §4.1 |

### 3.3 component 模块

| MCP 工具 | Python API | 封装方式 |
|---------|-----------|---------|
| `get_component` | `session.component(name)` → `Component.record` + `.attached()` 计数 + `gitlink.git_url(manifest)` | API + URL |
| `search_components` | `session.sql('SELECT * FROM components WHERE scan_id=? AND name LIKE ?')` | SQL LIKE |
| `component_attached` | `Component.attached(collector?)` | API |
| `component_dependencies` | `Component.dependencies()` | API |
| `component_dependents` | `Component.dependents()` | API |
| `component_features` | `session.sql(features + gn_args JOIN)` | SQL JOIN |
| `component_syscaps` | `session.sql('SELECT value FROM syscaps WHERE scan_id=? AND component_id=?')` | SQL |
| `component_innerapis` | `session.sql(innerapis + install_modules LEFT JOIN)` + `gitlink.git_url(name)` per row | SQL + URL |

### 3.4 service 模块

| MCP 工具 | Python API | 封装方式 |
|---------|-----------|---------|
| `get_service` | `session.service(cfg, name?)` → `.record` | API |
| `search_services` | `session.sql('SELECT * FROM services WHERE scan_id=? AND (name LIKE ? OR cfg LIKE ?)')` | SQL LIKE |
| `service_hosted` | `Service.hosted(collector?)` | API |

### 3.5 install 模块

| MCP 工具 | Python API | 封装方式 |
|---------|-----------|---------|
| `get_install_module` | `session.install_module(label)` → `.record` + `.targets()` + `.tags()` + `gitlink.git_url(label)` | API + URL |
| `search_install_modules` | `session.sql('SELECT * FROM install_modules WHERE scan_id=? AND (label LIKE ? OR label_name LIKE ?)')` | SQL LIKE |
| `owner_of` | `session.owner_of(dest)` → Component | API |
| `installed_at` | `session.installed_at(dest)` | API |

### 3.6 gn_args 模块

| MCP 工具 | Python API | 封装方式 |
|---------|-----------|---------|
| `get_gn_arg` | `session.sql('SELECT * FROM gn_args WHERE scan_id=? AND name=?')` + feature_count 子查询 + `gitlink.git_url(decl_file, decl_line)` | SQL + URL |
| `search_gn_args` | `session.sql('SELECT * FROM gn_args WHERE scan_id=? AND name LIKE ?')` | SQL LIKE |

### 3.7 elf 模块

| MCP 工具 | Python API | 封装方式 |
|---------|-----------|---------|
| `search_elf_modules` | `session.sql('SELECT * FROM elf_modules WHERE scan_id=? AND (soname LIKE ? OR file_name LIKE ?)')` | SQL LIKE |
| `elf_dependencies` | `session.sql()` BFS 闭包查询（见 §4.3） | SQL 递归 |
| `elf_dependents` | `session.sql('SELECT callee.* FROM elf_module_dependencies d JOIN elf_modules caller ON ... WHERE caller.partition=? AND caller.file_name=?')` | SQL JOIN |

### 3.8 sa 模块

| MCP 工具 | Python API | 封装方式 |
|---------|-----------|---------|
| `get_sa` | `session.sql('SELECT * FROM sas WHERE scan_id=? AND sa_id=?')` | SQL |
| `search_sas` | `session.sql('SELECT * FROM sas WHERE scan_id=? AND (libpath LIKE ? OR profile LIKE ?)')` | SQL LIKE |

### 3.9 hdi 模块

| MCP 工具 | Python API | 封装方式 |
|---------|-----------|---------|
| `get_hdi` | `session.sql('SELECT * FROM hdis WHERE scan_id=? AND (service_name=? OR node=?)')` | SQL |
| `search_hdis` | `session.sql('SELECT * FROM hdis WHERE scan_id=? AND (library LIKE ? OR module_name LIKE ? OR node LIKE ? OR service_name LIKE ?)')` | SQL LIKE |

### 3.10 query 模块

| MCP 工具 | Python API | 封装方式 |
|---------|-----------|---------|
| `list_entities` | `session.sql()` + 过滤构造 + LIMIT/OFFSET | SQL 动态构造 |
| `aggregate` | `session.sql()` + GROUP BY 构造 | SQL 动态构造 |
| `sql_query` | `session.sql(sql, params)` + `security.check(sql)` | 见 §4.2 |

### 3.11 issues 模块

| MCP 工具 | Python API | 封装方式 |
|---------|-----------|---------|
| `list_issues` | `session.issues(collector?)` 或 SQL 过滤 | API / SQL |

### 3.12 schema 模块

| MCP 工具 | Python API | 封装方式 |
|---------|-----------|---------|
| `get_schema` | `PRAGMA table_info` + `PRAGMA foreign_key_list`（经 `metadata()`） | PRAGMA |
| `get_tables` | `framework.tables()` 或 `sqlite_master` | API / SQL |

## 4. 关键算法

### 4.1 git_url 构建

移植自 `viewer/src/model/gitlink.js`，Python 实现：

```python
# agentic/mcp/gitlink.py

import re

HOSTS = [
    (re.compile(r'gitlab', re.I),
     lambda base, ref, path: f'{base}/-/tree/{ref}/{path}' if path else f'{base}/-/tree/{ref}'),
    (re.compile(r'.*'),
     lambda base, ref, path: f'{base}/tree/{ref}/{path}' if path else f'{base}/tree/{ref}'),
]

def git_url(session, path, line=None):
    """工作区路径或 GN label → git 仓访问 URL。

    返回 {url, repo, ref, file_path, exact} 或 None。
    """
    # 1. 输入识别
    if path.startswith('//'):
        # GN label: //dir:target → dir/BUILD.gn
        directory = path[2:].split(':')[0].rstrip('/')
        file_in_repo = 'BUILD.gn'
        search_path = directory
    else:
        # 文件路径
        search_path = path.rsplit('/', 1)[0] if '/' in path else ''
        file_in_repo = path
        # 仓内相对路径稍后 strip 前缀

    # 2. 最长前缀匹配仓
    repos = session.sql(
        'SELECT name, path, remote_url, revision, head_commit '
        'FROM repos WHERE scan_id = ? AND path IS NOT NULL AND path != ""',
        (session.scan_id,))
    repos.sort(key=lambda r: len(r['path']), reverse=True)

    repo = None
    for r in repos:
        rp = r['path'].strip('/')
        if search_path == rp or search_path.startswith(rp + '/'):
            repo = r
            break
    if not repo or not repo.get('remote_url'):
        return None

    # 3. 仓内相对路径
    rp = repo['path'].strip('/')
    if path.startswith('//'):
        rel = search_path[len(rp):].lstrip('/')
        file_path = f'{rel}/BUILD.gn' if rel else 'BUILD.gn'
    else:
        file_path = path[len(rp):].lstrip('/') if path.startswith(rp) else path

    # 4. ref 选择
    ref = repo.get('head_commit') or repo.get('revision')
    if not ref:
        return None

    # 5. URL 拼接
    base = repo['remote_url'].removesuffix('.git').rstrip('/')
    builder = next(fn for pattern, fn in HOSTS if pattern.search(base))
    url = builder(base, ref, file_path)

    # 6. 行号锚点
    if line:
        url += f'#L{line}'

    return {
        'url': url,
        'repo': repo['name'],
        'ref': ref,
        'file_path': file_path,
        'exact': bool(repo.get('head_commit')),
    }
```

**缓存**：repos 列表在 session 生命周期内缓存（按 scan_id），与 viewer 的 `gitlink.js` 同策略。

### 4.2 sql_query 安全检查

```python
# agentic/mcp/security.py

import re
import sqlparse  # 或手写解析——避免引入第三方依赖

FORBIDDEN = re.compile(r'\b(PRAGMA|INSERT|UPDATE|DELETE|DROP|ALTER|CREATE|ATTACH|DETACH)\b', re.I)

def check_sql(sql, allowed_tables, scan_id):
    """校验 SQL 安全性，返回 (safe_sql, params_override) 或 raise SecurityError。

    安全约束：
    1. 只读：首关键字必须是 SELECT 或 WITH
    2. 禁止 PRAGMA/INSERT/UPDATE/DELETE/DROP/ALTER/CREATE/ATTACH/DETACH
    3. 表名白名单：FROM/JOIN 的表必须在 allowed_tables 中
    4. scan_id 注入：如果 SQL 不含 scan_id 字面量，自动追加 WHERE scan_id = ?
    5. LIMIT：自动追加 LIMIT 1000（如果 SQL 不含 LIMIT）
    """
    stripped = sql.strip()
    if not stripped:
        raise SecurityError('EMPTY_SQL')

    # 1. 只读检查
    first = stripped.split()[0].upper()
    if first not in ('SELECT', 'WITH'):
        raise SecurityError('NOT_READ_ONLY', f'first keyword: {first}')

    # 2. 禁止关键字
    if FORBIDDEN.search(stripped):
        raise SecurityError('FORBIDDEN_KEYWORD')

    # 3. 表名白名单
    # 简化实现：正则提取 FROM/JOIN 后的表名
    table_pattern = re.compile(r'(?:FROM|JOIN)\s+(\w+)', re.I)
    tables = table_pattern.findall(stripped)
    for t in tables:
        if t not in allowed_tables:
            raise SecurityError('TABLE_NOT_ALLOWED', f'table: {t}')

    # 4. scan_id 注入（简化：如果不含 scan_id，追加到第一个 WHERE 或作为唯一 WHERE）
    if 'scan_id' not in stripped.lower():
        if ' WHERE ' in stripped.upper():
            safe_sql = re.sub(r'\bWHERE\b', f'WHERE scan_id = ? AND', stripped, count=1, flags=re.I)
        else:
            # 在 ORDER BY/GROUP BY/LIMIT 前插入 WHERE
            safe_sql = stripped
            for kw in ('ORDER BY', 'GROUP BY', 'LIMIT'):
                safe_sql = re.sub(f'\\b{kw}\\b', f'WHERE scan_id = ? {kw}', safe_sql, count=1, flags=re.I)
            if 'WHERE' not in safe_sql.upper():
                safe_sql += ' WHERE scan_id = ?'

    # 5. LIMIT
    if 'LIMIT' not in safe_sql.upper():
        safe_sql += ' LIMIT 1000'

    return safe_sql, (scan_id,) if 'scan_id' not in stripped.lower() else ()
```

**超时**：用 `connection.set_progress_handler` 或线程级超时（5 秒）。SQLite 的 `set_progress_handler` 可以在每 N 条指令后检查时间，超时则 abort。

### 4.3 elf_dependencies BFS 闭包

不使用 Python BFS（需 N 次查询），用 SQLite 递归 CTE 一次完成：

```sql
WITH RECURSIVE closure AS (
    -- 起点
    SELECT e.id, e.dest, e.soname, e.partition, e.component_id,
           0 AS distance, '' AS path
      FROM elf_modules e
     WHERE e.scan_id = ? AND e.partition = ? AND e.file_name = ?

    UNION ALL

    -- 展开
    SELECT c.id, c.dest, c.soname, c.partition, c.component_id,
           closure.distance + 1,
           closure.path || closure.dest || ' → ' || c.dest
      FROM elf_module_dependencies d
      JOIN elf_modules caller ON caller.scan_id = d.scan_id AND caller.id = d.caller_id
      JOIN closure ON closure.id = caller.id
      LEFT JOIN elf_modules c ON c.scan_id = d.scan_id AND c.id = d.callee_id
     WHERE d.scan_id = ? AND (? IS NULL OR closure.distance + 1 <= ?)
)
SELECT * FROM closure ORDER BY distance
```

`direction='reverse'` 时交换 caller/callee 角色。`max_distance` 限制递归深度。

**注意**：SQLite 默认递归 CTE 深度上限由 `SQLITE_MAX_EXPR_DEPTH` 控制，通常足够。`max_distance` 参数是应用层保护，防止全图展开。

## 5. 错误处理

### 5.1 异常 → MCP 错误映射

```python
# agentic/mcp/tools/__init__.py

class ToolError(Exception):
    def __init__(self, code, message='', details=None):
        self.code = code
        self.message = message
        self.details = details

# 每个 tool 函数捕获异常并转为 ToolError
def tool_wrapper(fn):
    @functools.wraps(fn)
    def wrapper(*args, **kwargs):
        try:
            return fn(*args, **kwargs)
        except ToolError as e:
            return {"error": {"code": e.code, "message": e.message or e.code,
                               **({"details": e.details} if e.details else {})}}
        except KeyError as e:
            return {"error": {"code": "MISSING_PARAM", "message": f"parameter {e} required"}}
        except (ValueError, TypeError) as e:
            return {"error": {"code": "INVALID_PARAM", "message": str(e)}}
        except Exception as e:
            return {"error": {"code": "INTERNAL", "message": str(e)}}
    return wrapper
```

### 5.2 错误码总表

| code | 触发条件 | 来源 |
|------|---------|------|
| `NO_SESSION` | 未 `open_session` 或已 `close_session` | 所有工具 |
| `NOT_FOUND` | 按键查找未命中 | get_* 类工具 |
| `AMBIGUOUS` | 多重匹配 | owner_of, get_install_module |
| `NO_PARAMS` | 必填参数全未传 | get_hdi |
| `INVALID_COMPONENT_ID` | component_id 不存在 | component_attached 等 |
| `INVALID_SERVICE_ID` | service_id 不存在 | service_hosted |
| `INVALID_COLLECTOR` | collector 名未注册 | component_attached, service_hosted |
| `INVALID_TABLE` | table 名未注册 | list_entities, aggregate |
| `INVALID_FILTER` | filter 列名不存在 | list_entities |
| `INVALID_GROUP_BY` | 分组列不存在或超 3 维 | aggregate |
| `INVALID_CURSOR` | 游标无效或扫描已变更 | list_entities |
| `INVALID_SEVERITY` | severity 非 info/warning/error | list_issues |
| `NOT_READ_ONLY` | sql_query 非 SELECT/WITH | sql_query |
| `TABLE_NOT_ALLOWED` | sql_query 引用未注册表 | sql_query |
| `FORBIDDEN_KEYWORD` | sql_query 含 PRAGMA/写操作 | sql_query |
| `TIMEOUT` | sql_query 超时 | sql_query |
| `SQL_ERROR` | SQLite 执行报错 | sql_query |
| `NO_REF` | 仓无 head_commit 也无 revision | git_url |
| `DB_NOT_FOUND` | db_path 不存在 | open_session |
| `NO_COMPLETED_SCAN` | 库中无已完成扫描 | open_session |
| `SCAN_NOT_FOUND` | scan_id 不存在 | open_session |
| `DB_CORRUPT` | SQLite 打开失败 | open_session |
| `INTERNAL` | 未预期异常 | 所有工具 |

## 6. MCP 协议细节

### 6.1 工具定义格式

每个工具用自定义 `@register()` 装饰器注册，参数 JSON Schema 手写（不依赖 mcp SDK）：

```python
# agentic/mcp/tools/__init__.py
REGISTRY: list[Tool] = []

def register(name, description, schema=None):
    def decorator(fn):
        REGISTRY.append(Tool(
            name=name, description=description,
            input_schema=schema or {'type': 'object', 'properties': {}},
            handler=fn))
        return fn
    return decorator

# agentic/mcp/tools/component.py
@register('get_component', 'Look up a component by name', {
    'type': 'object',
    'properties': {'name': {'type': 'string'}},
    'required': ['name'],
})
def get_component(params, manager):
    session = manager.get_active()
    comp = session.component(params['name'])
    if comp is None:
        raise ToolError('NOT_FOUND', f'component not found: {params["name"]}')
    ...
    return {'id': comp.id, 'name': comp.name, ...}
```

server.py 的 `handle_request` 处理 JSON-RPC：`tools/list` 返回 `REGISTRY` 的 schema 导出，`tools/call` 调用 `dispatch(name, params, manager)` 路由到 handler。

零依赖：不使用 `mcp` PyPI 包，JSON-RPC 2.0 over stdio 直接实现（`json.loads` 逐行读 stdin，`json.dumps` 写 stdout）。

### 6.2 资源 URI（未实施）

MCP 资源是 Agent 可 `resources/read` 的只读数据，按 URI 寻址。设计已定，实现待做：

```
oskm://scan/{scan_id}/metadata          → get_scan_info 的返回
oskm://scan/{scan_id}/issues           → list_issues 的返回
oskm://scan/{scan_id}/component/{name}  → get_component 的返回
oskm://scan/{scan_id}/component/{name}/features  → component_features 的返回
oskm://scan/{scan_id}/component/{name}/innerapis → component_innerapis 的返回
oskm://scan/{scan_id}/component/{name}/syscaps    → component_syscaps 的返回
oskm://scan/{scan_id}/service/{cfg}     → get_service 的返回
oskm://scan/{scan_id}/path/{dest}       → owner_of 的返回
oskm://scan/{scan_id}/gn_arg/{name}     → get_gn_arg 的返回
oskm://scan/{scan_id}/schema            → get_schema 的返回
oskm://scan/{scan_id}/link_stats        → get_link_stats 的返回
```

当前 server 对 `resources/list` 和 `resources/read` 返回空列表。资源是"读取"（适合 prompt 注入），工具是"调用"（适合问答），两者互补。

### 6.3 分页协议（未实施）

`list_entities` 和 `search_*` 工具的分页设计：

```json
// 请求
{"page": {"limit": 100, "cursor": null}}

// 返回
{"items": [...], "total": 382, "next_cursor": "eyJvZmZzZXQiOjEwMH0"}
```

游标设计为 base64-urlsafe 编码的 JSON：`{"fingerprint": "<result_hash>", "offset": 100}`。当前实现返回 `next_cursor: null`（单页 LIMIT，无游标）。游标 + fingerprint 待实施。

## 7. 测试策略

### 7.1 单元测试

每个工具模块独立测试，mock `ScanSession`：

```python
# agentic/mcp/tests/test_component.py
class TestGetComponent(unittest.TestCase):
    def setUp(self):
        self.session = MockScanSession(fixture_db='tests/fixtures/rk3568.db')

    def test_found(self):
        result = component.get_component(self.session, name='ability_runtime')
        self.assertEqual(result['name'], 'ability_runtime')
        self.assertIn('manifest_url', result)
        self.assertIn('attached_counts', result)

    def test_not_found(self):
        result = component.get_component(self.session, name='nonexistent')
        self.assertEqual(result['error']['code'], 'NOT_FOUND')
```

### 7.2 安全测试

```python
class TestSqlQuerySecurity(unittest.TestCase):
    def test_rejects_insert(self):
        with self.assertRaises(SecurityError) as ctx:
            security.check_sql('INSERT INTO repos VALUES (...)', ...)
        self.assertEqual(ctx.exception.code, 'NOT_READ_ONLY')

    def test_rejects_pragma(self):
        with self.assertRaises(SecurityError) as ctx:
            security.check_sql('PRAGMA table_info(repos)', ...)
        self.assertIn('FORBIDDEN_KEYWORD', ctx.exception.code)

    def test_injects_scan_id(self):
        sql, params = security.check_sql(
            'SELECT * FROM components WHERE name = ?', ALLOWED, scan_id=2)
        self.assertIn('scan_id = ?', sql)
        self.assertEqual(params, (2,))
```

### 7.3 端到端测试

用真实 `knowledge.db` 跑 20 个典型 Agent 问答，验证端到端正确性：

```python
class TestEndToEnd(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.server = OskmMcpServer(db_path='tests/fixtures/rk3568.db')

    def test_file_to_component(self):
        result = self.server.call('owner_of', dest='system/lib/libfoo.z.so')
        self.assertIsNotNone(result.get('component'))

    def test_sa_by_id(self):
        result = self.server.call('get_sa', sa_id=1401)
        self.assertEqual(result['sa_id'], 1401)

    def test_elf_closure(self):
        result = self.server.call('elf_dependencies',
                                  dest='system/lib/libfoo.z.so',
                                  max_distance=3)
        self.assertTrue(all(r['distance'] <= 3 for r in result['reachable']))

    def test_git_url(self):
        result = self.server.call('git_url',
                                  path='foundation/ability/ability_runtime/bundle.json')
        self.assertIn('gitcode.com', result['url'])
```

## 8. 部署

### 8.1 Claude Desktop 配置

`~/Library/Application Support/Claude/claude_desktop_config.json`（macOS）或等价路径：

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

### 8.2 opencode 配置

`.opencode/opencode.json` 或 `~/.config/opencode/opencode.json`：

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

### 8.3 安装

零依赖——MCP server 使用纯 Python 标准库实现 JSON-RPC over stdio，不依赖 `mcp` PyPI 包或其他第三方库。oskm 本身也是零依赖。

```bash
cd packages/oskm
# 无需 pip install 任何额外包——oskm + agentic/mcp 全部标准库
python3 -m agentic.mcp.server --db /path/to/knowledge.db
```

## 9. 设计决策记录

1. **stdio 而非 SSE**：本地 Agent（Claude Desktop / opencode），stdio 最简单。SSE 远程访问是后续扩展。
2. **不封装 `oskm.core.api.scan()`**：MCP server 是查询消费者，不是扫描触发器。扫描由 CLI 或 CI 触发。
3. **工具返回 dict 而非 ScanResult 对象**：MCP 要求 JSON 可序列化。ScanResult 的 freeze/thaw 机制在 server 边界处 thaw 为 dict。
4. **sql_query 保留逃生口**：typed 工具覆盖不到的多表 JOIN + 子查询需要原始 SQL。安全约束（§4.2）保证只读 + 表名白名单 + 超时。
5. **gitlink 移植自 viewer 而非新写**：viewer/gitlink.js 已在 rk3568 全量 5395 个 label 上验证过路径匹配，Python 版直接对齐算法。
6. **BFS 用递归 CTE 而非 Python 循环**：避免 N 次 SQL 调用，单条递归 CTE 一次完成闭包展开。
7. **零依赖 JSON-RPC 自实现**：不使用 `mcp` PyPI 包，JSON-RPC 2.0 over stdio 用标准库 `json` + `sys.stdin/stdout` 直接实现。oskm 和 agentic/mcp 全部零第三方依赖。
8. **资源 URI 与工具并行**（未实施）：资源是 prompt 注入用（"这是部件 X 的完整记录"），工具是问答用（"部件 X 有哪些特性"）。两者返回值结构相同，入口不同。当前 server 返回空 resources 列表。
9. **多会话 + ATTACH 实现跨库对比**：MCP server 持有多个 ScanSession 实例（`session_id` 寻址），`attach_secondary` 在当前连接上 `ATTACH DATABASE` 实现跨库 JOIN，`diff_scans` 提供 typed 差异输出。ATTACH 只能通过专用工具执行（不暴露给 `sql_query`），别名在白名单中校验。

## 10. 多库对比与多会话

### 10.1 动机

单会话设计无法回答"两次扫描之间新增了哪些部件""特性值从 true 变成 false 的有哪些"等对比问题。Agent 被迫分两次查询、在 context 里做 diff，token 开销高且易出错。

### 10.2 多会话模型

```
MCP Server 进程
├── session[1] = ScanSession.open(db_a, scan_id=1)   ← active
├── session[2] = ScanSession.open(db_b, scan_id=3)
└── session[1].connection
      └── ATTACH 'db_b' AS secondary                ← 通过 attach_secondary 工具
```

- **多会话**：`open_session` 返回 `session_id`，进程内可持有多个会话。最新打开的为 active，其余通过 `switch_session` 切换。
- **ATTACH**：`attach_secondary(db_path, alias)` 在 active session 的 SQLite 连接上执行 `ATTACH DATABASE`。之后 `sql_query` 可引用 `alias.table_name` 做跨库 JOIN。
- **安全边界**：ATTACH 只能通过 `attach_secondary` 工具执行（内部校验路径、只读模式），`sql_query` 的 `FORBIDDEN` 正则仍禁止 Agent 直接写 ATTACH 语句。白名单校验 `alias.table` 中的 alias 是否已注册。

### 10.3 工具变更

| 工具 | 变更类型 | 说明 |
|------|---------|------|
| `open_session` | 修改 | 返回 `session_id`；支持多会话并存 |
| `close_session` | 修改 | 接受可选 `session_id`，关闭指定或当前 |
| `switch_session` | 新增 | 切换 active session |
| `list_sessions` | 新增 | 列出所有打开的会话 |
| `attach_secondary` | 新增 | ATTACH 另一个数据库到当前连接 |
| `detach_secondary` | 新增 | DETACH 别名 |
| `diff_scans` | 新增 | 结构化差异对比（added/removed/changed） |

### 10.4 sql_query 安全更新

`security.py` 的表名白名单校验扩展：

```python
# 原来只允许裸表名：FROM components
# 现在还允许带别名的表名：FROM secondary.components

def extract_tables(sql):
    # 提取 FROM/JOIN 后的表名，支持 alias.table 格式
    pattern = re.compile(r'(?:FROM|JOIN)\s+([\w.]+)', re.I)
    tables = pattern.findall(sql)
    return tables

def check_table(table_ref, allowed_tables, attached_aliases):
    if '.' in table_ref:
        alias, table = table_ref.split('.', 1)
        if alias not in attached_aliases:
            raise SecurityError('ALIAS_NOT_ATTACHED', f'alias: {alias}')
        if table not in allowed_tables:
            raise SecurityError('TABLE_NOT_ALLOWED', f'table: {table}')
    else:
        if table_ref not in allowed_tables:
            raise SecurityError('TABLE_NOT_ALLOWED', f'table: {table}')
```

`ATTACH` 仍在 `FORBIDDEN` 正则中——Agent 不能通过 `sql_query` 自己 ATTACH，只能通过 `attach_secondary` 工具。

### 10.5 diff_scans 算法

`diff_scans` 对指定实体做集合差异：

```python
def diff_scans(session, entity, scan_a, scan_b, db_b=None, fields=None):
    """结构化差异对比。

    db_b 非空时，scan_b 从 ATTACH 的别名库查；否则同一库内对比。
    """
    table_b = f'{db_b}.{entity}' if db_b else entity
    key = DIFF_KEY[entity]  # components→name, gn_args→name, services→(cfg,name), ...

    rows_a = session.sql(f'SELECT * FROM {entity} WHERE scan_id = ?', (scan_a,))
    rows_b = session.sql(f'SELECT * FROM {table_b} WHERE scan_id = ?', (scan_b,))

    index_a = {r[key]: r for r in rows_a}
    index_b = {r[key]: r for r in rows_b}

    added = [k for k in index_b if k not in index_a]
    removed = [k for k in index_a if k not in index_b]
    changed = []
    for k in index_a:
        if k in index_b:
            diffs = compare_fields(index_a[k], index_b[k], fields or DIFF_FIELDS[entity])
            if diffs:
                changed.append({'key': k, 'changes': diffs})
    return {'added': added, 'removed': removed, 'changed': changed}
```

### 10.6 支持的对比维度

| entity | 主键 | 对比字段 | 典型问题 |
|--------|------|---------|---------|
| `components` | `name` | `subsystem`, `deps`, `repo_id` | 新增/删除部件、依赖变更 |
| `gn_args` | `name` | `current_value`, `has_override` | 开关值变更 |
| `features` | `(component_id, value)` | `gn_arg_id` | 特性新增/删除、值变更 |
| `services` | `(cfg, name)` | `type`, `executable`, `component_id` | 服务新增/删除、归属变更 |
| `install_modules` | `label` | `type`, `component_id` | 安装模块新增/删除 |
| `innerapis` | `name` | `install_module_id` | InnerAPI 关联变更 |

未列出的 entity 用 `sql_query` + ATTACH 手动对比。

### 10.7 使用流程示例

```
# 1. 打开主库（scan_id=2，当前代码）
open_session(db_path="/path/to/knowledge.db", scan_id=2)
→ {"session_id": 1, "scan_id": 2, ...}

# 2. ATTACH 基线库（scan_id=1，上次发布）
attach_secondary(db_path="/path/to/baseline.db", alias="baseline")
→ {"alias": "baseline", "scan_id": 1, ...}

# 3. 结构化 diff：哪些部件是新增的
diff_scans(entity="components", scan_a=2, scan_b=1, db_b="baseline")
→ {"added": ["new_feature_component"], "removed": ["legacy_part"], "changed": [...]}

# 4. 自定义跨库查询：特性值变更
sql_query(sql="SELECT f.value, g.current_value AS new_val,
           g2.current_value AS old_val
           FROM features f
           JOIN gn_args g ON g.id = f.gn_arg_id
           JOIN baseline.features f2 ON f2.value = f.value AND f2.scan_id = 1
           JOIN baseline.gn_args g2 ON g2.id = f2.gn_arg_id AND g2.scan_id = 1
           WHERE f.scan_id = 2 AND g.current_value != g2.current_value")
→ {"rows": [...], "row_count": 3}

# 5. 清理
detach_secondary(alias="baseline")
close_session()
```

### 10.8 文件结构更新

```
agentic/mcp/
├── server.py
├── session.py            # 改：多会话管理（dict[session_id → ScanSession]）
├── gitlink.py
├── security.py           # 改：白名单支持 alias.table 格式
├── diff.py               # 新：diff_scans 实现
└── tools/
    ├── session.py        # 改：+switch_session/list_sessions/attach_secondary/detach_secondary/diff_scans
    └── ...
```
