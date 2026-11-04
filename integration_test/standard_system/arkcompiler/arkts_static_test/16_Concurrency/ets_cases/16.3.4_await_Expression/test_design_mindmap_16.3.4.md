# 16.3.4 await Expression - 测试设计思维导图

## 1. 测试范围

- await 表达式语法：await Promise、await 非 Promise 值、await 可选链、await 变量、连续 await、await 联合类型、await 作用域限制

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_03_04_001~006 | compile-pass 用例 | 6 |
| CCY_16_03_04_090 | compile-fail 用例 | 1 |

### 2.2 文件命名规范

- `CCY_16_03_04_YYY_{CATEGORY}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 | @design |
|---|--------|------|---------|
| 001 | await Promise 表达式 | CCY_16_03_04_001_PASS_await_promise.ets | await Promise 在 async 函数中通过编译 |
| 002 | await 非 Promise 值（不挂起） | CCY_16_03_04_002_PASS_await_non_promise.ets | await 非 Promise 值通过编译且不挂起 |
| 003 | await 可选链操作 | CCY_16_03_04_003_PASS_await_optional_chaining.ets | await 可选链操作在 async 函数中通过编译 |
| 004 | await Promise 变量 | CCY_16_03_04_004_PASS_await_promise_variable.ets | await Promise 类型变量通过编译 |
| 005 | 连续 await 多个表达式 | CCY_16_03_04_005_PASS_await_multiple.ets | 多个 await 表达式顺序执行通过编译 |
| 006 | await 联合类型 Promise<T> \| T | CCY_16_03_04_006_PASS_await_union_type.ets | await 在 Promise<T> \| T 联合类型编译通过 |

### 3.2 compile-fail

| # | 测试点 | 文件 | @design |
|---|--------|------|---------|
| 090 | await 在非 async 函数中 | CCY_16_03_04_090_FAIL_await_outside_async.ets | await 在非 async 函数中应编译错误 |

### 3.3 runtime

（待覆盖 — 需 ark VM 验证 await 执行语义：挂起→恢复、Promise 决议顺序）

## 4. 覆盖情况

| 类型 | 数量 | 说明 |
|------|:----:|------|
| compile-pass | 6 | Promise、非 Promise、可选链、变量、连续 await、联合类型 |
| compile-fail | 1 | await 在非 async 上下文中 |
| runtime | 0 | 需 ark VM 实测（挂起恢复、执行顺序、错误传播） |
