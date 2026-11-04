# 16.4 Parallel Execution - 跨语言对比报告 ArkTS / Java / Swift

## 概览

Parallel Execution（并行执行）涵盖 launch API、EAWorker 和 Taskpool。这些是标准库级 API，三语言各有不同的并行编程模型。

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 并行执行 API | launch / EAWorker / Taskpool | ExecutorService / ForkJoinPool | Task / TaskGroup |
| 线程模型 | Worker thread | OS thread pool | Cooperative thread pool |
| 结构化并发 | ✅ Taskpool | ❌ | ✅ TaskGroup |
| 独占线程 | ✅ EAWorker | ✅ Thread | ❌ |
| 异步支持 | ✅ launch + async | ❌ CompletableFuture | ✅ Task + async |

## 核心结论

ArkTS 并行 API 与 Swift 的结构化并发最为接近。Java 的线程模型更底层。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 并行执行 API | launch / Taskpool | ExecutorService / ForkJoinPool | Task / TaskGroup |
| 结构化并发 | Taskpool | ❌ | TaskGroup |
| 独占线程 | EAWorker | Thread | ❌ |
| 线程模型 | Worker thread | OS thread pool | Cooperative thread pool |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | 并行执行 launch API | `launch { compute() }` | `Executors.newFixedThreadPool(2).submit(() -> compute())` | `Task.detached { await compute() }` |

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
| API 简洁度 | ★★★★★ | ★★★ | ★★★★★ |
| 结构化并发支持 | ★★★ | ★★ | ★★★★★ |
| 线程灵活性 | ★★★★ | ★★★★★ | ★★★ |

## ArkTS 设计建议

保持当前 launch + Taskpool + EAWorker 三者并行的设计模式。Taskpool 提供了类似 Swift TaskGroup 的结构化并发能力，建议在文档中明确各 API 的适用场景。EAWorker 的独占线程模式是 Java/Swift 没有的差异化优势，适合需要稳定线程绑定的场景。

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
