# 3.15.1 String Literal Types - 测试设计思维导图

## 概述

ArkTS §3.15.1 定义 String Literal Types：
- 操作与超类型 string 相同
- 操作结果类型是超类型中指定的类型
- 例如：`s0 + s0` 的结果是 string 类型（不是 "string literalstring literal"）

**Spec 原文关键引用（spec/types.md）：**
> "Operations on variables of string literal types are identical to the operations of their supertype string."
> "The resulting operation type is the type specified for the operation in the supertype."

## 子规则覆盖

### 1. String Literal Type 声明与赋值
- 正向编译: `let s0: "string literal" = "string literal"`
- 正向编译: 不同的 string literal 值
- 运行时: string literal 值验证

### 2. String Literal Type 赋值给 string
- 正向编译: `let s1: string = s0`
- 运行时: 赋值后值验证

### 3. String Literal Type 运算结果为 string
- 正向编译: `let s1: string = s0 + s0`
- 正向编译: string literal 与 string 运算
- 运行时: 运算结果类型验证

### 4. String Literal Type 作为函数参数
- 正向编译: 函数参数使用 string literal type
- 运行时: 函数调用验证

### 5. String Literal Type 与超类型关系
- 正向编译: string literal 可赋值给 string
- 反向编译: string 不能赋值给 string literal
- 反向编译: 不同 string literal 不能互赋

### 6. String Literal Type 运算符
- 正向编译: + 运算符（结果为 string）
- 正向编译: == 运算符
- 正向编译: < > 运算符
- 运行时: 运算符结果验证

## 分类说明

- **compile-pass**: 验证 string literal type 的正确用法
- **compile-fail**: 验证 string literal type 的非法用法
- **runtime**: 验证 string literal type 的运行时行为

## 文件命名规范

- `TYP_03_15_01_XXX_PASS_<DESCRIPTION>.ets`
- `TYP_03_15_01_XXX_FAIL_<DESCRIPTION>.ets`
- `TYP_03_15_01_XXX_RUNTIME_<DESCRIPTION>.ets`
