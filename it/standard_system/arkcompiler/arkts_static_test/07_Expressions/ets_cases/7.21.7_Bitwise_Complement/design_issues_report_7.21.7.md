# 7.21.7 Bitwise Complement — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: ~enum 编译通过（D 类） ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_21_07_025_FAIL_ENUM |
| **实测结果** | 编译通过（期望编译时错误） |
| **错误信息** | 无错误 |

**描述**：spec 要求 `~` 仅对数值类型和 bigint 有效，enum 不是数值类型应报编译时错误。但 ArkTS 编译器实际允许 `~enum` 通过。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `~Color.RED` | ❌ Compile-time error |
| ArkTS (实现) | `~Color.RED` | ✅ 编译通过 |
| Java | `~Color.RED` | ✅ 编译通过（enum 底层是 int） |
| Swift | `~Color.red` | ❌ 语法错误（Swift 无 ~enum） |

**分类**：D 类 — Spec 与实现不一致

**建议**：确认 ArkTS enum 是否应被视为整型（类似 Java），若是需更新 spec；若否，需修复编译器。

---

### ID-02: float/double 支持 ~ — ArkTS 独有 ⭐⭐⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 支持 ~float（截断为 int）和 ~double（截断为 long）；Java 和 Swift 编译时拒绝 ~ 用于浮点数。

**跨语言对比**：

| 语言 | `~float(2.5)` | `~double(2.5)` |
|------|--------------|----------------|
| ArkTS | ✅ 截断 2.5→2→~2=-3 | ✅ 截断 2.5→2→~2=-3(long) |
| Java | ❌ 编译错误 | ❌ 编译错误 |
| Swift | ❌ 编译错误 | ❌ 编译错误 |

---

### ID-03: 类型拓宽 — ArkTS = Java ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 和 Java 的 ~byte/~short 拓宽为 int；Swift 无 byte/short。

---

### ID-04: bigint 支持 — ArkTS 独有 ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 唯一支持 ~bigint。

---

### ID-05: enum 检查 — ArkTS（实现）和 Java 允许 ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 跨语言设计差异 |

**描述**：ArkTS（实现）和 Java 允许 ~enum；Swift 不允许。

**建议**：float/double 截断求反是 ArkTS 独有特性，需验证是否设计意图。建议统一 enum 处理策略：当前 ++/-- 拒绝 enum 但 ~ 允许，行为不一致。
