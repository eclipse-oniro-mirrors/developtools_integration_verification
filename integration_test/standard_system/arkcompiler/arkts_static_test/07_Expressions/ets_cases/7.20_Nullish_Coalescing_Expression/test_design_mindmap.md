# 7.20 Nullish-Coalescing Expression - 测试设计思维导图

## 概述

`??` 空值合并运算符用于在 LHS 为 nullish（null/undefined）时取 RHS，否则取 LHS。该运算符的核心特性包括：空值合并语义、短路求值（lazy evaluation）、类型推导（normalized union type），以及与 `||`/`&&` 混合的编译时错误检查。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 基本空值合并 — undefined | `undefined ?? "default"` — LHS 为 undefined，取 RHS |
| 002 | 基本空值合并 — 非 nullish | `"value" ?? "default"` — LHS 非 nullish，取 LHS |
| 003 | 基本空值合并 — null | `null ?? 42` — LHS 为 null，取 RHS |
| 004 | 可空变量类型 | `T | undefined` 类型变量 ?? default |
| 005 | 链式空值合并 | 多重链式 `a ?? b ?? c` |
| 006 | 括号隔离语法 | `n ?? (a || b)` — 括号隔离 `||` 合法 |
| 007 | 空串/false 非 nullish | `"" ?? "fall"`、`false ?? true` — 空串/false 非 nullish，不触发 RHS |
| 008 | 0/空对象 非 nullish | `0 ?? 1`、空对象 ?? default — 0/对象非 nullish，不触发 RHS |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | `??` 与 `||` 无括号混用 | `n ?? a || b` — `??` 和 `||` 不能无括号混用 |
| 022 | `??` 与 `&&` 无括号混用 | `n ?? a && b` — `??` 和 `&&` 不能无括号混用 |
| 023 | `??` 与 `||`/`&&` 复杂混用 | `n ?? a || b && c` — 复杂混用 |

### runtime（验证实际运行时语义正确性）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | undefined 触发 RHS | `undefined ?? "default"` → `"default"` |
| 032 | 非 nullish 取 LHS | `"hello" ?? "world"` → `"hello"` |
| 033 | null 触发 RHS | `null ?? 42` → `42` |
| 034 | false 非 nullish | `false ?? true` → `false` |
| 035 | 0 非 nullish | `0 ?? 99` → `0` |
| 036 | 空串非 nullish | `"" ?? "fallback"` → `""` |
| 037 | 链式合并 | `undefined ?? null ?? "last"` → `"last"` |
| 038 | 短路求值 | LHS 非 nullish 时 RHS 不执行（副作用函数验证） |

## 文件命名规范

`EXP_07_20_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
