# 6.3.2 char Conversions for Relational and Equality Operands - 测试设计思维导图

## 概述
关系运算符和相等运算符允许 `char` 类型操作数与数值类型操作数进行隐式转换。
char 类型操作数按以下规则 widening：
- 若另一操作数为 byte/char/int → char 转换为 int
- 否则 → char 转换为另一操作数的类型（long/double 等）

## 子类型覆盖

### 1. char vs 整数类型转换
- 正向编译: char < byte (both → int), char < int (char → int), byte < char
- 反向编译: char < string, char < boolean
- 运行时: 验证 char 值比较的数值语义

### 2. char vs 宽类型转换
- 正向编译: char < long (char → long), char < double (char → double), char > long
- 反向编译: string < char
- 运行时: 验证 char 转换为 long/double 后的比较正确性

### 3. char 相等比较
- 正向编译: char == int, char != long, char == byte, char == char
- 运行时: 验证 == 和 != 语义

### 4. 全运算符
- 正向编译: char 与各类型的所有关系/相等运算符 (< > <= >= == !=)
- 运行时: 综合验证

## 分类说明
- compile-pass: 验证 char 的合法 widening 比较编译通过
- compile-fail: 验证 char 与非数值类型比较编译失败
- runtime: 验证 char widening 比较的运行时正确性

## 文件命名规范
- 前缀: CON_06_03_02_
