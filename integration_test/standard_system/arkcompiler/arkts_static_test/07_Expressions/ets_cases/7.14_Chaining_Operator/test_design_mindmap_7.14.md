# 7.14 Chaining Operator - 测试设计思维导图

## 概述

链式操作符 `?.` 用于安全访问可能为 nullish（`null` 或 `undefined`）的值。ArkTS 支持四种链式操作上下文：字段访问（`obj?.field`）、方法调用（`obj?.method()`）、索引访问（`arr?.[i]`）和函数调用（`fn?.()`）。链式操作符在 nullish 值上短路返回 `undefined`；在非 nullish 值上无类型影响。ArkTS 独有限制包括禁止对静态方法使用 `?.`、禁止在赋值左侧和递增/递减表达式中使用 `?.`，以及当表达式已知始终 nullish 或始终非 nullish 时触发编译时警告。

## 三级测试点设计

### compile-pass（验证编译通过）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | nullish 字段访问 | `obj?.field` 可空对象字段访问，结果为 `T \| undefined` |
| 002 | nullish 方法调用 | `obj?.method()` 可空对象方法调用 |
| 003 | nullish 索引 | `arr?.[0]` 可空数组索引 |
| 004 | 非 nullish 无效果 | 非 nullish 类型上使用 `?.` 不影响类型 |
| 005 | nullish+非 nullish 混合 | 混合 nullish 和非 nullish 类型 |
| 006 | 实例方法合法 | `b?.g()` 非静态实例方法合法 |
| 007 | 嵌套链式 | `a?.b?.c?.d` 编译通过 |
| 008 | 函数链式调用 | `fn?.()` 可空函数类型变量调用 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 009 | 静态方法 `?.` | `A?.f()` 静态方法使用链式操作符 → 编译时错误 |
| 010 | `?.` 在赋值左侧 | `x?.y = value` → 编译时错误 |
| 011 | `?.` 后置递增 | `x?.y++` → 编译时错误 |
| 012 | `?.` 前置递增 | `++x?.y` → 编译时错误 |
| 013 | `?.` 后置递减 | `x?.y--` → 编译时错误 |
| 014 | `?.` 前置递减 | `--x?.y` → 编译时错误 |
| 019 | `this?.` 链式操作 | `this?.method()` → 编译时错误（this 不为 nullish） |
| 020 | `super?.` 链式操作 | `super?.method()` → 编译时错误（super 不为 nullish） |

### runtime（验证运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 015 | nullish 链式返回 undefined | nullish 对象字段访问 → `undefined` |
| 016 | 非 nullish 返回值 | 非 nullish 对象字段访问 → 实际值 |
| 017 | 嵌套链式运行时 | 任意层 nullish → `undefined`（短路停止）|
| 018 | 方法链式运行时 | 非 nullish 返回实际返回值 |

## 文件命名规范

`EXP_07_14_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
