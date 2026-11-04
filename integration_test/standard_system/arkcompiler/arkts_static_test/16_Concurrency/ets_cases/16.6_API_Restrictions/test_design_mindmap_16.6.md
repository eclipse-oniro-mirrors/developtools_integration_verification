# 16.6 API Details and Restrictions - 测试设计思维导图

## 概述

§16.6 定义并发 API 的详细限制和使用注意事项，包括 Promise 方法限制、未处理拒绝和错误处理策略。

## 子类型覆盖

### 1. launch API details (§16.6.1)
- Worker thread 域/组概念（标准库文档）

### 2. Using async API (§16.6.2)
- async 入口函数（描述性）

### 3. Promise class API (§16.6.3)
- .then/.catch/.finally 注册限制

### 4. Unhandled Rejected Promises (§16.6.4)
- 未处理拒绝策略

### 5. Error handling policy (§16.6.5)
- 错误传播策略

## 文件命名规范
- CCY_16_06_YYY_{CATEGORY}_{DESCRIPTION}.ets


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- normal cases
- edge cases
- error cases
- worker thread ID: unique number per thread
- worker thread domain: named filtering criteria
- notable domains: main, exclusive
- worker thread group: immutable set of worker threads
- group definition via domain or explicit ID list
- group specified in launch parameters
- job assigned to worker thread from group
- rescheduling stays within same group
- worker thread IDs may become invalid (threads created/deleted)
- API handles invalid IDs (ignore, error, or return value)
- compile-pass: launch with domain parameter
- compile-pass: launch with group parameter
- compile-pass: launch with worker thread ID
- runtime: launch on main domain
- runtime: launch on exclusive worker thread
- boundary: invalid worker thread ID handling
- calling async function from non-async context
- requires converting caller to async (chain of conversions)
- chain can continue up to program entry point
- async entry point function supported
- compile-pass: async main entry point
- compile-pass: async function called from async main
- compile-pass: chained async calls
- runtime: async main execution flow
- Promise safe to await across worker threads
- .then(callback): register resolution callback
- .catch(callback): register rejection callback
- .finally(callback): register finalization callback
- callback runs as separate job on registering worker thread
- same-thread callbacks: execution order matches registration order
- cross-thread callbacks: order defined per thread, no global order
- compile-pass: .then() callback registration
- compile-pass: .catch() callback registration
- compile-pass: .finally() callback registration
- compile-pass: chained .then().catch().finally()
- runtime: .then() callback called after Promise resolved
- runtime: .catch() callback called after Promise rejected
- runtime: .finally() callback called regardless of outcome
- runtime: callback order matches registration on same thread
- boundary: .then() returning new Promise (chaining)
- boundary: .then() with no arguments
- boundary: callback throws error
- rejected Promise is unhandled if no await and no .then()/.catch()
- timing evaluated per worker thread
- Promise may be unhandled on one thread but handled on another
- unhandled rejection behavior (TBD, design not final)
- runtime: Promise rejected with no handler (unhandled)
- runtime: Promise rejected but caught by .catch() (handled)
- runtime: Promise rejected but awaited (handled)
- boundary: cross-thread unhandled detection
- all errors should be handled or considered uncaught
- uncaught error initiates program termination
- job abnormal completion rejects corresponding Promise
- rejection prevents error from being uncaught
- unhandleable cases: runtime-created job with no Promise
- unhandleable case: main job throws error
- these cases result in uncaught error
- compile-pass: async function with try/catch around await
- runtime: rejected Promise caught by try/catch
- runtime: async function throw results in Promise rejection
- runtime: main job throw results in uncaught error
- boundary: nested error propagation
- normal cases
- edge cases
- error cases
- Producer_Consumer_Model
- ATM_Withdrawal_Model
- Deadlock_Detection
- Dining_Philosophers
- Race_Condition_Detection
- Bank_Transfer
- async + launch: async function launched via launch API
- async + Taskpool: async function in taskpool
- async + synchronization: async function with AsyncLock
- launch + synchronization: launched job with mutex
- Promise + .then() chaining across modules
- async main + multiple concurrent jobs
- error propagation across job boundaries
- Promise rejection + .catch() in different worker thread

