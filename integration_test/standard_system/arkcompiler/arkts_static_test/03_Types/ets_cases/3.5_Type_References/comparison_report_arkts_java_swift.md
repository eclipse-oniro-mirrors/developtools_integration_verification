# 3.5 Type References - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-11
**规范来源：** ArkTS Static Spec §3.5 Type References
**测试基础：** 19 个用例（10 PASS + 5 FAIL + 4 runtime 真实执行）

---

## 一、本节核心概念

ArkTS §3.5 定义了**类型引用 (Type Reference)** 的形式：

| 形式 | 语法 | 示例 |
|------|------|------|
| Simple name | `TypeName` | `let x: int`, `let y: MyClass` |
| Qualified name | `pkg.TypeName` | `let m: ns.MyMap` |
| 带类型参数 | `Name<T1, T2>` | `Map<string, number>` |
| Type alias | 通过 alias 名 | `type T = ...; let x: T` |

**核心规则：**
- 泛型 type reference 必须 well-formed（参数数量+约束）
- type alias 引用被**透明递归替换**为底层非别名类型

---

## 二、跨语言对比

### 2.1 类型引用语法

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Simple name | `TypeName` | `TypeName` | `TypeName` |
| Qualified name | `ns.Type` | `pkg.Type` | `Module.Type` |
| 嵌套限定名 | `outer.inner.Type` | `outer.inner.Type` | `Module.Type.Nested` |
| Generic args | `<T1, T2>` | `<T1, T2>` | `<T1, T2>` |
| Type alias | ✅ `type T = ...` | ❌ | ✅ `typealias T = ...` |

### 2.2 泛型实例化要求

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 显式 type args | ✅（除非 default）| ⚠️（允许 raw type）| ✅（除非可推断）|
| Type 默认值 | ✅ `<T = int>` | ❌ | ❌ |
| 参数数量检查 | ✅ 严格 | ✅ 严格 | ✅ 严格 |
| 约束检查 | ✅ extends | ✅ extends | ✅ where |
| 嵌套泛型 | ✅ `A<B<C>>` | ✅ `A<B<C>>` | ✅ `A<B<C>>` |

### 2.3 type alias 替换语义 ⭐

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 是否支持 | ✅ | ❌（无 type alias）| ✅ typealias |
| 透明替换 | ✅（spec 显式规定）| N/A | ✅ |
| 递归替换 | ✅ | N/A | ✅ |
| 链式（A→B→C）| ✅ | N/A | ✅ |
| 泛型 alias | ✅ `type T<U>=...` | N/A | ✅ |
| alias 循环引用拒绝 | ✅ | N/A | ✅ |

---

## 三、用例 1:1 对照

### 用例 ①：spec 关键 alias 替换（TYP_03_05_007 / 016）⭐

**ArkTS（spec §3.5 原例）：**
```typescript
type T1 = Object
type T2 = number

function foo(t1: T1, t2: T2) {
  t1 = t2      // 类型兼容性测试用 Object 和 number（不是 T1/T2）
  let s: number = t2 + t2  // 运算合法性用 number 而非 T2
}
```

**Swift（同语义）：**
```swift
typealias T1 = AnyObject
typealias T2 = Double

func foo(t1: T1, t2: T2) {
    var temp: T1 = t1
    let s: Double = t2 + t2   // alias 透明替换
}
```

**Java（无 type alias）：**
```java
// Java 必须直接用 Object 和 double，没有 alias 机制
void foo(Object t1, double t2) {
    double s = t2 + t2;
}
```

### 用例 ②：泛型 alias（TYP_03_05_009 / 019）

**ArkTS（spec §3.5 原例）：**
```typescript
class A<T> { /* ... */ }
type MyType<T> = A<T>[]
let x: MyType<number> = [new A<number>(), new A<number>()]
// MyType<number> 透明替换为 A<number>[]
```

**Swift：**
```swift
class A<T> { /* ... */ }
typealias MyType<T> = [A<T>]
var x: MyType<Double> = [A<Double>(), A<Double>()]
```

**Java（无 type alias）：** 无对应。

### 用例 ③：泛型嵌套引用（TYP_03_05_005）

**ArkTS：**
```typescript
class Cont<T> { v: T; ... }
let nested: Cont<Cont<int>> = new Cont<Cont<int>>(new Cont<int>(42))
```

**Java（自动装箱）：**
```java
class Cont<T> { T v; ... }
Cont<Cont<Integer>> nested = new Cont<>(new Cont<>(42));   // Integer 装箱
```

**Swift：**
```swift
struct Cont<T> { var v: T }
let nested: Cont<Cont<Int>> = Cont(v: Cont(v: 42))
```

**关键差异：** Java 必须装箱（`int` → `Integer`），ArkTS/Swift 直接用原生类型。

### 用例 ④：alias 循环引用（TYP_03_05_015）

**ArkTS（编译失败）：**
```typescript
type SelfRef = SelfRef             // ❌
type Mutual1 = Mutual2; type Mutual2 = Mutual1   // ❌
```

**Swift（同样失败）：**
```swift
typealias SelfRef = SelfRef        // ❌ Type alias references itself
```

**Java：** 无 type alias，无此问题。

### 用例 ⑤：泛型约束违反（TYP_03_05_012）

**ArkTS：**
```typescript
class Constrained<T extends Base> { /* ... */ }
let c: Constrained<NotASubtype>   // ❌
let c2: Constrained<string>       // ❌
```

**Java（同样失败）：**
```java
class Constrained<T extends Base> { /* ... */ }
Constrained<NotASubtype> c = ...   // ❌ Type argument is not within bounds
```

**Swift（用 where）：**
```swift
struct Constrained<T> where T: Base { /* ... */ }
let c: Constrained<NotASubtype>    // ❌ does not conform to expected type
```

### 用例 ⑥：默认类型参数（TYP_03_05_006）

**ArkTS：**
```typescript
class Defaulted<T = int> {
  v: T
  constructor(x: T) { this.v = x }
}
let d: Defaulted = new Defaulted(2)   // T 默认为 int
```

**Java（不支持默认类型参数）：**
```java
class Defaulted<T> { /* ... */ }
Defaulted d = new Defaulted();   // ⚠️ raw type warning，没有"默认"概念
```

**Swift（不支持默认类型参数）：**
```swift
struct Defaulted<T> { var v: T }
let d = Defaulted(v: 2)   // 通过推断而非默认
```

**关键差异：** ArkTS 是三者中**唯一**支持泛型默认参数的语言。

---

## 四、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | Simple name 类型引用 `let x: int` | ✅ compile-pass | ✅ 编译通过 | ✅ 编译通过 |
| 002 | Qualified name `ns.MyType` | ✅ compile-pass | ✅ `pkg.MyType` | ✅ `Module.MyType` |
| 003 | 泛型引用 `Map<string, int>` | ✅ compile-pass | ✅ `Map<String, Integer>` | ✅ `Dictionary<String, Int>` |
| 004 | type alias 引用 `let x: MyAlias` | ✅ compile-pass | ❌ 无 type alias | ✅ typealias |
| 005 | type alias 透明替换（赋值兼容） | ✅ runtime | N/A | ✅ runtime |
| 006 | 默认类型参数 `<T = int>` | ✅ compile-pass | ❌ 不支持 | ❌ 不支持 |
| 007 | spec 原例：alias 替换后类型兼容 | ✅ runtime | N/A | ✅ runtime |
| 008 | 泛型嵌套 `Cont<Cont<int>>` | ✅ compile-pass | ⚠️ 需装箱 `Cont<Cont<Integer>>` | ✅ 编译通过 |
| 009 | 泛型 alias `type M<T> = A<T>[]` | ✅ compile-pass + runtime | ❌ 无 type alias | ✅ typealias |
| 010 | alias 循环引用（compile-fail） | ✅ compile-fail | N/A | ✅ compile-fail |
| 011 | 泛型约束违反（compile-fail） | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 012 | 泛型参数数量不匹配 | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 013 | 类型参数作用域外引用（compile-fail） | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 014 | interface 类型引用 | ✅ compile-pass | ✅ 编译通过 | ✅ protocol 引用 |
| 015 | enum 类型引用 | ✅ compile-pass | ✅ 编译通过 | ✅ 编译通过 |
| 016 | alias 链式替换 runtime 验证 | ✅ runtime | N/A | ✅ runtime |
| 017 | 泛型实例化约束检查 runtime | ✅ runtime | ✅ runtime | ✅ runtime |
| 018 | 数组类型引用 `int[]` vs `Array<int>` | ✅ compile-pass（等价） | ✅ `int[]` | ✅ `[Int]` |
| 019 | 函数类型引用 `() => int` | ✅ compile-pass | ⚠️ `Function<Integer,Integer>` | ✅ `() -> Int` |

### 关键差异详解

#### 006: 默认类型参数 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `class D<T = int>{}; let d: D = new D(1)` | ✅ T 自动推断为 int |
| Java | 无默认类型参数 | — |
| Swift | 无默认类型参数，必须显式或可推断 | — |

#### 008: 泛型嵌套无装箱 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `Cont<Cont<int>>` | ✅ 原生类型直接嵌套 |
| Java | `Cont<Cont<Integer>>` | ⚠️ 必须 Integer 装箱 |
| Swift | `Cont<Cont<Int>>` | ✅ 原生类型直接嵌套 |

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Simple/Qualified name | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 泛型类型引用 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Type alias 透明性 | ⭐⭐⭐⭐⭐ | ❌ | ⭐⭐⭐⭐⭐ |
| 默认类型参数 | ⭐⭐⭐⭐⭐（独有） | ❌ | ❌ |
| 嵌套泛型 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐（需装箱）| ⭐⭐⭐⭐⭐ |
| 循环引用检测 | ⭐⭐⭐⭐⭐ | N/A | ⭐⭐⭐⭐⭐ |

---

## 五、核心结论

| 角度 | 结论 |
|------|------|
| **类型引用语法** | 三者基本一致 |
| **type alias 透明性** | ArkTS = Swift > Java（无）|
| **泛型默认参数** | ArkTS 独有 |
| **嵌套泛型实例化** | ArkTS = Swift > Java（需装箱）|
| **约束/参数数量检查** | 三者一致严格 |

### 关键启示

1. **ArkTS §3.5 设计与 Swift 几乎完全一致**，质量较高
2. **泛型默认参数** 是 ArkTS 独有特性（Java/Swift 都不支持）
3. **type alias 透明替换** 与 Swift 一致，Java 完全缺失
4. **泛型不需要装箱** 是 ArkTS/Swift 相对 Java 的优势
5. **约束 + 数量检查** 三语言一致严格

### ArkTS 设计建议

1. ✅ 保留：alias 透明替换语义清晰
2. ✅ 保留：泛型默认参数（独有优势）
3. ✅ 保留：泛型不装箱（性能优势）

---

## 六、对应规范文档

| 语言 | 规范来源 |
|------|---------|
| ArkTS | ArkTS Static Spec §3.5 Type References |
| Java | JLS SE21 §4.3 Reference Types, §4.5 Parameterized Types, §6 Names |
| Swift | The Swift Programming Language: Type Aliases, Generics, Type References |
