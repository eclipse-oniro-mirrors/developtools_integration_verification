# 16.3.4 await Expression - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

ArkTS await 表达式语义与 TypeScript 一致，与 Swift await 高度相似。Java 无语言级 await 关键字，依赖 CompletableFuture 的阻塞调用或编排组合子。

## 2. 章节对应关系

| ArkTS (§16.3.4) | Java (JLS) | Swift (Concurrency) |
|------|------|-------|
| await Promise | CF.join() / CF.get() 阻塞 | await value |
| await 非 Promise（不挂起） | 无对应 | await 非 async 值（不挂起） |
| await 可选链 | N/A | await optional?.method() |
| await 变量 | CF<T> 变量 + .get() | await variable |
| 连续 await | 链式 .then() / 顺序 .get() | 顺序 await |
| await 联合类型 | 无直接对应 | 无直接对应 |
| await 在非 async 中错误 | N/A（不存在 await） | await 在非 async 中错误 |

## 3. 关键差异

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 关键字 | `await` | 无（`.join()` / `.get()`） | `await` |
| 非 Promise 值 | ✅ 不挂起直接返回 | N/A | ✅ 不挂起直接返回 |
| 非 async 上下文 | ❌ 编译错误 | N/A | ❌ 编译错误 |
| 可选链支持 | ✅ `await obj?.method()` | N/A | ✅ `await obj?.method()` |
| 错误传播 | await reject → throw | .get() 抛 ExecutionException | await 抛对应错误 |

## 4. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| await 语法 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 非 Promise 处理 | ⭐⭐⭐⭐ | N/A | ⭐⭐⭐⭐ |
| 错误传播 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

## 5. 核心结论

ArkTS await 与 Swift await 在语法和语义上几乎一致。Java 缺少 await 关键字，需通过 CF.get() 阻塞调用或 .then() 编排，代码可读性不如 ArkTS/Swift。

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | await 表达式等待 Promise | `let v = await promise;` | `Integer v = cf.join();` // 阻塞 | `let v = try await promise` |

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
