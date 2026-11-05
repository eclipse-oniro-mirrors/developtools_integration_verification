# 16.5 Synchronization - 跨语言对比报告 ArkTS / Java / Swift

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Lock | AsyncLock | ReentrantLock | NSLock |
| Mutex | AsyncMutex | synchronized | os_unfair_lock |
| RWLock | AsyncRWLock | ReentrantReadWriteLock | pthread_rwlock |
| CondVar | AsyncCondVar | Condition | NSCondition |
| Atomics | Atomic classes | AtomicInteger/AtomicReference | AtomicInt/AtomicReference |

## 核心结论

三语言均提供类似的同步原语，ArkTS 的异步锁与 async/await 集成更自然。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 互斥锁 | AsyncMutex | synchronized / ReentrantLock | os_unfair_lock / NSLock |
| 读写锁 | AsyncRWLock | ReentrantReadWriteLock | pthread_rwlock_t |
| 条件变量 | AsyncCondVar | Condition | NSCondition |
| 原子操作 | AtomicInteger / AtomicReference | AtomicInteger / AtomicReference | AtomicInt / AtomicReference |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | 互斥锁同步 | `AsyncMutex().lock() { critical() }` | `synchronized (lock) { critical() }` | `NSLock().lock(); critical(); NSLock().unlock()` |

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
| API 设计 | ★★★★★ | ★★★★ | ★★★★ |
| 类型安全 | ★★★★ | ★★★ | ★★★★★ |
| 与 async 集成 | ★★★★★ | ★★★ | ★★★★ |

## ArkTS 设计建议

ArkTS 异步锁（AsyncMutex/AsyncRWLock/AsyncCondVar）与 async/await 深度集成，在异步上下文中不会阻塞线程，这是相对 Java synchronized 和 Swift NSLock 的显著优势。建议保持当前设计，并在 API 文档中强调异步锁在协程/非阻塞场景下的正确使用方式。

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
