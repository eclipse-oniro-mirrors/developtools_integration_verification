# 7.35.1 Lambda Signature - 测试设计思维导图

## 概述

验证 ArkTS 中 Lambda 表达式签名（Lambda Signature）的正确性。Lambda 签名由形式参数（formal parameters）和可选返回类型组成，类型推断允许在部分情况下省略参数类型注解。

## Spec 规则

### 基本定义
| # | 规则 | 说明 |
|---|------|------|
| 1 | Lambda 签名由形式参数和可选返回类型组成 | 与函数声明类似 |
| 2 | 类型推断允许省略参数类型注解 | 当目标类型提供上下文时可推断 |
| 3 | Lambda 表达式的参数作用域与 Shadowing 遵循标准规则 | 引用 Scopes 和 Shadowing by Parameter |

### 编译时错误（compile-time error）
| # | 规则 | 说明 |
|---|------|------|
| 1 | Lambda 表达式声明两个同名的形式参数 | `(x: int, x: int) => x` |
| 2 | 形式参数未提供类型，且无法通过类型推断推导 | 无上下文类型且无显式注解 |

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 单参数类型从上下文推断 | 类型化变量赋值 `const f: (p: int) => int = x => x`，含 int/string/boolean/double/long 多种类型 |
| 002 | 显式类型注解参数（单参数） | `(x: int) => x`，含 string/boolean/long/double 类型注解 |
| 003 | 多参数带类型注解 | `(x: int, y: int) => x + y`，含同类型和混合类型（string + int） |
| 004 | 无参数 Lambda | 空参数列表 `() => 42`，赋值给函数类型变量，含 int/string/boolean/double + 块体 |
| 005 | 返回类型注解 | `(x: int): int => x * 2`，含多参数/无参/不同返回类型 |
| 006 | 泛型函数上下文推断参数类型 | 泛型函数参数 `foo<Object>(e => e)`，含 apply<int/string/boolean/double> + combine |
| 007 | 多参数类型从上下文推断 | 从目标类型推断所有参数类型（参数名可不同于目标类型） |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 008 | 重复参数名（两个同名） | `(x: int, x: int) => x + x` |
| 009 | 多个参数中重复同名 | `(a: int, b: int, a: int) => a`（头尾同名） |
| 010 | 无类型且无上下文推断（单参数） | `const f = x => x` |
| 011 | 无类型且无上下文推断（多参数） | `const f = (a, b) => a + b` |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 012 | 类型推断参数 Lambda 可调用且值正确 | 3 个断言：单参数/多参数/泛型推断 |
| 013 | 显式类型参数 Lambda 可调用且值正确 | 2 个断言：单参数/多参数 |
| 014 | 无参数 Lambda 返回值正确 | 1 个断言：`() => expr` |
| 015 | 带返回类型注解 Lambda 值正确 | 1 个断言：`(x: int): int => expr` |

## 三语言对比要点

| 特性 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| Lambda 签名语法 | `(x: T) => expr` 或 `x => expr` | `(T x) -> expr` 或 `x -> expr` (类型推断) | `{ (x: T) in expr }` 或 `{ $0 }` |
| 参数类型推断 | ✅ 从目标类型推断 | ✅ 从函数式接口推断 | ✅ 从上下文推断 |
| 重复参数名错误 | ✅ compile-error | ✅ compile-error | ✅ compile-error |
| 无类型无上下文错误 | ✅ compile-error | ✅ compile-error | ✅ compile-error |
| 返回类型注解 | ✅ `(x: T): R => expr` | ✅ 在函数式接口中定义 | ✅ `{ (x: T) -> R in expr }` |
| 空参数列表 | ✅ `() => expr` | ✅ `() -> expr` | ✅ `{ in expr }` |

## 文件清单

| # | 文件名 | 类别 | 验证点 |
|:-:|--------|:----:|--------|
| 001 | EXP_07_35_01_001_PASS_SINGLE_PARAM_INFERRED.ets | compile-pass | 单参数类型从上下文推断（类型化变量） |
| 002 | EXP_07_35_01_002_PASS_TYPED_PARAMETERS.ets | compile-pass | 显式类型注解参数（多种类型） |
| 003 | EXP_07_35_01_003_PASS_MULTI_PARAM_WITH_TYPES.ets | compile-pass | 多参数带类型注解 |
| 004 | EXP_07_35_01_004_PASS_NO_PARAMS.ets | compile-pass | 空参数列表 `() => expr` |
| 005 | EXP_07_35_01_005_PASS_RETURN_TYPE_ANNOTATION.ets | compile-pass | 返回类型注解 |
| 006 | EXP_07_35_01_006_PASS_GENERIC_LAMBDA_INFERENCE.ets | compile-pass | 泛型函数上下文推断参数类型 |
| 007 | EXP_07_35_01_007_PASS_MULTI_PARAM_INFERRED.ets | compile-pass | 多参数类型从上下文推断 |
| 008 | EXP_07_35_01_008_FAIL_DUPLICATE_PARAM_NAME.ets | compile-fail | 两个参数同名 |
| 009 | EXP_07_35_01_009_FAIL_TRIPLE_DUPLICATE_PARAM_NAME.ets | compile-fail | 三个参数中两个同名 |
| 010 | EXP_07_35_01_010_FAIL_NO_TYPE_NO_INFERENCE.ets | compile-fail | 单参数无类型且无上下文推断 |
| 011 | EXP_07_35_01_011_FAIL_MULTI_PARAM_NO_INFERENCE.ets | compile-fail | 多参数无类型且无上下文推断 |
| 012 | EXP_07_35_01_012_RUNTIME_SEMANTICS.ets | runtime | 运行时验证 Lambda 签名创建和调用 |

## 分类说明

| 分类 | 用途 | 数量 |
|:----:|------|:----:|
| compile-pass | 验证各种有效的 Lambda 签名形式编译通过 | 7 |
| compile-fail | 验证重复参数名和无法推断类型时的编译错误 | 4 |
| runtime | 验证 Lambda 签名创建的运行时行为 | 1 |
| **合计** | | **12** |

## 文件命名规范

```
EXP_07_35_01_YYY_{CATEGORY}_{DESCRIPTION}.ets
```

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

编号规则：001-007 PASS, 008-011 FAIL, 012 RUNTIME

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
