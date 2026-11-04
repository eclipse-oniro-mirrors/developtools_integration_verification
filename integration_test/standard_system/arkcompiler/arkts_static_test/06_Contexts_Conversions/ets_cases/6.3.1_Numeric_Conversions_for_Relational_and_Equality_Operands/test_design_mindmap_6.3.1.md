# 6.3.1 Numeric Conversions for Relational and Equality Operands - 测试设计思维导图

## 概述
关系运算符(<, >, <=, >=)和相等运算符(==, !=)允许对不同大小的数值类型操作数进行隐式转换（Widening Numeric Conversions）。
数值基类型的枚举也可在数值上下文中使用。

核心规则：
- 不同类型数值操作数在比较前，较窄类型会 widening 转换为较宽类型
- 枚举类型若基类型为数值类型，可作为数值操作数使用
- 非数值类型（string, boolean）用于关系运算符应编译失败

## 子类型覆盖

### 1. 关系运算符 widening 转换
- 正向编译: int < long, long > int, byte < int, double > int, float < double, short < long 等
- 反向编译: string < int, boolean > int, string > long 等非数值类型
- 运行时: 验证 widening 后比较结果的正确性

### 2. 相等运算符 widening 转换
- 正向编译: int == long, short != long, byte == int 等
- 反向编译: 非数值类型在相等比较中的行为（可能合法或非法）
- 运行时: 验证 equality 的 widening 比较结果

### 3. 枚举在数值上下文
- 正向编译: 数值基类型枚举用于关系运算和相等运算
- 反向编译: string 基类型枚举用于关系运算
- 运行时: 验证枚举值与数值比较的结果

### 4. 边界值
- 运行时: 极大/极小值的 widening 比较、零值、负值

## 分类说明
- compile-pass: 验证合法 widening 比较编译通过
- compile-fail: 验证非数值类型用于关系运算符产生编译错误
- runtime: 验证 widening 比较的运行时正确性

## 文件命名规范
- 前缀: CON_06_03_01_
- 编号: 001 起连续递增
