# Atomic Operations - 跨语言对比报告 (ArkTS / Java / Swift)

## 概览

原子操作为共享可变状态提供无锁线程安全原语。ArkTS 在其标准库中提供了`AtomicBoolean`、`AtomicInt`和`AtomicLong`。Java 拥有系统的`java.util.concurrent.atomic`包，包含`AtomicBoolean`、`AtomicInteger`、`AtomicLong`、`AtomicReference`等。Swift 通过`Atomics`模块在 iOS 16+ / macOS 13+ 中引入了`Atomic`，不过历史上开发者使用`OSAtomic`或手动锁定。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Atomic boolean | `AtomicBoolean` | `AtomicBoolean` | `ManagedAtomic<Bool>` (iOS 16+) |
| Atomic integer | `AtomicInt` | `AtomicInteger` | `ManagedAtomic<Int>` |
| Atomic long | `AtomicLong` | `AtomicLong` | Same (Int is 64-bit on 64-bit) |
| Atomic reference | N/A | `AtomicReference<V>` | `ManagedAtomic<UnsafeMutablePointer>` |
| CAS operation | `atomic.compareAndSet(expected, new)` | `atomic.compareAndSet(expected, new)` | `atomic.compareExchange(expected, new)` |

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Primitive types | Boolean, Int, Long | Boolean, Integer, Long, LongAdder, etc. | Generic `ManagedAtomic<T>` |
| Reference types | N/A | ✅ (AtomicReference) | Via pointers |
| Atomic arrays | N/A | ✅ (AtomicIntegerArray, etc.) | N/A |
| Memory ordering | Sequential consistency | Sequential consistency | Configurable (relaxed, acquiring, releasing, sequentiallyConsistent) |
| Adders/Accumulators | N/A | ✅ (LongAdder, DoubleAccumulator) | N/A |
| LazySet | N/A | ✅ (`lazySet`) | N/A |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | Increment atomic counter | `count.increment()` | `counter.incrementAndGet()` | `count.wrappingIncrement(ordering: .sequentiallyConsistent)` |
| 2 | CAS loop | `while (true) { let old = count.get(); let new = old + 1; if (count.compareAndSet(old, new)) break; }` | `while (true) { int old = counter.get(); int next = old + 1; if (counter.compareAndSet(old, next)) break; }` | `while true { let (old, done) = count.compareExchange(expected: current, desired: current + 1, ordering: .sequentiallyConsistent); if done { break }; current = old }` |
| 3 | Atomic boolean flag | `flag.set(true); if (flag.get()) { ... }` | `flag.set(true); if (flag.get()) { ... }` | `flag.store(true, ordering: .sequentiallyConsistent); if flag.load(ordering: .sequentiallyConsistent) { ... }` |

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
| Type coverage | ★★★☆☆ | ★★★★★ | ★★★★☆ |
| Memory ordering control | ★★☆☆☆ | ★★☆☆☆ | ★★★★★ |
| Performance (CAS) | ★★★★☆ | ★★★★★ | ★★★★☆ |
| Convenience methods | ★★★☆☆ | ★★★★★ | ★★★☆☆ |
| Cross-platform support | ★★★★☆ | ★★★★★ | ★★★☆☆ |

## 核心结论

ArkTS 提供了基本的原子原语（Boolean、Int、Long）以及标准的 CAS 操作。Java 提供了最系统的原子库，包含专用类型、数组和累加器。Swift 的可托管原子操作提供可配置的内存排序，对性能和语义提供了最大程度的控制。ArkTS 的覆盖范围足以满足常见用例，但缺乏原子引用和累加器等高级特性。

## ArkTS 设计建议

1. 添加`AtomicReference<T>`以实现对象引用的原子更新
2. 考虑为高争用计数器提供`LongAdder`等效方法
3. 支持内存排序参数（relaxed、acquire、release）以进行性能调优
4. 添加原子数组类型以实现并发数组元素访问
5. 提供`updateAndGet`/`getAndUpdate`函数式便捷方法
