# 3.21.1 Awaited Utility Type - 测试设计思维导图

## 概述
`Awaited<T>` 是 ArkTS 内置 utility type，递归移除类型中所有的 `Promise` 包装，直到遇到非 `Promise` 类型。语义上类似 `await` 或 `.then()`。

## 核心规则
- `Awaited<Promise<string>>` → `string`
- `Awaited<Promise<Promise<number>>>` → `number`
- `Awaited<boolean | Promise<number>>` → `boolean | number`
- `Awaited<Object>` → `Object`
- `Awaited<Promise<Promise<number>|Promise<string>|Promise<boolean>>>` → `number|string|boolean`
- `Awaited<Promise<(p: Promise<string>) => Promise<number>>>` → `(p: Promise<string>) => Promise<number>`（函数内 Promise 不展开）
- `Awaited<Promise<Array<Promise<number>>>>` → `Array<Promise<number>>`（数组内 Promise 不展开）
- 类型参数约束：`Awaited<T extends SubType>` 是 `Awaited<U extends SuperType>` 的子类型（协变）

## 测试点

### compile-pass
- 基本 `Promise<string>` → string
- 嵌套 Promise → 最内层类型
- union 中展开 Promise
- 非 Promise 类型保持不变
- 函数类型内 Promise 不展开
- 数组内 Promise 不展开
- 协变传递

### compile-fail
- 用非类型参数（如 `1`）实例化（应是类型不合法）
- 重名名定义冲突（如有）

### runtime
- Awaited 类型不会影响运行时值

## 编号规划
- compile-pass: 001~008
- compile-fail: 009~010
- runtime: 011~012

## 三环境实测要求
- ArkTS：es2panda + ark ✅
- Java：无 compile‑time Awaited，标记 N/A
- Swift：无 compile‑time Awaited，标记 N/A