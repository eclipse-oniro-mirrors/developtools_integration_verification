# 16.2 Overview of Concurrency Features - 测试设计思维导图

## 1. 测试范围

- 异步执行原语：async / await / Promise
- 并行执行 API：launch / EAWorker / Taskpool
- 同步 API：locks / atomics
- API 细节与限制引用

## 2. 测试用例设计

### 2.1 编号规划

| 编号范围 | 含义 | 数量 |
|---------|------|:----:|
| CCY_16_02_001~003 | compile-pass 用例 | 3 |
| CCY_16_02_090~091 | compile-fail 用例 | 2 |
| CCY_16_02_020~021 | runtime 用例 | 2 |

### 2.2 文件命名规范

- `CCY_16_02_YYY_{PASS|FAIL|RUNTIME}_{DESC}.ets`

## 3. 测试点分解

### 3.1 compile-pass

| # | 测试点 | 文件 |
|---|--------|------|
| 001 | async/await/Promise 基本用法 | CCY_16_02_001_PASS_ASYNC_AWAIT.ets |
| 002 | launch API 基本用法 | CCY_16_02_002_PASS_LAUNCH_API.ets |
| 003 | AsyncLock 同步基本用法 | CCY_16_02_003_PASS_SYNC_LOCK.ets |

### 3.2 compile-fail

| # | 测试点 | 文件 |
|---|--------|------|
| 090 | await 在非 async 函数中 | CCY_16_02_090_FAIL_AWAIT_OUTSIDE_ASYNC.ets |
| 091 | async 函数返回非 Promise 类型 | CCY_16_02_091_FAIL_ASYNC_RETURN_NON_PROMISE.ets |

### 3.3 runtime

| # | 测试点 | 文件 |
|---|--------|------|
| 020 | async 函数返回 Promise 非 undefined | CCY_16_02_020_RUNTIME_ASYNC_EXECUTION.ets |
| 021 | launch 返回 Promise 非 undefined | CCY_16_02_021_RUNTIME_LAUNCH_EXECUTION.ets |

## 4. 覆盖情况

### 4.1 已覆盖

| 类型 | 数量 | 覆盖范围 |
|------|:----:|---------|
| compile-pass | 3 | async/await/Promise、launch API、AsyncLock |
| compile-fail | 2 | await 在非 async 函数、async 返回非 Promise |
| runtime | 2 | async Promise 非 undefined、launch Promise 非 undefined |

### 4.2 Spec 引用但无独立用例

| Spec 要点 | 说明 |
|-----------|------|
| EAWorker API | 在 16.4.3 有声明式用例覆盖（仅编译验证） |
| Taskpool API | 在 16.4.4 有声明式用例覆盖（仅编译验证） |
| atomics / 其余同步 | 在 16.5.5~16.5.6 有声明式用例覆盖 |
| API 细节与限制 | 在 16.6 各子章节覆盖 |

> 注：16.2 为概述章节，smoke test 覆盖三类原语即可，详细测试在 16.3~16.6 子章节。
