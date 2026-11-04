# 3.21.5 Readonly Utility Type - 测试设计思维导图

## 概述
`Readonly<T>` 将 T 的所有字段设为 readonly，不可重新赋值。

## 核心规则
- T 必须是 class/interface
- 所有字段变为 readonly（禁止重新赋值）
- 方法/getter/setter 不包含
- T 可赋值给 Readonly<T>
- T <: Readonly<T>
- U <: T ⇒ Readonly<U> <: Readonly<T>

## 测试点
- compile-pass: readonly 字段声明、T 赋给 Readonly<T>、子类型协变、subtype
- compile-fail: readonly 字段写入、非 class/interface、方法访问
- runtime: 字段只读、子类型赋值、T → Readonly<T>