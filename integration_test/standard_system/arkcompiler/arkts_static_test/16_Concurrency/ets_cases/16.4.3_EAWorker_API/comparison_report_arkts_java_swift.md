# EAWorker API - 跨语言对比报告 (ArkTS / Java / Swift)

## 概览

EAWorker 是 ArkTS 特有的用于 CPU 密集型并行工作的 API，提供了具有专用内存空间的隔离 Worker 上下文。它类似于 JavaScript 中的 Web Workers。Java 通过`Thread`和`ExecutorService`处理 CPU 密集型工作；Swift 在协作线程池上使用`Task`，将繁重工作卸载到调度队列中。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Worker creation | `new worker.ThreadWorker(script)` | `new Thread(runnable).start()` | Not directly exposed |
| Message passing | `postMessage` / `onmessage` | Shared memory / `BlockingQueue` | `await` / `Actor` messaging |
| CPU-intensive offload | EAWorker dedicated worker | `ExecutorService.submit(Callable)` | `Task.detached { heavyWork() }` |
| Worker lifecycle | `terminate()` | `thread.interrupt()` | Task cancellation |
| Shared memory | N/A (message-based) | `volatile` / `Atomic*` / locks | Actor state isolation |

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Isolation model | Process-like (no shared state) | Shared memory (threads) | Actor isolation |
| Communication | Async message passing | Shared mutable state | Async method calls |
| Thread overhead | Separate thread per worker | Thread per task (pooled) | Cooperative (lightweight) |
| Use case | Heavy CPU / blocking I/O | General threading | Async I/O / CPU |
| Memory safety | High (no shared memory) | Low (manual sync) | High (actor isolation) |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | Offload CPU-heavy computation | `let w = new worker.ThreadWorker("compute.ets"); w.postMessage(data);` | `executor.submit(() -> compute(data));` | `Task.detached { await heavyCompute(data) }` |
| 2 | Receive result from worker | `w.onmessage = (e) => { result = e.data; }` | `Future<Result> f = executor.submit(() -> compute(data)); Result r = f.get();` | `let result = await Task.detached { await heavyCompute(data) }.value` |
| 3 | Worker cleanup | `w.terminate();` | `executor.shutdown();` | Task auto-cancelled on scope exit |

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
| 隔离安全 | ★★★★★ | ★★☆☆☆ | ★★★★☆ |
| 性能 (CPU-intensive) | ★★★★☆ | ★★★★★ | ★★★☆☆ |
| API 简洁性 | ★★★★☆ | ★★★☆☆ | ★★★★★ |
| 消息传递便利性 | ★★★★★ | ★★☆☆☆ | ★★★★☆ |
| 内存模型安全性 | ★★★★★ | ★★☆☆☆ | ★★★★★ |

## 核心结论

EAWorker 通过消息传递隔离提供了较强的内存安全性，非常适合在不需要共享状态的 CPU 密集型并行工作中使用。Java 的线程模型更灵活但容易出错。Swift 的协作任务很轻量，但不太适合没有调度队列的真正并行 CPU 密集型工作。EAWorker 填补了类似于 Web Workers 的特殊领域。

## ArkTS 设计建议

1. 考虑添加类型化消息接口以在 Worker 边界提供更好的类型安全性
2. 支持可转移对象（无需拷贝即可传输缓冲区）以处理大数据
3. 添加 Worker 池抽象以管理多个 Worker
4. 在 Worker 消息间提供带有类型化错误处理的错误传播
