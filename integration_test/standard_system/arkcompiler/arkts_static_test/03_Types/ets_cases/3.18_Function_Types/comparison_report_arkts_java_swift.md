# 3.18 Function Types - 跨语言对比报告 (ArkTS / Java / Swift)

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 函数类型语法 | `(x: int) => int` | 函数式接口 / `Function<T,R>` | `(Int) -> Int` |
| 类型别名 | `type Fn = (x: int) => int` | `interface Fn { int apply(int x); }` | `typealias Fn = (Int) -> Int` |
| 可选参数 | `?` 标记，实际类型 `T | undefined` | 无可选参数概念 | 无可选参数概念（用 Optional） |
| 泛型函数类型 | `type Pred<T> = (x: T) => boolean` | 泛型函数式接口 | 泛型闭包 |
| rest 参数 | `(...args: int[]) => int` | 可变参数 `int...` | 可变参数 `Int...` |
| 函数超类型 | `Function`（不可直接调用 spec，实际可调用） | `java.util.function.Function` | 无通用函数超类型 |
| 联合类型含函数 | `string \| ((x: int) => int)` | 无联合类型 | 无联合类型 |
| void 返回 | `() => void` | `Runnable` / `void` | `() -> Void`（需返回 Void） |

## 2. 章节对应关系

| ArkTS 3.18 特性 | Java 对应 | Swift 对应 |
|----------------|----------|-----------|
| 函数类型声明 | 函数式接口 (SAM) | 闭包类型 |
| type 别名命名函数类型 | `@FunctionalInterface` | `typealias` |
| 可选参数 | 无（可用方法重载模拟） | 无（用 Optional 模拟） |
| 泛型函数类型 | 泛型函数式接口 | 泛型闭包 |
| rest 参数 | 可变参数 | 可变参数 |
| Type Function 超接口 | `java.util.function.Function` 等函数式接口 | 无 |
| Function.unsafeCall | `Function.apply()` | 直接调用闭包 |
| Function.name | 无标准 API | `#function` 字面量 |
| 联合类型含函数 | 无联合类型 | 无联合类型 |
| readonly 参数 | 无 | 无 |

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift | 严重性 |
|------|-------|------|-------|--------|
| 函数类型语法简洁性 | ✅ 一等公民语法 | ⚠️ 需要接口定义 | ✅ 一等公民语法 | LOW |
| 可选参数 | ✅ `?` 标记 | ❌ 不支持 | ❌ 不支持 | MEDIUM |
| Function 直接调用 | ✅ 允许（与 spec 不一致） | ✅ `apply()` | ✅ 直接调用 | LOW |
| 函数类型联合 | ✅ 支持 | ❌ 无联合类型 | ❌ 无联合类型 | MEDIUM |
| 函数类型嵌套（高阶） | ✅ 原生支持 | ⚠️ 需嵌套泛型接口 | ✅ 原生支持 | LOW |
| Function.name | ✅ 返回函数名 | ❌ 无标准 API | ⚠️ `#function` 仅在函数内部 | MEDIUM |

## 4. 用例 1:1 对照（关键代码）

### 4.1 函数类型声明与赋值

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 基本函数类型声明 | ✅ compile-pass | ✅ | ✅ |

**ArkTS:**
```typescript
type IntOp = (x: int) => int
let f1: IntOp = (x: int): int => { return x * 2 }
```

**Java:**
```java
@FunctionalInterface
interface IntOp { int apply(int x); }
IntOp f1 = x -> x * 2;
```

**Swift:**
```swift
typealias IntOp = (Int) -> Int
let f1: IntOp = { x in x * 2 }
```

### 4.2 可选参数

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 004 | 全可选参数 | ✅ compile-pass | N/A | N/A |

**ArkTS:**
```typescript
type AllOptional = (x?: int, y?: string) => void
```

**Java:** 无对应概念（Java 用方法重载模拟可选参数）

**Swift:** 无对应概念（Swift 用 `Optional` 模拟可选参数）

### 4.3 泛型函数类型

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 005 | 泛型函数类型 | ✅ compile-pass | ✅ | ✅ |

**ArkTS:**
```typescript
type Predicate<T> = (x: T) => boolean
let isPositive: Predicate<int> = (x: int): boolean => { return x > 0 }
```

**Java:**
```java
Predicate<Integer> isPositive = x -> x > 0;
```

**Swift:**
```swift
typealias Predicate<T> = (T) -> Bool
let isPositive: Predicate<Int> = { x in x > 0 }
```

### 4.4 Type Function / unsafeCall

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 025 | Function.name | ✅ runtime | N/A | N/A |
| 026 | unsafeCall | ✅ runtime | ✅ `apply()` | ✅ 直接调用 |

**ArkTS:**
```typescript
let f: Function = addNumbers
f.unsafeCall(3, 4)  // 正确调用方式（spec 要求）
f(3, 4)             // 实际也编译通过（与 spec 不一致）
```

**Java:**
```java
Function<Integer, Integer> f = x -> x + 1;
f.apply(3);  // 唯一调用方式
```

**Swift:**
```swift
let f: (Int) -> Int = { $0 + 1 }
f(3)  // 直接调用
```

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 基本函数类型声明 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 002 | 函数类型作为参数 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 003 | 函数类型作为返回值 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 004 | 可选参数 | ✅ compile-pass | N/A | N/A |
| 005 | 泛型函数类型 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 006 | rest 参数 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 007 | 函数类型联合 | ✅ compile-pass | N/A | N/A |
| 008 | void 返回 | ✅ compile-pass | ✅ compile-pass | ⚠️ 需返回 Void |
| 009 | readonly 参数 | ✅ compile-pass | N/A | ✅ `let` 参数 |
| 010 | 嵌套函数类型 | ✅ compile-pass | ⚠️ 需嵌套接口 | ✅ compile-pass |
| 011 | 必选参数在可选参数后 | ✅ compile-fail | N/A | N/A |
| 013 | 函数类型赋值不兼容 | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 014 | Function 直接调用 | ✅ compile-pass（ArkTS 允许） | ✅ compile-pass | ✅ compile-pass |
| 019 | 函数类型调用 | ✅ runtime | ✅ runtime | ✅ runtime |
| 022 | 泛型函数类型运行时 | ✅ runtime | ✅ runtime | ✅ runtime |
| 025 | Function.name | ✅ runtime | N/A | ⚠️ `#function` |

### 关键差异详解

#### 用例编号 014: Function 类型直接调用 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let f: Function = foo; f(1)` | ✅ 编译通过并执行 |
| Java | `Function<Integer,Void> f = ...; f.apply(1)` | ✅ 只能通过 apply() |
| Swift | 无通用 Function 超类型 | N/A |

**差异说明**: ArkTS spec 3.18.1 明确说明 Function 类型不能直接调用，必须用 `unsafeCall`，但实际编译器允许直接调用。这是一个 spec 与实现不一致的问题。

#### 用例编号 004: 函数类型可选参数 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `(x: int, y?: string) => void` | ❌ 编译错误（实现不支持） |
| Java | 无对应语法 | N/A |
| Swift | `(Int, String?) -> Void` | ✅ 编译通过 |

**差异说明**: ArkTS spec 允许 trailing optional，但编译器报错 `A required parameter cannot follow an optional parameter`（方向反了）。

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类型严格性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 类型表达力 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| null 安全 | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 函数类型表达力 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 数值精确度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 7. 核心结论

1. **ArkTS 函数类型表达力优于 Java**：一等公民语法、联合类型、可选参数等特性是 Java 函数式接口无法直接表达的。
2. **ArkTS 与 Swift 函数类型最接近**：两者都有闭包类型语法、泛型闭包、type 别名。
3. **关键差异**：ArkTS 的可选参数在函数类型中、Function 类型的调用限制等方面存在 spec 与实现不一致。
4. **Java 无联合类型**：ArkTS 的 `string | ((x: int) => int)` 联合类型在 Java 中需要通过接口继承模拟。

## 8. ArkTS 设计建议

1. **修正函数类型可选参数编译器检查**：允许 `(x: int, y?: string) => void`，与 spec 3.18 一致。
2. **明确 Function 类型调用规则**：要么更新 spec 允许直接调用，要么修复编译器禁止直接调用。
3. **考虑增加函数类型推断**：当前需要显式声明所有参数类型，可以考虑更多类型推断场景。