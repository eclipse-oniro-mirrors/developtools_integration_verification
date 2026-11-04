# 7.23.1 Multiplication - 测试设计思维导图

## 概述

乘法运算 `*` 在 ArkTS 中的类型组合规则、隐式数值提升、IEEE 754 浮点行为及整数溢出处理。覆盖所有数值类型和 bigint 类型。

## 三级测试点设计

### compile-pass（类型组合编译通过）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | byte * byte → int | 隐式类型提升 byte/short→int |
| 002 | short * short → int | 隐式类型提升 short→int |
| 003 | int * int → int | 同类型整数乘法 |
| 004 | int * long → long | 取最大类型 |
| 005 | long * long → long | 同类型长整数乘法 |
| 006 | int * float → float | int 提升到 float |
| 007 | float * float → float | 同类型浮点乘法 |
| 008 | int * double → number | int 提升到 double |
| 009 | float * double → number | float 提升到 double |
| 010 | double * double → number | 同类型双精度乘法 |
| 011 | bigint * bigint → bigint | bigint 乘法 |
| 012 | byte * int → int | byte 提升到 int |
| 013 | short * long → long | short 提升到 long |
| 014 | 正负号组合不影响编译 | int * (-int) 编译通过 |

### compile-fail（非法类型组合）

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | string * string | 字符串不能乘法 |
| 022 | boolean * boolean | 布尔不能乘法 |
| 023 | string * int | 字符串不能乘法 |
| 024 | boolean * int | 布尔不能乘法 |
| 025 | bigint * int | bigint 混合数值类型 |
| 026 | bigint * double | bigint 混合数值类型 |

### runtime（运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | int 溢出低 32 位截断 | 2147483647*2 = -2 |
| 032 | IEEE 754: NaN*anything = NaN, Infinity*0 = NaN | NaN, NaN |
| 033 | IEEE 754: Infinity*finite = signed Infinity | ±Infinity |
| 034 | IEEE 754: 符号规则（同号正/异号负） | 正/负 |
| 035 | float/double 溢出到 Infinity | ±Infinity |
| 036 | bigint 乘法结合律 | (a*b)*c == a*(b*c) |
| 037 | 整数同类型结合律（int/long） | (a*b)*c == a*(b*c) |
| 038 | 浮点乘法不满足结合律 | (a*b)*c != a*(b*c) |
| 039 | 乘法从不抛异常 | 溢出/下溢不抛异常 |

## 文件命名规范

`EXP_07_23_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
