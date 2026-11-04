# AsyncMutex - 跨语言对比报告 (ArkTS / Java / Swift)

## 概览

AsyncMutex 是 ArkTS 特有的专为异步上下文设计的互斥锁，在不阻塞底层线程的情况下提供互斥访问。Java 提供`synchronized`块和`ReentrantLock`用于基于线程的互斥。Swift 更倾向于使用 Actor 隔离进行安全可变状态管理，使得显式互斥锁在惯用的 Swift 代码中不太常见。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Mutex primitive | `AsyncMutex` | `synchronized` / `ReentrantLock` | `actor` isolation |
| Acquire | `mutex.lock()` / `mutex.lockAsync()` | `synchronized(this) { }` / `lock.lock()` | `await actor.method()` |
| Release | `mutex.unlock()` | Auto (synchronized) / manual (lock) | Auto (actor scope) |
| Try acquire | `mutex.tryLock()` | `lock.tryLock()` | N/A (actor provides automatic isolation) |
| Async-safe | ✅ | ❌ (blocks thread) | ✅ (actor suspension) |

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Async non-blocking | ✅ | ❌ | ✅ (via actor) |
| Scope-based guard | Manual | ✅ (synchronized) | ✅ (actor) |
| Deadlock risk | Moderate (manual) | Moderate (reentrant safe) | Low (actor serial) |
| Reentrancy | N/A | ✅ (ReentrantLock) | ✅ (actor reentrant) |
| Idiomatic usage | Explicit | Explicit / implicit | Implicit (actor) |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | Protect mutable state | `mutex.lock(); try { state++; } finally { mutex.unlock(); }` | `synchronized (this) { state++; }` | `actor Counter { var value = 0; func increment() { value += 1 } }` |
| 2 | Async critical section | `await mutex.lockAsync(); try { await modify(x); } finally { mutex.unlock(); }` | `synchronized (this) { modify(x); }` | `await actor.modify(x)` (auto-serialized) |
| 3 | Try lock pattern | `if (mutex.tryLock()) { ... mutex.unlock(); }` | `if (lock.tryLock()) { try { ... } finally { lock.unlock(); } }` | N/A (actor handles all access) |

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
| Async safety | ★★★★★ | ★★☆☆☆ | ★★★★★ |
| Ease of correct use | ★★★☆☆ | ★★★★☆ | ★★★★★ |
| Flexibility | ★★★☆☆ | ★★★★★ | ★★★☆☆ |
| Reentrancy support | ★★☆☆☆ | ★★★★★ | ★★★★★ |
| Documentation | ★★★☆☆ | ★★★★★ | ★★★★☆ |

## 核心结论

ArkTS AsyncMutex 为语言带来了异步安全的互斥访问，填补了 Java 的阻塞`synchronized`在异步上下文中无法填补的空白。Swift 的 Actor 模型是最优雅的解决方案，完全消除了显式互斥锁的使用。AsyncMutex 对 ArkTS 来说是一个务实的选择，但存在与 Java 的 ReentrantLock 相同的手动管理风险。

## ArkTS 设计建议

1. 考虑引入类似`actor`的构造来替代共享状态的显式互斥锁使用
2. 添加`withLock`基于作用域的 API 以防止遗漏解锁
3. 支持基于超时的锁获取以用于异步上下文
4. 在调试模式下提供死锁检测或警告
