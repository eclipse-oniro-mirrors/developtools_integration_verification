# 7.21.5 Unary Plus - 测试设计思维导图

## 概述

验证 `+expr` 一元正号表达式的编译时类型检查和类型拓宽规则。

## 三级测试点设计

### compile-pass

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | INT | +int 编译通过，结果类型 int |
| 002 | SHORT | +short 编译通过（结果拓宽为 int）|
| 003 | LONG | +long 编译通过（结果保持 long）|
| 004 | BYTE | +byte 编译通过（结果拓宽为 int）|
| 005 | FLOAT | +float 编译通过（结果保持 float）|
| 006 | DOUBLE | +double 编译通过（结果保持 double）|
| 007 | BIGINT | +bigint 编译通过（结果保持 bigint）|

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | STRING | +string 非数值不可转换 |
| 022 | BOOLEAN | +boolean 非数值不可转换 |
| 023 | OBJECT | +Object 非数值不可转换 |
| 024 | NULL | +null 非数值不可转换 |

### runtime

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | INT_VALUE | +5 → 5, +(-3) → -3 |
| 032 | SHORT_WIDEN | +short → int，值正确 |
| 033 | BYTE_WIDEN | +byte → int，值正确 |
| 034 | LONG_VALUE | +long 值正确 |
| 035 | FLOAT_DOUBLE | +float 和 +double 值正确 |
| 036 | BIGINT_VALUE | +bigint 值正确 |

## 文件命名规范

`EXP_07_21_05_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
