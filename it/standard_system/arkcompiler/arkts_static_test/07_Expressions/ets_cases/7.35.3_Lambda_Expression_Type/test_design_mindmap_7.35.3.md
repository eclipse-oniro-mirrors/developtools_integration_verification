# 7.35.3 Lambda Expression Type - 测试设计思维导图

## 概述

验证 ArkTS 中 Lambda 表达式的类型（Lambda Expression Type）的正确性。根据规范，Lambda 表达式的类型是一个函数类型（Function Type），以 lambda 参数作为函数类型的参数，lambda 返回类型作为函数类型的返回类型。返回类型可以从 lambda 体中推断。

## Spec 规则

### 基本定义
| # | 规则 | 说明 |
|---|------|------|
| 1 | Lambda expression type 是一个 function type | 是函数类型的实例 |
| 2 | Lambda 参数（如有）作为函数类型的参数 | `(x: int, y: int): int => x + y` → `(int, int) => int` |
| 3 | Lambda 返回类型作为函数类型的返回类型 | `(): string => "hello"` → `() => string` |
| 4 | Lambda 返回类型可从 lambda 体推断 | 可省略返回类型标注，由体自动推断 |
| 5 | **编译错误**：Lambda 赋值给不兼容的函数类型 | 参数类型/数量/返回类型不匹配 |

### Type Inference 规则
| # | 规则 | 说明 |
|---|------|------|
| 5a | 表达式体可推断返回类型 | `(x: int) => x * 2` → `(int) => int` |
| 5b | 块体带 return 可推断返回类型 | `() => { return 123 }` → `() => int` |
| 5c | Void 调用表达式体推断为对应类型 | `(): void => log()` → `() => void` |
| 5d | Lambda 参数类型可从上下文推断 | `const f: (int) => int = x => x * 2` |

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 显式返回类型标注 | Lambda 标注 `(): int => 42` 赋值给 `() => int` 等，int/string/boolean/double/单参/多参类型完全匹配 |
| 002 | 表达式体推断返回类型 | `x => x + 1` → `(int) => int`，string/boolean 表达式体均可推断 |
| 003 | 块体推断返回类型 | `() => { return 123 }` → `() => int`，块体带 return 可推断返回类型 |
| 004 | 上下文推断参数类型 | `const f: (int) => int = x => x * 2`，上下文推断完整类型 |
| 005 | 无参 lambda | 无参 lambda 返回 int/string，`(): int => 42`/`(): string => "hello"` |
| 006 | Void 返回类型 | `(): void => {}`/`(): void => logMsg()`，void 调用表达式体 |
| 007 | Lambda 作为参数/返回类型 | 函数接受 lambda 参数、函数返回 lambda、类型别名定义函数类型 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 008 | 参数类型不匹配 | `const f: (int) => int = (s: string): int => s.length` |
| 009 | 返回类型不匹配 | `const f: () => string = (): int => 42` |
| 010 | 参数数量不匹配 | `const f: () => int = (x: int): int => x` 及 `const f: (int) => int = (): int => 0` |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 011 | 运行时语义验证（9 断言） | 显式返回类型、推断返回类型、上下文推断参数类型、无参 lambda、Void lambda、Lambda 作为参数传递调用返回值正确 |

## 三语言对比要点

| 特性 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| Lambda 类型本质 | Function Type | 函数式接口（@FunctionalInterface）| 闭包类型（Closure Type）|
| 返回类型推断 | ✅ 可从体推断 | ✅ 单表达式体推断 | ✅ 单表达式隐式返回 |
| 参数类型推断 | ✅ 可从上下文推断 | ✅ 可从上下文推断 | ✅ 可从上下文推断 |
| 类型标注 | ✅ 显式标注 | ✅ 显式标注 | ✅ 显式标注 |
| 函数类型表达 | `(int, string) => boolean` | `BiFunction<Integer,String,Boolean>` | `(Int, String) -> Bool` |
| 类型别名 | `type F = (int) => int` | `@FunctionalInterface interface F` | `typealias F = (Int) -> Int` |
| 无参 lambda 类型 | `() => T` | `Supplier<T>` / `Runnable` | `() -> T` |

## 文件清单

| # | 文件名 | 类别 | 验证点 |
|:-:|--------|:----:|--------|
| 001 | EXP_07_35_03_001_PASS_EXPLICIT_RETURN_TYPE.ets | compile-pass | 显式返回类型多类型匹配 |
| 002 | EXP_07_35_03_002_PASS_INFERRED_RETURN_EXPR.ets | compile-pass | 表达式体推断返回类型 |
| 003 | EXP_07_35_03_003_PASS_INFERRED_RETURN_BLOCK.ets | compile-pass | 块体推断返回类型 |
| 004 | EXP_07_35_03_004_PASS_CONTEXT_INFERRED_PARAM.ets | compile-pass | 上下文推断参数类型 |
| 005 | EXP_07_35_03_005_PASS_NO_PARAM_LAMBDA.ets | compile-pass | 无参 lambda 多类型 |
| 006 | EXP_07_35_03_006_PASS_VOID_RETURN_TYPE.ets | compile-pass | Void 返回类型 lambda |
| 007 | EXP_07_35_03_007_PASS_LAMBDA_AS_PARAM_RETURN.ets | compile-pass | Lambda 作为参数/返回类型 |
| 008 | EXP_07_35_03_008_FAIL_PARAM_TYPE_MISMATCH.ets | compile-fail | 参数类型不匹配 |
| 009 | EXP_07_35_03_009_FAIL_RETURN_TYPE_MISMATCH.ets | compile-fail | 返回类型不匹配 |
| 010 | EXP_07_35_03_010_FAIL_PARAM_COUNT_MISMATCH.ets | compile-fail | 参数数量不匹配 |
| 011 | EXP_07_35_03_011_RUNTIME_SEMANTICS.ets | runtime | 运行时验证：返回值正确性 |

## 分类说明

| 分类 | 用途 | 数量 |
|:----:|------|:----:|
| compile-pass | 验证 Lambda 表达式类型各种有效形式编译通过 | 7 |
| compile-fail | 验证 Lambda 表达式类型不匹配的编译错误 | 3 |
| runtime | 验证 Lambda 表达式类型运行时行为 | 1 |
| **合计** | | **11** |

## 文件命名规范

```
EXP_07_35_03_001_PASS_{DESCRIPTION}.ets       // compile-pass (001-007)
EXP_07_35_03_008_FAIL_{DESCRIPTION}.ets       // compile-fail (008-010)
EXP_07_35_03_011_RUNTIME_SEMANTICS.ets        // runtime (011)
```

编号规则：001-007 PASS，008-010 FAIL，011 RUNTIME

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
