# 3.21.2 NonNullable Utility Type - 测试设计思维导图

## 概述
`NonNullable<T>` 从 T 中排除 null 和 undefined。`NonNullable<T> = T - null - undefined`。

## 核心规则
- 若 T 不含 null/undefined → T 保持不变
- `NonNullable<null>` / `NonNullable<undefined>` → never
- `NonNullable<Any>` → `Any - null - undefined`
- 泛型内使用 `NonNullable<T>` 作字段类型（spec 原例）

## 测试点

### compile-pass
- `Object|null|undefined` → Object
- 不含 nullish 的类型 → 自身
- 泛型 `NonNullable<T>` 字段
- `NonNullable<Any>` 编译通过

### compile-fail
- `NonNullable<null>` → never 赋值
- `NonNullable<undefined>` → never 赋值

### runtime
- 基础展开后值正确

## 编号
- compile-pass: 001~005
- compile-fail: 006~007
- runtime: 008~009