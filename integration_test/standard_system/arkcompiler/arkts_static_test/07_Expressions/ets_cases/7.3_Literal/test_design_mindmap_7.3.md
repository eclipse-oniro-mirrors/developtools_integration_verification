# 7.3 Literal - 测试设计思维导图

## 概述

**Spec 定义：**
- *Literals* (see Literals) denote fixed and unchanging values.
- Type of a literal is the type of an expression.
- For numeric literals, type of a literal is inferred using Type Inference for Constant Expressions.

**核心含义：** 字面量是表达式中表示固定不变值的语法形式。每个字面量本身就是表达式，其类型由该字面量的类型决定。数值字面量的类型通过常量表达式类型推断确定。

## 三级测试点设计

### compile-pass

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 整数字面量 | 所有进制（十进制、十六进制、八进制、二进制）编译通过 |
| 002 | 浮点数和 BigInt 字面量 | 浮点数字面量（double/float/scientific）和 bigint 字面量编译通过 |
| 003 | 字符串、布尔、null、undefined | 字符串（双引号、单引号、转义序列）、布尔、null、undefined 字面量编译通过 |
| 004 | 数值字面量类型推断 | 数值字面量类型推断（int → int, long → long, f → float, n → bigint） |
| 005 | 下划线分隔字面量 | 下划线分隔数值字面量（整型/浮点型）编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 006 | 整数超出 long 范围 | 整数字面量超出 long 范围 → compile-time error |
| 007 | 浮点数超出 float 范围 | 浮点数字面量超出 float 范围 → compile-time error |

### runtime

| # | 测试点 | 预期值 |
|---|--------|--------|
| 008 | 不同进制整数字面量值正确性 | 十进制、十六进制、八进制、二进制值正确（6 个断言） |
| 009 | 浮点数字面量值正确性 | double、科学计数法、float、前导点值正确（4 个断言） |
| 010 | bigint 和字符串字面量值正确性 | bigint 和字符串值正确（4 个断言） |
| 011 | 布尔字面量 true/false 值正确性 | 布尔值正确（4 个断言） |

## 文件命名规范

```
EXP_07_03_YYY_{CATEGORY}_{DESCRIPTION}.ets
```

- Prefix: `EXP_` for 07_Expressions
- Chapter/Sub: `07_03` for 7.3
- YYY: 001–011 连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: UPPER_SNAKE_CASE description

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
