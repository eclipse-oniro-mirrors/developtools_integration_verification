# 6.2 String Operator Contexts — Design Issues Report

## Issue #1: 0.0 格式化丢失小数部分

| Field | Detail |
|-------|--------|
| **描述** | `0.0 + " is zero"` 在 ArkTS 中产生 `"0 is zero"` 而非 `"0.0 is zero"` |
| **复现用例** | CON_06_02_028_FAIL_FLOAT_ZERO_STRING_LOSS |
| **实测错误** | 运行时断言失败：期望 `"0.0 is zero"`，实际 `"0 is zero"` |
| **跨语言对比** | Java: `0.0 + " is zero"` → `"0.0 is zero"` ✓<br>Swift: `String(0.0) + " is zero"` → `"0.0 is zero"` ✓<br>ArkTS: 整数形式的 `"0"` 作为浮点零的字符串表示 |
| **严重性** | LOW |
| **改进建议** | Spec §6.2 声明 "without the loss of information"，但 `0.0→"0"` 丢失了浮点类型信息。建议保持 `.0` 后缀以区分 `int(0)` |

## Issue #2: void + string 编译通过

| Field | Detail |
|-------|--------|
| **描述** | `"result: " + voidFunction()` 编译通过，但 spec 说 "If there is no applicable conversion, compile-time error occurs"。void 类型不在转换规则表中。 |
| **复现用例** | CON_06_02_016_FAIL_VOID_STRING_CONCAT（新用例） |
| **实测错误** | 编译通过（预期应失败），void 返回值被当作某种可转换值处理 |
| **跨语言对比** | Java: `"r: " + voidMethod()` — 编译错误（void 不能用于表达式）<br>Swift: `"r: " + String(voidFunc())` — 编译错误（Void 不可转换） |
| **严重性** | MEDIUM |
| **改进建议** | 明确 void 的 string 转换规则，或将其加入 "no applicable conversion" 列表 |

## Issue #3: Box 类名与 stdlib 冲突

| Field | Detail |
|-------|--------|
| **描述** | 用户定义的 `class Box` 与标准库中的 `Box` 类冲突，导致 `ESE0349: Class 'Box' is already defined` |
| **复现用例** | 用户 `class Box` 与 stdlib 冲突（原 CON_06_02_023 已重命名为 Container 规避） |
| **实测错误** | 编译错误 |
| **跨语言对比** | Java: 用户类和标准库类通过 package 隔离，不会冲突<br>Swift: 模块隔离，同名需显式限定 |
| **严重性** | LOW |
| **改进建议** | 文档中列出 stdlib 中的保留类名，或提供 namespacing 机制 |
