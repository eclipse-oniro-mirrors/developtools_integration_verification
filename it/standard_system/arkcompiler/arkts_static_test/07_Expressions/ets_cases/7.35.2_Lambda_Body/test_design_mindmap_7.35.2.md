# 7.35.2 Lambda Body - 测试设计思维导图

## 概述

验证 ArkTS 中 Lambda 表达式体（Lambda Body）的正确性。Lambda 体可以是单表达式或块，语义涉及返回值处理、变量捕获、`this` 捕获、void 调用表达式简化等规则。

## Spec 规则

| # | 规则 | 说明 |
|---|------|------|
| 1 | Lambda 体可以是单个表达式或块（Block） | 单表达式自动添加 `return`（非 void 调用时） |
| 2 | 名称、`this`、`super` 的含义与周围上下文相同 | 不引入新作用域（但参数引入新名称） |
| 3 | 参数引入新名称 | 覆盖外围同名变量 |
| 4 | 外围局部变量或形式参数在 lambda 体中使用 | **被 lambda 捕获** |
| 5 | 外围类型的实例成员在 lambda 体中使用 | **`this` 被 lambda 捕获** |
| 6 | **编译错误**：局部变量在 lambda 体中使用但未在 lambda 中声明且**未在之前赋值** | 确保变量在使用前被明确赋值 |
| 7 | 单表达式体处理规则 | |
| 7a | 若表达式是返回类型为 void 的调用表达式 → `{ expression; }`（语句表达式） | 等价的块是 { expression; }，没有 return |
| 7b | 否则 → `{ return expression; }` | 自动添加 return |
| 8 | **编译错误**：Lambda 返回类型既不是 void 也不是 never，且执行路径既无 return 语句也**不是单表达式体** | 块体必须包含 return |

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 单表达式体 | 简洁表达式体 `(x: int): int => x * 2`、字符串表达式体 `(s: string): int => s.length`、布尔表达式体 `(b: boolean): boolean => !b` |
| 002 | 块体带 return | 块体 + return `(x: int): int => { return x + 1; }`、字符串类型 return |
| 003 | 块体多条语句 | 块内声明局部变量后 return、块内多条语句（声明、计算、return） |
| 004 | 变量捕获 | Lambda 捕获外围方法中的局部变量（int/string）、捕获多个变量 |
| 005 | 捕获实例字段 | Lambda 捕获 `this`（实例字段） |
| 006 | Void 调用表达式体 | Void 返回类型 Lambda，体为 void 调用表达式 |
| 007 | void 返回 + 空块 | `(): void => {}` — 空块 + void 返回类型 |
| 008 | 无参 lambda/never | `(): never => { throw Error(...); }`、`(): int => { return 99; }` |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 009 | 未初始化捕获 | 局部变量未赋值即在 lambda 体中使用 → compile-time error |
| 010 | 块体无 return | Lambda 返回类型非 void/never，块体无 return → compile-time error |
| 011 | void 语句无 return | Lambda 返回类型非 void/never，块体仅含 void 语句无 return → compile-time error |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 012 | 运行时语义综合验证 | 7 个断言全部通过（表达式体、块体、多语句、捕获局部变量、捕获实例字段、无参块体、字符串块体） |

## 三语言对比要点

| 特性 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| 单表达式体 | ✅ `x => x + 1` | ✅ `x -> x + 1` | ✅ `{ $0 + 1 }` |
| 块体 + return | ✅ `{ return x; }` | ✅ `{ return x; }` | ✅ `{ return x; }` |
| 多语句块体 | ✅ `{ let y = x; return y; }` | ✅ `{ int y = x; return y; }` | ✅ `{ let y = x; return y; }` |
| 变量捕获 | ✅ 捕获外围局部变量 | ✅ 要求 effectively final / final | ✅ 捕获外围变量 |
| 捕获实例字段(this) | ✅ 隐式捕获 this | ✅ 隐式捕获 this | ✅ 隐式捕获 self |
| Void 调用表达式体自动简化 | ✅ 有（不加 return） | ⚠️ Java 中 void 方法调用本就是语句，无等价概念 | ❌ 无等价概念 |
| 未初始化变量捕获 | ✅ compile-error | ✅ compile-error | ❌ Swift 无此限制（可选型变量可为 nil） |
| 块体无 return（non-void） | ✅ compile-error | ✅ compile-error | ❌ Swift 单表达式闭包自动返回 |

## 文件清单

| # | 文件名 | 类别 | 验证点 |
|:-:|--------|:----:|--------|
| 001 | EXP_07_35_02_001_PASS_EXPRESSION_BODY.ets | compile-pass | 单表达式体（多种类型） |
| 002 | EXP_07_35_02_002_PASS_BLOCK_BODY_RETURN.ets | compile-pass | 块体带 return 语句 |
| 003 | EXP_07_35_02_003_PASS_BLOCK_BODY_MULTI_STMT.ets | compile-pass | 块体多条语句 |
| 004 | EXP_07_35_02_004_PASS_CAPTURE_LOCAL_VAR.ets | compile-pass | Lambda 捕获外围局部变量 |
| 005 | EXP_07_35_02_005_PASS_CAPTURE_INSTANCE_FIELD.ets | compile-pass | Lambda 捕获 this（实例字段） |
| 006 | EXP_07_35_02_006_PASS_VOID_CALL_EXPR_BODY.ets | compile-pass | Void 调用表达式作为体 |
| 007 | EXP_07_35_02_007_PASS_VOID_EMPTY_BLOCK.ets | compile-pass | void 返回类型 + 空块 |
| 008 | EXP_07_35_02_008_PASS_NO_PARAMS_BLOCK_BODY.ets | compile-pass | 无参 lambda 块体 |
| 009 | EXP_07_35_02_009_FAIL_UNINIT_LOCAL_CAPTURE.ets | compile-fail | 局部变量未赋值即在 lambda 体中使用 |
| 010 | EXP_07_35_02_010_FAIL_MISSING_RETURN_BLOCK.ets | compile-fail | 非 void/never 返回类型，块体无 return |
| 011 | EXP_07_35_02_011_FAIL_VOID_STMT_NO_RETURN.ets | compile-fail | 非 void 返回类型，块体仅 void 语句 |
| 012 | EXP_07_35_02_012_RUNTIME_SEMANTICS.ets | runtime | 运行时验证：表达式体/块体/捕获/返回值 |

## 分类说明

| 分类 | 用途 | 数量 |
|:----:|------|:----:|
| compile-pass | 验证各种有效的 Lambda 体形式编译通过 | 8 |
| compile-fail | 验证未初始化捕获、缺少 return 等编译错误 | 3 |
| runtime | 验证 Lambda 体的运行时行为 | 1 |
| **合计** | | **12** |

## 文件命名规范

```
EXP_07_35_02_001_PASS_{DESCRIPTION}.ets       // compile-pass (001-008)
EXP_07_35_02_009_FAIL_{DESCRIPTION}.ets       // compile-fail (009-011)
EXP_07_35_02_012_RUNTIME_SEMANTICS.ets        // runtime (012)
```

编号规则：001-008 PASS, 009-011 FAIL, 012 RUNTIME

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
