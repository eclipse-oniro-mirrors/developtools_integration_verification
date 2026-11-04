# 16.3.5 Promise Class - 测试设计思维导图

## 1. 测试范围

- Promise 类核心 API：Promise.resolve、Promise.reject、then/catch 回调、状态转换（pending→resolved）

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_03_05_001~004 | compile-pass 用例 | 4 |
| CCY_16_03_05_xxx | compile-fail 用例 | 0 |

### 2.2 文件命名规范

- `CCY_16_03_05_YYY_{CATEGORY}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 | @design |
|---|--------|------|---------|
| 001 | Promise.resolve 静态方法 | CCY_16_03_05_001_PASS_promise_resolve.ets | Promise.resolve 创建已决议 Promise 通过编译 |
| 002 | Promise then/catch 回调 | CCY_16_03_05_002_PASS_promise_then_catch.ets | Promise then/catch 方法通过编译 |
| 003 | Promise 状态转换 | CCY_16_03_05_003_PASS_promise_state_transitions.ets | Promise pending→resolved 状态转换通过编译 |
| 004 | Promise.reject 静态方法 | CCY_16_03_05_004_PASS_promise_reject.ets | Promise.reject 创建已拒绝 Promise 通过编译 |

### 3.2 compile-fail

（无 — spec 未定义 Promise 类相关的编译期错误条件）

### 3.3 runtime

（待覆盖 — 需 ark VM 验证 Promise 执行链、状态转换、回调调度）

## 4. 覆盖情况

| 类型 | 数量 | 说明 |
|------|:----:|------|
| compile-pass | 4 | resolve、reject、then/catch、状态转换 |
| compile-fail | 0 | spec 无编译期错误条件 |
| runtime | 0 | 需 ark VM 实测（回调执行、链式调用、异步调度） |
