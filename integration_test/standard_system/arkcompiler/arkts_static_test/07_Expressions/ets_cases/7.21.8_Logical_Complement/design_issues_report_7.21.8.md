# 7.21.8 Logical Complement — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 非 boolean 类型 ! 编译通过（D 类） ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_21_08_021_FAIL_INT、EXP_07_21_08_022_FAIL_STRING、EXP_07_21_08_023_FAIL_OBJECT、EXP_07_21_08_024_FAIL_NULL、EXP_07_21_08_025_FAIL_ENUM |
| **实测结果** | 编译通过（期望编译时错误） |
| **错误信息** | 无错误 |

**描述**：spec 要求 `!` 的操作数类型必须为 boolean 或 Extended Conditional 中明确的类型。但 ArkTS 编译器允许对所有类型（int/string/Object/null/enum）应用 `!`，且不报任何编译时错误。

| ID | 用例 | Spec 要求 | 实际行为 |
|:--:|------|-----------|---------|
| 021 | !int | ❌ compile-time error | ✅ 编译通过 |
| 022 | !string | ❌ compile-time error | ✅ 编译通过 |
| 023 | !Object | ❌ compile-time error | ✅ 编译通过 |
| 024 | !null | ❌ compile-time error | ✅ 编译通过 |
| 025 | !enum | ❌ compile-time error | ✅ 编译通过 |

**跨语言对比**：

| 语言 | `!42` | `!"hello"` | `!null` |
|------|:-----:|:----------:|:-------:|
| ArkTS (spec) | ❌ | ❌ | ❌ |
| ArkTS (实现) | ✅ false | ✅ false | ✅ true |
| Java | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| Swift | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |

**分类**：D 类 — Spec 与实现不一致

**建议**：确认 Extended Conditional Expressions 的准确范围。如果所有类型都有资格，需要更新 spec 明确说明；否则限制编译器只对特定类型允许。

---

### ID-02: boolean 类型 ! — 三语言一致 ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：基础 boolean `!` 语义三语言一致：`!true=false`, `!false=true`。

---

### ID-03: truthy/falsy 语义 — ArkTS = JavaScript ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS runtime truthy/falsy 与 JavaScript 完全一致。Falsy 值包括：`false`, `null`, `undefined`, `0`, `""`；其余为 truthy。

---

### ID-04: !!x 连续取反 — ArkTS = Java > Swift ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 跨语言设计差异 |

**描述**：ArkTS 和 Java 支持 `!!true` 连续取反语法；Swift 需 `!(!true)`。

---

### ID-05: De Morgan 定律 — 三语言一致 ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：`!(a&&b) == !a||!b` 和 `!(a||b) == !a&&!b` 三语言一致。

**建议**：当前实现采用了 JavaScript 风格 truthy/falsy 语义，可能是有意设计。建议在 spec 中明确列出哪些类型属于 Extended Conditional Expressions，或更新 spec 使 7.21.8 的描述与实现一致。
