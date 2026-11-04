# Launch API - 跨语言对比报告（ArkTS / Java / Swift）

## 概览

`launch` API 用于产生并发任务，支持即发即弃或返回结果两种模式。ArkTS 提供 `launch<T>(async () => T)` 产生任务；Java 使用 `CompletableFuture.supplyAsync` 或原生 `Thread`；Swift 使用 `Task { }` / `Task.detached` 结构化并发。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 产生异步任务 | `launch<T>(() => T)` | `CompletableFuture.supplyAsync(() -> T)` | `Task { await operation() }` |
| 即发即弃 | `launch(() => void)` | `executor.execute(() -> ...)` | `Task { ... }`（非结构化）|
| 分离任务 | N/A（所有 launch 均为分离式） | `new Thread(() -> ...).start()` | `Task.detached { ... }` |
| 有返回值的任务 | `let future: Future<T> = launch(() => compute())` | `CompletableFuture<T> f = CompletableFuture.supplyAsync(() -> compute())` | `let handle = Task { await compute() }` |
| 等待 / 汇合 | `future.get()` | `future.get()` / `future.join()` | `await handle.value` |

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 返回类型 | `Future<T>` | `CompletableFuture<T>` / `Future<T>` | `Task<T, Error>` |
| 结构化作用域 | 无作用域限制 | 无作用域限制（需手动管理） | 限定在父任务作用域内 |
| 异常传播 | 通过 Future 传播 | 包装在 `ExecutionException` 中 | 通过 `throws` 传播 |
| 优先级 | N/A | 通过 Thread 优先级 | 通过 Task 优先级 |
| 取消支持 | Future 支持 | `cancel(true)` | `cancel()` 通过 Task handle |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | 异步计算启动 | `launch(() => fib(30))` | `CompletableFuture.supplyAsync(() -> fib(30))` | `Task { await fib(30) }` |
| 2 | 即发即弃副作用 | `launch(() => logMetrics())` | `executor.execute(() -> logMetrics())` | `Task { await logMetrics() }` |
| 3 | 启动并支持取消 | `let f = launch(() => work()); f.cancel();` | `Future<?> f = executor.submit(() -> work()); f.cancel(true);` | `let t = Task { await work() }; t.cancel();` |

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

## 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| API 简洁性 | ★★★★☆ | ★★★☆☆ | ★★★★★ |
| 结构化安全 | ★★☆☆☆ | ★★☆☆☆ | ★★★★★ |
| 取消支持 | ★★★★☆ | ★★★★★ | ★★★★☆ |
| 结果获取便利性 | ★★★★☆ | ★★★★☆ | ★★★★★ |
| 文档和社区 | ★★★☆☆ | ★★★★★ | ★★★★★ |

## 核心结论

ArkTS `launch<T>` 提供了便捷的异步任务产生 API，支持通过 `Future<T>` 获取结果。相比 Java 的 CompletableFuture 语法更简洁，但缺少 Swift 的结构化并发保障。主要优势是语法简洁，主要不足是缺少自动取消传播和作用域生命周期管理。

## ArkTS 设计建议

1. 考虑增加结构化并发作用域（类似 `withTaskGroup`）以支持自动清理
2. 在 launch API 中支持基于优先级的任务调度
3. 提供 `launchDetached` 语义以区分作用域内和分离式任务
4. 使 Future API 对齐 `CompletableFuture` 风格的链式调用（thenApply, exceptionally）
