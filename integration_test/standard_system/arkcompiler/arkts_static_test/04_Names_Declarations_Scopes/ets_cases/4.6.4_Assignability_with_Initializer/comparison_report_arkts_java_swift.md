# 4.6.4 Assignability with Initializer - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Assignability with Initializer defines type compatibility rules between the initializer expression and the declared type. This section covers implicit widening, literal assignability, and type mismatch handling.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 隐式 widening | ✅ 数字类型自动转换 | ✅ 原始类型自动 widening | ❌ 需显式转换 |
| 字面量赋值 | ✅ 类型匹配即可 | ✅ 字面量可隐式转换 | ✅ 字面量可推断为确切类型 |
| 类型不匹配 | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| 子类型赋值 | ✅ 兼容 | ✅ 多态赋值 | ✅ 子类型赋值 |

## 核心结论

ArkTS behavior in this section is largely consistent with Java/Swift norms for assignability. ArkTS resembles Java in allowing implicit numeric widening.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
