# 7.21.5 Unary Plus — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

无 D 类 Spec 不一致。17/17 用例全部通过。

### ID-01: 类型拓宽 — ArkTS = Java ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |
| **说明** | ArkTS 和 Java 的 byte/short → int 拓宽一致；Swift 无 byte/short 类型 |

**跨语言对比**：

| 语言 | `+byte(10)` 结果类型 | `+short(1)` 结果类型 |
|------|---------------------|---------------------|
| ArkTS | **int**（拓宽） | **int**（拓宽） |
| Java | **int**（拓宽） | **int**（拓宽） |
| Swift | N/A | N/A |

---

### ID-02: bigint 支持 — ArkTS 独有 ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |
| **说明** | ArkTS 是唯一支持 +bigint 的语言；bigint 不受拓宽规则影响 |

**跨语言对比**：

| 语言 | `+bigint` |
|------|-----------|
| ArkTS | ✅ `+1n` → `1n` |
| Java | ❌ |
| Swift | ❌ |

---

### ID-03: 非数值检查 — 三语言一致 ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |
| **说明** | 三语言一致拒绝 string/boolean 等非数值类型 |

**跨语言对比**：

| 场景 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `+"hello"` | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| `+true` | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| `+null` | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |

---

### ID-04: null 拒绝 — ArkTS vs JavaScript ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |
| **说明** | ArkTS 拒绝 `+null`（编译时错误），而 JavaScript 允许 `+null → 0` |

**跨语言对比**：

| 语言 | `+null` |
|------|---------|
| ArkTS | ❌ 编译时错误 |
| JavaScript | ✅ `+null → 0` |
| Java | ❌ 编译时错误 |
| Swift | ❌ 编译时错误 |

**建议**：当前实现完全符合 spec 规范。byte/short → int 拓宽与 Java 一致，是合理的设计。
