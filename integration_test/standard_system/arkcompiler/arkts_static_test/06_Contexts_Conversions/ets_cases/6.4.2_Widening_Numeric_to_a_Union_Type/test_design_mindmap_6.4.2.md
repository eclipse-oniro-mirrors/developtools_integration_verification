# 6.4.2 Widening Numeric to a Union Type - 测试设计思维导图

## 概述
数值 v 可转换为联合类型 (U1|...|Un) 中的 Ui，条件：Ui 是联合中唯一大于 v 类型的数值类型。
三种赋值机制：1) 字面量类型推断；2) 子类型（已在联合中）；3) widening 到联合成员。

## 子类型覆盖

### 1. 字面量推断
- 正向: byte|int=256(int), byte|int=100(byte)
- 运行时: instanceof 验证

### 2. 子类型赋值
- 正向: int→byte|int|long
- 运行时: instanceof 验证

### 3. Widening 到联合成员
- 正向: byte→short|int|long, short→int|long
- 反向: int→byte|short (无更大类型)
- 运行时: 值保留验证

### 4. 无有效转换
- 反向: double→int|long, string→int|double

## 文件命名
CON_06_04_02_ZZZ_{CATEGORY}_{DESCRIPTION}.ets
