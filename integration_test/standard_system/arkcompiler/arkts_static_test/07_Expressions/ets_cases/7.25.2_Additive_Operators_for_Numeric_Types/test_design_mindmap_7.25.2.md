# 7.25.2 Additive Operators for Numeric Types - 测试设计思维导图

## 概述

Additive Operators for Numeric Types（数值类型加减法）定义了 `+` 和 `-` 在数值类型上的行为。

**核心规则：**
- 数值类型转换（Widening Numeric Conversions）确保双方都是数值类型
- 转换失败 → compile-time error
- `+` 执行加法，`-` 执行减法
- 结果类型是转换后最大的类型（byte→short→int→long→float→double）
- 提升类型为 int/long → 整数算术；float/double → 浮点算术
- 无副作用时加法满足交换律
- 同类型整数加法满足结合律；浮点加法**不**满足结合律
- 整数溢出：低位截断，符号与数学和相反
- IEEE 754 浮点规则：NaN、Infinity、零、溢出、舍入
- 下溢：IEEE 754 gradual underflow
- a - b = a + (-b) 对整数和浮点均成立
- 0 - x 在整数中等于取反；浮点中 0.0 - (+0.0) = +0.0 ≠ -(+0.0) = -0.0
- 数值加减法**永不抛异常**

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | int + int / int - int | 纯 int 类型保持 |
| 002 | int + long / int - long | int → long 提升 |
| 003 | int + float / int - float | int → float 提升 |
| 004 | int + double / long + double | 最大类型提升 |
| 005 | byte + byte / short + short | byte/short → int 提升 |
| 006 | bigint + bigint / bigint - bigint | bigint 保持 |
| 007 | a + b - c + d 链式加减法 | 链式加减法编译通过 |
| 008 | float + double → double | float → double 提升 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | boolean + int | boolean 不可转换为数值类型，编译错误 |
| 022 | boolean - int | boolean 不可转换为数值类型，编译错误 |
| 023 | string - string | string 不可转换（- 无字符串拼接语义），编译错误 |
| 024 | string - int | string 不可转换，编译错误 |
| 025 | bigint + int | bigint 和数值不可混合，编译错误 |
| 026 | bigint - int | bigint 和数值不可混合，编译错误 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | int + int 基本值 | 正/负/零/变量加法值正确 |
| 032 | int 溢出 | MAX_INT + 1 = MIN_INT（低位截断） |
| 033 | long 加法/溢出 | long 基本加法 + MAX_LONG + 1 = MIN_LONG |
| 034 | int - int 减法 | 正负零组合减法值正确 |
| 035 | int 同类型加法结合律 | int 同类型加法满足结合律（含溢出时） |
| 036 | long 同类型加法结合律 | long 同类型加法满足结合律 |
| 037 | NaN + any = NaN | NaN 参与加法结果为 NaN |
| 038 | +Infinity + (-Infinity) = NaN | 异号 Infinity 相加为 NaN |
| 039 | Infinity + finite = Infinity | Infinity 加有限值仍为 Infinity |
| 040 | (+0.0) + (-0.0) = +0.0 | 正零加负零得正零 |
| 041 | 浮点加法不满足结合律 | 大数舍去小数，不满足结合律 |
| 042 | 溢出 → 有符号 Infinity | 浮点溢出转为有符号 Infinity |

## 文件命名规范

`EXP_07_25_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
