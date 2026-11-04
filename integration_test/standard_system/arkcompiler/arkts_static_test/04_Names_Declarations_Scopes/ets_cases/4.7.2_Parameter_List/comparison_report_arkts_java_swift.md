# 4.7.2 Parameter List - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Parameter List defines the syntax and semantics of function parameter declarations. This section covers required parameters, optional parameters, and default value syntax.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 参数声明语法 | `name: Type` | `Type name` | `name: Type` |
| 必需参数 | ✅ | ✅ | ✅ |
| 可选参数 | ✅ `name?: Type` | ❌（通过重载模拟） | ✅ `name: Type?` |
| 默认值 | ✅ `name: Type = value` | ❌（通过重载模拟） | ✅ `name: Type = value` |

## 核心结论

ArkTS behavior in this section is largely consistent with Swift norms for parameter lists. Java lacks native optional/default parameter support, relying on method overloading instead.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
