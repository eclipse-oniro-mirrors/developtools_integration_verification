# 9.3.1 Implementing Required Interface Properties - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**规范来源：** ArkTS Static Spec 9.3.1, Java JLS SE21 §9.4 Interface Methods & Fields, Swift Language Reference - Protocol Properties
**测试基础：** 14 个用例（6 compile-pass + 5 compile-fail + 3 runtime 真实执行）
**跨语言实测：** WSL Ubuntu (Java 1.8.0_492 / Swift 6.0.3) — T005/S005 实测通过

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 必需接口属性 | ✅ 接口声明 required 属性 | ❌ 仅 static final 常量 | ✅ protocol `{ get set }` 属性 |
| 字段实现属性 | ✅ `field: Type` 实现 | ❌（无实例属性） | ✅ `var prop: Type` 实现 |
| readonly实现readonly | ✅ readonly字段→readonly属性 | ❌（仅常量） | ✅ let→{ get } 属性 |
| getter+setter实现 | ✅ get/set实现属性 | ✅ getter/setter方法 | ✅ 计算属性实现 |
| readonly实现writeable | ❌ 编译错误 | ❌ | ❌ |
| getter-only实现writeable | ❌ 编译错误 | ❌ | ❌ |

---

## 二、关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 接口属性类型 | required + optional | 仅 public static final 常量 | required `{ get }` / `{ get set }` |
| 字段实现方式 | 直接字段 / getter+setter | 仅方法（无字段级实现） | var / let / 计算属性 |
| readonly→readonly | ✅ | ✅ (final) | ✅ (let) |
| readonly→writeable | ❌ 编译错误 | ❌ | ❌ |
| getter→readonly | ✅ | ✅ | ✅ |
| 无实现必需属性 | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |

### 跨语言特殊点

- ⭐ **Java 接口不支持可变实例属性**：Java 接口中只有 `public static final` 常量，无法声明可变实例属性。ArkTS 和 Swift 都支持接口/协议声明可变属性要求（`{ get set }`）。
- ⭐ **ArkTS readonly 字段可实现 readonly 接口属性**：这与 Swift 的 `let` 实现 `{ get }` 属性一致。Java 无此概念（仅有 final 常量）。
- ⭐ **ArkTS readonly 字段不可实现 writeable 接口属性**：与 Swift 一致（let 不能实现 { get set }），这是合理的安全约束。

---

## 三、用例对照

### 用例 ①：字段实现接口属性 (CLS_09_03_1_001_PASS)

**ArkTS：** `class C implements I { name: string = "x" }` — 字段直接实现 ✅
**Java：** 接口属性只能是常量，类用 getter 方法替代 ✅
**Swift：** `class C: P { var name: String = "x" }` — var 实现 { get set } ✅

### 用例 ②：getter+setter实现 (CLS_09_03_1_003_PASS)

**ArkTS：** `get name(): string { ... } set name(v: string) { ... }` ✅
**Java：** `String getName() { ... } void setName(String v) { ... }` ✅
**Swift：** `var name: String { get { ... } set { ... } }` ✅

---

## 四、核心结论

| 角度 | 结论 |
|------|------|
| **接口属性** | ArkTS=Swift(支持可变) >> Java(仅常量) |
| **字段实现** | ArkTS=Swift(直接字段/属性) >> Java(方法替代) |
| **readonly约束** | ArkTS=Swift(一致) >> Java(仅final) |

### ArkTS 设计建议

1. ✅ **保留接口可变属性** — 比 Java 更灵活，与 Swift protocol 一致。
2. ✅ **保留 readonly→writeable 编译拒绝** — 安全约束与 Swift 一致。

---

## 附录：规范文档

| 语言 | 规范来源 |
|------|---------|
| ArkTS | ArkTS Static Spec §9.3.1 Implementing Required Interface Properties |
| Java | JLS SE21 §9.4 Interface Methods, §8.4.3.3 final Methods |
| Swift | The Swift Programming Language: Protocols - Property Requirements |
