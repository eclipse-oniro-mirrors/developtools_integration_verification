# 6.3 Numeric Operator Contexts - 测试设计思维导图

## 概述
Numeric contexts 适用于算术运算符的操作数。使用 Widening Numeric Conversions 将操作数转换为目标类型 T。
数值基类型的枚举也可在数值上下文中使用，其类型假定与枚举基类型相同。

数值上下文包括：Unary / Exponentiation / Multiplicative / Additive / Shift / Relational / Equality / Bitwise / Conditional-And / Conditional-Or

（注：Relational/Equality 的 widening 已由 6.3.1 覆盖，char 转换已由 6.3.2 覆盖）

## 子类型覆盖

### 1. Unary Expressions
- 正向: +int, -long, ~byte 等一元运算符
- 运行时: 验证一元运算结果

### 2. Exponentiation / Multiplicative / Additive
- 正向: int**long, int*double, int+long 等 widening 算术
- 反向: string*int, boolean+int 等非数值算术
- 运行时: 验证 widening 算术结果

### 3. Shift / Bitwise
- 正向: int<<long, int&long, int^long 等
- 运行时: 验证移位和位运算结果

### 4. Conditional-And / Conditional-Or
- 正向: 数值上下文中的 && ||
- 运行时: 验证短路行为

### 5. Enum in Arithmetic Contexts
- 正向: 数值枚举参与算术运算
- 反向: string 枚举参与算术
- 运行时: 验证枚举算术结果

### 6. Compound Assignment
- 正向: += -= *= /= 等 widening 场景
- 运行时: 验证复合赋值结果

## 文件命名
CON_06_03_ZZZ_{CATEGORY}_{DESCRIPTION}.ets
