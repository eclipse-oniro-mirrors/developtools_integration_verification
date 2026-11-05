# 7.16 instanceof Expression - 测试设计思维导图

## 概述

`instanceof` 表达式用于运行时检查对象的实际类型是否是指定类型的子类型。ArkTS 支持 `expression instanceof type` 语法，返回 `boolean` 类型结果。本节涵盖基本 instanceof 类型检查、结果类型、泛型 instanceof、Smart Cast（智能类型收窄）、编译时始终 true/false 警告以及运行时行为。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 基本 instanceof 类层次 | `a instanceof B` — 类层次结构基本判断（a:A, B extends A, a=new B()） |
| 002 | Smart cast | `if (a instanceof B)` — if 子句中的 smart cast 编译通过 |
| 003 | 泛型类名（擦除） | `x instanceof B` — 泛型类名作为 T（OK，已擦除） |
| 004 | 不相关类型 | 无继承关系类型判断（class A、class B，不相关） |
| 005 | 超类检查 | `b instanceof A` — superclass 检查（B extends A） |
| 006 | 布尔表达式 | instanceof 结果用于布尔表达式（&&、||、!） |
| 007 | 始终 true 警告 | `d instanceof C` (d:D, D extends C) → 始终 true 警告 |
| 008 | 始终 false 警告 | `d instanceof E` (d:D, D/E 无关) → 始终 false 警告 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 009 | 泛型类型参数 `B<T>` | `x instanceof B<T>` — 泛型类型参数未保留到运行时 → 编译时错误 |
| 010 | 类型参数 `T` | `x instanceof T` — 类型参数 T 直接使用 → 编译时错误 |

### runtime（验证实际运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 011 | 子类 instanceof 为 true | `a instanceof B` 运行时 true |
| 012 | 不相关类型 instanceof 为 false | 不相关类型 instanceof 运行时 false |
| 013 | undefined instanceof 为 false | `undefined instanceof A` 运行时 false |
| 014 | 接口引用 instanceof | 接口实现类的 instanceof 运行时正确 |

## 文件命名规范

`EXP_07_16_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
