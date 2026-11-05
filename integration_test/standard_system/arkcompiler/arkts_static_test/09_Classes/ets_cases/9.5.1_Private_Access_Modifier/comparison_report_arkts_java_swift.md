# 9.5.1 Private Access Modifier - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**测试基础：** 9 个用例（3 compile-pass + 4 compile-fail + 2 runtime）
**跨语言实测：** T006/S006 实测通过

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| private语义 | 仅类内可见 | 仅类内可见 | 仅类内可见（fileprivate=文件内可见） |
| 子类重用private名称 | ✅ 子类可声明同名private | ✅ 子类可声明同名private | ✅ 子类可声明同名private |
| private构造器 | ✅ 限制实例化 | ✅ 限制实例化 | ✅ 限制实例化 |
| 子类访问父类private | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |

---

## 二、关键差异

- ⭐ **三语言private语义高度一致**：private 成员仅在声明类内可见，子类不可访问但可声明同名 private 成员。
- ⭐ **Swift private vs fileprivate**：Swift 的 `private` 限制在声明作用域内，`fileprivate` 限制在文件内。ArkTS 和 Java 的 `private` 都限制在类内。

---

## 三、核心结论

| 角度 | 结论 |
|------|------|
| **private语义** | 三语言高度一致 |
| **子类名称重用** | 三语言均允许 |
| **private构造器** | 三语言语义一致 |

---

## 附录

| ArkTS | §9.5.1 | Java | §6.6 | Swift | Access Control |
