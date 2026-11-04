# 4.6.3 Validity of Initializer - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Validity of Initializer defines which expressions are valid as initializers in variable/constant declarations. This section covers expression restrictions, type checking, and null/undefined validity.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 初始化表达式限制 | ✅ 任意表达式（类型需匹配） | ✅ 任意表达式（类型需匹配） | ✅ 任意表达式（类型需匹配） |
| null/undefined 合法性 | `undefined` 任意类型 | `null` 引用类型 | `nil` Optional 类型 |
| 字面量初始化 | ✅ | ✅ | ✅ |
| 复杂表达式初始化 | ✅ | ✅ | ✅ |

## 核心结论

ArkTS behavior in this section is largely consistent with Java/Swift norms for initializer validity. All three languages accept arbitrary expressions as initializers subject to type checking.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
