# 7.27.2 Bigint Relational Operators - 测试设计思维导图

## 概述

本子章节定义 bigint 类型的关系运算符（`<`、`<=`、`>`、`>=`）行为。

**核心规则：** 关系运算符可应用于 bigint 值，前提是：
1. **两个操作数都是 bigint 类型** → 直接进行 bigint 比较
2. **一个操作数是 bigint，另一个是数值类型** → 按以下规则转换后比较：
   - **数值操作数是整数类型**（int/long/byte/short）→ 转换为 bigint，然后进行 bigint 比较
   - **数值操作数是 double 类型** → bigint 转换为 double，然后进行浮点比较
   - **数值操作数是 float 类型** → 两个操作数都转换为 double，然后进行浮点比较

**结果类型：** 始终为 `boolean`

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | bigint vs bigint | bigint 四运算符编译通过 |
| 002 | bigint vs int | bigint < int 等混合编译通过 |
| 003 | bigint vs long | bigint < long 等混合编译通过 |
| 004 | bigint vs byte/short | bigint < byte/short 混合编译通过 |
| 005 | bigint vs double | bigint < double 混合编译通过 |
| 006 | bigint vs float | bigint < float 混合编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 011 | string 与 bigint | string/boolean/Object/null/undefined 与 bigint 比较，编译错误 |
| 012 | boolean 与 bigint | boolean 与 bigint 比较，编译错误 |
| 013 | Object 与 bigint | Object 与 bigint 比较，编译错误 |
| 014 | null 与 bigint | null 与 bigint 比较，编译错误 |
| 015 | undefined 与 bigint | undefined 与 bigint 比较，编译错误 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 021 | bigint vs bigint 基本比较 | `2n < 3n` → true，`2n >= 3n` → false |
| 022 | bigint vs bigint 边界值 | 大正数、大负数比较值正确 |
| 023 | bigint vs int | `2n < 3` → true，int 隐式转换为 bigint |
| 024 | bigint vs long | long → bigint 隐式转换后的比较结果 |
| 025 | bigint vs byte/short | byte/short → bigint 隐式转换后的比较结果 |
| 026 | bigint vs double | `2n < 3.0` → true，bigint → double 浮点比较 |
| 027 | bigint vs float | bigint + float 都 → double 后浮点比较 |
| 028 | Spec 示例组合 | `b < f` where f=3.f → true 等 |

## 文件命名规范

`EXP_07_27_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
