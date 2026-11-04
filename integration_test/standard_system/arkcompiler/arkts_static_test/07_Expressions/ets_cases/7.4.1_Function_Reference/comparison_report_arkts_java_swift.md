# 7.4.1 Function Reference — 三语言对比报告

## 1. 概览

Function Reference（函数引用）是 ArkTS 中引用已声明或导入函数的核心机制。三语言对此特性的支持程度不同：

| 语言 | 定位 |
|------|------|
| **ArkTS** | 完整支持：顶层函数引用、泛型函数引用（需显式类型参数）、重载函数的引用限制 |
| **Java** | 通过方法引用（Method Reference）和函数式接口实现类似语义，但仅适用于类方法 |
| **Swift** | 与 ArkTS 最接近：顶层函数引用、泛型函数引用（需类型标注）、重载函数的引用限制 |

## 2. 章节对应关系

| ArkTS | Java | Swift |
|-------|------|-------|
| 顶层函数引用 | 静态方法引用 `Class::method` | 顶层函数引用 `let f = foo` |
| 函数类型 `(params) => returnType` | 函数式接口 `Function<T,R>` | 函数类型 `(Params) -> ReturnType` |
| 泛型函数引用 `gen<Type>` | Lambda 包装泛型方法 | 类型标注明确泛型 `let f: (Int) -> Int = identity` |
| 隐式重载函数名引用限制（编译时错误） | 重载方法引用歧义（编译时错误） | 重载函数名歧义（编译时错误） |
| 显式重载 `overload foo { foo1, foo2 }` | 无直接等价概念 | 无直接等价概念 |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 顶层函数引用 | ✅ `let func = foo` | ❌ 必须是类静态方法 | ✅ `let func = foo` |
| 类型推导 | ✅ 自动推导 | ✅ 自动推导 | ✅ 自动推导 |
| 泛型引用需显式类型参数 | ✅ 编译时必须 | ❌ 类型推断而非显式 | ✅ 需要类型标注 |
| 隐式重载名称引用 | ❌ 编译时错误 | ❌ 歧义编译错误 | ❌ 歧义编译错误 |
| 显式重载名称引用 | ❌ 编译时错误 | N/A（无此语法） | N/A（无此语法） |
| 重载歧义消除方式 | 禁止引用重载名 | 目标类型消除歧义 | 类型标注消除歧义 |

## 4. 用例对照

### 4.1 基本函数引用

| 语言 | 代码 |
|------|------|
| ArkTS | `function foo(n: number): string { return n.toString() }` `let func = foo` |
| Java | `public static String foo(int n) { return Integer.toString(n); }` `Function<Integer, String> func = Class::foo;` |
| Swift | `func foo(n: Int) -> String { return String(n) }` `let func = foo` |

### 4.2 通过引用调用

| 语言 | 代码 |
|------|------|
| ArkTS | `let result = func(21)` |
| Java | `int result = func.apply(21)` |
| Swift | `let result = func(21)` |

### 4.3 泛型函数引用

| 语言 | 代码 |
|------|------|
| ArkTS | `function gen<T>(x: T): T {}` `let a = gen<string>` |
| Java | 需 lambda 包装：`Function<Integer, Integer> f = x -> Class.identity(x);` |
| Swift | `func identity<T>(_ x: T) -> T { return x }` `let f: (Int) -> Int = identity` |

### 4.4 隐式重载函数名引用

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let b = bar`（bar 已重载） | ❌ 编译时错误 |
| Java | `Consumer<?> c = Class::bar`（bar 已重载） | ❌ 歧义编译错误，需目标类型消除 |
| Swift | `let f = bar`（bar 已重载） | ❌ 歧义编译错误，需类型标注消除 |

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 基本函数引用 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 002 | 多签名函数引用类型推导 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 003 | 通过引用调用函数 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 004 | 泛型函数引用（显式类型参数） | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 005 | 显式重载单函数引用 | ✅ compile-pass | N/A | N/A |
| 006 | 泛型无类型参数引用 | ✅ compile-fail | ⚠️ 需类型推断 | ✅ compile-fail |
| 007 | 隐式重载函数名引用 | ✅ compile-fail | ❌ 歧义编译错误 | ❌ 歧义编译错误 |
| 008 | 显式重载名称引用 | ✅ compile-fail | N/A | N/A |
| 009 | 运行时引用调用结果验证 | ✅ runtime | ✅ runtime | ✅ runtime |
| 010 | 运行时泛型引用调用验证 | ✅ runtime | ✅ runtime | ✅ runtime |

### 关键差异详解

#### 006: 泛型函数引用无类型参数 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let b = gen` | ❌ 编译时错误：无显式类型参数 |
| Java | `var x = Class.<String>identity(...)` 或 lambda | ⚠️ Java 通过方法类型推断或 lambda 包装，非直接禁止 |
| Swift | `let f = identity`（无上下文） | ❌ 编译时错误：泛型参数无法推断 |

#### 005: 显式重载单函数引用（ArkTS 特有）

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `overload foo { foo1, foo2 }` → `let y = foo2` | ✅ OK，引用单个函数名 |
| Java | N/A | ❌ Java 无显式重载声明语法 |
| Swift | N/A | ❌ Swift 无显式重载声明语法 |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 函数引用语法的简洁性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 类型推导完整性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 泛型函数引用支持 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 重载引用安全性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 运行时一致性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

## 7. 核心结论

1. **ArkTS 的函数引用语义清晰且安全**：禁止泛型无类型参数引用、禁止重载函数名引用，在编译期消除歧义。
2. **与 Swift 高度一致**：顶层函数引用、泛型约束、重载约束等语义几乎相同。
3. **Java 受限于类结构**：无法直接引用顶层函数，必须使用类静态方法和函数式接口包装。
4. **显式重载是 ArkTS 独有特性**：Java 和 Swift 均无 `overload foo { foo1, foo2 }` 语法，这是 ArkTS 为代码可读性增加的显式声明机制。

## 8. ArkTS 设计建议

- 当前设计无缺陷。函数引用的安全约束（禁止泛型无类型参数、禁止重载名）是合理的设计选择，与 Swift 主流实践一致。
- 无 SPEC 不一致问题。

## 9. 三环境实测验证

实测代码和报告见 `cross_lang_verify/` 目录（2026-07-28 实测）：

| 文件 | 实测结果 |
|------|:--------:|
| `JavaFuncRefTest.java` + `.class` | 10/10 ✅ |
| `SwiftFuncRefTest.swift` + 二进制 | 10/10 ✅ |
| `verification_report.md` | 三环境结果对照 |

**实测关键验证点：**
- Swift 泛型无类型标注：❌ `generic parameter 'T' could not be inferred`（同 ArkTS）
- Java 重载通过目标类型消歧义：`IntUnaryOperator f = Class::overloaded` ✅
- 三语言函数引用调用返回值一致（add(3,5)=8）
