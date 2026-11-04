# 10.2 Superinterfaces and Subinterfaces - 测试设计思维导图

## 概述
Interface can extend one or more superinterfaces, inheriting all members. Extension cycle and non-interface type extension are forbidden.

## 子类型覆盖
### 1. Single superinterface
- 正向编译: extends 单个父接口

### 2. Multiple superinterfaces
- 正向编译: extends 多个父接口

### 3. Extension validation
- 反向编译: 继承非接口类型
- 反向编译: 循环继承依赖
