# 9.1.1 Abstract Classes - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-22
**规范来源：** ArkTS Static Spec 9.1.1 Abstract Classes, Java JLS SE21 §8.1.1.1 abstract Classes, Swift Language Reference - Protocols
**测试基础：** 12 个用例（4 compile-pass + 5 compile-fail + 3 runtime 真实执行）
**跨语言实测：** WSL Ubuntu (Java 1.8.0_492 / Swift 6.0.3) — T002/S002 实测通过

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 抽象类语法 | `abstract class A { ... }` | `abstract class A { ... }` | ❌ 无 abstract class（用 protocol 替代） |
| 抽象方法 | `abstract fn(): void` | `abstract void fn()` | ❌ 无 abstract 方法（protocol 中声明） |
| 实例化抽象类 | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误（protocol 不能实例化） |
| 非抽象类含抽象方法 | ❌ 编译错误 | ❌ 编译错误 | ❌（非class问题，struct必须实现protocol） |
| abstract + final | ❌ 编译错误 | ❌ 编译错误 | ❌（Swift 无 abstract） |
| abstract + override | ❌ 编译错误 | ✅ 允许 | ✅（protocol 方法可重写） |
| 非抽象子类未实现 | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误（必须实现protocol要求） |

---

## 二、章节对应关系

| ArkTS 9.1.1 | Java JLS SE21 | Swift Reference | 核心议题 |
|-------------|---------------|-----------------|----------|
| Abstract Classes | §8.1.1.1 abstract Classes | Protocols | 抽象类/协议声明 |
| 抽象方法声明 | §8.4.3.1 abstract Methods | Protocol Method Requirements | 抽象方法约束 |
| 实例化禁止 | §15.9 New Class Instance (abstract) | Protocol Conformance | 禁止实例化 |
| 修饰符冲突 | §8.1.1.1 Modifiers | Declarations | abstract+final/override冲突 |

---

## 三、关键差异矩阵

### 3.1 语法

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 抽象类声明 | `abstract class A {}` | `abstract class A {}` | `protocol P {}` |
| 抽象方法 | `abstract fn(): void` | `abstract void fn()` | `func fn()` (protocol 中) |
| 具体子类实现 | `class B extends A { fn(): void {} }` | `class B extends A { void fn() {} }` | `class B: P { func fn() {} }` |
| 抽象子类继承 | `abstract class B extends A {}` | `abstract class B extends A {}` | `class B: P, Q {}`（多协议） |

### 3.2 修饰符冲突

| 冲突组合 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| abstract + final | ❌ 编译错误 (CLS_09_01_019) | ❌ 编译错误 | ❌（无abstract） |
| abstract + override | ❌ 编译错误 (CLS_09_01_020) | ✅ 允许（抽象子类可重新声明） | ✅（protocol方法可在子类重写） |
| abstract + private | ❌（spec禁止） | ❌ 编译错误 | ❌（protocol方法必须可见） |

### 3.3 跨语言特殊点

- ⭐ **Swift 用 protocol 替代 abstract class 是核心差异**：Swift 没有 `abstract` 关键字，用 protocol（仅声明方法签名）+ extension（提供默认实现）+ class conform（实现）三段式替代。功能上等价但语法差异大。
- ⭐ **ArkTS 禁止 abstract + override 而 Java 允许**：ArkTS 规定抽象方法不能有 override 修饰符，但 Java 允许抽象子类重新声明抽象方法（abstract override 表示"重新声明为抽象"）。
- ⭐ **三语言均禁止实例化抽象类**：CLS_09_01_017_FAIL 在三语言中行为一致。

---

## 四、用例 1:1 对照

### 用例 ①：抽象类声明与具体方法 (CLS_09_01_013/014_PASS)

**ArkTS：**
```typescript
abstract class Shape { abstract area(): number; toString(): string { return "Shape" } }
```

**Java：**
```java
abstract class Shape { abstract double area(); String toString() { return "Shape"; } }
```

**Swift（protocol替代）：**
```swift
protocol Shape { func area() -> Double }
extension Shape { func toString() -> String { return "Shape" } }
```

⭐ **差异**：Swift 通过 protocol+extension 提供默认实现，等价于 abstract class 的具体方法。

---

### 用例 ②：实例化抽象类 — 编译错误 (CLS_09_01_017_FAIL)

**ArkTS（编译失败）：**
```typescript
abstract class A {}
let a = new A()  // ❌ Cannot instantiate abstract class
```

**Java（编译失败 — WSL实测确认）：**
```java
abstract class A {}
A a = new A();  // ❌ CannotInstantiate is abstract; cannot be instantiated
```

**Swift（编译失败 — protocol不能实例化）：**
```swift
protocol P {}
let p = P()  // ❌ Protocol 'P' cannot be instantiated
```

⭐ **三语言完全一致** — 均编译拒绝实例化抽象类/协议。

---

### 用例 ③：抽象→子类派发 (CLS_09_01_022_RUNTIME)

**ArkTS（ark VM 实测通过）：**
```typescript
abstract class Animal { abstract speak(): string }
class Dog extends Animal { speak(): string { return "Woof" } }
let a: Animal = new Dog()
assert(a.speak() == "Woof")
```

**Java：**
```java
Animal a = new Dog();
assert a.speak().equals("Woof");
```

**Swift（多态通过protocol）：**
```swift
let a: Shape = Dog()
assert(a.area() == 42.0)  // 多态派发
```

⭐ **三语言多态派发语义一致** — 通过抽象基类/协议引用调用子类方法，行为相同。

---

## 五、严格度对比

```
Swift 更严格 ──────────────── Java 更宽松

领域 1: abstract 方法可见性
  ArkTS (abstract不能private) ≈ Java (abstract不能private) ≈ Swift (protocol方法必须可见)

领域 2: abstract+override 组合
  ArkTS (禁止) > Java (允许) > Swift (protocol允许重写)

领域 3: 实例化禁止
  ArkTS = Java = Swift (均禁止)

总体趋势: ArkTS ≥ Java ≈ Swift (在抽象类约束上)
```

---

## 六、核心结论

| 角度 | 结论 |
|------|------|
| **抽象类声明** | ArkTS = Java (原生abstract) >> Swift (protocol替代) |
| **实例化禁止** | 三语言完全一致 |
| **abstract+final** | 三语言均禁止 |
| **abstract+override** | ArkTS 禁止 | Java 允许 | Swift protocol允许重写 |
| **运行时多态** | 三语言派发语义一致 |

### ArkTS 设计建议

1. ✅ **保留原生 abstract class** — 比 Swift protocol 更直观，与 Java 一致。
2. ⚠️ **考虑是否允许 abstract override** — Java 允许抽象子类重新声明抽象方法，ArkTS 当前禁止。如果需要中间抽象层，可考虑放开。
3. ✅ **保留实例化禁止** — 与 Java/Swift 一致。

---

## 附录：规范文档

| 语言 | 规范来源 |
|------|---------|
| ArkTS | ArkTS Static Spec §9.1.1 Abstract Classes |
| Java | JLS SE21 §8.1.1.1 abstract Classes, §8.4.3.1 abstract Methods |
| Swift | The Swift Programming Language: Protocols, Protocol Extensions |
