# 6.4 Implicit Conversions - 测试设计思维导图

## 概述
描述所有允许的隐式转换。每种转换在特定上下文中允许（如 Assignment-like Contexts, String Contexts, Numeric Contexts）。
子转换类型：
- 6.4.1 Widening Numeric Conversions
- 6.4.2 Widening Numeric to Union Type
- 6.4.3 Enumeration to Numeric Type
- 6.4.4 Enumeration to string Type

本节的父级测试聚焦于：多隐式转换协同工作、上下文隔离、跨上下文行为。

## 子类型覆盖

### 1. 多转换类型共存
- 正向: 同一函数中使用多种隐式转换（widening + enum→numeric + enum→string）
- 反向: 错误上下文使用转换

### 2. 上下文隔离
- 正向: 每种转换在正确上下文中生效
- 反向: 转换在不匹配上下文中不应生效

### 3. 转换链
- 正向: 表达式经过多重转换链（如 enum→int→long→double）

### 4. 运行时综合
- 运行时: 所有转换类型的值保留验证

## 文件命名
CON_06_04_ZZZ_{CATEGORY}_{DESCRIPTION}.ets
