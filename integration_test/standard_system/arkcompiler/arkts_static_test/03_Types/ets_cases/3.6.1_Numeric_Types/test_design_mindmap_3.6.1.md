# 3.6.1 Numeric Types - 测试设计思维导图

## 概述
本节定义 ArkTS 的**数值类型 (Numeric Types)**，是 Value Types 的子集（不含 boolean/char）。

## 核心规则

### 数值类型集合
- **整数类型**：byte, short, int, long
- **浮点类型**：float, double（number 是 double 的别名）
- **不属于数值类型**：bigint（任意精度，与数值类型隔离）

### 类型层次（Numeric Type Hierarchy）
```
byte < short < int < long < float < double
```
**关键性质：**
- Widening Numeric Conversions 把小类型转大类型（隐式）
- bigint **不在**此层次中，无隐式转换
- 必须用 `BigInt(...)` 类方法显式转换

### 数值类型的类性质
- 所有数值类型都是 `Object` 的子类型
- 可在任何接受 class 的地方使用
- 支持 `new number`, `new byte`, `new int` 等构造函数

## 测试点覆盖

### 1. 类型声明与字面量（PASS）
- 6 种数值类型基本声明（byte/short/int/long/float/double）
- number 别名等价于 double
- 字面量类型推断（整数→int、浮点→double、float 后缀 `f`）

### 2. Widening 数值转换层次（PASS）
- byte → short, int, long, float, double
- short → int, long, float, double
- int → long, float, double
- long → float, double
- float → double

### 3. 数值类型作为 Object 子类型（PASS）
- 数值赋值给 Object 变量（自动装箱）
- 数值作为 `Object[]` 元素
- 数值作为函数参数 Object

### 4. new 构造函数实例化（PASS）
- `new number` → 0
- `new byte` → 0
- `new int` → 0
- 等等
- spec §3.6.1 例子原文

### 5. bigint 与 numeric 隔离（FAIL / PASS）
- PASS: BigInt() 方法显式转换
- FAIL: 数值类型隐式赋值给 bigint
- FAIL: bigint 隐式赋值给数值类型
- FAIL: bigint 与 number 算术运算

### 6. Narrowing 转换禁止（FAIL）
- double → float 隐式禁止
- long → int 隐式禁止
- int → byte 隐式禁止
- 等等

### 7. 字面量超出范围（FAIL）
- byte 字面量超 [-128, 127]
- short 字面量超 [-32768, 32767]
- int 字面量超 2147483647
- long 字面量超出范围

### 8. Runtime 验证
- 各数值类型字面量边界值
- widening 后值正确保留
- bigint 通过 BigInt() 显式转换
- new 构造函数返回 0

## 编号规划
- compile-pass: 001 ~ 010
- compile-fail: 011 ~ 015
- runtime: 016 ~ 020

## 文件命名规范
`TYP_03_06_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`