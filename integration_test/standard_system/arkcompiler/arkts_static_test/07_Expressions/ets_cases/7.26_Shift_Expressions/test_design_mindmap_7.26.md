# 7.26 Shift Expressions - 测试设计思维导图

## 概述

Shift Expressions（移位表达式）定义了 `<<`（左移）、`>>`（带符号右移）、`>>>`（无符号右移）三个移位运算符的行为。

**核心规则：**
- 移位运算符左结合（`a << b >> c` = `(a << b) >> c`）
- 两个操作数必须为数值类型或 `bigint` 类型
- double/float 操作数被截断为 long/int
- byte/short 左操作数提升为 int
- bigint 双方都是 bigint → 无需转换；bigint + 数值混合 → compile-time error
- `>>>` 用于 bigint → compile-time error
- 结果类型 = 左操作数转换后的类型
- 左操作数提升为 int → 仅取右操作数低 5 位（掩码 0x1f），范围 0~31
- 左操作数提升为 long → 仅取右操作数低 6 位（掩码 0x3f），范围 0~63
- 基于二进制补码表示执行移位
- `n << s` = n 左移 s 位，等价于乘以 2^s（即使溢出）
- `n >> s` = n 右移 s 位（符号扩展），floor(n/2^s)
- `n >>> s` = n 右移 s 位（零扩展）
  - n 为正：同 n >> s
  - n 为负（int）：(n >> s) + (2 << ~s)
  - n 为负（long）：(n >> s) + ((2 as long) << ~s)

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | int << int / int >> int / int >>> int | 纯 int 类型保持 |
| 002 | long << long / long >> long / long >>> long | 纯 long 类型保持 |
| 003 | bigint << bigint / bigint >> bigint | bigint 保持（无 >>>） |
| 004 | byte/short → int 提升 | 左操作数 byte/short 自动提升为 int |
| 005 | 左结合性 | `a << b >> c` = `(a << b) >> c` |
| 006 | float/double 截断 | double → long, float → int 后执行移位 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | bigint >>> bigint | 无符号右移不可用于 bigint，编译错误 |
| 022 | bigint + 数值混合 | bigint << int, bigint >> double 等，编译错误 |
| 023 | string << int | 非数值类型移位，编译错误 |
| 024 | boolean >> int | 非数值类型移位，编译错误 |
| 025 | Object >>> int | 非数值类型移位，编译错误 |
| 026 | 其余非数值类型 | 非数值类型移位，编译错误 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | int << s 基本值 | 正/负/零左移值正确 |
| 032 | int >> s 符号扩展 | 负数右移保持负号 |
| 033 | int >>> s 零扩展 | 负数右移变正数 |
| 034 | int 移位距离掩码 | s & 0x1f（s=32 等价于 s=0） |
| 035 | int << 溢出 | 1 << 31 = MIN_INT |
| 036 | long 移位基本值 | long << / >> / >>> 值正确 |
| 037 | long 移位距离掩码 | s & 0x3f（s=64 等价于 s=0） |
| 038 | bigint 移位 | bigint << bigint / >> bigint 大数移位 |
| 039 | 负移位距离 | 取低 5/6 位后为正 |
| 040 | >>> 公式验证 | 对负 int/long 验证 (n>>s)+(2<<~s) |

## 文件命名规范

`EXP_07_26_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
