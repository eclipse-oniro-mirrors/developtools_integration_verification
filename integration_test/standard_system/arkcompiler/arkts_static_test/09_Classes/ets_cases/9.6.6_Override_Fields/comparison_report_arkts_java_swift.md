# 9.6.6 Override Fields - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**测试基础：** 9 个用例（3 compile-pass + 4 compile-fail + 2 runtime）
**跨语言实测：** T012/S012 实测通过

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 字段override语法 | `override name: Type = init` | ❌ 无字段override(仅隐藏) | ✅ `override var name: Type` (仅计算属性) |
| override语义 | **虚字段**(父类引用也看到子类值) | **字段隐藏**(父类引用看到父类值) | **虚属性**(计算属性override是虚方法) |
| 同类型override | ✅ | ✅(隐藏) | ✅(计算属性) |
| 类型不匹配 | ❌ 编译错误 | ✅(隐藏允许不同类型) | ❌ 编译错误(override必须协变) |
| 修饰符不匹配 | ❌ 编译错误 | ✅(隐藏可不同可见性) | ❌ 编译错误 |
| static+override | ❌ 编译错误 | ❌(static不参与继承) | ❌ 编译错误 |
| 不存在字段override | ❌ 编译错误 | ✅(新字段，不算override) | ❌ 编译错误 |

---

## 二、关键差异

- ⭐⭐ **ArkTS 字段 override 是虚方法，Java 是字段隐藏** — 这是三语言中最显著的差异：
  - **ArkTS**: 子类 override 字段后，通过父类引用也看到子类值（虚字段）
  - **Java**: 子类同名字段只是隐藏，通过父类引用看到**父类值**（`(Parent)child.field != child.field`）
  - **Swift**: 存储属性不能 override，必须用计算属性；计算属性 override 是虚方法

- ⭐ **Swift 存储属性不能 override**：Swift 规定子类不能 override 父类的存储属性，只能 override 计算属性。ArkTS 允许 override 存储字段。

---

## 三、用例对照

### 用例 ①：字段 override vs 隐藏 (CLS_09_06_6_008_RUNTIME)

**ArkTS（虚字段 — 父类引用看到子类值）：**
```typescript
class Base { name: string = "Base" }
class Derived extends Base { override name: string = "Derived" }
let b: Base = new Derived()
// b.name == "Derived" — 虚字段
```

**Java（字段隐藏 — 父类引用看到父类值）：**
```java
Base b = new Derived();
// b.name == "Base" — 字段隐藏！
// ((Derived)b).name == "Derived" — 子类引用看到子类值
```

**Swift（计算属性 override — 虚方法）：**
```swift
class Base { var name: String { return "Base" } }
class Derived: Base { override var name: String { return "Derived" } }
let b: Base = Derived()
// b.name == "Derived" — 虚属性
```

⭐⭐ **核心差异**: ArkTS 字段 override 是虚方法（与 Swift 计算属性一致），Java 字段只能隐藏（父类引用看到父类值）。

---

## 四、核心结论

| 角度 | 结论 |
|------|------|
| **字段override语义** | ArkTS(虚字段)=Swift(虚属性) >> Java(字段隐藏) |
| **存储属性override** | ArkTS允许 >> Swift禁止 |
| **类型/修饰符约束** | ArkTS=Swift(严格) >> Java(宽松) |

### ArkTS 设计建议

1. ✅ **保留虚字段 override** — 与 Swift 虚属性一致，比 Java 字段隐藏更安全。
2. ⚠️ **文档中明确说明与 Java 字段隐藏的差异** — 这是迁移时的重要注意事项。

---

## 附录

| ArkTS | §9.6.6 | Java | §8.3/§8.4.8 | Swift | Properties/Inheritance |
