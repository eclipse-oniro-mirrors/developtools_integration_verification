# 4.4 Accessible - 测试设计思维导图

## 概述
An entity is accessible if it belongs to the current scope. Type names, function names, variable names, module names can be used when accessible.

## 子类型覆盖
### 1. 类型名称可访问性
- 正向编译: 作用域内的类型可用来声明变量

### 2. 函数名称可访问性
- 正向编译: 作用域内的函数可调用

### 3. 变量名称可访问性
- 正向编译: 作用域内的变量可读写

### 4. 模块/命名空间名称可访问性
- 正向编译: 导入模块可访问，namespace 导出实体通过限定名可访问
- 反向编译: namespace 导出实体在外部不能省略 namespace 限定名
