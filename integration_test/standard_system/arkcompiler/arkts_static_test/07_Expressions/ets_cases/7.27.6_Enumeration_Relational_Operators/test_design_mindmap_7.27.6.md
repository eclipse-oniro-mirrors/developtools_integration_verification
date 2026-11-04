# 7.27.6 Enumeration Relational Operators - 测试设计思维导图

## 概述

本子章节定义枚举类型的关系运算符（`<`、`<=`、`>`、`>=`）行为。

**核心规则：** 如果两个操作数都是相同枚举类型 → 使用 Numeric Relational Operators 或 String Relational Operators（取决于枚举基类型），否则 → compile-time error。

**枚举基类型规则：**
- **int**（默认）：无显式初始化器或所有初始化器可赋值给 int → 基类型为 int
- **long**：显式声明 `enum E: long { ... }`
- **byte**：显式声明 `enum E: byte { ... }`
- **string**：所有初始化器为 string → 基类型为 string（非整型基类型枚举成员必须显式初始化）

**关系运算符映射：**
- int/long/byte 基类型枚举 → Numeric Relational Operators（数值比较）
- string 基类型枚举 → String Relational Operators（字符串比较）

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | int 基类型默认枚举 | 默认枚举（<, <=, >, >=）编译通过 |
| 002 | long 基类型显式枚举 | long 基类型显式枚举编译通过 |
| 003 | byte 基类型显式枚举 | byte 基类型显式枚举编译通过 |
| 004 | string 基类型显式枚举 | string 基类型显式枚举编译通过 |
| 005 | int 基类型混合初始化 | 显式+隐式混合初始化枚举编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | 不同类型枚举比较 | 不同类型枚举比较，编译时错误 |
| 022 | 枚举与数值类型比较 | 枚举与数值类型比较，编译时错误 |
| 023 | 枚举与字符串类型比较 | string 基类型枚举与字符串比较，编译时错误 |
| 024 | 不同枚举（相同基类型）比较 | 相同基类型但不同枚举比较，编译时错误 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | int 基类型序比较（12 断言） | 4 运算符 × 3 组合，数值比较正确 |
| 032 | long 基类型序比较（12 断言） | long 基类型枚举序比较正确 |
| 033 | string 基类型序比较（12 断言） | string 基类型枚举字符串序比较正确 |
| 034 | byte 基类型序比较（12 断言） | byte 基类型枚举数值比较正确 |

## 文件命名规范

`EXP_07_27_06_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
