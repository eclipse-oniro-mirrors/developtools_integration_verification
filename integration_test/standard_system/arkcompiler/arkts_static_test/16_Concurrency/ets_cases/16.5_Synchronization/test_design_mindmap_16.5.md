# 16.5 Synchronization - 测试设计思维导图

## 概述

§16.5 定义 ArkTS 同步机制，包括 AsyncLock、AsyncMutex、AsyncRWLock、AsyncCondVar 和原子操作。这些是标准库级 API。

## 子类型覆盖

### 1. AsyncLock (§16.5.1)
- 标准库 API：独占/共享锁定

### 2. AsyncMutex (§16.5.2)
- 标准库 API：lock/unlock

### 3. AsyncRWLock (§16.5.3)
- 标准库 API：读/写锁定

### 4. AsyncCondVar (§16.5.4)
- 标准库 API：条件变量

### 5. Atomic operations (§16.5.5)
- 标准库 API：原子操作

## 文件命名规范
- CCY_16_05_YYY_{CATEGORY}_{DESCRIPTION}.ets


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- normal cases
- edge cases
- error cases
- AsyncLock class: protects shared data from concurrent access
- designed for isolated callback pattern (lockAsync callback)
- lockAsync<T>(callback, mode): request execution under lock
- two access levels: exclusive and shared
- exclusive: no other request satisfied until callback finishes
- shared: concurrent requests allowed, exclusive requests wait
- lockAsync returns Promise that resolves after callback completes
- can be safely requested concurrently by same or different jobs
- abort existing request for callback execution
- query status of existing locks
- timeout for lock acquire request
- deadlock detection hints
- example: SharedState class with checkAndModify
- example: two modification sequences with suspension points
- example: lock prevents interleaving and data races
- compile-pass: AsyncLock declaration
- compile-pass: lockAsync with exclusive mode
- compile-pass: lockAsync with shared mode
- compile-pass: lockAsync with async callback
- runtime: exclusive lock prevents interleaved execution
- runtime: shared lock allows concurrent readers
- runtime: lock with suspension point maintains critical section
- runtime: two lockAsync operations on same lock are sequential
- boundary: timeout on lock acquisition
- boundary: abort lock request
- boundary: deadlock detection
- API: AsyncLockMode.EXCLUSIVE vs shared
- AsyncMutex class: decoupled lock/unlock operations
- designed for use with condition variable
- designed when callback isolation is inconvenient
- await lock.lock() to acquire (await is mandatory)
- lock.unlock() to release
- code between lock() and unlock() is critical section
- no other job can acquire lock until unlock() called
- safe across same or different worker threads
- double locking (deadlock) is developer's responsibility
- deadlock avoidance is developer's responsibility
- example: SharedState protected by AsyncMutex
- example: two async functions with interleaved suspension
- compile-pass: AsyncMutex declaration
- compile-pass: lock() and unlock() calls
- runtime: mutex prevents interleaved critical section access
- runtime: await lock() suspends until lock acquired
- runtime: unlock() releases for next waiter
- boundary: double lock from same job (deadlock)
- boundary: unlock without lock (error)
- boundary: unlock called but lock never awaited
- AsyncRWLock class: read/write lock
- decoupled lock/unlock operations
- readers: concurrent access allowed between readers
- writers: exclusive access (no readers or other writers)
- designed when callback isolation inconvenient
- designed when read vs write distinction matters
- standard library API (reference documentation)
- compile-pass: AsyncRWLock declaration
- runtime: multiple readers can acquire concurrently
- runtime: writer waits for all readers to release
- runtime: readers wait for writer to release
- boundary: read-to-write upgrade (if supported)
- AsyncCondVar class: condition variable for shared data
- requires AsyncMutex paired with it
- cv.wait(mutex): unlock mutex, wait for notification, relock
- await cv.wait(m) is mandatory (returns Promise)
- cv.notifyOne(mutex): notify one waiter
- cv.notifyAll(mutex): notify all waiters
- typical pattern: while(condition) { await cv.wait(m); }
- example: flag-based notification (job A sets flag, job B waits)
- example: critical section with condition check
- compile-pass: AsyncCondVar declaration with AsyncMutex
- compile-pass: wait() and notifyOne() calls
- runtime: condition variable wait blocks until notify
- runtime: notifyOne wakes exactly one waiter
- runtime: notifyAll wakes all waiters
- runtime: spurious wakeup handled by while loop
- boundary: wait with no corresponding notify (timeout)
- boundary: notifyOne with no waiters (no-op)
- standard library atomic classes
- lock-free data structures and algorithms
- compare-and-swap operations
- spinlock construction
- complex lock-free containers
- standard library API (reference documentation)
- compile-pass: atomic variable declaration
- runtime: atomic read-modify-write operations
- runtime: compare-and-swap atomicity
- runtime: atomics across worker threads
- thread-safe concurrent containers
- worker thread-local data APIs
- other helper synchronization classes
- standard library API (reference documentation)

## 覆盖情况

### 已覆盖（有实际 .ets 文件）

| 子章节 | compile-pass | compile-fail | runtime |
|--------|:-----------:|:-----------:|:------:|
| §16.5.1 AsyncLock | 4 (声明/独占/共享/临界区) | 1 (双锁) | 0 |
| §16.5.2 AsyncMutex | 3 (声明/lock_unlock/临界区) | 1 (unlock_无lock) | 0 |
| §16.5.3 AsyncRWLock | 1 (声明) | 0 | 0 |
| §16.5.4 AsyncCondVar | 3 (声明/notify/wait循环) | 0 | 0 |
| §16.5.5 原子操作 | 1 (声明) | 0 | 0 |
| §16.5.6 附加实体 | 1 (并发容器) | 0 | 0 |
| **合计** | **13** | **2** | **0** |

### 待覆盖（设计要点标注 runtime 但无对应 .ets 文件）

| 子章节 | 缺失项 |
|--------|--------|
| §16.5.1 AsyncLock | runtime: 独占锁防交错、共享锁并发读、悬挂点保持临界区、顺序执行；边界: 超时、中止、死锁检测 |
| §16.5.2 AsyncMutex | runtime: 防交错、await lock() 挂起、unlock() 释放；边界: 死锁 |
| §16.5.3 AsyncRWLock | runtime: 多读并发、写等读、读等写；边界: 读锁升级 |
| §16.5.4 AsyncCondVar | runtime: wait 阻塞、notifyOne/All、spurious wakeup；边界: 超时、无等待者 notify |
| §16.5.5 原子操作 | runtime: 读-改-写、CAS、跨 worker 原子操作 |
| §16.5.6 附加实体 | runtime 场景 |

> 注：AsyncMutex/AsyncCondVar/AsyncRWLock 当前 stdlib 尚未提供，runtime 用例依赖于 stdlib 实现就绪。

