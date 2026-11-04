# 3.21.3 Partial Utility Type - 测试设计思维导图

## 概述
`Partial<T>` 将 class/interface 的所有字段和属性设为 optional，方法（含 getter/setter）不包含。

## 核心规则
- T 必须是 class 或 interface，否则编译错误
- 所有字段变为 optional (T|undefined)
- 方法、getter、setter 不在 Partial 中
- T 不可赋值给 Partial<T>
- U <: T ⇒ Partial<U> <: Partial<T>
- Object literal 有自己的 getter/setter

## 测试点

### compile-pass
- interface 字段变为 optional
- class 字段变为 optional
- 子类型协变
- Object literal 通过 Partial 赋值

### compile-fail
- T 赋给 Partial<T>（不可赋值）
- 非 class/interface 应用 Partial
- 在 Partial 上调用方法

### runtime
- optional 字段访问（undefined 检查）
- Object literal 赋 Partial 后值正确
- 子类型赋值