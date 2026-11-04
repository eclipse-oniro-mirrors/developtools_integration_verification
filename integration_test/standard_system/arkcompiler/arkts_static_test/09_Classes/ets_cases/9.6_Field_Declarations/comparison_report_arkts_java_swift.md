# 9.6 Field Declarations - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**规范来源：** ArkTS Static Spec 9.6, Java JLS SE21 §8.3 Field Declarations, Swift Language Reference - Properties
**测试基础：** 8 个用例（3 compile-pass + 3 compile-fail + 2 runtime）
**跨语言实测：** WSL Ubuntu — T007/T008/T009/T010/T011/T012 实测通过

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 字段声明语法 | `name: Type = init` | `Type name = init` | `var name: Type = init` |
| 修饰符 | static, readonly, optional(?), late-init(!), override | static, final, transient, volatile | static, let, var, lazy, override(计算属性) |
| 字段方法同名 | ❌ 编译错误 | ✅ 不冲突 | ⚠️ 有歧义 |
| 重复字段修饰符 | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |

---

## 二、关键差异

- ⭐ **ArkTS 字段方法同名冲突**：Java 不冲突（不同命名空间），Swift 允许。
- ⭐ **ArkTS readonly ≈ Java final ≈ Swift let**：语义一致（只读字段）。
- ⭐ **ArkTS optional(?) ≈ Java nullable ≈ Swift T?**：可选类型语义一致。

---

## 三、核心结论

| 角度 | 结论 |
|------|------|
| **字段声明语法** | ArkTS(`:Type`) ≈ Swift(`: Type`) >> Java(`Type id`) |
| **字段方法同名** | ArkTS禁止 >> Java/Swift允许 |
| **readonly/final/let** | 三语言语义一致 |
| **optional/nullable/T?** | 三语言语义一致 |

---

## 附录

| ArkTS | §9.6 | Java | §8.3 | Swift | Properties |
