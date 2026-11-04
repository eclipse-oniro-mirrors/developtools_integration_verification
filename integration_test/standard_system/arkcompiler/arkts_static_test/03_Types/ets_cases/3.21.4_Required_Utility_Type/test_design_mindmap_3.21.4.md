# 3.21.4 Required Utility Type - 测试设计思维导图

## 概述
`Required<T>` 是 `Partial<T>` 的反向，将 T 的所有 optional 字段设为 required（非 optional）。方法（含 getter/setter）不包含。

## 核心规则
- T 必须是 class/interface，否则编译错误
- 所有 optional 字段变为 required
- 方法、getter、setter 不在 Required 中
- T 不可赋值给 Required<T>
- U <: T ⇒ Required<U> <: Required<T>

## 测试点
- compile-pass: optional→required、子类型协变、class 的 Required
- compile-fail: 缺少 required 字段、T 赋给 Required<T>、非 class/interface、方法访问
- runtime: 全部字段必填赋正常值