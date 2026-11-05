# 7.23.2 Division - 测试设计思维导图

## 概述

7.23.2 Division 覆盖二元除法运算符 `/`，其左右操作数分别为被除数（dividend）和除数（divisor）。验证类型组合规则、非法类型检测、运行时行为（含 IEEE 754 浮点除法和整数除法向零取整）。

## 三级测试点设计

### compile-pass（类型组合编译通过）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | byte / short 除法提升到 int | byte/byte→int, short/short→int |
| 002 | int/int→int, int/long→long, long/long→long | 整数类型组合 |
| 003 | float/int→float, float/float→float | 浮点类型组合 |
| 004 | double/any→number（double 类型） | double 类型组合 |
| 005 | bigint/bigint→bigint | bigint 除法 |
| 006 | 负数/有符号操作数除法 | 负数和有符号数除法编译通过 |

### compile-fail（非法类型组合 + 除零字面量）

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | string / string | 字符串不能除法 |
| 022 | boolean / boolean | 布尔不能除法 |
| 023 | string / int | 字符串不能除法 |
| 024 | boolean / int | 布尔不能除法 |
| 025 | bigint / int | bigint 混合数值类型 |
| 026 | bigint / double | bigint 混合数值类型 |
| 027 | 整数除零字面量 | `a / 0` 编译期检测（⚠️ D 类：未检测） |
| 028 | bigint 除零字面量 0n | `a / 0n` 编译期检测 |

### runtime（运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | 整数除法向零取整 + 符号规则 | 7/3=2, -7/3=-2, 7/-3=-2 |
| 032 | INT_MIN / -1 溢出 | -2147483648/-1 = -2147483648 |
| 033 | 整数除零运行时异常 | 变量除零抛 ArithmeticError |
| 034 | Bigint 向零取整 | 7n/3n=2n, -7n/3n=-2n |
| 035 | Bigint 除零运行时错误 | 变量除零抛运行时错误 |
| 036 | IEEE 754 NaN | NaN/any=NaN, Infinity/Infinity=NaN, 0/0=NaN |
| 037 | IEEE 754 Infinity | Infinity/有限数=有符号 Infinity, 有限非零/0=有符号 Infinity |
| 038 | IEEE 754 有符号零 | Finite/Infinity=有符号零, 0/有限数=有符号零 |
| 039 | 符号规则 + 溢出 | 同号正、异号负；大数除法溢出到 Infinity |
| 040 | 不抛异常保证 | 溢出/下溢/除零/精度丢失均不抛异常 |

## 文件命名规范

`EXP_07_23_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
