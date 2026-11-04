# 4.6.1 Variable Declarations - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Variable Declarations define mutable storage using `let`. This section covers declaration syntax, type annotation requirements, and initialization rules for variables.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 声明关键字 | `let` | `Type name` | `var` |
| 类型注解 | `let x: T = value` | `T x = value` | `var x: T = value` |
| 类型推断 | ✅ `let x = 1` | ❌（Java 10+ `var` 部分支持） | ✅ `var x = 1` |
| 初始化要求 | 必须初始化 | 可声明后赋值 | 必须初始化 |

## 核心结论

ArkTS behavior in this section is largely consistent with Java/Swift norms for variable declarations, with ArkTS requiring definite initialization similar to Swift.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
