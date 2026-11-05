# 7.21.7 Bitwise Complement - 测试设计思维导图

## 概述

`~expr` 一元按位求反运算符，对数值类型或 bigint 类型操作数逐位取反。`~x` 等于 `(-x)-1`。

## 三级测试点设计

### compile-pass

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | INT | `~int` 编译通过，结果 int |
| 002 | SHORT | `~short` 拓宽为 int |
| 003 | LONG | `~long` 保持 long |
| 004 | BYTE | `~byte` 拓宽为 int |
| 005 | FLOAT | `~float` 截断为 int |
| 006 | DOUBLE | `~double` 截断为 long |
| 007 | BIGINT | `~bigint` 保持 bigint |
| 008 | IDENTITY | `~x = (-x)-1` 恒等式验证（编译时合法）|

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | STRING | `~string` 非数值 |
| 022 | BOOLEAN | `~boolean` 非数值 |
| 023 | OBJECT | `~Object` 非数值 |
| 024 | NULL | `~null` 非数值 |
| 025 | ENUM | `~enum` 非数值（D 类：实际编译通过）|

### runtime

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | INT_VALUE | `~int` 运行时值正确 |
| 032 | SHORT_VALUE | `~short` 运行时值和类型 |
| 033 | LONG_VALUE | `~long` 运行时值和类型 |
| 034 | BYTE_VALUE | `~byte` 运行时值和类型 |
| 035 | FLOAT_VALUE | `~float` 截断为 int 后的值 |
| 036 | DOUBLE_VALUE | `~double` 截断为 long 后的值 |
| 037 | BIGINT_VALUE | `~bigint` 运行时值 |
| 038 | IDENTITY | `~x == (-x)-1` 恒等式验证 |

## 文件命名规范

`EXP_07_21_07_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
