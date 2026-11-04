# 7.2.1 Type of Expression - 测试设计思维导图

## 概述

每个表达式都有一个在编译时确定的类型。根据是否有目标类型（target type），表达式分为 standalone 和 non-standalone 两类。类型推断分三步：收集类型信息 -> 类型推断 -> 从字面量推断。对象字面量在 standalone 上下文中会产生编译时错误（无法自推断类型），而数组字面量可以从元素推断类型，允许 standalone。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | standalone int 推断 | 数字字面量 standalone 推断为 int |
| 002 | standalone string 推断 | 字符串字面量 standalone 推断为 string |
| 003 | standalone boolean 推断 | 布尔字面量 standalone 推断为 boolean |
| 004 | standalone array 推断 | 数组字面量 standalone 推断类型 |
| 005 | 显式注解 target type | 显式类型注解与表达式类型匹配 |
| 006 | 函数参数 target type | 函数参数 target type 匹配 |
| 007 | 返回值 target type | 函数返回值 target type |
| 008 | 对象字面量 class target type | 对象字面量 non-standalone（类） |
| 009 | 赋值 target type | 赋值 target type 匹配 |
| 010 | writable 到 readonly | writable 传给 readonly 参数 |
| 011 | 表达式语句 | 表达式作为独立语句 |
| 012 | readonly 到 readonly | readonly 传给 readonly 参数 |
| 013 | 泛型 target type | 泛型推断 target type |
| 014 | 嵌套表达式 target type | 嵌套表达式类型推断 |
| 015 | 三目表达式 target type | 三目表达式类型推断 |

### compile-fail（验证编译时错误）

| # | 测试点 | 说明 |
|---|--------|------|
| 016 | standalone 对象字面量 | 对象字面量 standalone -> compile-time error |
| 017 | readonly 到 writable | readonly 传给 non-readonly 参数 |
| 018 | 类型不匹配 | 类型不兼容的 target type |
| 019 | 函数参数类型不匹配 | 函数参数类型不匹配 |
| 020 | 返回值类型不匹配 | 返回值类型不匹配 |

### runtime（验证实际计算值符合类型推断规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 021 | standalone 类型值 | 验证 standalone 表达式类型运行时行为 |
| 022 | 函数参数 target type | 验证函数参数类型传递 |
| 023 | readonly 数组参数 | 验证 readonly 数组参数传递 |
| 024 | object literal target | 验证对象字面量 target type |
| 025 | standalone 数组 | 验证 standalone 数组类型推断 |

## 文件命名规范

`EXP_07_02_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
