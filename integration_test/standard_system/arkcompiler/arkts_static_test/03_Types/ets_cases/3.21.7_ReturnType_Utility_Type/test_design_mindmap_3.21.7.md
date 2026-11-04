# 3.21.7 ReturnType Utility Type - 测试设计思维导图

## 概述
`ReturnType<T>` 从函数类型 T 中提取返回类型。

## 核心规则
- `ReturnType<() => string>` → string
- `ReturnType<() => void>` → void
- 非函数类型（除 never）→ 编译错误
- `ReturnType<Function>` → Any
- `ReturnType<never>` → never
- 可作为泛型默认参数

## 测试点
- compile-pass: 基本函数类型、多参函数、void 返回、union 返回、泛型默认
- compile-fail: 非函数类型入参
- runtime: 提取后的类型可赋值