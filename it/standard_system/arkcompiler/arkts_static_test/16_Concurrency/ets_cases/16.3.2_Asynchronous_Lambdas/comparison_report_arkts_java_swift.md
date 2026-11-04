# 16.3.2 Asynchronous Lambdas - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

ArkTS async lambda 继承了 TypeScript 语法，提供简洁的异步闭包表达式。Java 通过 lambda 返回 CompletableFuture 模拟，Swift 通过 async closure 实现。

## 2. 章节对应关系

| ArkTS (§16.3.2) | Java (JLS) | Swift (Concurrency) |
|------|------|-------|
| async lambda 变量赋值 | lambda 返回 CF 赋值 | `{ () async -> T in }` |
| async lambda 参数传递 | 参数类型 CF<T> 的函数式接口 | `(T) async -> U` 参数 |
| async lambda 无悬挂点 | 无特殊语法 | 允许无 async 操作的 async closure |
| await 在非 async lambda → 错误 | 编译器无此限制 | 非 async closure 中 await 错误 |

## 3. 关键差异

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语法 | `async () => { }` | `() -> CF<T>` | `{ () async -> T in }` |
| 必选关键字 | 主体前 `async` | 无 | 主体前 `async` |
| 非 async 中 await | ❌ 编译错误 | N/A（无 await 关键字） | ❌ 编译错误 |
| 类型封装 | 自动 Promise<T> | 显式 CF<T> | 隐式 T |

## 4. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 语法简洁性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 类型安全 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 一致性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

## 5. 核心结论

ArkTS async lambda 语法与常规 lambda 仅差 `async` 关键字，学习成本低。与 Swift 的 async closure 语义最为接近。Java 缺少语言级 async lambda 支持，需手动返回 CompletableFuture。

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | 异步 lambda 表达式 | `let f = async () => { return 42; }` | `Supplier<CompletableFuture<Integer>> f = () -> CompletableFuture.completedFuture(42);` | `let f = { () async -> Int in return 42 }` |

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
