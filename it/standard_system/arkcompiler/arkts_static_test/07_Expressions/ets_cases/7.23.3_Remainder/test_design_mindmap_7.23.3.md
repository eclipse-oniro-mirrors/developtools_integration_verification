# 7.23.3 Remainder - 测试设计思维导图

## 概述

7.23.3 Remainder 覆盖二元取余运算符 `%`，左右操作数为被除数（dividend）和除数（divisor）。定义：(a/b)*b + (a%b) == a 恒成立。验证类型组合规则、非法类型检测、运行时行为（含 IEEE 754 浮点取余和整数取余符号规则）。

## 三级测试点设计

### compile-pass（类型组合编译通过）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | byte/short 取余提升到 int | byte%byte→int, short%short→int |
| 002 | int/int→int, int/long→long, long/long→long | 整数类型组合 |
| 003 | float/int→float, float/float→float | 浮点类型组合 |
| 004 | double/any→number（最大类型规则） | double 类型组合 |
| 005 | bigint/bigint→bigint | bigint 取余 |
| 006 | 负数/有符号操作数取余 | 负数和有符号数取余编译通过 |

### compile-fail（非法类型组合 + 取余零字面量）

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | string % string | 字符串不能取余 |
| 022 | boolean % boolean | 布尔不能取余 |
| 023 | string % int | 字符串不能取余 |
| 024 | boolean % int | 布尔不能取余 |
| 025 | bigint % int | bigint 混合数值类型 |
| 026 | bigint % double | bigint 混合数值类型 |
| 027 | 整数取余字面量 0 | `a % 0` 编译期检测（⚠️ D 类：未检测） |
| 028 | bigint 取余字面量 0n | `a % 0n` 编译期检测（⚠️ D 类：未检测） |

### runtime（运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | 整数取余符号规则 + 恒等式 | 结果符号与被除数相同，|结果| < |除数|, (a/b)*b+(a%b)=a |
| 032 | INT_MIN % -1 = 0 | 特殊溢出返回 0 |
| 033 | 整数取余除零 | 变量除零抛 ArithmeticError |
| 034 | Bigint 取余恒等式 | (a/b)*b + (a%b) == a |
| 035 | Bigint 取余除零 | 运行时错误 |
| 036 | 浮点取余 NaN | operand=NaN / dividend=Infinity / divisor=0 → NaN |
| 037 | 浮点取余符号 | 结果符号 = 被除数符号 |
| 038 | 浮点取余特殊值 | finite%Infinity=dividend, 0%finite=0, r=n-(d*q) |
| 039 | 不抛异常保证 | 浮点取余除零不抛异常 |

## 文件命名规范

`EXP_07_23_03_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
