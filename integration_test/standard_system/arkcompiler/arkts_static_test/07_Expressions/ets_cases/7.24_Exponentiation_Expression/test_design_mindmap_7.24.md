# 7.24 Exponentiation Expression - 测试设计思维导图

## 概述

Exponentiation Expression（幂运算，`**` 运算符）定义了指数运算规则。`**` 是唯一右结合的运算符，对所有数值类型和 bigint 类型生效。

**核心规则：**
- numeric ** numeric → double
- bigint ** bigint → bigint
- 其余类型组合 → compile-time error
- `**` 是右结合运算符（`a ** b ** c` = `a ** (b ** c)`）
- 永不抛异常

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | byte/short → int 提升 | byte ** byte → double，byte/short 自动提升为 int |
| 002 | int/long → double | int**int→double, int**long→double, long**long→double |
| 003 | float/double 类型组合 | double**int→double, int**double→double |
| 004 | bigint ** bigint | bigint 保持，bigint ** bigint → bigint |
| 005 | bigint 零指数 | bigint ** 0n = 1n（零指数特例） |
| 006 | 负数基数 | 负数基数 double**double 和 bigint**bigint 编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | string ** string | 非数值类型，编译错误 |
| 022 | boolean ** boolean | 非数值类型，编译错误 |
| 023 | string ** int | 一方非数值，编译错误 |
| 024 | boolean ** int | 一方非数值，编译错误 |
| 025 | bigint ** int | bigint 与数值混合，编译错误 |
| 026 | bigint ** double | bigint 与数值混合，编译错误 |
| 027 | bigint ** 负整数 | bigint 指数必须为非负，编译错误 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | bigint 基本指数运算 | bigint ** bigint 值正确 |
| 032 | bigint 负指数抛异常 | bigint ** 负指数，抛出异常（@runtime-throws） |
| 033 | 零指数 | x ** 0 = 1（对所有 x 包括 NaN、Infinity） |
| 034 | 零基底正指数 | +0 ** 正数 = +0，-0 ** 奇数正数 = -0，-0 ** 偶数正数 = +0 |
| 035 | 零基底负指数 | ±0 ** 负数 = ±Infinity（除数零） |
| 036 | 零基底 Infinity 指数 | ±0 ** ±Inf → IEEE 754 规则 |
| 037 | 1 ** 任何数 = 1 | 含 NaN、Infinity |
| 038 | NaN/Infinity 幂运算特殊值 | NaN/Infinity 参与幂运算的 IEEE 754 规则 |
| 039 | -Infinity 幂运算特殊值 | -Infinity 幂运算的 IEEE 754 规则 |
| 040 | x ** ±Infinity 范围规则 | 范围规则验证 |
| 041 | 负数基底非整数指数 = NaN | 负数基底非整数指数结果为 NaN |
| 042 | 永不抛异常 + 右结合性 | 幂运算永不抛异常，右结合性验证 |

## 文件命名规范

`EXP_07_24_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
