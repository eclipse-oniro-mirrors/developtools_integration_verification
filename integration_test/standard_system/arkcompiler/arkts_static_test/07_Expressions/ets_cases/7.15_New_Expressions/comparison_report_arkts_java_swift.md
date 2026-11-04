# 7.15 New Expressions — 三语言对比报告

## 1. 概览

类实例创建表达式用于创建类的新实例并调用构造器初始化。ArkTS 和 Java 使用 `new` 关键字；Swift 无 `new` 关键字，直接调用 `Type()`。

| 语言 | 关键字 | 无括号语法 | 泛型语法 | 方法链 |
|------|--------|-----------|---------|-------|
| **ArkTS** | `new` | ✅ `new A` | `new Box<int>(42)` | `new A().m()` |
| **Java** | `new` | ❌ 必须 `new A()` | `new Box<Integer>(42)` | `new A().m()` |
| **Swift** | 无关键字 | ❌ 必须 `A()` | `Box<Int>(42)` | `A().m()` |

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 默认构造器 | `new A()` | `new A()` | `A()` |
| 参数构造器 | `new A(42)` | `new A(42)` | `A(42)` |
| 无括号创建 | `new A` ✅ | ❌ 语法错误 | ❌ 语法错误 |
| 方法链 | `new A().m()` | `new A().m()` | `A().m()` |
| 括号包裹 | `(new A).m()` | `(new A()).m()` | `(A()).m()` |
| 泛型实例化 | `new Box<int>(42)` | `new Box<Integer>(42)` | `Box<Int>(42)` |
| 错误省略括号 | ❌ `new A.method()` | ❌ 编译错误 | N/A |
| 类型参数 new T() | ❌ 编译错误 | ❌ 编译错误 | ❌ 需约束 |
| 接口实例化 | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| 抽象类实例化 | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| 构造器异常 | ✅ Error | ✅ Exception | ✅ fatalError/throws |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `new` 关键字 | ✅ | ✅ | ❌ 无 `new` |
| 无括号语法 | ✅ `new A` | ❌ 必须括号 | ❌ 必须括号 |
| 泛型实例化 | `Box<int>` | `Box<Integer>` | `Box<Int>` |
| FixedArray 限制 | ❌ 类型参数错误 | N/A | N/A |
| 构造器异常 | ✅ Error | ✅ Exception | ✅ fatalError |

## 4. 关键差异详解

### 4.1 无括号语法 — ArkTS 独有 ⭐⭐

| 语言 | 代码 | 结果 |
|------|------|------|
| ArkTS | `let a = new A` | ✅ 编译通过 |
| Java | `A a = new A` | ❌ 语法错误（必须 `new A()`）|
| Swift | `let a = A` | ❌ 语法错误（必须 `A()`）|

ArkTS 允许无参构造时省略括号，这是特殊的设计选择。

### 4.2 `new` 关键字 — ArkTS = Java > Swift ⭐

| 语言 | 代码 | 说明 |
|------|------|------|
| ArkTS | `new A()` | 使用 `new` 关键字 |
| Java | `new A()` | 使用 `new` 关键字 |
| Swift | `A()` | 直接调用 `init()`，无关键字 |

Swift 无 `new` 关键字是该语言的设计差异。

### 4.3 方法链语法 — ArkTS = Java > Swift ⭐

| 场景 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 正确方法链 | `new A().method()` | `new A().method()` | `A().method()` |
| 括号包裹 | `(new A).method()` | `(new A()).method()` | `(A()).method()` |
| 错误省略括号 | ❌ `new A.method()` | ❌ `new A.method()` | N/A |

三语言都允许 `new A().method()` 语法，且都在不正确使用时报错。

### 4.4 类型参数限制 — 三语言一致 ⭐

| 语言 | `new T()` (T 是类型参数) |
|------|------------------------|
| ArkTS | ❌ 编译错误 |
| Java | ❌ 编译错误（type erasure）|
| Swift | ❌ 需 `T: HasInit` 约束 |

三语言都禁止或限制类型参数作为 new 的 typeReference。

### 4.5 FixedArray 类型参数限制 — ArkTS 独有 ⭐⭐

ArkTS 明确禁止 `new FixedArray<T>(5, element)` 当 T 是类型参数：
```typescript
class A<T> {
  foo(element: T): void {
    let a = new FixedArray<T>(5, element) // ❌ compile-time error
  }
}
```
Java/Swift 无 FixedArray 概念。

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 默认构造器 `new A()` | ✅ compile-pass | ✅ | ✅ |
| 002 | 参数构造器 `new A(42)` | ✅ compile-pass | ✅ | ✅ |
| 003 | 创建并存储变量 | ✅ compile-pass | ✅ | ✅ |
| 004 | `new A().method()` 方法链 | ✅ compile-pass | ✅ | ✅ |
| 005 | `(new A).method()` 括号包裹 | ✅ compile-pass | ✅ | ✅ |
| 006 | 无括号 `new A` | ✅ compile-pass | ❌ 语法错误 | ❌ 语法错误 |
| 007 | 泛型 `new Box<int>(42)` | ✅ compile-pass | ✅ | ✅ |
| 008 | `new A.method()` 缺少括号 | ❌ compile-fail | ❌ 编译错误 | N/A |
| 009 | 类型参数 `new T()` | ❌ compile-fail | ❌ 编译错误 | ❌ 需约束 |
| 010 | FixedArray<T> 类型参数 | ❌ compile-fail | N/A | N/A |
| 011 | 接口 `new I()` | ❌ compile-fail | ❌ 编译错误 | ❌ 编译错误 |
| 012 | 抽象类 `new A()` | ❌ compile-fail | ❌ 编译错误 | ❌ 编译错误 |
| 013 | 构造器初始化运行时 | ✅ runtime | ✅ | ✅ |
| 014 | 方法链运行时 | ✅ runtime | ✅ | ✅ |
| 015 | 无括号运行时 | ✅ runtime | N/A | N/A |
| 016 | 构造器异常运行时 | ✅ runtime | ✅ | ✅ |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语法简洁性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 泛型支持 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 错误检查 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 运行时安全 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 7. 核心结论

1. **ArkTS ≈ Java**：`new` 关键字语法高度一致
2. **ArkTS 独有无括号语法**：`new A` 是 Java/Swift 都不支持的特性
3. **Swift 无 `new`**：Swift 直接调用 `init()`，设计哲学不同
4. **FixedArray 限制**：`new FixedArray<T>()` 类型参数错误是 ArkTS 独有
5. **0 D 类 Spec 不一致**：16/16 用例全部通过

## 8. ArkTS 设计建议

- 当前实现完全符合 spec 规范
- 无括号 `new A` 语法简洁但对跨语言开发者可能不够直观
- `new A.method()` 错误检查（提示需要括号）是好的用户体验设计
- FixedArray 类型参数限制是合理的类型安全检查
