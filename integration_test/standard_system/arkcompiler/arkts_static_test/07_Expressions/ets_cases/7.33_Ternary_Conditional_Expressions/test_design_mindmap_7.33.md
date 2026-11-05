# 7.33 Ternary Conditional Expressions - 测试设计思维导图

## 概述

验证 ArkTS 中三元条件表达式 `condition ? whenTrue : whenFalse` 的正确性，包括编译时条件值已知时的类型推断（`true` → whenTrue 类型，`false` → whenFalse 类型）、编译时条件值未知时的联合类型推断及归一化、不同类型 whenTrue/whenFalse 的组合（数值、字符串、对象类型层次）、运行时求值顺序（先求值 condition，再根据结果选择性求值 whenTrue 或 whenFalse）、右结合性（`a?b:c?d:e?f:g` ≡ `a?b:(c?d:(e?f:g))`）以及条件表达式的副作用验证。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | true 条件编译时类型推断 | `true ? "5" : 6` → 类型 "5"（true 分支被选中） |
| 002 | false 条件编译时类型推断 | `false ? "5" : 6` → 类型 int（false 分支被选中） |
| 003 | 条件未知时联合类型归一化 | `condition ? 5 : 6` → int；`condition ? new A() : new B()` → A |
| 004 | 不同类型组合编译通过 | int+long、float+int、对象类型层次（父子类）等混合 |
| 005 | 嵌套三元右结合性 | 多层嵌套三元表达式编译通过 |
| 006 | 规范示例验证 | true/false 条件类型推断、条件未知联合类型等 5 个示例 |
| 010 | int 作为条件（扩展行为） | `5 ? "a" : "b"` 编译通过（ArkTS 接受非 boolean 条件）|
| 011 | double 作为条件（扩展行为） | `3.14 ? "a" : "b"` 编译通过 |
| 012 | string 作为条件（扩展行为） | `"hello" ? "a" : "b"` 编译通过 |
| 013 | object 作为条件（扩展行为） | 对象表达式作为三元条件编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 014 | 类型不匹配赋值 | 三元结果 string|int 不可赋值给 int 变量 |

### runtime（验证运行时求值顺序和结果正确性）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 015 | true 条件运行时值 | condition=true 时选择 whenTrue 值（3 断言） |
| 016 | false 条件运行时值 | condition=false 时选择 whenFalse 值（3 断言） |
| 017 | 短路求值副作用验证 | 5 断言：未选分支不执行，副作用计数正确 |
| 018 | 嵌套三元运行时值 | 6 断言：a?b:c?d:e 等价于 a?b:(c?d:e) |
| 019 | 规范示例运行时值 | 6 断言：true/false/unknown 条件运行时值正确 |

## 文件命名规范

`EXP_07_33_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
