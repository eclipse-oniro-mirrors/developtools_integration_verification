# 16.6.2 Using Async API - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

ArkTS async API 定义异步函数的入口与链式调用模式，对应 Java 的 `CompletableFuture` 链和 Swift 的 `async` 函数。

## 2. 章节对应关系

| ArkTS (§16.6.2) | Java | Swift (Concurrency) |
|------|------|-------|
| async main 入口 | main() + CompletableFuture | @main struct + async |
| async 函数链式调用 | thenCompose / thenApply | 连续 await 调用 |

## 3. 关键差异

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 入口声明 | `async main()` | `main()` 内组合 CF | `@main struct` + `async` |
| 链式调用 | await 链 | `.thenCompose()` | await 顺序链 |
| 函数签名 | `async func()` 隐式返回 Promise | `CompletableFuture<T>` | `async func() -> T` |
| 语法风格 | await 顺序（类 Swift） | 方法链回调 | await 顺序 |

## 4. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 可读性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 链式表达 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

## 5. 核心结论

ArkTS async 链式调用在语法上几乎与 Swift 一致，均为 await 顺序表达式，比 Java 的 thenCompose 回调风格更直观。

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | async 函数链式调用 | `let r = await f(); await g(r);` | `cf.thenCompose(r -> g(r)).join();` | `let r = try await f(); try await g(r)` |

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
