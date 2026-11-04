# 4.6.5 Type Inference from Initializer - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Type Inference from Initializer defines how the compiler infers the type of a variable from its initializer expression. This section covers inference from literals, expressions, and context-sensitive inference.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 字面量推断 | ✅ `let x = 1` → `int` | ❌ 需显式 `var`（Java 10+） | ✅ `var x = 1` → `Int` |
| 表达式推断 | ✅ 从函数返回值推断 | ❌ | ✅ |
| 上下文敏感推断 | ❌ 有限 | ❌ | ✅ 强类型上下文推断 |
| null/undefined 推断 | ✅ 推断为 `undefined` 类型 | N/A | ❌ nil 需 Optional |

## 核心结论

ArkTS behavior in this section is largely consistent with Java/Swift norms for type inference, with ArkTS supporting basic inference from initializers.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
