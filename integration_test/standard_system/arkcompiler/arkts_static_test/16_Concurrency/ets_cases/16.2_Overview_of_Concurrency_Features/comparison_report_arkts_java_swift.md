# 16.2 Overview of Concurrency Features - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

ArkTS 提供三类并发原语：异步执行（async/await/Promise）、并行执行（launch/EAWorker/Taskpool）、同步（locks/atomics）。

## 2. 章节对应关系

| ArkTS (§16.2) | Java (JLS) | Swift (Concurrency) |
|------|------|-------|
| async/await/Promise | CompletableFuture | async/await/Promise |
| launch API | ExecutorService.submit() | Task.detached() |
| EAWorker API | Thread | N/A |
| Taskpool API | ForkJoinPool | TaskGroup |
| AsyncLock | ReentrantLock | NSLock / Actor |
| Atomics | AtomicInteger | AtomicInt |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语言级 async/await | ✅ | ❌ | ✅ |
| 结构化并发 | ✅ (Taskpool) | ⚠️ (ForkJoinPool) | ✅ (TaskGroup) |
| 专用 Worker 线程 | ✅ (EAWorker) | ✅ (Thread) | ❌ |
| 异步锁 | ✅ (AsyncLock) | ✅ (ReentrantLock) | ⚠️ (Actor 模式) |

## 4. 用例 1:1 对照

### 4.1 async/await

| # | 用例 | ArkTS | Java | Swift |
|---|------|:-----:|:----:|:-----:|
| 001 | async/await 基本用法 | ✅ compile-pass | ⚠️ (CompletableFuture) | ✅ |

### 4.2 launch API

| # | 用例 | ArkTS | Java | Swift |
|---|------|:-----:|:----:|:-----:|
| 002 | launch 基本用法 | ✅ compile-pass | ✅ | ✅ |

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 并发原语完备性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| 语言级集成度 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 同步机制 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |

## 6. 核心结论

ArkTS 的并发功能覆盖面广，同时具备语言级 async/await 和多种并行执行 API。

## 7. ArkTS 设计建议

结构化并发（Taskpool）和专用 Worker（EAWorker）的设计提供了灵活的并发控制模型，适合 UI 框架和后台任务的不同场景。

## 8. 三环境实测结果

| 用例 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| async/await | ✅ | N/A | ✅ |
| launch | ✅ | ✅ | ✅ |
