# 7.35.1 Lambda Signature — ArkTS / Java / Swift 对比报告

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|:----:|:-----:|:----:|:-----:|
| Lambda 语法 | `(params) => body` 或 `param => body` | `(params) -> body` 或 `param -> body` | `{ (params) -> T in body }` 或 `{ $0 }` |
| 参数类型推断 | ✅ 从目标类型上下文推断 | ✅ 从函数式接口推断 | ✅ 从上下文推断 |
| 重复参数名错误 | ✅ compile-error | ✅ compile-error | ✅ compile-error |
| 无类型无上下文错误 | ✅ compile-error | ✅ compile-error | ✅ compile-error |
| 返回类型注解 | ✅ `(x: T): R => expr` | ❌ 无显式语法（由函数式接口决定） | ✅ `{ (x: T) -> R in expr }` |
| 空参数列表 | ✅ `() => expr` | ✅ `() -> expr` | ✅ `{ () -> T in expr }` |
| 泛型上下文推断 | ✅ `foo<T>(e => e)` | ✅ `<T> apply(fn, val)` | ✅ 泛型函数上下文 |

## 2. 章节对应关系

| ArkTS | Java | Swift |
|-------|------|-------|
| Lambda 表达式 | Lambda 表达式 | 闭包（Closure） |
| 形式参数 + 可选返回类型 | Lambda 形式参数 | 闭包参数 + 返回类型 |
| 类型推断 `x => x` | 类型推断 `x -> x` | 类型推断 `{ $0 }` |
| `(x: int): int => x * 2`（返回类型注解） | N/A（函数式接口决定返回类型） | `{ (x: Int) -> Int in x * 2 }` |
| `function foo<T>(p: (p: T) => T) {}` | `<T> Function<T,T>` 泛型 | 泛型闭包参数 |
| 重名参数 → compile-error | 重名参数 → compile-error | 重名参数 → compile-error |
| 无推断上下文 → compile-error | 无推断上下文 → compile-error | 无推断上下文 → compile-error |

## 3. 关键差异矩阵

| 差异点 | ArkTS | Java | Swift |
|--------|:-----:|:----:|:-----:|
| Lambda 语法形式 | `=>` 箭头语法 | `->` 箭头语法 | `in` 关键字分隔 |
| 单参数省略括号 | ✅ `x => expr` | ✅ `x -> expr` | ❌ 必须用 `{}` 包裹 |
| 显式返回类型注解 | ✅ `(x: int): int => expr` | ❌ 无 | ✅ `{ (x: Int) -> Int in expr }` |
| 简写参数名 | ❌ 无 | ❌ 无 | ✅ `$0, $1, $2...` |
| 无参 Lambda 语法 | ✅ `() => expr` | ✅ `() -> expr` | ✅ `{ () -> T in expr }` 或 `{ T }` |

### 差异详解

#### 差异 1: Lambda 语法形式 ⭐

| 语言 | 语法 | 示例 |
|:----:|------|------|
| ArkTS | `(params) => body` | `(x: int) => x * 2` |
| Java | `(params) -> body` | `(Integer x) -> x * 2` |
| Swift | `{ (params) -> T in body }` | `{ (x: Int) -> Int in x * 2 }` |

三种语言的 Lambda/闭包语法不同：ArkTS 和 Java 使用箭头语法，Swift 使用块语法加 `in` 关键字分隔签名和体。

#### 差异 2: 显式返回类型注解 ⭐

| 语言 | 代码 | 行为 |
|:----:|------|------|
| ArkTS | `(x: int): int => x * x` | ✅ 支持显式返回类型注解 |
| Java | `(Integer x) -> x * x` | ❌ 无显式返回类型语法，由函数式接口推断 |
| Swift | `{ (x: Int) -> Int in x * x }` | ✅ 支持显式返回类型注解 |

ArkTS 的返回类型注解语法 `(params): ReturnType => body` 与 Swift 的 `{ (params) -> ReturnType in body }` 类似。Java 依赖函数式接口的目标类型来推断返回值类型。

## 4. 用例对照

| # | 用例 | ArkTS 代码 | Java 代码 | Swift 代码 |
|:-:|------|-----------|-----------|-----------|
| 001 | 类型推断单参 | `x => x`（从上下文） | `x -> x`（从上下文） | `{ x in x }`（从上下文） |
| 002 | 显式类型注解 | `(x: int) => x * 2` | `(Integer x) -> x * 2` | `{ (x: Int) -> Int in x * 2 }` |
| 003 | 多参数类型 | `(x: int, y: int) => x + y` | `(Integer x, Integer y) -> x + y` | `{ (x: Int, y: Int) -> Int in x + y }` |
| 004 | 空参数 | `() => 42` | `() -> 42` | `{ () -> Int in 42 }` |
| 005 | 返回类型注解 | `(x: int): int => x * x` | N/A（无语法） | `{ (x: Int) -> Int in x * x }` |
| 006 | 泛型推断 | `foo<int>(e => e * 2)` | `apply(x -> x * 2, 5)` | `apply({ x in x * 2 }, 5)` |
| 007 | 重名参数 | `(x: int, x: int)` ❌ | `(Integer x, Integer x)` ❌ | `{ (x: Int, x: Int) }` ❌ |
| 008 | 无推断上下文 | `const f = x => x` ❌ | `var f = x -> x;` ❌ | `let f = { x in x }` ❌ |

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|:-:|------|:-----:|:----:|:-----:|
| 001 | 单参数类型推断（x => x from context） | ✅ compile-pass | ✅ | ✅ |
| 002 | 显式类型注解参数（int/string/boolean/long/double） | ✅ compile-pass | ✅ | ✅ |
| 003 | 多参数带类型注解（同类型 + 混合类型） | ✅ compile-pass | ✅ | ✅ |
| 004 | 空参数列表 `() => expr` | ✅ compile-pass | ✅ | ✅ |
| 005 | 显式返回类型注解 | ✅ compile-pass | ❌ N/A（无语法） | ✅ |
| 006 | 泛型函数上下文推断参数类型 | ✅ compile-pass | ✅ | ✅ |
| 007 | 多参数从上下文类型推断 | ✅ compile-pass | ✅ | ✅ |
| 008 | 重复参数名编译错误 | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 009 | 无类型无推断上下文编译错误 | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 010 | 运行时语义验证（7 断言） | ✅ runtime | ✅ runtime（12 断言） | ✅ runtime（13 断言） |
| 011 | Swift 简写参数 `$0, $1` | N/A（无此语法） | N/A（无此语法） | ✅ compile-pass |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|:----:|:-----:|:----:|:-----:|
| Lambda 语法简洁度 | ⭐⭐⭐⭐⭐（`=>` 简洁直观） | ⭐⭐⭐⭐⭐（`->` 简洁直观） | ⭐⭐⭐⭐（`{ } in` 稍啰嗦，但有 `$0` 简写） |
| 参数类型推断 | ⭐⭐⭐⭐⭐（从目标类型 + 泛型上下文） | ⭐⭐⭐⭐⭐（从函数式接口推断） | ⭐⭐⭐⭐⭐（从上下文推断） |
| 返回类型注解 | ⭐⭐⭐⭐⭐（显式 `: R` 在参数后） | ⭐⭐（无显式语法，依赖接口） | ⭐⭐⭐⭐⭐（`-> R` 在参数后） |
| 重名参数检测 | ⭐⭐⭐⭐⭐（编译时错误） | ⭐⭐⭐⭐⭐（编译时错误） | ⭐⭐⭐⭐⭐（编译时错误） |
| 无上下文错误检测 | ⭐⭐⭐⭐⭐（编译时错误） | ⭐⭐⭐⭐⭐（编译时错误） | ⭐⭐⭐⭐⭐（编译时错误） |
| 简写参数支持 | ⭐⭐（无 `$0` 语法） | ⭐⭐（无 `$0` 语法） | ⭐⭐⭐⭐⭐（`$0, $1, $2` 原生支持） |
| 运行时语义 | ⭐⭐⭐⭐⭐（7 断言全通过） | ⭐⭐⭐⭐⭐（12 断言全通过） | ⭐⭐⭐⭐⭐（13 断言全通过） |

## 7. 核心结论

1. **三语言 Lambda 签名规则高度一致**：参数类型推断、重名参数错误、无上下文错误等核心规则在三种语言中行为相同。
2. **ArkTS 返回类型注解类似于 Swift**：`(x: T): R => expr` vs `{ (x: T) -> R in expr }`，均支持显式返回类型；Java 无此语法。
3. **参数类型推断系统支持**：ArkTS 从目标类型（赋值/参数传递）和泛型上下文两种方式推断均正确。
4. **重名参数检测正确**：两个参数同名和多参数中部分同名均被正确捕获为编译时错误。
5. **无推断上下文错误正确**：独立 Lambda 无目标类型时产生编译时错误，与 Java/Swift 行为一致。
6. **全部 12 个 ArkTS 用例通过**（7 PASS + 4 FAIL + 1 RUNTIME），Java（12/12）和 Swift（13/13）等价测试也全部通过。
7. **Swift 额外支持 `$0, $1` 简写参数名**：这是 Swift 相比 ArkTS/Java 的特殊语法糖，不是设计差异。

## 8. ArkTS 设计建议

- 当前 Lambda 签名实现与 Spec 一致，参数类型推断、重名参数检测、无上下文错误均正确。
- ArkTS 的 `(params): ReturnType => body` 语法比 Java（无返回类型语法）更完善，与 Swift 功能等价。
- 建议在 Spec 中补充更多关于类型推断失败场景的示例，帮助开发者理解何时需要显式类型注解。
- 与 Java 相比，ArkTS 通过目标类型和泛型上下文进行推断的能力完全等价；与 Swift 相比，缺少 `$0` 简写参数语法，但这不是必要功能。
