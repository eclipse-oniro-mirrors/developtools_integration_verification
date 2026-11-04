# 7.29.2 Boolean Logical Operators - 测试设计思维导图

## 概述

验证 ArkTS 中 boolean 类型 `&`（AND）、`^`（XOR）、`|`（OR）运算符的正确性。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | boolean & (AND) 四种真值表组合编译通过 | `true & true`、`true & false`、`false & true`、`false & false` 四种组合均编译通过 |
| 002 | boolean ^ (XOR) 和 \| (OR) 各四种组合编译通过 | `^` 和 `\|` 各四种真值表组合均编译通过 |
| 003 | 链式运算和变量运算编译通过 | 变量之间 &/^/\|、链式 `a & b \| c`、带括号 `a & (b \| c)`、复合表达式编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | boolean & 数值类型混合 | `boolean & int`、`boolean & float`、`boolean ^ long` 应产生编译时错误 |
| 002 | boolean &/^/\| 与 string/bigint 混合 | `boolean \| bigint`、`boolean & string` 应产生编译时错误 |

### runtime（验证实际计算值符合运算符规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 001 | `&` 完整真值表（4 断言） | `true & true=true`, `true & false=false`, `false & true=false`, `false & false=false` |
| 002 | `^` 完整真值表（4 断言） | `true ^ true=false`, `true ^ false=true`, `false ^ true=true`, `false ^ false=false` |
| 003 | `\|` 完整真值表（4 断言） | `true \| true=true`, `true \| false=true`, `false \| true=true`, `false \| false=false` |
| 004 | 变量与常量组合（6 断言） | 变量 &/^/\| true/false 各 2 组 |
| 005 | 自身运算（6 断言） | `a & a`, `a ^ a`, `a \| a` 各（true + false） |

## 三语言对比要点

| 特性 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| boolean & (AND) | `true & false` → `false` | `true & false` → `false` | 用 `&&` 替代（短路） |
| boolean \| (OR) | `true \| false` → `true` | `true \| false` → `true` | 用 `\|\|` 替代（短路） |
| boolean ^ (XOR) | `true ^ false` → `true` | `true ^ false` → `true` | 用 `!=` 替代 |
| 非短路特性 | 非短路 | 非短路 | 仅有短路逻辑运算符 |
| 混合类型检查 | compile-time error | 编译错误 | 编译错误 |

## 文件命名规范

`EXP_07_29_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
