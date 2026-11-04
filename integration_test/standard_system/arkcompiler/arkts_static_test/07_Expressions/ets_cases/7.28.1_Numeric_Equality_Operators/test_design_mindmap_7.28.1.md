# 7.28.1 Numeric Equality Operators - 测试设计思维导图

## 概述

Numerical Equality Operators（数值等值运算符）定义了 `==`、`===`、`!=`、`!==` 四个运算符在数值类型上的比较行为。

**核心规则：**
- 每个操作数必须可转换为数值类型（byte/short/int/long/float/double）或 bigint 类型，否则编译时错误
- 若一个操作数类型宽度小于另一个，可发生加宽转换
- 转换后类型为 int/long → 整数相等性测试
- 转换后类型为 float/double → 浮点相等性测试（IEEE 754 标准）
- 表达式结果类型恒为 `boolean`
- 等式运算符左结合（`a == b != c` = `(a == b) != c`）
- `==` 和 `===` 对所有类型结果相同（null/undefined 除外）

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | int == / != / === / !== | 纯 int 比较编译通过 |
| 002 | long == / != | 纯 long 比较编译通过 |
| 003 | byte/short → int 提升 | byte/int、short/int、byte/short 混合比较编译通过 |
| 004 | float == / != | 纯 float 比较编译通过（含 NaN 编译层面不报错） |
| 005 | double == / != | 纯 double 比较编译通过 |
| 006 | char vs 数值类型 | char 与 byte/int/long/float/double 等值比较编译通过 |
| 007 | 混合数值类型 | int+long、int+float、int+double、long+float、long+double、float+double |
| 008 | bigint 等值比较 | bigint == bigint / != bigint 编译通过 |
| 009 | bigint vs 数值类型 | bigint vs int/long/float/double（结果 false，编译通过） |
| 010 | Number 包装对象 | `5 == new Number(5)` 等 spec 示例编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | boolean vs 数值 | boolean 不是数值类型，编译时错误 |
| 022 | string vs 数值 | string 不是数值类型，编译时错误 |
| 023 | Object vs 数值 | Object 不是数值类型，编译时错误 |
| 024 | enum vs 数值 | enum 不是数值类型或 bigint，编译时错误 |
| 025 | null/undefined vs 数值 | null/undefined 不是数值类型，编译时错误 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | int 等值比较 | `5 == 5` → true，`5 != 5` → false，边界值正确 |
| 032 | long 等值比较 | `5L == 5L` → true，`5L != 5L` → false |
| 033 | float 等值比较 | `NaN == NaN` → false，`NaN != NaN` → true，`+0.0f == -0.0f` → true |
| 034 | double 等值比较 | `1.0 == 1.0` → true，`NaN != NaN` → true，`+0.0 == -0.0` → true |
| 035 | 混合类型等值比较 | int == long、int == float、int == double、float == double |
| 036 | bigint 等值比较 | `5n == 5n` → true，`5n == 5` → false（bigint vs numeric） |
| 037 | char 与数值等值比较 | `'A' == 65` → true，`'A' != 66` → true |

## 文件命名规范

`EXP_07_28_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
