# 16.4 Parallel Execution - 测试设计思维导图

## 概述

§16.4 定义 ArkTS 并行执行 API，包括 launch API、EAWorker API 和 Taskpool API。这些是标准库级 API，规范中未定义语言级编译错误。

## 子类型覆盖

### 1. launch API (§16.4.2)
- 正向编译: launch lambda 声明
- 运行时: launch 执行同步/void/类型参数 job
- 运行时: launch 在非 async 上下文中
- 已知限制: launch + async lambda + await → 编译器 CRASH (用例在 compile-pass/ 目录，详见 issue_report)

### 2. EAWorker API (§16.4.3)
- 标准库 API（已可用）
- compile-pass: EAWorker 构造/start/isAlive/run/quit
- runtime: EAWorker 创建 → run → lifecycle → join

### 3. Taskpool API (§16.4.4)
- 标准库 API（已可用）
- compile-pass: Task/TaskGroup/taskpool.execute
- runtime: Task 执行/函数直接执行/分组/优先级

## 文件命名规范
- CCY_16_04_YYY_{CATEGORY}_{DESCRIPTION}.ets


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- normal cases
- edge cases
- error cases
- launch API: primary parallel execution API
- EAWorker API: dedicated worker threads
- Taskpool API: structured concurrency framework
- orthogonal to async execution (async funcs can run in parallel)
- suspendable job can change worker thread on resumption
- launch API: primary parallel execution API
- launches provided lambda as new job
- default: least busy worker thread chosen
- returns Promise resolved when lambda completes
- full explicit form: launch<T>(async () => { ... })
- inferred form: launch async { ... }
- launch allowed in non-async functions too
- launch with async lambda can be rescheduled on resumption
- compile-pass: launch with synchronous lambda
- compile-pass: launch with async lambda
- compile-pass: launch with type parameter specification
- compile-pass: launch in non-async function
- compile-pass: launch with trailing lambda syntax
- runtime: launch executes lambda on another worker thread
- runtime: launch returns Promise that resolves with return value
- runtime: await launch result on caller worker thread
- runtime: launch async lambda with suspension points (⚠️ compiler CRASH, 详见 issue_report)
- edge: launch with void lambda (fire-and-forget)
- edge: launch with lambda that throws (Promise rejection)
- runtime: multiple concurrent launches
- runtime: nested launch calls
- API: launch parameter customization (domain, group, etc.)
- EAWorker: dedicated worker thread for exclusive use
- initial job and all spawned jobs stay on that worker thread
- compile-pass: EAWorker 构造/start/isAlive/run/quit
- runtime: EAWorker 创建 → run 任务 → Promise
- runtime: EAWorker 生命周期 start → isAlive → quit
- runtime: EAWorker join 等待 worker 完成
- designed for UI frameworks and similar use cases
- standard library API (reference documentation)
- structured concurrency framework
- create jobs with dependencies between them
- cancel spawned jobs
- combine jobs in groups
- compile-pass: Task/TaskGroup 创建/taskpool.execute
- runtime: Task 执行/Promise resolved
- runtime: 函数直接执行
- runtime: TaskGroup 分组执行
- runtime: 优先级配置执行
- complex execution order selection
- suspendable jobs NOT rescheduled to another worker thread
- standard library API (reference documentation)

