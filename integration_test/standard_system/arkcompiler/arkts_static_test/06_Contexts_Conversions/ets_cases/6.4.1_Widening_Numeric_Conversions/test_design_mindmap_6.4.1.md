# 6.4.1 Widening Numeric Conversions - 测试设计思维导图

## 概述
Widening numeric conversion 将数值类型转换为更大的数值类型，永不导致运行时错误。
转换表: byte→short/int/long/float/double, short→int/long/float/double, int→long/float/double, long→float/double, float→double

## 子类型覆盖

### 1. 按 From 类型覆盖
- byte→5 targets (short,int,long,float,double)
- short→4 targets
- int→3 targets
- long→2 targets
- float→1 target

### 2. 按上下文覆盖
- 声明上下文、调用上下文、返回上下文、赋值上下文、复合字面量上下文

### 3. 边界值
- 零、负数、极大值

## 转换矩阵

| From → To | short | int | long | float | double |
|-----------|:---:|:---:|:---:|:---:|:---:|
| byte | ✓ | ✓ | ✓ | ✓ | ✓ |
| short | | ✓ | ✓ | ✓ | ✓ |
| int | | | ✓ | ✓ | ✓ |
| long | | | | ✓ | ✓ |
| float | | | | | ✓ |

## 文件命名
CON_06_04_01_ZZZ_{CATEGORY}_{DESCRIPTION}.ets
