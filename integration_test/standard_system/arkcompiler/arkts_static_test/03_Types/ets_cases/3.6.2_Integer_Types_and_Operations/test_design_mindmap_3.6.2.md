# 3.6.2 Integer Types and Operations - 测试设计思维导图

## 概述
本节定义 ArkTS 的**整数类型 (byte/short/int/long)** 及其支持的运算操作集合。bigint 虽操作整数值，但不属于 numeric type 层次，单独章节讨论。

## 整数类型范围

| 类型 | 位数 | 范围 |
|------|------|------|
| byte | 8 位有符号 | -128 ~ 127 |
| short | 16 位有符号 | -32768 ~ 32767 |
| int | 32 位有符号 | -2³¹ ~ 2³¹-1 |
| long | 64 位有符号 | -2⁶³ ~ 2⁶³-1 |

## 整数运算符集合

### 1. 比较运算（结果 boolean）
- 关系：`<`, `<=`, `>`, `>=`
- 相等：`==`, `!=`

### 2. 幂运算 `**`
- 操作数为整数时**结果是 bigint**（特殊设计）

### 3. 数值运算（结果 int/long/bigint）
- 一元：`+`, `-`
- 乘除：`*`, `/`, `%`
- 加减：`+`, `-`
- 自增自减：`++` `--`（前缀/后缀）
- 移位：`<<`, `>>`, `>>>`
- 按位非：`~`
- 按位与/异或/或：`&`, `^`, `|`

### 4. 三元 `?:`

### 5. 字符串拼接 `+`
- 一边 string，一边 integer → integer 转 decimal string

## 类型推升规则 ⭐

| 操作数组合（除 shift）| 推升后类型 | 精度 |
|------|-----------|------|
| 任一是 long | long | 64 位 |
| 都不是 long，且任一非 int | int | 32 位 |

⚠️ **shift 表达式不参与上述推升**

## 重要约束

- 整数类型 ↔ boolean **不允许互转**
- 整数运算**不会指示溢出**（静默回绕）
- 整数 `/` `%` 右操作数为 0 时抛 **ArithmeticError**
- 整数值在 Extended Conditional Expressions 中可作 boolean

## 测试点覆盖

### compile-pass
1. 关系比较运算
2. 相等运算
3. 一元运算 + - ~
4. 算术 + - * / % 含类型推升
5. 自增自减前后缀
6. 移位 << >> >>>
7. 按位 & ^ |
8. 三元 ?:
9. 字符串拼接（int + string）
10. 幂运算 `**` 整数 → bigint

### compile-fail
1. 整数 ↔ boolean 互转
2. 移位操作数为浮点
3. 整数赋值给 boolean

### runtime
1. 类型推升结果验证（long 优先 / int 兜底）
2. 静默溢出回绕（`int max + 1`）
3. 除零抛 ArithmeticError
4. 取模零抛 ArithmeticError
5. 移位边界（负数右移、>>> 与 >> 区别）
6. 按位运算结果验证
7. 整数 `**` bigint 结果
8. 字符串拼接整数转 decimal

## 编号规划
- compile-pass: 001 ~ 010
- compile-fail: 011 ~ 013
- runtime: 014 ~ 021

## 文件命名规范
`TYP_03_06_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`