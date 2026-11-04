# 15.1.1 Type of Standalone Expression - 测试设计思维导图

## 概述
本节定义独立表达式的类型推断规则：
- 整数字面量作为独立表达式，类型推断为 `int`
- 浮点字面量作为独立表达式，类型推断为 `double`
- 常量表达式的类型从操作数和操作推断
- 数组字面量类型从元素类型推断
- 对象字面量作为独立表达式应报编译错误（ESE0127）

## 核心规则

### 1. 整数字面量类型推断
- `let x = 42` → `x: int`
- 独立整数字面量推断为 `int` 类型

### 2. 浮点字面量类型推断
- `let y = 3.14` → `y: double`
- 独立浮点字面量推断为 `double` 类型

### 3. 常量表达式类型推断
- `const a = 1 + 2` → `a: int`
- 常量表达式类型从操作数和操作推断

### 4. 数组字面量类型推断
- `let arr = [1, 2, 3]` → `arr: int[]`
- 数组字面量类型从元素类型推断

#
## 最新设计要点

从章节思维导图同步的最新测试设计点：

- numeric literals (int/long, double/float)
- constant expressions
- array literals
- object literal (compile-fail)

## 5. 对象字面量禁止作为独立表达式
- `{x: 1}` 作为独立表达式应报编译错误
- 错误码：ESE0127

## 测试点覆盖

### compile-pass
1. 整数字面量类型推断为 int
2. 浮点字面量类型推断为 double
3. 常量表达式类型推断
4. 数组字面量类型推断

### compile-fail
1. 对象字面量作为独立表达式应报编译错误

### runtime
1. 独立表达式运行时类型行为验证

## 编号规划
- compile-pass: 001 ~ 004
- compile-fail: 005
- runtime: 006

## 文件命名规范
`SEM_15_01_NNN_{CATEGORY}_{DESCRIPTION}.ets`

## 跨章节关联
- 15.1.2 Assignment-like Contexts (RHS type resolution)
- 15.7 Type Inference (general inference rules)
