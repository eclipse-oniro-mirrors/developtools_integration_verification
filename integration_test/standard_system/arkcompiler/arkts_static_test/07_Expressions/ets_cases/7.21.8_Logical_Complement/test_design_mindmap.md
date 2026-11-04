# 7.21.8 Logical Complement - 测试设计思维导图

## 概述

`!expr` 一元逻辑非运算符。操作数类型必须为 boolean（或 Extended Conditional 提到的类型），结果类型为 boolean。`!true` → `false`, `!false` → `true`。

## 三级测试点设计

### compile-pass

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | BASIC | `!true` / `!false` 基本字面量 |
| 002 | VARIABLE | `!boolVar` 变量 |
| 003 | DOUBLE_NEG | `!!true` 双重求反 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | INT | `!42` 非 boolean（D 类：实际编译通过）|
| 022 | STRING | `!"hello"` 非 boolean（D 类：实际编译通过）|
| 023 | OBJECT | `!new Object()` 非 boolean（D 类：实际编译通过）|
| 024 | NULL | `!null` 非 boolean（D 类：实际编译通过）|
| 025 | ENUM | `!Color.RED` 非 boolean（D 类：实际编译通过）|

### runtime

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | BASIC | `!true=false`, `!false=true` |
| 032 | VARIABLE | boolean 变量取反 |
| 033 | DOUBLE_NEG | `!!x == x` |
| 034 | COMPLEX | 链式 boolean 逻辑运算 |
| 035 | NONBOOL_INT | `!0=true(falsy)`, `!42=false(truthy)` |
| 036 | NONBOOL_STRING | `!""=true`, `!"hello"=false` |
| 037 | NONBOOL_NULL_UNDEFINED | `!null=true`, `!Object=false` |
| 038 | NONBOOL_ALL_TYPES | 综合 truthy/falsy 校验 |

## 文件命名规范

`EXP_07_21_08_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
