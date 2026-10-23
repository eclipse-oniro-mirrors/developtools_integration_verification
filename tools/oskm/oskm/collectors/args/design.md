# Args 采集器设计

schema 1.0.0 | 依赖：components

## 输入与范围

通过 `gn args --list --json` 采集全量 GN 构建参数（rk3568 下约 2958 个），每个 arg 记录名称、声明文件/行号、默认值、当前覆盖值、值类型、注释。依赖 components 采集器，通过声明文件路径前缀匹配为每个 arg 关联 `component_id`。

输入：

- `prebuilts/build-tools/{linux-x86|linux-aarch64}/bin/gn`（依赖构建环境）
- `out/{product}/args.gn`（需要已有构建产物）
- components 表（component_id 关联）

## 数据源

### 命令

```bash
prebuilts/build-tools/linux-x86/bin/gn args out/{product} --list --json
```

输出前半部分是 GN `print()` 噪音，后半部分是 JSON 数组。`extract_json()` 用 `re.finditer(r'\[\s*\{\s*"', output)` 定位最后一个匹配作为 JSON 起点，`output.rfind(']')` 定位终点。

### JSON 输出格式

```json
[
  {
    "name": "ability_runtime_power",
    "default": { "file": "//foundation/.../ability_runtime.gni", "line": 101, "value": "true" },
    "current": { "file": "//out/rk3568/args.gn", "line": 19, "value": "false" },
    "comment": "Enable ability runtime power management"
  }
]
```

| 字段 | 必有 | 说明 |
|------|------|------|
| `name` | 是 | arg 名称 |
| `default.file` / `default.line` / `default.value` | 是 | 声明位置与默认值（GN 字面量字符串） |
| `current` | 否 | 覆盖值（rk3568 约 3.5% 有覆盖） |
| `comment` | 否 | 声明前注释（约 11.5% 有注释） |

### 值解析

`parse_gn_value()` 将 GN 字面量字符串解析为 Python 值：`"true"`/`"false"` → bool，`"\"...\""` → str（去引号），`"123"` → int，`"[...]"` → list，其他复杂表达式保留原样。`classify_value()` 返回 `bool`/`str`/`int`/`list`/`other`。

实际值规则：`actual_value = current.value`（若 current 存在），否则 `default.value`。

## 表结构

```sql
CREATE TABLE gn_args (
    id              INTEGER PRIMARY KEY,
    scan_id         INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    name            TEXT NOT NULL,
    component_id    INTEGER REFERENCES components(id) ON DELETE CASCADE,
    decl_file       TEXT NOT NULL,
    decl_line       INTEGER NOT NULL,
    default_value   JSON,
    has_override    INTEGER NOT NULL DEFAULT 0,
    current_value   JSON,
    comment         TEXT,
    value_type      TEXT NOT NULL,
    UNIQUE (scan_id, name)
);
CREATE INDEX idx_gn_args_component ON gn_args(scan_id, component_id);
CREATE INDEX idx_gn_args_file ON gn_args(scan_id, decl_file);
```

字段决策：`name` 在扫描内 UNIQUE；`component_id` 可空（arg 声明在共享 .gni 或 `args.gn` 中可能无法关联唯一部件）；`decl_file` 去掉 `//` 前缀与 components.manifest 格式一致便于 JOIN；`default_value`/`current_value` JSON 序列化统一存储 bool/str/int/list。

## component_id 关联规则

复用 `core/ownership.py` 的 `manifest_directories()` + `nearest_component()`：将 `decl_file`（如 `//foundation/ability/ability_runtime/ability_runtime.gni`）视为 GN label，去掉 `//` 后按目录从深到浅逐级匹配 components 的 manifest 目录。

实测验证（rk3568）：

| decl_file | 匹配 component | 说明 |
|-----------|---------------|------|
| `//foundation/ability/ability_runtime/ability_runtime.gni` | ability_runtime | 同目录 |
| `//foundation/arkui/ace_engine/adapter/ohos/build/common.gni` | ace_engine | 子目录 |
| `//build/ohos/ohos.gni` | build_framework | `build/` 前缀匹配 `build/bundle.json` |
| `//out/rk3568/args.gn` | NULL | 不在任何 component 目录内 |

未匹配的 arg（`args.gn` 覆盖文件、GN 内置变量、`//.gn`/`BUILDCONFIG.gn` 等框架根文件）`component_id` 为 NULL，合法且不发 issue。

## 采集流程

```python
@register
class ArgsCollector(BaseCollector):
    NAME = 'args'
    DEPENDS_ON = ('components',)
    SCHEMA_VERSION = '1.0.0'
    TABLES = (GN_ARGS,)
    CONTEXT_TYPE = ArgsContext
    EXPORT_ORDER = 'name'
    RESULT_FIELD = 'gn_args'
```

拓扑序：`repos → components → args → install_modules → ...`

`collect()` 流程：

1. `find_gn(workspace)` 检测平台并返回 gn 路径，找不到发 `GN_TOOL_NOT_FOUND` advisory 后返回
2. 检查 `out/{product}/args.gn` 存在性，缺失发 `GN_BUILD_DIR_MISSING` advisory 后返回
3. `run_gn_args()` 调用 `gn args --list --json`（超时 120s），超时发 `GN_ARGS_TIMEOUT` advisory
4. `extract_json()` 提取 JSON 数组，解析失败发 `GN_ARGS_PARSE_FAILED` advisory
5. 加载 components 索引并构建 `manifest_directories()`
6. 逐 arg 解析 default/current 值，关联 component_id，emit

工具函数（`find_gn`/`run_gn_args`/`extract_json`/`parse_gn_value`/`classify_value`）实现于 `gn_args.py`。

## issue 规则

| 条件 | issue | 级别 |
|------|-------|------|
| `gn` 可执行文件不存在 | `GN_TOOL_NOT_FOUND` | advisory |
| `out/{product}/args.gn` 不存在 | `GN_BUILD_DIR_MISSING` | advisory |
| `gn args` 超时（120s） | `GN_ARGS_TIMEOUT` | advisory |
| JSON 解析失败 | `GN_ARGS_PARSE_FAILED` | advisory |
| arg 无法关联到 component | 不发 issue（null component_id 合法） |

所有 issue 均为 advisory——不影响 scan status，不阻断下游依赖。

## 容错设计

| 场景 | 处理 |
|------|------|
| 非 repo 工作区（无 prebuilts/） | gn_args 表为空，发 `GN_TOOL_NOT_FOUND` |
| 未构建（无 out/{product}/） | gn_args 表为空，发 `GN_BUILD_DIR_MISSING` |
| gn 超时 | gn_args 表为空，发 `GN_ARGS_TIMEOUT` |
| JSON 中某个 arg 缺字段 | 跳过该 arg，不崩溃 |
| component 表为空（--without components） | component_id 全为 null |

## 查询接口

```sql
-- 按名称查 arg
SELECT * FROM gn_args WHERE scan_id = ? AND name = 'ability_runtime_power';

-- 按部件查所有 arg
SELECT name, current_value, value_type, has_override
FROM gn_args WHERE scan_id = ? AND component_id = ? ORDER BY name;

-- 查所有有覆盖的 arg
SELECT name, default_value, current_value
FROM gn_args WHERE scan_id = ? AND has_override = 1 ORDER BY name;

-- 按值类型过滤
SELECT name, current_value FROM gn_args
WHERE scan_id = ? AND value_type = 'bool' AND current_value = 'true';

-- 未关联 component 的 arg
SELECT name, decl_file FROM gn_args
WHERE scan_id = ? AND component_id IS NULL ORDER BY decl_file;
```
