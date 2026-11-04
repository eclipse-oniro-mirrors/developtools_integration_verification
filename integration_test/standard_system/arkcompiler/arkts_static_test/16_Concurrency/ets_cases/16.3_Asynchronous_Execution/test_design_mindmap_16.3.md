# 16.3 Asynchronous Execution - 测试设计思维导图

## 概述

本章定义 ArkTS 异步执行模型，包括 async 函数/方法/lambda、await 表达式和 Promise 类。核心测试覆盖规范中明确定义的编译时错误点。

## 子类型覆盖

### 1. Asynchronous Functions (§16.3.1)
- 正向编译: async 函数声明 + async main 入口
- 反向编译: async 函数在静态初始化中调用
- 反向编译: async 函数有 abstract/native 修饰
- 反向编译: async 函数返回类型非 Promise
- 反向编译: 非 async 函数含 await 表达式
- 运行时: async 函数返回 Promise 值

### 2. Asynchronous Lambdas (§16.3.2)
- 正向编译: async lambda 声明和调用
- 运行时: async lambda 执行

### 3. Asynchronous Methods (§16.3.3)
- 正向编译: async 实例/静态方法
- 运行时: async 方法调用链

### 4. await Expression (§16.3.4)
- 正向编译: await Promise 表达式
- 正向编译: await 非 Promise 值（不挂起）
- 反向编译: await 在非 async 上下文中

### 5. Promise class (§16.3.5)
- 正向编译: Promise 创建和 await
- 运行时: Promise resolve/reject 值

## 文件命名规范
- CCY_16_03_YYY_{CATEGORY}_{DESCRIPTION}.ets


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- normal cases
- edge cases
- error cases
- async function declaration with async modifier
- async function returns Promise<T>
- async modifier not part of function type (type system perspective)
- async main entry point supported
- first suspension returns pending Promise immediately
- runtime creates suspendable job at first suspension
- second+ suspension schedules another job per scheduling rules
- normal completion resolves Promise with return value
- error completion rejects Promise with thrown error
- async function can explicitly return Promise<T> instance (returned as-is)
- async function can return T value (auto-boxed into Promise<T>)
- argumentless return allowed when T is void/undefined
- async function with zero suspension points defines no additional jobs
- compile-error: async function called in static initialization
- compile-error: async function with abstract modifier
- compile-error: async function with native modifier
- compile-error: async function return type other than Promise
- compile-error: non-async function with suspension points
- compile-pass: async function with Promise<void> return
- compile-pass: async function with inferred return type
- compile-pass: async function in normal calling context
- compile-pass: async function returning Promise<T> explicitly
- runtime: async function returns Promise, then resolves with value
- runtime: async function throws, Promise rejects with error
- runtime: multiple suspension points in one async function
- async modifier on lambda expressions
- async lambda follows same semantics as async functions
- async lambda in trailing lambda syntax
- compile-pass: async lambda declaration and invocation
- compile-pass: async lambda as function argument
- runtime: async lambda execution with suspension
- runtime: async lambda returns Promise value
- edge: async lambda with no suspension points
- async modifier on static class methods
- async modifier on instance class methods
- async methods follow same semantics as async functions
- compile-pass: async instance method declaration
- compile-pass: async static method declaration
- compile-pass: async method in class inheritance
- runtime: async method invocation chain
- runtime: async method with await inside
- boundary: async method overriding (return type covariance with Promise)
- await expression syntax: 'await' expression
- expression argument type: Any
- result type: Awaited<type(expression)>
- await on Promise subtype: suspends until resolved/rejected
- await on resolved Promise: value becomes await result
- await on rejected Promise: throws rejection error
- await on non-Promise type: returns value directly, no suspension
- example: await g() where g returns Promise<Object>, v1 is Object
- example: await new Int(5) where Int is non-Promise, no suspension, v2 is Int
- example: await optional chain with Promise|undefined, conditional suspension
- suspended job can be moved to another worker thread on resumption
- compile-error: await outside async function/method/lambda body
- compile-pass: await on Promise<T> in async function
- compile-pass: await on non-Promise value in async function
- compile-pass: await on union type (Promise|T)
- runtime: await suspends execution until Promise resolves
- runtime: await non-Promise returns immediately
- runtime: await rejected Promise throws
- runtime: await on optional Promise chain (?.)
- boundary: deeply nested await expressions
- boundary: await in loop (multiple sequential suspensions)
- Promise states: pending, resolved, rejected
- pending: value not yet known
- resolved: fulfilled with defined value
- rejected: contains error instance
- only way to get value: await expression on Promise
- Promise safe for concurrent access (exceptions in §16.6)
- compile-pass: Promise creation with constructor
- compile-pass: Promise.resolve() / Promise.reject()
- runtime: Promise transitions from pending to resolved
- runtime: Promise transitions from pending to rejected
- runtime: Promise.resolve value matches awaited result
- runtime: Promise.reject error caught by await
- boundary: Promise never resolved (pending forever)
- boundary: Promise resolved multiple times (only first takes effect)
- boundary: then/catch/finally callback registration
- cross-section: Promise with launch API
- cross-section: Promise with Taskpool API

### 遗漏的 spec 要点（对照 spec_original.md 增补）

| Spec 章节 | 遗漏要点 | 说明 |
|-----------|---------|------|
| §16.3.1 | async 修饰符不是函数类型一部分 | ✅ 已修复 (007_PASS_async_modifier_not_part_of_type) |
| §16.3.1 | 程序入口点支持 async 函数 | 在 16.6.2 提及，16.3 未单独列出 |
| §16.3.1 | T=void/undefined 允许无参数 return | ✅ 已修复 (006_PASS_async_void_return_argless) |
| §16.3.5 | 获取 Promise 值的唯一方式：await | spec 第 36-37 行，未单独点出 |

## 覆盖情况

### 已覆盖（有实际 .ets 文件）

| 子章节 | compile-pass | compile-fail | runtime |
|--------|:-----------:|:-----------:|:------:|
| §16.3.1 Async Functions | 8 (006_argless, 007_type, 008_covariant) | 4 | 4 (020_resolve, 021_reject, 022_multi, 023_explicit) |
| §16.3.2 Async Lambdas | 5 (003_no_suspension, 004_trailing, 005_closure) | 1 | 3 (020_exec, 021_await, 022_no_suspension) |
| §16.3.3 Async Methods | 3 | 3 (090_abstract, 091_static_init, 092_interface) | 3 (020_instance, 021_static, 022_chain) |
| §16.3.4 await Expression | 13 (007_for..013_awaited) | 1 | 5 (020_resolve..024_sequential) |
| §16.3.5 Promise Class | 8 (005_finally, 006_chain, 007_all, 008_race) | 3 (090_wrong_arg, 091_no_type, 092_wrong_type) | 5 (020_resolved..024_static) |
| **§16.3 合计** | **37** | **12** | **20** |
| + 父章节(16.3) | 9 | 7 | 3 |
| **全 16.3 总计** | **46** | **19** | **23** |

### 待覆盖

（无 — 所有主线场景已覆盖）

