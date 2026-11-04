# 3.15 Literal Types - 测试设计思维导图

## 概述

ArkTS §3.15 定义 Literal Types：
- 与 ArkTS 字面对齐
- 只支持三种字面量类型：
  - String Literal Types（字符串字面量类型）
  - null
  - undefined
- null 和 undefined 没有操作

**Spec 原文关键引用（spec/types.md）：**
> "Literal types are aligned with some ArkTS literals."
> "ArkTS supports only the following literal types: String Literal Types, null, and undefined."
> "There are no operations for literal types null and undefined."

## 子规则覆盖

### 1. String Literal Types
- 正向编译: `let a: "string literal" = "string literal"`
- 正向编译: string literal 类型赋值给 string 类型
- 正向编译: string literal 作为函数参数类型
- 运行时: string literal 操作结果为 string 类型

### 2. null 字面量类型
- 正向编译: `let b: null = null`
- 正向编译: null 作为函数参数类型
- 反向编译: null 类型不能赋值给非空类型

### 3. undefined 字面量类型
- 正向编译: `let c: undefined = undefined`
- 正向编译: undefined 作为函数参数类型
- 反向编译: undefined 类型不能赋值给非空类型

### 4. 字面量类型作为函数参数
- 正向编译: 函数参数使用字面量类型
- 运行时: 字面量类型参数调用验证

### 5. 字面量类型与超类型关系
- 正向编译: string literal 可赋值给 string
- 正向编译: string literal 操作结果为 string
- 反向编译: string 不能赋值给 string literal

### 6. 边界值与异常场景
- 反向编译: 数字字面量类型不支持
- 反向编译: 布尔字面量类型不支持

## 分类说明

- **compile-pass**: 验证字面量类型的正确用法、合法语法
- **compile-fail**: 验证字面量类型的非法用法、类型不兼容
- **runtime**: 验证字面量类型的运行时行为

## 文件命名规范

- `TYP_03_15_XXX_PASS_<DESCRIPTION>.ets`
- `TYP_03_15_XXX_FAIL_<DESCRIPTION>.ets`
- `TYP_03_15_XXX_RUNTIME_<DESCRIPTION>.ets`
