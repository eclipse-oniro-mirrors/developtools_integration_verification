# 3.11 Type void or undefined - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| void 类型 | `void` / `undefined`（同一类型），唯一值 `undefined` | `void` 仅返回类型，无值 | `Void` / `()`（空元组），唯一值 `()` |
| void 在类型系统中的位置 | `void ≡ undefined`，是 `Any` 的子类型 | `void` 仅用于方法返回类型声明 | `Void` 是 `()` 的别名，完整类型 |
| 推荐做法 | `void` 和 `undefined` 可互换使用 | `void` 仅作返回类型 | 使用 `Void` 或 `()` |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| void 返回类型 | `function f(): void` | `void f()` | `func f() -> Void` |
| undefined 返回类型 | `function f(): undefined` | N/A（无 undefined） | N/A（无 undefined） |
| void 变量声明 | `let v: void = undefined` | ❌ 编译错误 | `let v: Void = ()` |
| void 函数返回值 | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| void 泛型参数 | `new A<void>(undefined)` | ❌ 编译错误 | `Box<Void>(value: ())` |
| void 数组 | `void[] = [undefined]` | ❌ 编译错误 | `[Void] = [(), ()]` |
| undefined 赋给非空类型 | ❌ 编译错误 | N/A | N/A |
| void 与 undefined 互赋 | `v = u; u = v` | N/A | N/A |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **void 表达力** | 完整类型，可作变量/泛型/数组 | 仅返回类型，不能作变量/泛型/数组 | 完整类型，可作变量/泛型/数组 |
| **undefined 概念** | ✅ 原生支持，`void ≡ undefined` | ❌ 无此概念 | ❌ 无此概念（用 `nil`） |
| **唯一值** | `undefined` | 无值 | `()`（空元组） |
| **nullish 集成** | ✅ void 参与 nullish 体系 | ❌ void 不参与任何类型体系 | ⚠️ Optional 单独处理 |
| **语义模型** | `void ≡ undefined` | `void` = 无返回值 | `Void = ()` 空元组 |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 void 作为返回类型

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | void 函数返回 | ✅ compile-pass | ✅ | ✅ |

**代码对照：**

ArkTS (compile-pass):
```typescript
function f1(): void {
  return undefined
}
function f2(): void {
  return
}
function f3() {
  return undefined
}
```

Java:
```java
static void f1() { return; }
static void f2() { }
```

Swift:
```swift
func f1() -> Void { return }
func f2() -> Void { }
func f3() -> () { return }
```

---

### 4.2 undefined 作为返回类型 ⭐ ArkTS 独有

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 002 | undefined 函数返回 | ✅ compile-pass | N/A（无 undefined） | N/A（无 undefined） |

**代码对照：**

ArkTS (compile-pass):
```typescript
function f(): undefined {
  return
}
```

Java: **N/A**（Java 无 undefined 概念）

Swift: **N/A**（Swift 无 undefined 概念）

ArkTS 独有：Java 和 Swift 都没有与 `undefined` 对应的概念。

---

### 4.3 void/undefined 变量声明 ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 003 | void 变量声明 | ✅ compile-pass | ❌ **compile-fail** | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
let v: void = undefined
let u: undefined = undefined
v = u
u = v
```

Java (**compile-fail**):
```java
void v = null;  // 编译错误: illegal start of expression
```

Swift (compile-pass):
```swift
let v: Void = ()
let u: () = ()
// v == u  // true
```

**关键差异**: Java 的 void 仅能作返回类型，不能声明变量；ArkTS 和 Swift 都允许 void 作为完整类型使用。

---

### 4.4 void 函数返回值 ⭐ 三语言一致

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 011 | void 函数返回值 | ✅ **compile-fail** | ✅ **compile-fail** | ✅ **compile-fail** |

**代码对照：**

ArkTS (compile-fail):
```typescript
function f(): void {
  return 42  // 编译错误
}
```

Java (compile-fail):
```java
static void f() {
    return 42;  // 编译错误: incompatible types
}
```

Swift (compile-fail):
```swift
func f() -> Void {
    return 42  // 编译错误: cannot convert return expression
}
```

**三语言一致**: void 函数都不能返回值。

---

### 4.5 void 作为泛型参数 ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 006 | void 泛型参数 | ✅ compile-pass | ❌ **compile-fail** | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
class A<T> {
  f: T
  constructor(f: T) { this.f = f }
}
let a1 = new A<void>(undefined)
```

Java (**compile-fail**):
```java
List<void> list;  // 编译错误: illegal start of type
```

Swift (compile-pass):
```swift
struct Box<T> {
    let value: T
}
let box = Box<Void>(value: ())
```

**关键差异**: Java 无法使用 void 作为泛型参数；ArkTS 和 Swift 都支持。

---

### 4.6 void 作为数组元素 ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 009 | void 数组 | ✅ compile-pass | ❌ **compile-fail** | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
let arr: void[] = [undefined]
```

Java (**compile-fail**):
```java
void[] arr;  // 编译错误
```

Swift (compile-pass):
```swift
let arr: [Void] = [(), (), ()]
```

**关键差异**: Java 无法创建 void 数组；ArkTS 和 Swift 都支持。

---

### 4.7 undefined 赋给非空类型 ⭐ ArkTS 独有

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 013 | undefined 赋给非空类型 | ✅ **compile-fail** | N/A | N/A |

**代码对照：**

ArkTS (compile-fail):
```typescript
let s: string = undefined  // 编译错误
let n: int = undefined     // 编译错误
```

Java: **N/A**（无 undefined）

Swift: **N/A**（无 undefined）

---

### 4.8 void/undefined 互赋值 ⭐ ArkTS 独有

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 004 | void 与 undefined 互赋 | ✅ compile-pass | N/A | N/A |

**代码对照：**

ArkTS (compile-pass):
```typescript
let v: void = undefined
let u: undefined = undefined
v = u  // OK
u = v  // OK
```

Java: **N/A**（无 undefined）

Swift: **N/A**（无 undefined，Void 和 () 是同一概念）

---

### 4.9 void 泛型类实例化

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 006 | void 泛型类 | ✅ compile-pass | ❌ **compile-fail** | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
class A<T> {
  f: T
  m(): T { return this.f }
  constructor(f: T) { this.f = f }
}
let a1 = new A<void>(undefined)
let a2 = new A<undefined>(undefined)
```

Java (**compile-fail**):
```java
// 无法实例化 void 泛型
```

Swift (compile-pass):
```swift
struct Box<T> {
    let value: T
}
let b1 = Box<Void>(value: ())
let b2 = Box<()>(value: ())
```

---

### 4.10 void 数组声明与初始化

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 009 | void 数组 | ✅ compile-pass | ❌ **compile-fail** | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
let arr1: void[] = [undefined]
let arr2: Array<void> = [undefined, undefined]
```

Java (**compile-fail**):
```java
void[] arr;  // 编译错误
```

Swift (compile-pass):
```swift
let arr1: [Void] = [()]
let arr2: Array<Void> = [(), ()]
```

---

### 4.11 void 函数类型参数

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 008 | void 函数类型参数 | ✅ compile-pass | ❌ **compile-fail** | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
type F<T> = () => T
const f1: F<void> = (): void => {}
const f2: F<void> = () => {}
```

Java (**compile-fail**):
```java
// 无法使用 void 作为函数式接口类型参数
```

Swift (compile-pass):
```swift
typealias F<T> = () -> T
let f1: F<Void> = { }
let f2: F<()> = { }
```

---

### 4.12 Runtime: void 返回 undefined

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 016 | void 函数返回 undefined | ✅ runtime | N/A | N/A |

**代码对照：**

ArkTS (runtime ✅):
```typescript
function f(): void {
  return undefined
}
let result = f()
console.log(result)  // undefined
```

Java: **N/A**（void 函数无返回值）

Swift: **N/A**（Void 函数返回 ()）

---

### 4.13 Runtime: void 泛型运行时

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 018 | void 泛型运行时 | ✅ runtime | N/A | ✅ runtime |

**代码对照：**

ArkTS (runtime ✅):
```typescript
class A<T> {
  f: T
  m(): T { return this.f }
  constructor(f: T) { this.f = f }
}
let a = new A<void>(undefined)
console.log(a.f, a.m())  // undefined undefined
```

Swift (runtime ✅):
```swift
struct Box<T> {
    let value: T
}
let box = Box<Void>(value: ())
print(box.value)  // ()
```

---

### 4.14 Runtime: void 数组运行时

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 019 | void 数组运行时 | ✅ runtime | N/A | ✅ runtime |

**代码对照：**

ArkTS (runtime ✅):
```typescript
let arr: void[] = [undefined, undefined]
console.log(arr.length)  // 2
```

Swift (runtime ✅):
```swift
let arr: [Void] = [(), (), ()]
print(arr.count)  // 3
```

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| void 表达力 | ★★★★★ | ★★☆☆☆ | ★★★★☆ |
| 泛型支持 | ★★★★★ | ☆☆☆☆☆ | ★★★★★ |
| 数组支持 | ★★★★★ | ☆☆☆☆☆ | ★★★★☆ |
| 与 nullish 集成 | ★★★★★ | ☆☆☆☆☆ | ★★★☆☆ |
| 语义直观性 | ★★★★☆ | ★★★☆☆ | ★★★★★ |

## 6. 核心结论

1. **ArkTS void/undefined 设计明显强于 Java**：Java void 仅能做返回类型，不能作为变量、泛型参数或数组元素。

2. **ArkTS 与 Swift 更接近**：二者都允许 void 作为变量、泛型参数、数组元素，表达力更强。

3. **核心区别在唯一值**：
   - ArkTS: `undefined`
   - Swift: `()`（空元组）
   - Java: 无值

4. **ArkTS 的优势是 nullish 集成**：`void ≡ undefined`，能自然参与 `undefined` 相关类型系统。

5. **Swift 的优势是语义纯粹**：Void 就是空元组 `()`，与函数返回无值的模型一致。

6. **三语言一致点**：void 函数不能返回值（compile-fail）。

## 7. ArkTS 设计建议

1. **当前设计合理**：void ≡ undefined 的设计简化了类型系统，与 nullish 体系自然集成。

2. **比 Java 更强的表达力**：允许 void 作为变量/泛型/数组，提高了代码灵活性。

3. **建议文档加强**：明确说明 void 和 undefined 的等价关系，避免开发者混淆。

4. **考虑性能优化**：void[] 数组的实际应用场景有限，可考虑编译期优化。

## 8. 三环境实测结果

> ✅ **实测时间**：2026-06-21
> ✅ **实测环境**：ArkTS static_core / Java SE 21 / Swift 5.10

### ArkTS 实测结果

| 用例 | 结果 |
|------|------|
| 001_PASS_VOID_RETURN_UNDEFINED | ✅ |
| 002_PASS_UNDEFINED_RETURN_EMPTY | ✅ |
| 003_PASS_INFER_RETURN_UNDEFINED | ✅ |
| 004_PASS_VOID_UNDEFINED_VARIABLES | ✅ |
| 005_PASS_VOID_METHOD_LAMBDA | ✅ |
| 006_PASS_VOID_GENERIC_CLASS | ✅ |
| 007_PASS_VOID_GENERIC_FUNCTION | ✅ |
| 008_PASS_VOID_FUNCTION_TYPE_ARG | ✅ |
| 009_PASS_VOID_ARRAYS | ✅ |
| 010_PASS_UNDEFINED_TYPE_ARGUMENT | ✅ |
| 011_FAIL_VOID_RETURN_VALUE | ✅ (compile-fail) |
| 012_FAIL_UNDEFINED_RETURN_VALUE | ✅ (compile-fail) |
| 013_FAIL_UNDEFINED_TO_NONNULLISH | ✅ (compile-fail) |
| 014_FAIL_VOID_ARRAY_NON_UNDEFINED | ✅ (compile-fail) |
| 015_FAIL_VOID_PARAM_NON_UNDEFINED | ✅ (compile-fail) |
| 016_RUNTIME_VOID_RETURN_UNDEFINED | ✅ |
| 017_RUNTIME_UNDEFINED_RETURN | ✅ |
| 018_RUNTIME_GENERIC_VOID_HOLD | ✅ |
| 019_RUNTIME_VOID_ARRAY | ✅ |
| 020_RUNTIME_FUNCTION_VOID | ✅ |

### Java 实测结果

| 用例 | 结果 |
|------|------|
| void 返回类型 | ✅ compile-pass |
| void 变量声明 | ❌ compile-fail (符合预期) |
| void 泛型参数 | ❌ compile-fail (符合预期) |
| void 数组 | ❌ compile-fail (符合预期) |
| void 函数返回值 | ❌ compile-fail (符合预期) |
| undefined 关键字 | ❌ compile-fail (符合预期) |

### Swift 实测结果

| 用例 | 结果 |
|------|------|
| Void 返回类型 | ✅ compile-pass |
| Void 变量声明 | ✅ compile-pass `v1=()` |
| Void 泛型参数 | ✅ compile-pass |
| Void 数组 | ✅ compile-pass `count=3` |
| Void 函数返回值 | ❌ compile-fail (符合预期) |
| undefined 关键字 | ❌ compile-fail (符合预期) |

### 关键发现

- **Java void 限制最多**：只能作为返回类型，不能作为变量/泛型/数组
- **ArkTS 与 Swift 最接近**：都支持 void 作为完整类型使用
- **唯一值不同**：ArkTS 用 `undefined`，Swift 用 `()`
- **nullish 集成**：ArkTS 的 void ≡ undefined 设计与 nullish 体系自然集成
