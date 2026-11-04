# 3.22 Default Values for Types - 测试设计思维导图

## 概述
实验特性。值类型和 undefined/Any/void 有默认值，引用类型、枚举、类型参数无默认值。

## 核心规则
- 值类型默认值：number=0, byte=0, short=0, int=0, long=0, float=+0.0, double=+0.0, char=\u0000, boolean=false
- undefined 类型和超类型: Any/void/undefined → 默认值 undefined
- 引用类型、枚举、类型参数 → 无默认值
- 类字段 `T|undefined` → undefined

## 测试点
- compile-pass: 声明未初始化（值类型/Any/void/undefined）
- compile-fail: 引用类型未初始化就使用
- runtime: 默认值正确