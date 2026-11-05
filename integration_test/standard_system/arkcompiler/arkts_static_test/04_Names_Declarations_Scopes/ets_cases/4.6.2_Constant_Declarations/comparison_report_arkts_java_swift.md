# 4.6.2 Constant Declarations - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Constant Declarations define immutable bindings using `const`. This section covers constant syntax, literal type retention, and compile-time evaluation semantics.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 声明关键字 | `const` | `final` | `let` |
| 字面量类型保留 | ✅ `const x = 1` 类型为 `1` | ❌ | ❌ |
| 编译期常量 | ✅ const 表达式 | ✅ `final static` 常量折叠 | ✅ `let` 编译期优化 |
| 不可变性保证 | ✅ 绑定不可变 | ✅ 引用不可变 | ✅ 值/引用不可变 |

## 核心结论

ArkTS behavior in this section is largely consistent with Java/Swift norms for constant declarations. ArkTS's literal type retention (`const x = 1` as literal type `1`) is a unique advantage.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
