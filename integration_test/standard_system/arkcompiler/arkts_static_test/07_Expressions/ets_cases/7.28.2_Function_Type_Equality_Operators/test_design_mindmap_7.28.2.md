# 7.28.2 Function Type Equality Operators - 测试设计思维导图

## 概述

Function Type Equality Operators（函数类型等值运算符）定义了 `==`、`!=`、`===`、`!==` 四个运算符在函数类型上的比较行为。

**核心规则：**
- 若两个操作数引用同一个函数对象，比较结果为 `true`
- 当比较方法引用时，不仅必须使用同一个方法，还要求其绑定的实例相等
- 不同函数对象比较结果为 `false`
- 不同方法（即使在同一实例上）比较结果为 `false`
- 不同实例上的同名方法比较结果为 `false`

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 相同函数引用 | `foo == foo` 编译通过 |
| 002 | 不同函数 | `foo == bar` 编译通过（运行时 false） |
| 003 | 不同参数签名 | `foo == goo` 编译通过（运行时 false） |
| 004 | 相同实例同名方法 | `a.method == a.method` 编译通过 |
| 005 | 静态方法 | `A.method == A.method` 编译通过 |
| 006 | 不同实例同名方法 | `a.method == obj2.method` 编译通过（运行时 false） |
| 007 | 同一实例不同名方法 | `a.method == a.foo` 编译通过（运行时 false） |
| 008 | ===/!== 运算符 | `foo === foo` / `foo !== bar` / `a.method === a.method` 编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | 函数 vs 数值 | `foo == 5` → compile-time error |
| 022 | 函数 vs 字符串 | `foo == "hello"` → compile-time error |
| 023 | 函数 vs 布尔 | `foo == true` → compile-time error |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | 相同函数对象 | `foo() == foo()` → true |
| 032 | 不同函数对象 | `foo() == bar()` → false |
| 033 | 同一实例同一方法 | `a.method == a.method` → true |
| 034 | 同一静态方法 | `A.method == A.method` → true |
| 035 | 不同实例同一方法 | `a.method == obj2.method` → false |
| 036 | 同一实例不同方法 | `a.method == a.foo` → false |
| 037 | === 严格等值 | `foo === foo` → true |
| 038 | !== 严格不等 | `foo !== bar` → true，`a.method !== obj2.method` → true |

## 文件命名规范

`EXP_07_28_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
