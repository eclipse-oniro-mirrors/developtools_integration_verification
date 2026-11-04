# 14.7.1 Implementing Ambient Namespace Declaration — 跨语言行为差异及规范一致性报告

## 总览

ArkTS 14.7.1 的规范规则：
1. 实现 namespace 必须与 ambient namespace 同名
2. 嵌套 namespace 名称必须一致

## 已知差异

### D-14.7.1-01: declare namespace 与 namespace 无法合并

**描述**：spec 允许用同名非 declare namespace 实现 ambient namespace，但编译器报 "Unable to merge namespaces, because their modifiers are different"。

**复现用例**：
- AMB_14_07_01_001_FAIL_IMPLEMENT_SAME_NAME（`declare namespace A {}` + `namespace A {}`）

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `declare namespace A {} / namespace A {}` | ✅ 应允许 |
| ArkTS (实际) | 同上 | ❌ 编译器拒绝 merge |
| Java | `class A { static class Impl {} }` | ✅ 同类 |
| Swift | `enum A { enum Impl {} }` | ✅ 同类 |

**严重性**：MEDIUM
**分类**：D 类（Spec 与实现不一致）
**后续建议**：
1. 编译器应支持 `declare namespace` 与非 `declare namespace` 合并
2. 当前 "Unable to merge namespaces, because their modifiers are different" 错误应移除

## 2026-07-17 编译验证结果

| 用例 | @expect | 实际 | 结论 |
|------|---------|------|------|
| AMB_14_07_01_001_PASS_IMPLEMENT_SAME_NAME | compile-pass | ✅ ACCEPTED | ✅ 已修复 |
| AMB_14_07_01_005_FAIL_NESTED_NAME_MISMATCH | compile-fail | ❌ REJECTED | ✅ 正确 |
| AMB_14_07_01_006_FAIL_FUNCTION_SIG_MISMATCH | compile-fail | ❌ REJECTED | ✅ 正确 |

D-14.7.1-01 问题仍未被编译器修复：`declare namespace A {}` + `namespace A {}` 编译仍失败（ESY0006）。此前误判为已修复。

## 总结

| ID | 问题 | 严重性 | 分类 | 状态 |
|----|------|--------|------|------|
| D-14.7.1-01 | declare namespace 与 namespace 无法合并 | MEDIUM | D 类 | 🔴 未修复 |
