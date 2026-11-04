# 7.17.2 Runtime Checking in Cast Expression - 测试设计思维导图

## 概述

运行时 cast 检查（Runtime Checking in Cast Expressions）是指在运行时验证表达式的实际类型是否是指定类型的子类型。ArkTS 使用 `as` 关键字进行运行时类型转换，在转换失败时抛出 `ClassCastError`。编译时会对 always-succeeds（始终成功）和 always-throws（始终失败）的 cast 发出警告（W1001506）。`instanceof` 守卫与 `as` 的耦合使用可实现安全的运行时类型转换。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | Object 变量 as string | `(x: Object) => x as string` — 常规 Object→string 运行时检查 |
| 002 | 子类型 as 超类型（always-success 警告） | `d as C` (D extends C) — 编译时 warning: cast 始终成功 |
| 003 | 不相关子类 as（always-throws 警告） | `d as E` (D extends C, E extends C, D≠E) — 编译时 warning: cast 始终抛 ClassCastError |
| 004 | instanceof 守卫后 as | `if (x instanceof Person) { x as Person }` — Smart cast 使 as 安全 |
| 005 | string as Object | `s as Object` (string→Object) — 始终成功的超类型 cast |
| 006 | instanceof 直接 smart cast | instanceof 检查后无需 as，编译器自动类型收窄 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| — | 无 | 本节无 compile-fail 用例 |

### runtime（验证运行时类型检查行为）

| # | 测试点 | 预期行为 |
|---|--------|----------|
| 011 | 子类型 cast 运行时成功 | `d as C` (D extends C, 运行时确为 D) → 返回 D 实例 |
| 012 | 非子类型 cast 运行时失败 | `Object=42 as string` → ClassCastError |
| 013 | instanceof 守卫避免运行时错误 | `if (x instanceof Person) { x as Person }` → 安全 cast |
| 014 | 不相关类 cast 运行时失败 | A 实例 as B (不相关类) → ClassCastError |
| 015 | instanceof false 后 as 抛异常 | `Object=undefined as string` → ClassCastError |

## 文件命名规范

`EXP_07_17_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
