# 3.21.9 Nesting Utility Types - 测试设计思维导图

## 概述
Utility types 可以嵌套组合使用，外层和内层的约束都生效。

## 核心规则
- `Required<Readonly<T>>`：字段均为必填 + 只读
- `Readonly<Partial<T>>`：字段可选 + 只读
- `Partial<Readonly<T>>`：字段可选 + 只读（等同 Readonly<Partial<T>>）
- 内层 readonly 禁止写入，外层 Required 需要全字段

## 测试点
- compile-pass: 嵌套声明、合法对象字面量
- compile-fail: 嵌套 readonly 写入、Required 缺字段
- runtime: 值正确