# 7.25.1 String Concatenation - 测试设计思维导图

## 概述

String Concatenation（字符串拼接）定义了 `+` 运算符在字符串上下文中的行为。当任一操作数为 `string` 类型时，触发字符串转换和拼接。

**核心规则：**
- 如果任一操作数是 `string`，则执行字符串拼接
- LHS 字符在前，RHS 字符在后
- 非 string 操作数在运行时隐式转换为 string
- 非 constexpr 表达式创建新 string 对象
- 不可转换为 string 的类型 → compile-time error

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | string + string | 基本字符串拼接 |
| 002 | string + int | int 转换为十进制字符串 |
| 003 | string + float/double | 浮点数转换为十进制字符串，无精度损失 |
| 004 | string + boolean | boolean 转换为 "true"/"false" |
| 005 | string + bigint | bigint 转换为十进制字符串 |
| 006 | string + null | null 转换为 "null" |
| 007 | string + undefined | undefined 转换为 "undefined" |
| 008 | int + string | RHS string 触发同样转换 |
| 009 | 多操作数连续拼接 | string + string + string 连续拼接 |
| 010 | 混合类型链 | int + double + ": " + boolean 混合拼接 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | void 表达式 + string | void 类型无字符串转换，编译错误 |
| 022 | int + boolean | 双方均非 string，且 boolean 不可转换为数值或字符串，编译错误 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | 基本字符串拼接 | "Hello" + "World" = "HelloWorld" |
| 032 | string + int/double | 正确数值字符串拼接 |
| 033 | boolean → "true"/"false" | string + boolean 的正确转换 |
| 034 | bigint 大数 | bigint 大数字符串转换 |
| 035 | null/undefined | null → "null"，undefined → "undefined" |
| 036 | 左结合性 | 1 + 2 + "!" = "3!"，"!" + 1 + 2 = "!12" |
| 037 | 多字符串拼接 | "A" + "B" + "C" + "D" = "ABCD" |

## 文件命名规范

`EXP_07_25_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
