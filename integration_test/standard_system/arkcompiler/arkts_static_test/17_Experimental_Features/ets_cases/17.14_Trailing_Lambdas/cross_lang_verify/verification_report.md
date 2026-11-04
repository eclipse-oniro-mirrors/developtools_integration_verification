# 17.14 Trailing Lambdas - 三环境实测验证报告

**测试日期：** 2026-06-23

---

## ArkTS 实测结果

| # | 用例 | 预期 | 实测 |
|---|------|------|------|
| 001 | EXP2_17_14_001_PASS_SIMPLE_TRAILING | compile-pass | ✅ compile-pass |
| 002 | EXP2_17_14_002_PASS_METHOD_TRAILING | compile-pass | ✅ compile-pass |
| 003 | EXP2_17_14_003_PASS_MULTI_PARAM_TRAILING | compile-pass | ✅ compile-pass |
| 004 | EXP2_17_14_004_PASS_NESTED_TRAILING | compile-pass | ✅ compile-pass |
| 005 | EXP2_17_14_005_PASS_RETURN_VALUE | compile-pass | ✅ compile-pass |
| 006 | EXP2_17_14_006_PASS_STRING_PARAM_TRAILING | compile-pass | ✅ compile-pass |
| 007 | EXP2_17_14_007_FAIL_NOT_FUNCTION_TYPE | compile-fail | ✅ ESE0140: No matching call signature with trailing lambda |
| 008 | EXP2_17_14_008_FAIL_SEMICOLON_BEFORE_BLOCK | compile-fail | ✅ ESE0124: Expected 1 arguments, got 0 |
| 009 | EXP2_17_14_009_FAIL_MULTIPLE_TRAILING | compile-fail | ✅ ESE0124 + ESY0227 |
| 010 | EXP2_17_14_010_FAIL_OPTIONAL_BEFORE_TRAILING | compile-fail | ✅ ESY0219 (D类 SPEC不一致) |
| 010 | EXP2_17_14_010_RUNTIME_EXECUTION | runtime | ✅ verified: trailing lambda executed |
| 011 | EXP2_17_14_011_RUNTIME_RETURN_VALUE | runtime | ✅ verified: trailing lambda returned 42 |
| 012 | EXP2_17_14_012_RUNTIME_MULTI_PARAM | runtime | ✅ verified: prefix='hello', trailing executed |
| 013 | EXP2_17_14_013_RUNTIME_NESTED | runtime | ✅ verified: nested trailing lambdas executed correctly |

---

## Java 实测结果

**编译器：** javac 21.0.11
**运行时：** java (Java 21)

| 测试点 | 代码 | 结果 |
|--------|------|------|
| Lambda as last argument | `runCallback(() -> { ... })` | ✅ 通过（lambda 在括号内） |
| Multi-param + lambda | `processWithPrefix("test", () -> { ... })` | ✅ 通过 |
| Lambda return value | `computeAndStore(() -> { return 42; })` | ✅ 通过 |

**结论：** Java 支持 lambda 作为最后一个参数，但必须在括号内。Java **没有** trailing lambda 语法（即括号外的 block 语法）。

---

## Swift 实测结果

**状态：** Swift 5.10 未安装在该环境中。

**文档分析：**
Swift 的 trailing closure 语法是 trailing lambda 的最直接对应物：
```swift
func runCallback(_ callback: () -> Void) { callback() }
runCallback { print("trailing closure") }  // Swift trailing closure
```
这与 ArkTS 的 trailing lambda 语法高度相似，但 Swift 更灵活：
- Swift 支持带参数的 trailing closure
- Swift 支持 multiple trailing closures (Swift 5.3+)
- Swift trailing closure 可用于任何函数调用的最后一个 closure 参数

**预估结果：** Swift 应完整支持 trailing closure，功能覆盖度 >= ArkTS。

---

## 关键差异总结

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Trailing lambda/closue 语法 | ✅ `func() { body }` | ❌ 不支持 | ✅ `func { body }` |
| Lambda 在括号内 | ✅ `func(() => {})` | ✅ `func(() -> {})` | ✅ `func({ })` |
| 带参数 trailing lambda | ❌ (spec: 仅 receiver) | N/A | ✅ `func { x in ... }` |
| 多个 trailing closure | ❌ 不支持 | N/A | ✅ (Swift 5.3+) |
| 语义错误检测 | ✅ ESE0140 等 | N/A | ✅ compile error |
