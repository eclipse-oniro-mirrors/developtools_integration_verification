# 15.14.1 Extended Conditional Expressions - 测试设计思维导图

## 概述
本节定义 ArkTS 中扩展条件表达式（Extended Conditional Expressions）的语义：三元表达式的类型推断、联合类型返回、以及与 TypeScript 的兼容性。

## 核心规则

### 1. 三元表达式类型推断
- 三元表达式返回两个分支类型的联合类型
- `condition ? T : U` 返回 `T | U`
- 这与 TypeScript 一致，与 Java/Swift 不同

### 2. 类型不匹配拒绝
- 如果分支类型与上下文期望类型不匹配，编译错误
- 但联合类型可以赋值给兼容类型

### 3. 与 TypeScript 兼容性
- ArkTS 三元表达式行为与 TypeScript 一致
- 都返回联合类型（不是强制转换为单一类型）

## 测试点覆盖

### compile-fail（1 个）
1. 三元表达式类型不匹配拒绝（SEM_15_14_01_099）

### compile-pass（1 个）
1. 三元表达式类型推断（SEM_15_14_01_001_PASS_TERNARY）

### runtime（1 个）
1. 三元表达式运行时行为（SEM_15_14_01_100）

## 编号规划
- compile-fail: 099
- compile-pass: 001
- runtime: 100

## 文件命名规范
`SEM_15_14_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

## 子章节链接
- 15.14: Compatibility Features
- 15.7: Type Inference


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- ternary conditional expressions
- conditional-and/or
- logical complement

