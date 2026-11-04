# 14.4.2 Ambient Call Signature — 测试设计思维导图

## 概述

Ambient call signature declarations 在 ambient class 中指定可调用类型的签名，提供 TypeScript 兼容性。

**核心规则：**
1. 语法：`signature` = `(params): returnType`
2. 必须在 ambient class 内声明
3. 多个 call signatures 允许，但必须 distinct（参数类型不同）
4. 实现时使用 `static $_invoke` 方法
5. 仅用于 TS 兼容性

## 子类型覆盖

### compile-pass
- 单个 call signature
- 两个 distinct call signatures
- 三个 distinct call signatures
- 不同参数个数的 call signatures
- 与其余 ambient 成员共存

### compile-fail
- 非 distinct call signatures（相同参数类型）
- 非 ambient class 中的 call signature
- call signature 缺返回类型

### runtime
- ambient class with call signatures + main

## 文件命名规范
- 前缀：`AMB_`
- 章节：`14_04_02`
- PASS 001~005 → FAIL 006~008 → RUNTIME 009
