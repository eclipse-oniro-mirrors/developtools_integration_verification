# 17.13.4 Lambda Expressions with Receiver - 测试设计思维导图

## 概述
Lambda 表达式可以带有接收者。实测发现：es2panda **不支持**对 lambda 变量使用方法调用语法（`receiver.lambdaVar()`），仅支持普通调用语法（`lambdaVar(receiver)`）。顶层接收者函数可以同时使用两种调用语法。

## 子类型覆盖

### 1. 基本 lambda 接收者
- **正向编译**: 定义带接收者的lambda，通过普通调用使用
- **正向编译**: lambda通过普通调用语法调用
- **正向编译**: lambda访问接收者成员（显式this）

### 2. 非法用法
- **反向编译**: lambda使用非法接收者类型
- **反向编译**: lambda this引用外围类
- **反向编译**: lambda用于无接收者上下文
- **反向编译**: 无效lambda接收者语法

## 实测发现
- ⚠️ es2panda 不支持 lambda 变量的方法调用语法
- ⚠️ es2panda 不支持隐式 this
- ✅ 顶层接收者函数支持方法调用语法

## 文件命名规范
- 前缀：`EXP2_`
