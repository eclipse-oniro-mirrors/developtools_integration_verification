# 16.6.3 Promise Class API - 测试设计思维导图

## 1. 测试范围

- Promise 类核心 API：then、catch、finally 方法

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_06_03_001~003 | compile-pass 用例 | 3 |

### 2.2 文件命名规范

- `CCY_16_06_03_YYY_{CATEGORY}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 | spec 对应 |
|---|--------|------|-----------|
| 001 | Promise.then：fulfilled 后调用回调 | CCY_16_06_03_001_PASS_promise_then.ets | then(onFulfilled) 注册成功回调 |
| 002 | Promise.catch：rejected 后调用回调 | CCY_16_06_03_002_PASS_promise_catch.ets | catch(onRejected) 注册拒绝回调 |
| 003 | Promise.finally：无论成功/失败均执行 | CCY_16_06_03_003_PASS_promise_finally.ets | finally(onFinally) 自动执行 |

### 3.2 compile-fail

（无 — spec 未定义编译期错误条件）

### 3.3 runtime

（待覆盖 — 需 ark VM 验证回调执行顺序）

## 4. 覆盖情况

| 类型 | 数量 | 说明 |
|------|:----:|------|
| compile-pass | 3 | then + catch + finally 语法 |
| compile-fail | 0 | spec 无编译期错误条件 |
| runtime | 0 | 需 ark VM 实测（回调注册与调用） |
