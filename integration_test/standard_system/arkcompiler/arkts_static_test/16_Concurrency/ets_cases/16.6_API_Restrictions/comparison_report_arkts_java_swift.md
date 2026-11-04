# 16.6 API Details and Restrictions - 跨语言对比报告

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Promise then/catch | Job-based | Thread-based | Continuation-based |
| 未处理拒绝 | Worker-thread scoped | UnhandledRejectionHandler | 全局处理 |
| 错误传播 | 向上传播 | 向上传播 | 向上传播 |

## 核心结论

三语言在 Promise 回调和错误处理上的行为总体一致。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Promise then/catch | then / catch | thenApply / exceptionally | await / do-catch |
| 未处理拒绝 | Worker-thread scoped 事件 | UnhandledRejectionHandler | 全局 Task 错误传播 |
| 错误传播方式 | 向上传播 | 向上传播 | 向上传播 |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | Promise 链式回调 | `promise.then(v => f(v)).catch(e => g(e))` | `cf.thenApply(v -> f(v)).exceptionally(e -> g(e))` | `do { let v = try await promise; f(v) } catch { g(error) }` |

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
| API 完整性 | ★★★★ | ★★★★★ | ★★★ |
| 错误安全性 | ★★★ | ★★★★ | ★★★★★ |
| 编译期检查 | ★★ | ★★★ | ★★★★★ |

## ArkTS 设计建议

ArkTS 的 Promise API 与 JavaScript 标准一致，但未处理拒绝缺少编译期检查。建议增加编译期警告或 lint 规则，提示未添加 catch 的 Promise 链。同时可考虑引入结构化并发 API（类似 Swift TaskGroup）作为 Promise 链的替代方案，在编译期强制保证错误处理。

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
