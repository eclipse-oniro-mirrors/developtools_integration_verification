# 16.7.1 Scheduling Rules - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

ArkTS 调度规则定义 job 的调度策略，对应 Java 的线程优先级和调度器、Swift 的 Task 优先级。

## 2. 章节对应关系

| ArkTS (§16.7.1) | Java | Swift (Concurrency) |
|------|------|-------|
| 调度规则声明 | Thread.setPriority() | Task(priority: .high) |
| 优先级定义 | 1-10 | high / default / low / background |

## 3. 关键差异

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 调度粒度 | job 级别 | 线程级别 | Task 级别 |
| 优先级范围 | 声明式规则 | 1-10 数值 | userInitiated/high/medium/low/background |
| 抢占式 | 依赖 VM | ✅ 操作系统 | ✅ 协作式（async 挂起点） |
| 继承机制 | 未定义 | 默认继承父线程 | Task 继承父 Task 优先级 |

## 4. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| API 简洁度 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 调度控制力 | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 5. 核心结论

ArkTS 调度规则采用声明式语法，比 Java 的数值优先级更现代。Swift 在结构化并发中提供内置优先级模型，与 TaskGroup 深度集成。

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | 调度优先级设置 | `launch { ... }` 声明式规则 | `Thread.setPriority(Thread.MAX_PRIORITY)` | `Task(priority: .high) { ... }` |

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
