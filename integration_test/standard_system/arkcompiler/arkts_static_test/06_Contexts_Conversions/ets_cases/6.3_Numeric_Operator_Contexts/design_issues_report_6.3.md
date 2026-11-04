# 6.3 Numeric Operator Contexts — Design Issues Report

## Issue #1: `**` 返回 Double 而非 Integer

| Field | Detail |
|-------|--------|
| **描述** | `int ** int` 返回 `Double` 而非 `int` 或 `long`。例如 `2 ** 3` 结果是 `8.0` (double) |
| **复现用例** | CON_06_03_002, 026 |
| **实测错误** | `ESE0318: Type 'Double' cannot be assigned to type 'Long'` / `'Int'` |
| **跨语言对比** | Java: `Math.pow(2, 3)` → `double 8.0` (一致)<br>Swift: `pow(2.0, 3.0)` → `Double 8.0` (一致)<br>所有语言中幂运算均返回浮点 |
| **严重性** | N/A (语言一致性特性) |
| **建议** | 文档中明确标注 `**` 的返回类型为 `Double` |

## Issue #2: 复合赋值 `long += int` 的 widening 实现一致性

| Field | Detail |
|-------|--------|
| **描述** | `long_var += int_var` 在 ArkTS/Java 中通过隐式 widening 工作，Swift 需要显式转换 |
| **复现用例** | CON_06_03_025 |
| **跨语言对比** | Java: `longVar += intVar` ✓ (隐式 widening)<br>Swift: `int64Var += Int64(intVar)` ✗ (需显式) |
| **严重性** | N/A (已确认设计行为) |
