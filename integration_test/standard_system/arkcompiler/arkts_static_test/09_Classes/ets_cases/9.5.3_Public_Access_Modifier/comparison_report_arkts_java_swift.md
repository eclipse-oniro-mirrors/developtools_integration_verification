# 9.5.3 Public Access Modifier - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**测试基础：** 3 个用例（2 compile-pass + 1 runtime）

---

## 一、概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| public语义 | 处处可见 | 处处可见 | 处处可见（模块内）；open=模块外可继承 |
| 默认可见性 | public（无修饰符=public） | package-private（无修饰符=包内） | internal（无修饰符=模块内） |

---

## 二、关键差异

- ⭐ **默认可见性是三语言最大差异**：ArkTS 无修饰符默认 public，Java 无修饰符默认 package-private，Swift 无修饰符默认 internal。

---

## 三、核心结论

| 角度 | 结论 |
|------|------|
| **public语义** | 三语言一致（处处可见） |
| **默认可见性** | ArkTS(public) ≠ Java(package-private) ≠ Swift(internal) |
