# 7.29.1 Integer Bitwise Operators - 测试设计思维导图

## 概述

Integer Bitwise Operators 定义了三个整型位运算符 `&`（AND）、`^`（XOR）、`|`（OR）应用于数值类型或 `bigint` 类型操作数的行为。

**核心规则：**
- 运算符：`&`（按位与）、`^`（按位异或）、`|`（按位或）
- 应用于数值类型（int/long/byte/short/double/float）或 `bigint`
- 优先级：`&` > `^` > `|`，左结合
- 每个运算符可交换（无副作用时）且可结合

**类型转换规则：**
- 若任一操作数为 `double` 或 `float` → 先截断为适当整数类型
- 若任一操作数为 `byte` 或 `short` → 提升为 `int`
- 若两操作数为不同整数类型 → 小类型通过加宽转换为大类型
- 两操作数均为 `bigint` → 无需转换
- **编译错误**：一个操作数为 `bigint`，另一个为数值类型（非 bigint）

**结果类型：** 操作数的类型（转换后）

**结果值：**
- `&` → 按位与
- `^` → 按位异或
- `|` → 按位或

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | int 位运算基本 | int & int 按位与、int ^ int 按位异或、int | int 按位或、int 链式运算 a & b | c、字面量位运算常量折叠 |
| 002 | long 位运算基本 | long & long 64 位按位与、long ^ long 64 位按位异或、long | long 64 位按位或 |
| 003 | byte/short 提升位运算 | byte & byte 提升为 int 结果 int、short & short 提升为 int 结果 int、byte & short 均提升为 int 结果 int |
| 004 | 混合整数类型位运算 | int & long int 加宽为 long 结果 long、byte & long byte 提升为 int 再加宽为 long 结果 long、short & int short 提升为 int 结果 int |
| 005 | float/double 截断位运算 | float & float 截断为 int 结果 int、double & double 截断为适当整数类型、float & int float 截断为 int 再与 int 运算 |
| 006 | bigint 位运算 | bigint & bigint 任意精度按位与、bigint ^ bigint 任意精度按位异或、bigint | bigint 任意精度按位或 |
| 007 | 链式位运算及优先级 | 链式位运算及优先级（& > ^ > |），验证编译通过和优先级规则 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 008 | bigint 与 int 混合 | bigint & int 编译错误 |
| 009 | bigint 与 float 混合 | bigint ^ float 编译错误 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 010 | int 位运算运行时值验证 | 5&3=1, 5|3=7, 5^3=6, 负数位运算, 零值位运算, 全1掩码运算 |
| 011 | long 位运算运行时值验证 | 64 位边界值 &、^、| |
| 012 | bigint 位运算运行时值验证 | 大整数按位与/异或/或，任意精度正确计算 |
| 013 | float/double 截断后位运算运行时验证 | float 值截断为整数后的位运算结果验证 |

## 文件命名规范

```
EXP_07_29_01_YYY_{CATEGORY}_{DESCRIPTION}.ets
```

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

前缀 `EXP_`（07_Expressions 章节固定前缀），编号顺序 PASS → FAIL → RUNTIME 连续递增。

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
