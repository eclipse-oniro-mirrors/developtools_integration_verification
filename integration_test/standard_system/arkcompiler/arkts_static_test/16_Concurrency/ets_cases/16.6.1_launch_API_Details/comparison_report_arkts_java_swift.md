# 16.6.1 launch API Details - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

ArkTS `launch` API 用于创建独立并发 job，对应 Java 的 `Thread` 或 `CompletableFuture.runAsync`，以及 Swift 的 `Task.detached`。

## 2. 章节对应关系

| ArkTS (§16.6.1) | Java | Swift (Concurrency) |
|------|------|-------|
| launch { ... } 创建独立 job | new Thread(() -> {}).start() | Task.detached { ... } |
| launch 返回 void | Thread 无返回值 | Task<Void, Never> |
| job 父子关系 | Thread 无层级 | TaskGroup 结构化并发 |

## 3. 关键差异

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 创建语法 | `launch { ... }` | `new Thread(() -> ...)` | `Task.detached { ... }` |
| 返回值 | void | void | Task<Void, Never> |
| 结构化并发 | ❌ launch 独立 | ❌ Thread 独立 | ✅ 支持 TaskGroup |
| 异常传播 | 内部 try/catch | 线程内 catch | 通过 Task 结果传播 |

## 4. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 语法简洁度 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |
| 结构化支持 | ⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 异常处理 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |

## 5. 核心结论

ArkTS `launch` 在语法层面比 Java `Thread` 更简洁，接近 Swift 的 `Task.detached`。但缺乏 Swift 的结构化并发 TaskGroup 机制。

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | launch 创建独立 job | `launch { compute() }` | `new Thread(() -> compute()).start()` | `Task.detached { await compute() }` |

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
