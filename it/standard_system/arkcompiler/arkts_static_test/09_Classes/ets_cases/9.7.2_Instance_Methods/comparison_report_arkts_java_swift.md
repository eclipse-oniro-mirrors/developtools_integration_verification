# 9.7.2 Instance Methods - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-19
**规范来源：** ArkTS Static Spec 9.7.2 Instance Methods, Java JLS SE21, Swift Language Reference
**测试基础：** 12 个用例（7 compile-pass + 2 compile-fail + **3 runtime 真实执行**）

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **实例方法本质** | class body 中非 `static` 的方法，通过对象调用 | 非 `static` 方法，通过对象引用调用 | 实例方法定义在 `class` / `struct` / `enum` 中，通过实例调用 |
| **`this` / `self` 引用** | `this` 关键字，指向当前实例 | `this` 关键字，指向当前实例 | `self` 关键字（可省略），指向当前实例 |
| **虚分派** | 所有实例方法默认虚分派 | 所有实例方法默认虚分派（`final` 可阻止） | 不可被继承的类用 `final` 标记；协议方法默认动态派发 |
| **方法重载** | ❌ **不支持** — 同名同参数类型列表即编译错误 | ✅ 支持方法重载（overload） | ✅ 支持方法重载（overload） |
| **`override` 关键字** | 可选（spec 不强制） | 必选（`@Override` 注解） | 必选（`override` 关键字） |
| **值类型实例方法** | 不适用（class 为引用类型） | 不适用（所有对象为引用类型） | `struct` / `enum` 实例方法需 `mutating` 关键字修改属性 |
| **方法签名唯一标识** | 名称 + 参数类型列表 | 名称 + 参数类型列表 + 返回类型（JVM 层面） | 名称 + 参数类型列表 |

---

## 二、章节对应关系

| ArkTS §9.7.2 | Java JLS SE21 | Swift Language Reference |
|-------------|---------------|--------------------------|
| 实例方法声明（class body 内非 static） | JLS §8.4 Method Declarations | Swift 实例方法章节 |
| `this` 访问实例字段 | JLS §15.8.3 `this` | The `self` Property |
| 实例方法虚分派 | JLS §15.12 Method Invocation (dynamic dispatch) | Method Dispatch |
| `override` 重写超类方法 | JLS §8.4.8 Inheritance, Overriding, and Hiding | Override 章节 |
| `super.method()` 调用父类 | JLS §15.11.2 `super` | `super` Keyword |
| 方法签名唯一性（禁止重载） | JLS §8.4.2 Method Signature（允许重载） | Declaration Modifiers（允许重载） |
| 接口方法实现（`implements`） | JLS §8.4.8.1 Overriding (by interface-implementation) | Protocol Method Requirements |
| 参数名遮蔽字段 | JLS §6.4 Shadowing | Name Shadowing |

---

## 三、关键差异矩阵

### 3.1 修饰符 / 语法

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 实例方法声明 | `methodName(params): RetType` | `RetType methodName(params)` | `func methodName(params) -> RetType` |
| 无参数声明 | `foo(): void` | `void foo()` | `func foo()` |
| 默认虚分派 | ✅ 所有实例方法 | ✅ 所有实例方法（非 final） | ✅ class 方法默认动态；protocol 方法动态派发 |
| `final` / 不可重写 | ❌ 无可直接等价语法 | ✅ `final` 方法不可重写 | ✅ `final` class 不可继承 |
| `override` 关键字 | 可选 | 必选（`@Override`） | 必选（`override`） |
| `super` 调用 | ✅ `super.method()` | ✅ `super.method()` | ✅ `super.method()` |
| 方法重载支持 | ❌ 不支持 | ✅ 支持 | ✅ 支持 |
| `this` / `self` | `this` 显式 | `this` 显式 | `self` 隐式（可省略） |
| 值类型修改 | N/A | N/A | `mutating func` 修饰 |
| 返回类型 `void` | `: void` | `void` | 无返回（或 `-> Void`）|

### 3.2 修饰符冲突规则

| 冲突场景 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| 同名同参数类型列表（重载） | ❌ 编译错误 | ✅ 合法（基于返回类型差异或重载） | ✅ 合法（返回类型或参数标签差异） |
| 同名不同返回类型 | ❌ 编译错误 | ✅ 若参数列表不同则允许 | ✅ 若参数列表不同则允许 |
| 子类同签名方法（不写 override） | 视为 override（可选） | ✅ 合法 override（不强制注解） | ❌ 需显式 `override` |
| 子类同签名但返回类型不同 | ❌ 编译错误 | ✅ 协变返回类型允许 | ✅ 协变返回类型允许 |
| 实例方法重写静态方法 | N/A（语言层面禁止） | ❌ 编译错误 | ❌ 编译错误 |
| 参数名遮蔽字段 | ✅ 允许，`this.field` 区分 | ✅ 允许，`this.field` 区分 | ✅ 允许，`self.field` 区分 |

### 3.3 跨语言特殊点 ⭐

- ⭐ **ArkTS 禁止方法重载**：同一类中不允许存在名称相同且参数类型列表相同的多个方法，即使返回类型不同也不允许。这是 ArkTS 简化设计的重要体现，与 Java/Swift 形成显著差异。对应用例 `CLS_09_07_020_FAIL_INSTANCE_METHOD_DUP_SIG` 和 `CLS_09_07_048_FAIL_METHOD_NAME_CONFLICT`。
- ⭐ **Swift `mutating` 关键字**：Swift 的 `struct` 和 `enum` 是值类型，实例方法默认不能修改属性；必须用 `mutating func` 标记。ArkTS 和 Java 的 class 均为引用类型，实例方法修改字段无此限制。
- ⭐ **Java 协变返回类型**：子类 override 方法可以返回比父类更具体的类型（covariant return type），ArkTS/Swift 也支持但限制略有不同。
- ⭐ **ArkTS `override` 可选**：子类重写超类方法时，`override` 关键字是可选的，编译器通过签名匹配自动识别。Java 的 `@Override` 和 Swift 的 `override` 均为（强烈推荐的）显式标记。
- ⭐ **Swift implicit `self`**：Swift 中 `self` 可省略不写，编译器通过作用域解析自动推断。ArkTS 要求显式 `this.field` 来访问字段（参数同名遮蔽场景必须用 `this`）。
- ⭐ **多接口实现**：ArkTS 支持类同时 `implements` 多个接口，实例方法为所有接口提供实现，对应用例 `CLS_09_07_016_PASS_INSTANCE_METHOD_INTERFACE_IMPL`。

---

## 四、用例 1:1 对照（含 runtime 实测结果）

### 用例 ①：实例方法基本用法 + `this` 引用（CLS_09_07_004 / 030 / 034）⭐

**ArkTS（compile-pass + runtime 验证）：**
```typescript
class Acc { val: int = 5; getVal(): int { return this.val } }
// 运行时：c.setVal(77); c.getVal() → 77 ✅

class Entity004 implements Identifiable004 {
  private name: string
  getName(): string { return this.name }
  describe(): string { return "Entity: " + this.name }
}

class Player004 extends Entity004 {
  private level: int
  describe(): string { return "Player: " + this.getName() }
  getLevel(): int { return this.level }
}
```

**Java（同语义）：**
```java
class Acc {
    private int val = 5;
    public int getVal() { return this.val; }  // this 显式
}

class Entity implements Identifiable {
    private String name;
    @Override
    public String getName() { return this.name; }
    public String describe() { return "Entity: " + this.name; }
}

class Player extends Entity {
    private int level;
    @Override
    public String describe() { return "Player: " + this.getName(); }
    public int getLevel() { return this.level; }
}
```

**Swift（同语义，注意 `override` 必选）：**
```swift
class Acc {
    var val: Int = 5
    func getVal() -> Int { return self.val }  // self 可省略
}

class Entity: Identifiable {
    private var name: String
    func getName() -> String { return self.name }
    func describe() -> String { return "Entity: " + self.name }
}

class Player: Entity {
    private var level: Int
    override func describe() -> String { return "Player: " + self.getName() }  // override 必须
    func getLevel() -> Int { return self.level }
}
```

**关键发现：** 三语言在 `this`/`self` 引用和实例方法基本语义上高度一致。差异在于：ArkTS 的 `override` 可选 vs Java/Swift 的（强烈）推荐/必选；ArkTS 禁止重载意味着 `describe` 签名在类层次中必须唯一。

---

### 用例 ②：多级继承链 + super 调用（CLS_09_07_049_RUNTIME_OVERRIDE_CHAIN）⭐ runtime 实测

**ArkTS（runtime 执行通过）：**
```typescript
class Base049 { val(): int { return 1 } }
class Mid049 extends Base049 { override val(): int { return super.val() + 1 } }
class Derived049 extends Mid049 { override val(): int { return super.val() + 1 } }
// main: new Derived049().val() == 3 ✅ runtime 验证
```

**Java（同语义）：**
```java
class Base {
    public int val() { return 1; }
}
class Mid extends Base {
    @Override
    public int val() { return super.val() + 1; }
}
class Derived extends Mid {
    @Override
    public int val() { return super.val() + 1; }
}
// new Derived().val() == 3 ✅
```

**Swift（同语义）：**
```swift
class Base {
    func val() -> Int { return 1 }
}
class Mid: Base {
    override func val() -> Int { return super.val() + 1 }
}
class Derived: Mid {
    override func val() -> Int { return super.val() + 1 }
}
// Derived().val() == 3 ✅
```

**关键发现：** 三语言多级继承链 + `super` 调用语义完全一致。运行时实测验证 ArkTS 的 `override` + `super` 调用链在 ark VM 上正确分派。`Derived049().val()` 返回 `1+1+1 = 3`。

---

### 用例 ③：方法签名冲突检测（CLS_09_07_020 / 048）⭐

**ArkTS（编译失败）：**
```typescript
// 同签名重复定义 → compile-fail
class DuplicateMethod020 {
  process(value: int): int { return value + 1 }
  process(value: int): int { return value * 2 }  // ❌ 重复签名
}

// 同名不同返回类型 → compile-fail
class Bad048 { work(): void {} work(): int { return 1 } }  // ❌ 方法名冲突
```

**Java（编译通过 —— 取决于参数列表是否不同）：**
```java
// 同签名重复 → compile-fail（Java 同样禁止）
class DuplicateMethod {
    int process(int value) { return value + 1; }
    int process(int value) { return value * 2; }  // ❌ duplicate method
}

// 但不同的返回类型 + 相同参数 → compile-fail 在 Java 中也禁止（仅在 JVM 字节码层面不可区分）
// 方法重载在 Java 中通过参数类型/数量区分是允许的：
int compute(int x) { return x; }
double compute(double x) { return x; }  // ✅ 合法重载（参数类型不同）
```

**Swift（允许重载 —— 参数类型或标签不同即可）：**
```swift
// 同签名重复 → compile-fail
class Example {
    func process(_ value: Int) -> Int { return value + 1 }
    func process(_ value: Int) -> Int { return value * 2 }  // ❌ duplicate method
}

// 但以下合法 —— 参数标签不同：
func process(value: Int) -> Int { return value + 1 }
func process(_ value: Int) -> Int { return value * 2 }  // ✅ 合法重载
```

**关键发现：** 三语言都禁止完全相同的方法签名重复声明，但 **Java 和 Swift 允许通过参数类型/数量/标签差异实现方法重载**，而 **ArkTS 完全禁止重载**。这是 ArkTS 简化设计中最大的差异点。

---

### 用例 ④：多接口实现（CLS_09_07_016）➕ 复杂参数类型（CLS_09_07_018）⭐

**ArkTS：**
```typescript
class Circle016 implements Shape016, Labeled016 {
  area(): double { return 3.14159 * this._radius * this._radius }
  perimeter(): double { return 2.0 * 3.14159 * this._radius }
  scale(factor: double): void { this._radius = this._radius * factor }
  getLabel(): string { return this._label }
  setLabel(label: string): void { this._label = label }
  diameter(): double { return 2.0 * this._radius }
}

class ArrayProcessor018 {
  setLabel(label: string | null): void { ... }  // 联合类型参数
  addBonus(base: int, bonus?: int): int { ... }  // 可选参数
  prefixAll(items: int[], prefix: int): int[] { ... }  // 数组参数+返回
}
```

**Java（同语义，但无联合类型）：**
```java
class Circle implements Shape, Labeled {
    @Override public double area() { return 3.14159 * radius * radius; }
    @Override public double perimeter() { return 2.0 * 3.14159 * radius; }
    @Override public void scale(double factor) { this.radius *= factor; }
    @Override public String getLabel() { return this.label; }
    @Override public void setLabel(String label) { this.label = label; }
    public double diameter() { return 2.0 * radius; }
}
// Java 无联合类型（用 Optional 或重载替代），无可选参数
```

**Swift（等价，但需注意值类型场景）：**
```swift
class Circle: Shape, Labeled {
    func area() -> Double { return 3.14159 * radius * radius }
    func perimeter() -> Double { return 2.0 * 3.14159 * radius }
    func scale(factor: Double) { self.radius *= factor }
    func getLabel() -> String { return self.label }
    func setLabel(_ label: String) { self.label = label }
    func diameter() -> Double { return 2.0 * radius }
}
// Swift 支持可选参数和联合类型（enum Optional）
```

**关键发现：** ArkTS 的多接口实现语义与 Java/Swift 一致。ArkTS 独有的 **联合类型参数**（`string | null`）和 **可选参数**（`bonus?: int`）在 Java 中没有直接等价特性（Java 需用 `Optional`、重载或 `@Nullable` 注解）。

---

## 五、严格度对比

```
严格（更多编译时约束）               宽松（更多运行时自由度）
──────────────────────────────────────────────────────────

ArkTS ──────────────────────────────────────────────────
  • 完全禁止方法重载（同名同参即 error）
  • override 可选
  • 参数类型严格匹配
  • 无原始类型（raw type）回退

Java ────────────────────────────────────────────────────
  • 允许方法重载（参数类型/数量区分）
  • @Override 注解可选（不强制）
  • 允许 raw type（泛型历史兼容）
  • 允许协变返回类型
  • 支持 final 方法显式禁止重写

Swift ───────────────────────────────────────────────────
  • 允许方法重载（参数标签区分）
  • override 关键字必选
  • 协议方法必须实现（编译检查）
  • final class 阻止继承
  • mutating 关键字显式标记值类型修改
```

**三语言严格度光谱：** Swift > ArkTS > Java

- **Swift 最严格**：`override` 关键字必选、`mutating` 显式声明、协议方法强约束、`final` 显式标记。
- **ArkTS 居中**：禁止重载使方法签名唯一性最严格（Java/Swift 允许重载），但 `override` 可选降低了某些场景的安全性。
- **Java 最宽松**：允许方法重载、`@Override` 可选、协变返回类型、raw type 兼容。

---

## 六、继承/组合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 实例方法虚分派正确性 | ⭐⭐⭐⭐⭐ (runtime 3/3 通过) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| `this` / `self` 引用一致性 | ⭐⭐⭐⭐⭐ (7 个 PASS 用例覆盖) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 接口方法实现约束 | ⭐⭐⭐⭐⭐ (多接口强制实现) | ⭐⭐⭐⭐⭐ (强制实现所有方法) | ⭐⭐⭐⭐⭐ (协议方法强制实现) |
| **方法签名唯一性保护** | ⭐⭐⭐⭐⭐（禁止重载，零歧义） | ⭐⭐⭐（允许重载，可能混淆） | ⭐⭐⭐（允许重载，需标签区分） |
| **`override` 安全检查** | ⭐⭐⭐（可选关键字，可能遗漏） | ⭐⭐⭐⭐（`@Override` 推荐） | ⭐⭐⭐⭐⭐（关键字必选，无遗漏风险） |
| 多级继承链 `super` 支持 | ⭐⭐⭐⭐⭐ (runtime 049 验证) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 参数名遮蔽处理 | ⭐⭐⭐⭐⭐ (this.field 明确区分) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 值类型实例方法支持 | N/A（class-only） | N/A（class-only） | ⭐⭐⭐⭐⭐（mutating 语义） |
| 复杂参数类型支持 | ⭐⭐⭐⭐⭐（联合类型+可选参数） | ⭐⭐⭐（无联合类型/可选参数） | ⭐⭐⭐⭐⭐（等价能力） |

---

## 七、核心结论

| 角度 | 结论 |
|------|------|
| **实例方法基本语义** | 三语言高度一致：非 static、对象调用、`this`/`self` 引用 |
| **虚分派** | 三者默认均为虚分派，ArkTS = Java = Swift |
| **方法重载** | ArkTS 完全禁止 vs Java/Swift 允许 —— 最大差异 |
| **override 关键字** | ArkTS 可选 vs Swift 必选 vs Java 注解推荐 |
| **`super` 调用链** | 三者完全一致，ArkTS runtime 实测通过 |
| **接口方法实现** | 三语言语义一致，ArkTS 支持多接口 |

### 关键启示

1. **ArkTS 实例方法设计稳健**：12 个用例 100% 通过（7 PASS + 2 FAIL + 3 runtime），无设计缺陷，与 Java/Swift 核心语义对齐。
2. **禁止方法重载是双刃剑**：简化了编译器实现和开发者心智模型（无需考虑重载解析优先级），但丧失了 Java/Swift 中重载带来的 API 设计灵活性。
3. **`override` 关键字可选是风险点**：子类开发者可能无意中重写了父类方法而不自知（尤其当父类新增方法时）。Swift 的强制 `override` 更安全。
4. **联合类型参数和可选参数是 ArkTS 独特优势**：Java 没有直接的联合类型和可选参数语法，需要用 `Optional<T>` 或方法重载模拟。
5. **参数名遮蔽语义清晰**：三语言一致采用"裸名=参数，`this.field`=字段"规则，ArkTS 对应用例 `CLS_09_07_019` 已验证。

### ArkTS 设计建议

1. ✅ **保留**：禁止方法重载 —— 简化语言，减少歧义，适合声明式 UI 开发场景。
2. ⚠️ **建议加强**：将 `override` 关键字改为**可选警告**（编译器检测到疑似 override 时提示），或至少在工具链（IDE Lint）中提供 override 遗漏检测。
3. ✅ **保留**：联合类型参数和可选参数 —— 相比 Java 的明显优势，提升 API 表达力。
4. ⚠️ **建议补充**：考虑增加 `final` 标记（防止子类重写特定方法），目前 ArkTS 无法阻止某个实例方法被子类重写。
5. ✅ **保留**：多接口实现语义清晰，与 Java/Swift 一致，无需修改。

---

## 六、对应规范文档

| 语言 | 规范来源 |
|------|---------|
| ArkTS | ArkTS Static Spec §9.7.2 Instance Methods |
| Java | JLS SE21 §8.4 Method Declarations, §15.12 Method Invocation, §8.4.8 Inheritance, Overriding, and Hiding |
| Swift | The Swift Programming Language: Methods, Inheritance, Method Dispatch |
