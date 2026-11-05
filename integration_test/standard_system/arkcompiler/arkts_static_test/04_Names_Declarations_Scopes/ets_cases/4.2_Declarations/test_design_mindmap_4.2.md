# 4.2 Declarations - 测试设计思维导图

## 概述
A declaration introduces a named entity in an appropriate declaration scope. Declarations must be distinguishable by name or signature.

## 子类型覆盖
### 1. Declaration distinguishability by name
- 正向编译: 不同名称的声明可以共存
- 反向编译: 同名但不可区分（非重载）的声明
- 运行时: N/A

### 2. Declaration Distinguishable by Signatures (4.2.1)
- 正向编译: 同名函数不同签名（重载）
- 反向编译: 同名函数重载等价签名
- 运行时: 重载函数分派

### 3. Predefined type name clash
- 反向编译: 使用预定义类型名声明变量

### 4. Ambient vs non-ambient clash
- 反向编译: 同一模块中ambient和非ambient同实体

## 文件命名规范
- NAM_04_02_YYY_{CATEGORY}_{DESCRIPTION}.ets
