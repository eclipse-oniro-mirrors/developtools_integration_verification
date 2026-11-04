# 7.35.3 Lambda Expression Type — ArkTS / Java / Swift 对比报告

## 1. 概览（三语言定位）

| 维度 | ArkTS | Java | Swift |
|:----:|:-----:|:----:|:-----:|
| Lambda 类型本质 | Function Type（函数类型） | 函数式接口（@FunctionalInterface） | 闭包类型（Closure Type） |
| 返回类型推断 | ✅ 可从表达式体/块体推断 | ✅ 单表达式体推断 | ✅ 单表达式闭包隐式返回 |
| 参数类型推断 | ✅ 可从上下文推断 | ✅ 可从上下文推断 | ✅ 可从上下文推断 |
| 函数类型语法 | `(int, string) => boolean` | `BiFunction<Integer,String,Boolean>` | `(Int, String) -> Bool` |
| 类型别名 | `type F = (int) => int` | `@FunctionalInterface interface F` | `typealias F = (Int) -> Int` |
| 无参 lambda 类型 | `() => T` | `Supplier<T>` / `Runnable` | `() -> T` |
| Void 返回类型 | `() => void` | `Consumer<T>` / `Runnable` | `() -> Void` |

## 2. 章节对应关系（ArkTS / Java / Swift）

| ArkTS | Java | Swift |
|-------|------|-------|
| `(): int => 42` | `Supplier<Integer> f = () -> 42` | `let f: () -> Int = { 42 }` |
| `(x: int): int => x * 2` | `Function<Integer,Integer> f = x -> x * 2` | `let f: (Int) -> Int = { x in x * 2 }` |
| `(x: int, y: int): int => x + y` | `BiFunction<Integer,Integer,Integer> f = (x,y) -> x + y` | `let f: (Int,Int) -> Int = { x,y in x + y }` |
| `(): void => {}` | `Runnable r = () -> {}` | `let f: () -> Void = {}` |
| `(s: string): void => log(s)` | `Consumer<String> c = s -> System.out.println(s)` | `let f: (String) -> Void = { s in print(s) }` |
| 类型别名 | `@FunctionalInterface` 接口声明 | `typealias` |
| 高阶函数参数 | `BiFunction<T,U,R>` 参数 | `(T, U) -> R` 参数类型 |
| 高阶函数返回 | `Function<T,R>` 返回类型 | `(T) -> R` 返回类型 |

## 3. 关键差异矩阵

| 差异点 | ArkTS | Java | Swift |
|--------|:-----:|:----:|:-----:|
| 函数类型 vs 函数式接口 | ✅ 原生函数类型语法 | ❌ 需 @FunctionalInterface 接口包装 | ✅ 原生函数类型语法 |
| 单表达式体隐式 return | ✅（非 void 调用时） | ✅（非 void 返回时） | ✅（始终隐式 return） |
| 块体 return 要求 | ✅ 非 void/never 必须 return | ✅ 非 void 必须 return | ⚠️ 不强制 return（最后表达式隐式返回） |
| 类型别名简洁性 | ✅ `type F = (int) => int` | ⚠️ 需声明接口 | ✅ `typealias F = (Int) -> Int` |
| 无参 lambda 简洁性 | ✅ `() => 42` | ✅ `() -> 42` | ✅ `{ 42 }` |
| 多参数 lambda 简洁性 | ✅ `(x, y) => x + y` | ✅ `(x, y) -> x + y` | ⚠️ `{ x, y in x + y }` 稍啰嗦 |
| 上下文推断参数类型 | ✅ | ✅ | ✅ |
| 参数/返回类型不匹配检测 | ✅ compile-fail | ✅ compile-error | ✅ compile-error |
| 参数数量不匹配检测 | ✅ compile-fail | N/A（可变参数灵活） | ✅ compile-error |
| Void 返回类型特殊处理 | ✅ `(): void => {}` 有效 | ✅ `Runnable r = () -> {}` | ✅ `let f: () -> Void = {}` |
| `$0`/`$1` 简写 | ❌ 不支持 | ❌ 不支持 | ✅ 支持 |
| Receiver 类型（成员函数引用） | ✅ Function Types with Receiver | ✅ 方法引用 | ✅ `[self]` 捕获列表 |

### 关键差异详解

#### 差异 1: 类型语法 — 原生函数类型 vs 函数式接口 ⭐⭐

| 语言 | 类型声明 | lambda 赋值 |
|:----:|---------|-------------|
| ArkTS | `type F = (int) => int` | `const f: F = (x: int): int => x * 2` |
| Java | `@FunctionalInterface interface F { int apply(int x); }` | `F f = x -> x * 2` |
| Swift | `typealias F = (Int) -> Int` | `let f: F = { x in x * 2 }` |

ArkTS 和 Swift 都支持原生函数类型语法，Java 需要额外的接口声明。ArkTS 的语法更接近 TypeScript/JavaScript 风格。

#### 差异 2: 参数数量匹配检测 ⭐

| 语言 | 代码 | 行为 |
|:----:|------|------|
| ArkTS | `const f: () => int = (x: int): int => x` | ✅ compile-fail（参数数量不匹配） |
| Java | `Supplier<Integer> f = x -> x` | ✅ compile-error（类型推断错误） |
| Swift | `let f: () -> Int = { x in x }` | ✅ compile-error（参数数量不匹配） |

ArkTS 对函数类型参数数量的检查与 Java/Swift 一致，类型不匹配时均能正确报告编译时错误。

## 4. 用例 1:1 对照（关键用例的三语言代码对比）

| # | 用例 | ArkTS 代码 | Java 代码 | Swift 代码 |
|:-:|------|-----------|-----------|-----------|
| 001 | 显式返回类型 int | `(): int => 42` | `() -> 42`（Supplier） | `{ () -> Int in 42 }` |
| 002 | 表达式体推断 int | `(x: int) => x * 2` | `x -> x * 2`（Function） | `{ x in x * 2 }` |
| 003 | 块体推断 int | `() => { return 123 }` | `() -> { return 123 }` | `{ () -> Int in return 123 }` |
| 004 | 上下文推断参数 | `x => x.length` | `x -> x.length()`（Function）| `{ x in x.count }` |
| 005 | 无参 lambda string | `(): string => "world"` | `() -> "world"`（Supplier） | `{ () -> String in "world" }` |
| 006 | Void 返回类型 | `(): void => {}` | `() -> {}`（Runnable） | `{ () -> Void in }` |
| 007 | 高阶函数参数 | `applyOp(10, 32, (x, y) => x + y)` | `applyOp(10, 32, (x, y) -> x + y)` | `applyOp(10, 32, op: { x, y in x + y })` |
| 008 | 高阶函数返回 | `makeAdder(5)` → `(x: int): int => x + 5` | `makeAdder(5)` → `x -> x + 5` | `makeAdder(base: 5)` → `{ x in x + 5 }` |
| 009 | 参数类型不匹配 | `(int)=>int = (s: string) => s.length` ❌ | `Function<Integer,Integer> = (String s) -> s.length()` ❌ | `(Int)->Int = { (s: String) in s.count }` ❌ |
| 010 | 返回类型不匹配 | `()=>string = ():int => 42` ❌ | `Supplier<String> = () -> 42` ❌ | `()->String = { () -> Int in 42 }` ❌ |

## 5. 三环境实测结果 ⭐

| # | 用例 | ArkTS | Java | Swift |
|:-:|------|:-----:|:----:|:-----:|
| 001 | 显式返回类型（int/string/boolean/double） | ✅ compile-pass | ✅ | ✅ |
| 002 | 表达式体推断返回类型 | ✅ compile-pass | ✅ | ✅ |
| 003 | 块体推断返回类型 | ✅ compile-pass | ✅ | ✅ |
| 004 | 上下文推断参数类型 | ✅ compile-pass | ✅ | ✅ |
| 005 | 无参 lambda 多类型 | ✅ compile-pass | ✅ | ✅ |
| 006 | Void 返回类型 lambda | ✅ compile-pass | ✅ | ✅ |
| 007 | Lambda 作为参数/返回类型 | ✅ compile-pass | ✅ | ✅ |
| 008 | 参数类型不匹配 | ✅ compile-fail | ✅ compile-error | ✅ compile-error |
| 009 | 返回类型不匹配 | ✅ compile-fail | ✅ compile-error | ✅ compile-error |
| 010 | 参数数量不匹配 | ✅ compile-fail | ✅ compile-error | ✅ compile-error |
| 011 | 运行时语义验证（9 断言） | ✅ runtime | ✅ (11 断言) | ✅ (13 断言) |

### 关键差异详解

#### 差异 1: 参数类型不匹配检测 ⭐

| 语言 | 代码 | 行为 |
|:----:|------|------|
| ArkTS | `const f: (int) => int = (s: string): int => s.length` | ✅ compile-fail |
| Java | `Function<Integer,Integer> f = (String s) -> s.length()` | ✅ compile-error |
| Swift | `let f: (Int) -> Int = { (s: String) in s.count }` | ✅ compile-error |

## 6. 综合评分（多维度打星）

| 维度 | ArkTS | Java | Swift |
|:----:|:-----:|:----:|:-----:|
| 类型语法简洁性 | ⭐⭐⭐⭐⭐（原生函数类型语法） | ⭐⭐⭐（需接口包装） | ⭐⭐⭐⭐⭐（原生函数类型语法） |
| 类型推断能力 | ⭐⭐⭐⭐⭐（返回类型+参数上下文推断） | ⭐⭐⭐⭐⭐（单表达式推断） | ⭐⭐⭐⭐⭐（完整类型推断） |
| 编译时类型安全检查 | ⭐⭐⭐⭐⭐（类型/参数/返回全检查） | ⭐⭐⭐⭐⭐（全检查） | ⭐⭐⭐⭐⭐（全检查） |
| 高阶函数自然度 | ⭐⭐⭐⭐⭐（函数类型作参数/返回） | ⭐⭐⭐⭐（需函数式接口） | ⭐⭐⭐⭐⭐（函数类型作参数/返回） |
| 运行时语义 | ⭐⭐⭐⭐⭐（返回值正确） | ⭐⭐⭐⭐⭐（返回值正确） | ⭐⭐⭐⭐⭐（返回值正确） |
| 类型别名便利性 | ⭐⭐⭐⭐⭐（`type` 直接定义） | ⭐⭐⭐（需 `@FunctionalInterface` 接口） | ⭐⭐⭐⭐⭐（`typealias` 直接定义） |

## 7. 核心结论

1. **ArkTS 和 Swift 均支持原生函数类型语法**，比 Java 的 @FunctionalInterface 接口更简洁直观。
2. **类型推断三语言行为高度一致**：返回类型可从体推断，参数类型可从上下文推断，运行时行为正确。
3. **编译时类型安全检查三语言一致**：参数类型、返回类型、参数数量不匹配时均能正确报告编译时错误。
4. **Lambda Expression Type 本质是 Function Type**：ArkTS 的 `(int, string) => boolean` 语法与 Swift 的 `(Int, String) -> Bool` 高度相似。
5. **运行时语义正确**：所有 11 个 ETS 用例（12 Java/13 Swift）全部通过，返回值符合预期。
6. **ArkTS 的 100% 通过率**：7 PASS + 3 FAIL + 1 RUNTIME 全部通过，无 D 类异常。

## 8. ArkTS 设计建议

1. **保持现有设计**：Lambda Expression Type 作为 Function Type 的设计与 Swift 高度一致，类型推断和编译时检查均工作正常，建议维持现有设计。
2. **上下文推断能力是优势**：可以从函数类型变量声明推断参数类型和返回类型，减少冗余标注，提高代码可读性。
3. **补充 `$0`/`$1` 简写**（可选）：Swift 支持 `{ $0 + $1 }` 的简写语法，ArkTS 当前不支持。在常见的高阶函数（如 `map`、`filter`、`reduce`）场景中，这种简写可大幅提升编码效率。
4. **文档建议**：Spec 中 "Lambda return type can be inferred from the lambda body" 的 Note 已经准确描述了返回类型推断的语义，建议在 Spec 中补充更多示例说明上下文推断的规则。
