# 15.14 Compatibility Features - 测试设计思维导图

## 概述
本节定义 ArkTS 中 TypeScript 兼容特性（Compatibility Features）的语义：包括真值判断、条件表达式、以及 TS 特有的类型兼容行为。

## 核心规则

### 1. 真值判断（Truthiness）
- `false` → falsy
- `0` → falsy
- `NaN` → falsy
- `""` (空字符串) → falsy
- `null` → falsy
- `undefined` → falsy
- 其余值 → truthy

### 2. 条件表达式
- `&&` 和 `||` 运算符返回操作数之一（不是 boolean）
- 条件表达式可用于类型 narrowing

### 3. 与 TypeScript 兼容性
- ArkTS 尽量与 TypeScript 兼容
- 但部分 TS 特性不支持（如 `any` 的完全兼容）

## 测试点覆盖

### compile-fail（2 个）
1. SMART_GLOBAL: 全局 Base 成员未缩窄访问 Derived 独有成员（SEM_15_14_023_FAIL）
2. 类型不兼容赋值（SEM_15_14_099_FAIL）

### compile-pass（2 个）
1. 联合类型缩窄（含/不含 null）（SEM_15_14_023）
2. 联合类型缩窄 + 方法调用（SEM_15_14_024）

### runtime（14 个）
1. 空字符串 falsy（SEM_15_14_00_200）
2. 非空字符串 truthy（SEM_15_14_00_201）
3. 0 falsy（SEM_15_14_00_202）
4. 非0数字 truthy（SEM_15_14_00_203）
5. NaN falsy（SEM_15_14_00_204）
6. null falsy（SEM_15_14_00_205）
7. undefined falsy（SEM_15_14_00_206）
8. 对象 truthy（SEM_15_14_00_207）
9. `false || int` 表达式（SEM_15_14_00_208）
10. `true || int` 表达式（SEM_15_14_00_209）
11. `0 && string` 表达式（SEM_15_14_00_210）
12. `1 && string` 表达式（SEM_15_14_00_211）
13. SMART_GLOBAL 模式：重载声明 base 顶层（SEM_15_14_00_215）
14. 兼容特性综合验证（SEM_15_14_00_216）

## 编号规划
- runtime: 001-012, 019-021, 024, 101

## 文件命名规范
`SEM_15_14_YYY_RT_{DESCRIPTION}.ets`

## 子章节链接
- 15.14.1: Extended Conditional Expressions
- 15.7: Type Inference


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- deprecated extended semantics
- conditional expressions

