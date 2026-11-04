# 16.3.1 Asynchronous Functions - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

ArkTS async 函数语法与 TypeScript 一致，声明方式与 Swift 相似，返回 Promise<T> 语义与 Java CompletableFuture 对应。

## 2. 章节对应关系

| ArkTS (§16.3.1) | Java (JLS) | Swift (Concurrency) |
|------|------|-------|
| async 函数声明返回 Promise<T> | 无直接对应（方法返回 CompletableFuture<T>） | async func 返回 T（隐式） |
| async 入口函数 (main) | main() 同步入口 | @main async 入口 |
| async 修饰符非类型一部分 | 无对应 | async 是函数类型一部分 |
| 返回类型推断 Promise<T> | CompletableFuture 泛型推断 | async 函数隐式返回类型 |

## 3. 关键差异

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 声明语法 | `async function` | 无关键字，返回 CF<T> | `async func` |
| 返回值包装 | 自动包装为 Promise<T> | 手动创建 CF | 自动包装 |
| 入口函数 | `async function main()` | `static void main()` | `@main struct` + `async` |
| 修饰符位置 | 函数签名中 | N/A | 函数签名中 |

## 4. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 声明简洁性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 类型安全 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 入口支持 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

## 5. 核心结论

ArkTS async 函数声明语法与 TypeScript/ECMAScript 完全一致，学习成本低。返回类型自动包装为 Promise<T> 与 Swift 的隐式 async 返回类似，但比 Java 手动创建 CompletableFuture 更简洁。async 修饰符不是函数类型一部分这一设计简化了类型系统。

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | async 函数声明 | `async function foo(): Promise<int> { return 42; }` | `CompletableFuture<Integer> foo() { return CompletableFuture.completedFuture(42); }` | `func foo() async -> Int { return 42 }` |

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
