# 6.3.1 Numeric Conversions for Relational/Equality — Design Issues Report

## Issue #1: string enum 支持关系比较

| Field | Detail |
|-------|--------|
| **描述** | `string` 基类型枚举允许 `<` 比较（按字符串字典序）。Spec §6.3 说枚举可在数值上下文中使用 "if enumeration base type is a numeric type"，但实际 string enum 也被接受 |
| **复现用例** | CON_06_03_01_015 (原 string enum `<`) |
| **实测结果** | 编译通过而非失败 |
| **跨语言对比** | Java: enum `<` enum — compile error (无论基类型)<br>Swift: `Comparable` enum `<` — OK (protocol based) |
| **严重性** | LOW |
| **改进建议** | 明确 string enum 在关系运算符中的行为是否符合 spec |

## Issue #2: float 字面量导致 widening 测试受限

| Field | Detail |
|-------|--------|
| **描述** | `float = 1.5` 失败（double 字面量），导致无法直接测试 float→double 的 widening 比较 |
| **复现用例** | CON_06_03_01_006, 009 |
| **实测错误** | `ESE0318: Type 'Double' cannot be assigned to type 'Float'` |
| **严重性** | LOW (已在 6.1 design issues 记录) |

## Issue #3: enum + int 直接比较是 ArkTS 独有特性

| Field | Detail |
|-------|--------|
| **描述** | `Priority.Medium > 1` 在 ArkTS 中合法，但 Java/Swift 均不支持。这是 ArkTS 通过枚举→数值转换 + 数值 widening 链式实现的独特能力 |
| **复现用例** | CON_06_03_01_025 |
| **跨语言对比** | Java: `Priority.Medium > 1` — compile error<br>Swift: `Priority.Medium.rawValue > 1` — 需显式 rawValue |
| **严重性** | N/A (特性确认，非问题) |
| **建议** | 在文档中突出此特性作为与 Java/Swift 的差异化优势 |
