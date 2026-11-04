# 7.30 Conditional-And Expression - 测试设计思维导图

## 概述

验证 ArkTS 中 `&&`（Conditional AND）运算符的正确性，包括真值表、短路行为、结合律和类型检查。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | boolean && 真值表编译通过 | 验证 true&&true, true&&false, false&&true, false&&false 四种组合编译通过 |
| 002 | 短路行为编译通过 | 验证 false && effect() LHS false 时 RHS 不执行；true && effect() LHS true 时 RHS 正常执行；同时验证变量与常量组合（变量&&变量、变量&&常量、常量&&变量）编译通过 |
| 003 | 链式运算与结合律编译通过 | 验证 T&&T&&T, T&&T&&F, T&&F&&T, F&&T&&T 四种组合；结合律 (a&&b)&&c ≡ a&&(b&&c)；左结合性 (a&&b)&&c 编译通过；长链 T&&T&&T&&T&&F&&T 编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 004 | boolean && 数值类型混合 | 验证 boolean && int/float/long + 反向 + 全非 boolean + 混合数值 共11种场景产生编译时错误 |
| 005 | boolean && string/bigint 混合 | 验证 boolean && string/bigint + 反向 + 全非 boolean 共5种场景产生编译时错误 |

### runtime（验证实际计算值符合短路 AND 语义）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 006 | && 真值表 4 种组合（4 断言） | true&&true=true, true&&false=false, false&&true=false, false&&false=false |
| 007 | 短路行为 2 种组合（4 断言） | false&&effect()→effect 不执行；true&&effect()→effect 执行；effectFlag 检查 2 次 |
| 008 | 链式运算 4 种 3 元组合（4 断言） | T&&T&&T=true, T&&T&&F=false, T&&F&&T=false, F&&T&&T=false |
| 009 | 结合律验证（4 断言） | (a&&b)&&c == a&&(b&&c)（结果相同）；(T&&T)&&F == T&&(T&&F)（结果相同） |
| 010 | 变量运算 4 种组合（4 断言） | a&&a, a&&b, b&&a, b&&b 运行时值正确 |
| 011 | 与 & 一致性 4 种组合（4 断言） | T&&T==T&T, T&&F==T&F, F&&T==F&T, F&&F==F&F 均相等 |

**运行时断言合计：24 断言**

## 三语言对比要点

| 特性 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| `&&` (short-circuit AND) | ✅ `true && false` → `false` | ✅ `true && false` → `false` | ✅ `true && false` → `false` |
| 短路特性 | ✅ LHS false 时 RHS 跳过 | ✅ LHS false 时 RHS 跳过 | ✅ LHS false 时 RHS 跳过 |
| 结果类型 boolean | ✅ boolean | ✅ boolean | ✅ Bool |
| 混合类型检查 | ✅ compile-time error | ✅ 编译错误 | ✅ 编译错误 |
| 完全结合律 | ✅ `(a&&b)&&c` ≡ `a&&(b&&c)` | ✅ 相同 | ✅ 相同 |
| 与 `&` 一致性验证 | ✅ `&&` ≡ `&` for boolean | ✅ `&&` ≡ `&` for boolean | ❌ `&` 对 Bool 不可用 |

## 文件命名规范

`EXP_07_30_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
