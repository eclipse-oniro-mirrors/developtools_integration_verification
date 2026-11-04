# 7.27.1 Numeric Relational Operators - 测试设计思维导图

## 概述

Numeric Relational Operators（数值关系运算符）定义了 `<`、`<=`、`>`、`>=` 四个运算符在数值类型上的比较行为。

**核心规则：**
- 每个操作数必须为数值类型（byte/short/int/long/float/double），否则编译时错误
- 关系表达式结果类型恒为 `boolean`
- 关系运算符左结合（`a < b > c` = `(a < b) > c`）
- 根据转换后的操作数类型执行有符号整数比较（int/long）或浮点比较（float/double）
- IEEE 754 标准：NaN 比较结果为 false、-Inf < 所有有限值、+Inf > 所有有限值、+0.0 = -0.0

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | int < / <= / > / >= int | 纯 int 比较编译通过 |
| 002 | long < / <= / > / >= long | 纯 long 比较编译通过 |
| 003 | float < / <= / > / >= float | 纯 float 比较编译通过 |
| 004 | double < / <= / > / >= double | 纯 double 比较编译通过 |
| 005 | byte/short → int 提升 | byte/int、short/int、byte/short 混合比较编译通过 |
| 006 | 混合数值类型 | int+long、int+float、int+double、long+float、long+double、float+double |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | string < int | string 不是数值类型，编译错误 |
| 022 | boolean < int | boolean 不是数值类型，编译错误 |
| 023 | Object < int | Object 不是数值类型，编译错误 |
| 024 | null/undefined < int | null/undefined 不是数值类型，编译错误 |
| 025 | string < string | 双方均非数值类型（字符串关系运算符见 7.27.3），编译错误 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | int 基本比较 | `5 < 10` → true，`10 < 5` → false，`5 <= 5` → true 等 |
| 032 | int 边界值比较 | INT_MAX > 0 → true，INT_MIN < 0 → true 等 |
| 033 | long 比较 | 基本比较与负数比较值正确 |
| 034 | float 比较 | `1.0f < 2.0f` → true，`1.0f <= 1.0f` → true 等 |
| 035 | double 比较 | `1.0 < 2.0` → true，`2.0 > 1.0` → true 等 |
| 036 | IEEE 754 特殊值 | NaN 比较恒为 false，-Inf < 有限值，+Inf > 有限值，正零等于负零 |
| 037 | 混合类型比较 | int < long、int < float、int < double、long < float 等 |
| 038 | byte/short 运行时 | byte/short 比较值正确 |

## 文件命名规范

`EXP_07_27_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
