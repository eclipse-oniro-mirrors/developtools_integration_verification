# 9.5 Access Modifiers - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**规范来源：** ArkTS Static Spec 9.5 Access Modifiers, Java JLS SE21 §6.6 Access Control, Swift Language Reference - Access Control
**测试基础：** 4 个用例（2 compile-pass + 1 compile-fail + 1 runtime）
**跨语言实测：** WSL Ubuntu — T006/S006 实测通过

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 修饰符种类 | private, protected, public | private, protected, public, package-private | private, fileprivate, internal, public, open |
| 默认可见性 | public | package-private | internal |
| protected语义 | 类内+子类可见 | 类内+子类+同包可见 | ❌ 无protected |
| private跨类 | ❌ 不可见 | ❌ 不可见 | ❌ 不可见（fileprivate=文件内可见） |

---

## 二、关键差异

- ⭐ **Swift 无 protected**：Swift 用 `fileprivate`（文件内可见）和 `open`（模块外可继承重写）替代 protected 的功能。ArkTS 和 Java 都有原生 protected。
- ⭐ **默认可见性差异**：ArkTS 默认 public，Java 默认 package-private，Swift 默认 internal。
- ⭐ **Java protected 包含同包可见**：Java 的 protected 不仅子类可见，同包的其余类也可见。ArkTS 的 protected 仅类内+子类可见（更严格）。

---

## 三、核心结论

| 角度 | 结论 |
|------|------|
| **private** | 三语言语义一致（类内可见） |
| **protected** | ArkTS(类内+子类) ≠ Java(类内+子类+同包) >> Swift(无protected) |
| **默认可见** | ArkTS(public) ≠ Java(package-private) ≠ Swift(internal) |

### ArkTS 设计建议

1. ✅ **保留 protected 语义** — 比 Java 更严格（不含同包），语义更清晰。
2. ⚠️ **考虑是否增加 fileprivate/open** — Swift 的多层次访问控制对模块化设计有益。

---

## 附录

| ArkTS | ArkTS Static Spec §9.5 |
| Java | JLS SE21 §6.6 |
| Swift | The Swift Programming Language: Access Control |
