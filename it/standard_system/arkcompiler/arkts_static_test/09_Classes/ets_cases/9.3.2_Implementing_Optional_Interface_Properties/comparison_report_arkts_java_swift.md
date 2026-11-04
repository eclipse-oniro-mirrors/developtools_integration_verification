# 9.3.2 Implementing Optional Interface Properties - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**规范来源：** ArkTS Static Spec 9.3.2, Java JLS SE21 §9.4, Swift Language Reference - Optional Protocol Requirements
**测试基础：** 6 个用例（3 compile-pass + 1 compile-fail + 2 runtime）

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 可选接口属性 | ✅ `prop?: Type` | ❌（接口无可选属性） | ✅ `optional var prop: Type` (仅@objc协议) |
| 不实现可选属性 | ✅ 编译通过 | ✅（接口常量需实现） | ✅ 编译通过 |
| optional字段实现 | ✅ `prop?: Type` 实现 | ❌ | ✅ `var prop: Type?` 实现 |
| 非可选实现可选 | ❌ 编译错误 | ❌ | ❌（类型不匹配） |

---

## 二、关键差异

- ⭐ **Java 不支持可选接口属性**：Java 接口中所有成员都必须实现，无可选概念。
- ⭐ **Swift 仅 @objc 协议有 optional**：Swift 的 optional protocol requirements 仅限于与 Objective-C 互操作的 @objc 协议，纯 Swift protocol 不支持可选要求。
- ⭐ **ArkTS 是最灵活的设计**：原生支持可选接口属性且不限于特定场景。

---

## 三、用例对照

### 用例 ①：不实现可选属性 (CLS_09_03_2_001_PASS)

**ArkTS：** `class C implements I { }` — 可不实现 `prop?: string` ✅
**Java：** 接口无可选属性概念，所有成员必须实现 ❌
**Swift：** `class C: P { }` — 可不实现 @objc optional 成员 ✅

---

## 四、核心结论

| 角度 | 结论 |
|------|------|
| **可选接口属性** | ArkTS原生支持 >> Swift(@objc限定) >> Java(不支持) |
| **不实现可选** | ArkTS=Swift(允许) >> Java(不允许) |
| **非可选实现可选** | ArkTS编译拒绝(安全) |

### ArkTS 设计建议

1. ✅ **保留原生可选接口属性** — 比 Java/Swift 更灵活且不限定场景。

---

## 附录

| ArkTS | ArkTS Static Spec §9.3.2 |
| Java | JLS SE21 §9.4 Interface Methods |
| Swift | The Swift Programming Language: Optional Protocol Requirements |
