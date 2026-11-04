# 7.21.6 Unary Minus - 测试设计思维导图

## 概述

验证 `-expr` 一元负号表达式的编译时类型检查、类型拓宽和运行时求反语义。

## 三级测试点设计

### compile-pass

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | INT | -int 编译通过，结果类型 int |
| 002 | SHORT | -short 拓宽为 int |
| 003 | LONG | -long 保持 long |
| 004 | BYTE | -byte 拓宽为 int |
| 005 | FLOAT | -float 保持 float |
| 006 | DOUBLE | -double 保持 double |
| 007 | BIGINT | -bigint 保持 bigint |
| 008 | NEGATE_INT_MIN | -int.MIN_VALUE 编译通过（包装不报错）|

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | STRING | -string 非数值 |
| 022 | BOOLEAN | -boolean 非数值 |
| 023 | OBJECT | -Object 非数值 |
| 024 | NULL | -null 非数值 |

### runtime

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | INT_VALUE | -5=-5, -(-3)=3 |
| 032 | INT_MIN_NEGATE | -int.MIN → int.MIN（溢出）|
| 033 | SHORT_WIDEN | -short → int 值正确 |
| 034 | BYTE_WIDEN | -byte → int 值正确 |
| 035 | LONG_VALUE | -long 值正确 |
| 036 | FLOAT_DOUBLE | -float/-double 符号反转 |
| 037 | BIGINT_VALUE | -bigint 值正确 |
| 038 | FLOAT_SPECIAL | -0.0 → +0.0, -infinity 等 |

## 文件命名规范

`EXP_07_21_06_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
