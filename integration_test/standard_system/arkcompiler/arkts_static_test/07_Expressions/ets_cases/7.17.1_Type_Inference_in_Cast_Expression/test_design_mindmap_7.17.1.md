# 7.17.1 Type Inference in Cast Expression - 测试设计思维导图

## 概述

Cast 表达式中的类型推断用于在编译时确定字面量的目标类型。ArkTS 编译器根据 `expr as Type` 中 Type 的声明类型，推导字面量的具体元素/属性类型。本节覆盖数值字面量、数组字面量、对象字面量三种字面量 as 转换的编译时类型推导规则。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 数值字面量 as byte | `1 as byte` — 数值字面量在 byte 范围内 |
| 002 | 数值字面量 as double | `1 as double` — 数值字面量到浮点类型 |
| 003 | 数组字面量 as double[] | `[1, 2] as double[]` — int 元素提升到 double |
| 004 | 数组字面量 as 元组 | `[1, "cc"] as [double, string]` — 多类型元素到元组 |
| 005 | 对象字面量 as 类类型 | `{ x: 10, y: "hi" } as A` — 对象字面量到类类型 |
| 006 | 对象字面量 as 接口类型 | `{ x: 10, y: "hi" } as I` — 对象字面量到接口类型 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 007 | 数值溢出 | `128 as byte` — 数值超出 byte 范围（-128~127） |
| 008 | 错误目标类型 | `[1, 2] as double` — 目标类型不是数组/元组类型 |
| 009 | 错误元素类型 | `[1, "cc"] as double[]` — 元素类型不兼容 |
| 010 | 元组元素不匹配 | `[1.0, "cc"] as [int, string]` — 元组元素类型不匹配 |
| 011 | 不兼容目标 | `[1, 2] as string` — 目标类型不是数组/元组类型 |
| 101 | Cast 到 never | `1 as never` — 目标类型为 never 应编译时错误 |

### runtime（验证实际计算值符合 cast 语义）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 012 | 数值字面量 as 转换运行时值验证 | `42 as byte` = 42 / 127 |
| 013 | 数组字面量 as 数组类型运行时值验证 | `[1, 2] as double[]` 元素值 1.0 / 2.0 |
| 014 | 元组 as 转换运行时值验证 | `[1, "cc"] as [double, string]` 值 1.0 / "cc" |
| 015 | 对象字面量 as 类型运行时值验证 | `{ x: 10, y: "hello" } as A` 字段值 10 / "hello" |

> ⚠️ 注：as 类型推导表达式本身不会导致运行时错误（元素/属性求值可能异常）

## 文件命名规范

`EXP_07_17_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
