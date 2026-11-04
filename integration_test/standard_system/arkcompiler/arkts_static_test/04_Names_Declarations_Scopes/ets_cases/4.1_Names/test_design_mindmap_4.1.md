# 4.1 Names - 测试设计思维导图

## 概述
Name is a sequence of one or more identifiers used to refer to declared entities. Names can be simple (single identifier) or qualified (identifier.identifier...).

## 子类型覆盖
### 1. Simple names
- 正向编译: 单个标识符声明和引用
- 反向编译: 空标识符、数字开头的标识符
- 运行时: 运行时通过简单名引用实体

### 2. Qualified names
- 正向编译: 模块名.导出成员, 类名.静态成员, 实例.实例成员, 接口类型变量.实例成员
- 反向编译: 空限定名、非法限定名
- 运行时: 限定名访问模块/类成员

### 3. Identifier rules
- 正向编译: 合法标识符（字母/下划线/$开头）
- 反向编译: 关键字作为标识符
- 运行时: N/A

## 分类说明
- compile-pass / compile-fail / runtime

## 文件命名规范
- NAM_04_01_YYY_{CATEGORY}_{DESCRIPTION}.ets
