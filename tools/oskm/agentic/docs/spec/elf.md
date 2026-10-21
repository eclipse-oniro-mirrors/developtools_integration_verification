# elf 模块 — MCP 工具规格

ELF 二进制模块的 DT_NEEDED 依赖图遍历。

## 工具清单

| 工具 | 说明 |
|------|------|
| `search_elf_modules` | 按 soname 或 file_name 模糊搜索 ELF |
| `elf_dependencies` | 前向/反向 BFS 依赖闭包（含距离与路径） |
| `elf_dependents` | 反向依赖列表（谁依赖了它） |

---

## search_elf_modules

按 soname 或 file_name 模糊搜索 ELF 模块。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `query` | string | ✓ | 搜索关键词，匹配 `soname` 子串或 `file_name` 子串 |
| `partition` | string | | 按分区过滤：`system` / `vendor` / `updater` |
| `component` | string | | 按部件名精确过滤 |
| `limit` | int | | 返回上限，默认 20，上限 100 |

**返回**

```json
{
  "results": [
    {
      "id": 501,
      "dest": "system/lib/libfoo.z.so",
      "soname": "libfoo.z.so",
      "file_name": "libfoo.z.so",
      "partition": "system",
      "component": "foo_runtime"
    }
  ],
  "total": 1
}
```

---

## elf_dependencies

从指定 ELF 模块出发，沿 DT_NEEDED 边做 BFS 遍历，返回依赖闭包。每条结果含距离（跳数）和路径（边序列）。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `dest` | string | ✓ | 镜像内 ELF 文件路径（如 `system/lib/libfoo.z.so`） |
| `direction` | string | | `forward`（默认）：沿着 DT_NEEDED 往被依赖方走；`reverse`：反向，谁依赖了它 |
| `max_distance` | int | | BFS 最大深度。省略时无限制；建议传值以防全图展开（如 `max_distance=3`） |

**返回**

```json
{
  "root": "system/lib/libfoo.z.so",
  "direction": "forward",
  "reachable": [
    {
      "dest": "system/lib/libbar.z.so",
      "soname": "libbar.z.so",
      "partition": "system",
      "component": "bar_runtime",
      "component_id": 12,
      "distance": 1,
      "via": ["system/lib/libfoo.z.so → system/lib/libbar.z.so"]
    },
    {
      "dest": "system/lib/libbaz.z.so",
      "soname": "libbaz.z.so",
      "partition": "system",
      "component": null,
      "component_id": null,
      "distance": 2,
      "via": ["system/lib/libfoo.z.so → system/lib/libbar.z.so → system/lib/libbaz.z.so"]
    }
  ],
  "unresolved": [
    {"needed_name": "libnonexistent.z.so", "caller_dest": "system/lib/libfoo.z.so"}
  ]
}
```

`reachable` 按 `distance` 升序排列。`via` 是路径上每条边（`caller.dest → callee.dest`）。`component` 为 null 表示该 ELF 未归属到部件。`unresolved` 列出 DT_NEEDED 中未在 system/vendor 内找到的库名。

`reverse` 方向返回"谁依赖了 root"的闭包——回答"如果我改了 libfoo，谁会受影响"。

**错误码**

| code | 说明 |
|------|------|
| `NOT_FOUND` | `dest` 不是已扫描的 ELF 文件 |
| `NOT_ELF` | `dest` 存在但不是 ELF 文件（install_target 未解析为 elf_modules 行） |
| `NO_SESSION` | 未建立会话 |

---

## elf_dependents

返回直接依赖了指定 ELF 的模块列表（depth=1，不做闭包展开）。

**参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|:----:|------|
| `dest` | string | ✓ | 镜像内 ELF 文件路径 |

**返回**

```json
{
  "dest": "system/lib/libfoo.z.so",
  "dependents": [
    {
      "dest": "system/lib/libbar.z.so",
      "soname": "libbar.z.so",
      "partition": "system",
      "component": "bar_runtime",
      "component_id": 12
    }
  ]
}
```

比 `elf_dependencies(direction='reverse', max_distance=1)` 更直接——只返回直接边，不带 path/via。适合"谁直接引用了我"的快速查询。
