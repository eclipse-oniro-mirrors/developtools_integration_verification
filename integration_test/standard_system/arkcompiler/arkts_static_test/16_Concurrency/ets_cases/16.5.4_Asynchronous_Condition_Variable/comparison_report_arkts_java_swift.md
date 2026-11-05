# AsyncConditionVariable - 跨语言对比报告 (ArkTS / Java / Swift)

## 概览

AsyncConditionVariable 允许异步任务等待某个条件变为真，并接收其余任务的通知。ArkTS 将其作为异步原生原语提供。Java 使用`java.util.concurrent.locks`中的`Condition`，绑定到`ReentrantLock`。Swift 使用`NSCondition`或`NSConditionLock`进行基于条件的同步，两者都是阻塞的。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Condition variable | `AsyncConditionVariable` | `Condition` (bound to Lock) | `NSCondition` / `NSConditionLock` |
| Wait | `condvar.wait()` / `condvar.waitAsync()` | `condition.await()` | `condition.wait()` |
| Signal one | `condvar.signal()` | `condition.signal()` | `condition.signal()` |
| Broadcast all | `condvar.broadcast()` | `condition.signalAll()` | `condition.broadcast()` |
| Associated lock | External AsyncLock | ReentrantLock | NSCondition (lock integrated) |

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Async non-blocking wait | ✅ | ❌ (blocks thread) | ❌ (blocks thread) |
| Spurious wakeup safe | ✅ (loop re-check) | ✅ (loop re-check) | ✅ (loop re-check) |
| Timeout support | N/A | `await(time, unit)` | `wait(until:)` |
| Predicate support | Manual loop | Manual loop | Manual loop |
| Lock integration | Explicit AsyncLock | Bound to ReentrantLock | Integrated (NSCondition) |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | Wait for condition | `lock.lock(); while (!ready) { await condvar.waitAsync(); } ... lock.unlock();` | `lock.lock(); while (!ready) { condition.await(); } ... lock.unlock();` | `condition.lock(); while (!ready) { condition.wait(); } condition.unlock();` |
| 2 | Signal condition change | `lock.lock(); ready = true; condvar.signal(); lock.unlock();` | `lock.lock(); ready = true; condition.signal(); lock.unlock();` | `condition.lock(); ready = true; condition.signal(); condition.unlock();` |
| 3 | Broadcast to all waiters | `lock.lock(); ready = true; condvar.broadcast(); lock.unlock();` | `lock.lock(); ready = true; condition.signalAll(); lock.unlock();` | `condition.lock(); ready = true; condition.broadcast(); condition.unlock();` |

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
| Async non-blocking | ★★★★★ | ★★☆☆☆ | ★★☆☆☆ |
| API completeness | ★★★☆☆ | ★★★★★ | ★★★★☆ |
| Spurious wakeup safety | ★★★★☆ | ★★★★☆ | ★★★★☆ |
| Timeout support | ★★☆☆☆ | ★★★★★ | ★★★★☆ |
| Ease of correct use | ★★★☆☆ | ★★★☆☆ | ★★★☆☆ |

## 核心结论

ArkTS AsyncConditionVariable 是唯一支持异步非阻塞等待的条件变量，适用于事件驱动的异步代码。Java 的 Condition 功能最丰富，支持超时和公平通知。Swift 的 NSCondition 尚可但会阻塞线程。三种都需要谨慎使用 while 循环谓词来处理虚假唤醒。

## ArkTS 设计建议

1. 为异步等待添加超时支持（`waitAsync(timeout: Duration)`）
2. 提供`waitFor(predicate)`便捷方法以封装 while 循环模式
3. 支持公平通知以防止等待者饥饿
4. 考虑直接与 AsyncLock 集成（类似于 Java 的 Condition-Lock 绑定）
