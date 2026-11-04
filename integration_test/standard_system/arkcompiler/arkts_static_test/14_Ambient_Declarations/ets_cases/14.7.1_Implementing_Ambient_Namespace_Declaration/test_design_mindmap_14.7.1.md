# 14.7.1 Implementing Ambient Namespace Declaration — 测试设计思维导图

## 概述

Ambient namespace 可在 ArkTS 中实现：用同名非 ambient namespace 提供实现体。

**核心规则：**
1. 实现 namespace 必须与 ambient namespace 同名
2. 嵌套 namespace 的名称必须与 ambient 上下文一致
3. 实现时可以提供函数体、变量初始值等

## 子类型覆盖

### compile-pass（4 个）
- 同名实现：`declare namespace A {}` + `namespace A {}`
- 嵌套同名：`declare namespace A { namespace B {} }` + `namespace A { namespace B {} }`
- 实现函数：`declare namespace A { function foo(): void }` + `namespace A { function foo(): void {} }`
- 实现变量：`declare namespace A { let x: int }` + `namespace A { let x: int = 0 }`

### compile-fail（2 个）
- 嵌套名称不匹配：ambient namespace B 但实现 namespace C
- 方法签名不匹配：参数类型不同

### runtime（1 个）
- 实现的 ambient namespace + main 执行

## 文件命名规范
- 前缀：`AMB_`
- 章节：`14_07_01`
- PASS 001~004 → FAIL 005~006 → RUNTIME 007
