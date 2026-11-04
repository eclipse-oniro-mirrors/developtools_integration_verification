# 7.18 typeof Expression - 测试设计思维导图

## 概述

`typeof` 表达式用于在运行时获取表达式的类型名称字符串，返回值为小写字符串。ArkTS 原生支持 `typeof` 关键字（继承自 JavaScript 语法），可在编译时和运行时确定表达式的类型名称。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | typeof string/boolean | string→"string", boolean→"boolean"（编译时已知结果） |
| 002 | typeof bigint/number/double | bigint→"bigint", number→"number", double→"number" |
| 003 | typeof byte/short/int/long/float | byte→"byte", short→"short", int→"int", long→"long", float→"float" |
| 005 | typeof Object/function | Object→"object", function→"function" |
| 006 | typeof null/undefined | null→"object", undefined→"undefined" |
| 007 | typeof enum | int 枚举→"int", string 枚举→"string" |
| 008 | typeof union | union 类型 typeof 编译通过 |

### compile-fail（验证编译时错误）

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | typeof 重载函数名 | typeof 应用于重载函数名应为编译时错误 |

### runtime（验证运行时实际返回值）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | typeof string/boolean 运行时验证 | string→"string", boolean→"boolean" |
| 032 | typeof numeric 运行时验证 | int→"int", byte→"byte", double→"number", bigint→"bigint" |
| 034 | typeof null/undefined 运行时验证 | null→"object", undefined→"undefined" |
| 035 | typeof enum 运行时验证 | int enum→"int", string enum→"string" |
| 036 | typeof Object 运行时类型 | 运行时取决于实际类型值 |
| 037 | typeof union 运行时类型 | 运行时取决于实际类型值 |
| 038 | typeof 类型参数运行时 | 运行时确定实际类型 |

## 文件命名规范

`EXP_07_18_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
