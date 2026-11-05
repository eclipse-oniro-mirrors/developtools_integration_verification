# 16.6.3 Promise Class API - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

ArkTS Promise 类提供 then/catch/finally 接口，与 Java `CompletableFuture` 和 JavaScript `Promise` 设计一致，Swift 则以 async/await 替代 Promise 链。

## 2. 章节对应关系

| ArkTS (§16.6.3) | Java | Swift (Concurrency) |
|------|------|-------|
| Promise.then | CompletableFuture.thenApply | await（内隐回调） |
| Promise.catch | CompletableFuture.exceptionally | do/catch |
| Promise.finally | CompletableFuture.whenComplete | defer |

## 3. 关键差异

| 维度 | ArkTS | Java (CF) | Swift |
|------|-------|-----------|-------|
| 成功回调 | `.then(v => {})` | `.thenApply(v -> ...)` | `let v = await ...` |
| 异常回调 | `.catch(e => {})` | `.exceptionally(e -> ...)` | `catch { e in ... }` |
| 最终执行 | `.finally(() => {})` | `.whenComplete(...)` | `defer { ... }` |
| 链式风格 | 方法链（类 JS） | 方法链 | 结构化（await） |

## 4. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| API 完整性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| 可读性 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

## 5. 核心结论

ArkTS Promise API 沿用了 JavaScript 风格的 then/catch/finally 链式模式，与 Java CompletableFuture 功能等价。Swift 则通过 async/await 结构化并发消除了显式 Promise 链的需求，更为现代化。

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | then/catch/finally 链 | `p.then(v => f(v)).catch(e => g(e)).finally(() => h())` | `cf.thenApply(v -> f(v)).exceptionally(e -> g(e)).whenComplete((v, e) -> h())` | `do { let v = try await p; f(v) } catch { g(error) }` |

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
