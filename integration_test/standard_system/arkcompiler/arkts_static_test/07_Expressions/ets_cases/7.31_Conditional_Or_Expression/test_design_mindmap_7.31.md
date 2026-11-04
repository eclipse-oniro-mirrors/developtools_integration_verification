# 7.31 Conditional-Or Expression - 测试设计思维导图

## 概述

验证 ArkTS 中 `||`（Conditional OR）运算符的正确性，包括真值表、短路行为、结合律和类型检查。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | boolean `||` 真值表 | 验证 `true||true`、`true||false`、`false||true`、`false||false` 四种组合编译通过 |
| 002 | 短路行为 | 验证 LHS 为 `true` 时 RHS 不执行（短路），LHS 为 `false` 时 RHS 正常执行 |
| 003 | 链式运算与结合律 | 验证链式 `||` 运算、结合律 `(a||b)||c` ≡ `a||(b||c)`、括号分组、长链 `F||F||F||F||T||F`、变量常量组合编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 004 | boolean 与数值类型混合 | `boolean || int`、`boolean || float`、`boolean || long`、反向、全非 boolean、混合数值（共 11 种场景）产生编译错误 |
| 005 | boolean 与 string/bigint 混合 | `boolean || string`、`boolean || bigint`、反向、全非 boolean（共 5 种场景）产生编译错误 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 006 | `||` 完整语义运行时验证 | 24 断言全部通过（真值表4 + 短路4 + 链式4 + 结合律4 + 变量运算4 + `|` 一致性4） |

## 文件命名规范

`EXP_07_31_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
