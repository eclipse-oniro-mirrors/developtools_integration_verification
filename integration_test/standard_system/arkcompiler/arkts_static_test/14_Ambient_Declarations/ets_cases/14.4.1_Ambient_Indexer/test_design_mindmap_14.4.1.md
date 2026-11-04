# 14.4.1 Ambient Indexer — 测试设计思维导图

## 概述

Ambient indexer declarations 在 ambient class 中指定类实例的索引签名，提供 TypeScript 兼容性。

**核心规则：**
1. 语法：`['readonly'?] '[' identifier ':' type ']' returnType`
2. 仅允许一个 ambient indexer 声明（per class）
3. 仅在 ambient 上下文中支持
4. 索引类型支持 number、int、string 等
5. 支持 readonly 修饰

## 子类型覆盖

### compile-pass
- number 索引，number 返回
- int 索引，class 返回
- string 索引，string 返回
- readonly 索引
- Object 返回类型
- 与其余 ambient 成员共存

### compile-fail
- 两个 indexer（违反"仅一个"规则）
- 在非 ambient class 中使用 indexer
- 无效语法

### runtime
- ambient class with indexer + main 共存

## 文件命名规范
- 前缀：`AMB_`
- 章节：`14_04_01`
- PASS 001~006 → FAIL 007~009 → RUNTIME 010
