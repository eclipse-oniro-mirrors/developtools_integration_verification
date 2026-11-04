# 9.4 Class Members - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**规范来源：** ArkTS Static Spec 9.4 Class Members, Java JLS SE21 §8.2 Class Members, Swift Language Reference - Classes and Structures
**测试基础：** 8 个用例（3 compile-pass + 3 compile-fail + 2 runtime）

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 成员类型 | 字段、方法、构造器、getter/setter | 字段、方法、构造器、嵌套类 | 属性、方法、构造器、嵌套类型 |
| static/instance同名 | ✅ 允许 | ✅ 允许 | ✅ 允许 |
| 字段方法同名 | ❌ 编译错误 | ✅ 不冲突 | ⚠️ 有歧义 |
| 继承public/protected | ✅ | ✅ | ✅ |
| private不继承 | ✅ | ✅ | ✅ |

---

## 二、关键差异

- ⭐ **ArkTS 字段方法同名冲突**：同一 class 声明中字段名与方法名互斥（CLS_09_04_004），Java 不冲突（不同命名空间），Swift 允许但有歧义。
- ⭐ **字段字段同名**：三语言均禁止同scope两字段同名。
- ⭐ **方法方法同名**：三语言均禁止同scope同签名方法。

---

## 三、核心结论

| 角度 | 结论 |
|------|------|
| **成员同名** | ArkTS最严格(字段方法互斥) >> Swift(允许) >> Java(不冲突) |
| **static/instance** | 三语言均允许同名 |
| **继承成员** | public/protected三语言均继承 |

### ArkTS 设计建议

1. ⚠️ **建议评估字段方法同名约束** — Java/Swift均允许，ArkTS禁止可能影响API设计。

---

## 附录

| ArkTS | ArkTS Static Spec §9.4 |
| Java | JLS SE21 §8.2 Class Members |
| Swift | The Swift Programming Language: Classes and Structures |
