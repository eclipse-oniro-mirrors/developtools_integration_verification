# 7.12.1 Call Arguments - 测试设计思维导图

## 概述

调用参数（callArguments）的语法规则：参数列表可选（空参调用合法），参数序列由表达式逗号分隔组成，尾部逗号可选，仅 rest parameter 对应参数可为 spread expression，trailing lambda 是实验特性。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 空参调用 | `func()` 无参数调用编译通过 |
| 002 | 单参数调用 | `func(42)` 单个表达式参数编译通过 |
| 003 | 多参数调用 | `func(a, b, c)` 多个逗号分隔参数编译通过 |
| 004 | 尾部逗号 | `func(a, b,)` 最后一个参数后带逗号编译通过 |
| 005 | Spread rest 参数 | `func(...rest)` spread rest 参数编译通过 |
| 006 | 表达式参数 | `func(a + b, f())` 表达式作为参数编译通过 |
| 007 | Trailing lambda | `func(param) { trailingLambda }` 实验特性编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 008 | Spread 非 rest 参数 | `func(...arr)` spread 到非 rest 参数 → 编译时错误 |
| 009 | Trailing lambda 非函数类型 | `func() { block }` 最后参数不是函数类型 → 编译时错误 |
| 010 | Spread 非 iterable 类型 | spread 非 iterable 类型 → 编译时错误 |

### runtime（验证实际运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 011 | 多参数值传递 | 多参数值正确传递，计算结果正确 |
| 012 | 尾部逗号语义等价 | 尾部逗号不影响值传递 |
| 013 | Spread rest 运行时 | spread rest 参数正确展开 |
| 014 | 表达式参数运行时求值 | 表达式参数运行时正确求值 |

## 文件命名规范

`EXP_07_12_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
