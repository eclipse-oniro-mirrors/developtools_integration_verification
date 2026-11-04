# 3.6.3 Floating-Point Types and Operations - 测试设计思维导图

## 概述
本节定义 ArkTS 浮点类型 (float, double, number) 及其运算，遵循 IEEE 754 标准。

## 浮点类型范围

| 类型 | 位数 | 标准 |
|------|------|------|
| float | 32 位 | IEEE 754 binary32 |
| double / number | 64 位 | IEEE 754 binary64 |

## 浮点运算符集合

### 1. 比较运算（结果 boolean）
- 关系：`<`, `<=`, `>`, `>=`
- 相等：`==`, `!=`

### 2. 数值运算（结果 float/double）
- 一元 `+`, `-`
- 幂 `**`（**结果总是 double**，64 位精度）
- 乘除 `*`, `/`, `%`
- 加减 `+`, `-`
- 自增自减 `++`, `--`

### 3. 整数运算（结果 int/long）
- 移位 `<<`, `>>`, `>>>`
- 按位非 `~`
- 按位 `&`, `^`, `|`

### 4. 三元 `?:`

### 5. 字符串拼接 `+`
- 浮点 + string → 浮点转 decimal string（无信息损失）

## 类型推升规则 ⭐

| 操作数组合 | 推升后 | 精度 |
|-----------|-------|------|
| 任一是 double | double | 64 位 |
| 否则任一是 float | float | 32 位 |

## IEEE 754 关键性质

- 支持非规格化浮点数 (denormalized)
- gradual underflow（非 flush-to-zero）
- round-to-nearest（默认舍入，偶数偏好）
- 浮点 → 整数：round-toward-zero（截断）
- 上溢 → ±Infinity
- 下溢 → 非规格化数或 ±0
- 无定义运算 → NaN
- NaN 操作 → NaN

## 重要约束

- 浮点 ↔ boolean **不允许互转**
- 浮点 cast 到/从任意 numeric type 合法
- `%` 运算不严格遵循 IEEE 754 余数规则

## 测试点覆盖

### compile-pass
1. float/double 字面量声明
2. 关系/相等比较
3. 一元 + - 运算
4. 算术 + - * / % 含推升
5. `**` 幂运算 → double
6. 自增自减
7. 字符串拼接（浮点 + string）
8. 三元 ?:
9. 浮点 cast 到整数（注：注意 ArkTS 弃用 `as`）
10. 整数 cast 到浮点

### compile-fail
1. 浮点 ↔ boolean 互转
2. 浮点字面量超 double 范围

### runtime
1. NaN 性质：NaN != NaN, NaN op X = NaN
2. ±Infinity 性质：1.0/0.0 = Inf, -1.0/0.0 = -Inf
3. 浮点 → 整数 round-toward-zero（截断）
4. 浮点上溢 → ±Infinity
5. 浮点下溢 → 非规格化或 ±0
6. 类型推升 double 优先 → 64 位精度
7. 类型推升 float 兜底 → 32 位精度
8. 字符串拼接 decimal 表示无损

## 编号规划
- compile-pass: 001 ~ 010
- compile-fail: 011 ~ 012
- runtime: 013 ~ 020

## 文件命名规范
`TYP_03_06_03_YYY_{CATEGORY}_{DESCRIPTION}.ets`