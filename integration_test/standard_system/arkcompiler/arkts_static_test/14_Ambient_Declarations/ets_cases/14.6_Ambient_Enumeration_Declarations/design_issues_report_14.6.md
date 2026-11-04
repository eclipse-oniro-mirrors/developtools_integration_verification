# 14.6 Ambient Enumeration Declarations — 跨语言行为差异及规范一致性报告

## 总览

ArkTS 14.6 Ambient Enumeration Declarations 的规范规则：
1. `const` 前缀 → compile-time error（临时限制）
2. 成员不能有初始化器 → compile-time error
3. 成员仅可为标识符列表

## 已知差异

### D-14.6-01: 枚举成员初始化器检查缺失

**描述**：ArkTS 编译器当前允许 ambient enum 成员带初始化器，但 spec 要求 compile-time error。

**复现用例**：
- AMB_14_06_006_FAIL_MEMBER_INITIALIZER.ets（`declare enum Err1 { A = 5 }`）
- AMB_14_06_007_FAIL_MIXED_INITIALIZER.ets（`declare enum Err2 { A, B = 5 }`）

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `declare enum E { A = 5 }` | ❌ compile-time error |
| ArkTS (实际) | `declare enum E { A = 5 }` | ✅ 编译通过（与 spec 矛盾）|
| Java | `enum E { A(5) }` | ✅ 允许 |
| Swift | `enum E: Int { case A = 5 }` | ✅ 允许 |

**严重性**：MEDIUM
**分类**：D 类（Spec 与实现不一致）

## 2026-07-17 编译验证结果

| 用例 | @expect | 实际 | 结论 |
|------|---------|------|------|
| AMB_14_06_005_FAIL_CONST_ENUM | compile-fail | ❌ REJECTED | ✅ 正确 |
| AMB_14_06_006_FAIL_MEMBER_INITIALIZER | compile-fail | ✅ ACCEPTED | ❌ 仍存在 |
| AMB_14_06_007_FAIL_MIXED_INITIALIZER | compile-fail | ✅ ACCEPTED | ❌ 仍存在 |

D-14.6-01 问题仍未被编译器检测，保持活跃状态。

## 总结

| ID | 问题 | 严重性 | 分类 | 状态 |
|----|------|--------|------|------|
| D-14.6-01 | 枚举成员初始化器检查缺失 | MEDIUM | D 类 | 🔴 未修复 |
