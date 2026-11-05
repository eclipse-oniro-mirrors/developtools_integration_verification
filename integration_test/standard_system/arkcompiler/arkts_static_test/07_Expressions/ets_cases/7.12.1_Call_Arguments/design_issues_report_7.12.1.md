# 7.12.1 Call Arguments — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 尾部逗号支持差异 — 语言设计差异 ⭐⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 语言设计差异 |
| **严重性** | ⭐⭐（中） |
| **合理性** | 符合 ArkTS/TypeScript 语法惯例 |

**描述**：ArkTS 支持函数调用尾部逗号 `func(a,)`，Java 和 Swift 均不支持。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `sum(1, 2, 3,)` | ✅ 编译通过 |
| Java | `sum(1, 2, 3,)` | ❌ 编译时错误：illegal start of expression |
| Swift | `sum(1, 2, 3,)` | ❌ 编译时错误：unexpected ',' separator |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-02: Trailing lambda — 语言设计差异 ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 语言设计差异 |
| **严重性** | ⭐（低） |
| **合理性** | 实验特性，符合现代语言趋势 |

**描述**：ArkTS 支持 trailing lambda 语法（实验特性），Java 无此语法，Swift 支持 trailing closure。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `foo() { body }` | ✅ 实验特性支持 |
| Java | N/A | ❌ 无对应语法 |
| Swift | `foo() { body }` | ✅ trailing closure |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-03: Spread/varargs 语法差异 ⭐

| 语言 | 声明语法 | 调用语法 | 备注 |
|------|---------|---------|------|
| ArkTS | `...args: int[]` | `func(...arr)` | 与 TypeScript 一致 |
| Java | `int... args` | `func(arr)` | 无需显式 spread 操作符 |
| Swift | `_ numbers: Int...` | `func(1, 2, 3)` | 直接传值，不支持数组 spread |

**分类**：符合 ArkTS spec 的语言设计差异

## 总体结论

本节无 Spec 与实现不一致问题（0 D 类）。所有差异均为已知的语言设计差异，符合各自语言的 spec 定义。
