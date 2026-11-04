# 7.2.2 Normal and Abrupt Completion - 测试设计思维导图

## 概述

本节定义表达式的正常完成（Normal Completion）与异常完成（Abrupt Completion）语义。正常完成指表达式求值所有必要步骤完成且无错误抛出；异常完成指求值过程中任一步骤抛出错误，导致求值停止。四种导致运行时错误的表达式类型：数组索引越界（RangeError）、定长数组元素类型不匹配（ArrayStoreError）、类型转换失败（ClassCastError）、整数除/取余零（ArithmeticError）。子表达式异常完成的传播规则：包含子表达式的表达式立即异常完成，取消所有后续正常模式的求值步骤。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 算术表达式正常完成 | 算术表达式正常完成验证 |
| 002 | 数组有效索引 | 数组索引正常（有效索引） |
| 003 | 定长数组正确类型赋值 | 定长数组正确类型赋值 |
| 004 | 类型转换正常完成 | 类型转换正常完成（兼容类型） |
| 005 | 整数除法正常（非零除数） | 整数除法正常完成（非零除数） |
| 006 | 整数取余正常（非零除数） | 整数取余正常完成（非零除数） |
| 007 | 链式/复合表达式正常 | 复合/链式表达式正常完成 |
| 008 | 函数调用正常完成 | 函数调用正常完成 |
| 009 | 字符串有效索引 | 字符串索引正常完成 |
| 010 | nullish 合并正常 | nullish 合并正常完成 |
| 011 | 三元表达式正常 | 三元表达式正常完成 |
| 012 | 混合表达式正常 | 混合表达式正常完成 |

### compile-fail（验证编译时错误）

| # | 测试点 | 说明 |
|---|--------|------|
| 013 | 整数除字面量零 | 整数除法字面量零 -> compile-time error |
| 014 | 整数取余字面量零 | 整数取余字面量零 -> compile-time error |
| 017 | 负数组索引（SPEC不一致） | 字面量负数组索引编译时错误（spec 要求运行时 RangeError） |

### runtime（验证运行时正常完成与异常抛出行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 015 | 正常完成多断言 | 正常完成断言验证 |
| 016 | 数组索引越界 RangeError | @runtime-throws=RangeError |
| 018 | 类型转换失败 ClassCastError | @runtime-throws=ClassCastError |
| 019 | 整数除零 ArithmeticError | @runtime-throws=ArithmeticError |
| 020 | 整数取余零 ArithmeticError | @runtime-throws=ArithmeticError |
| 021 | 字符串索引越界 RangeError | @runtime-throws=RangeError |
| 022 | 字符串负索引 RangeError | @runtime-throws=RangeError |

## 文件命名规范

`EXP_07_02_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
