# 4.7.4 Optional Parameters - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Optional Parameters defines the `?` suffix for optional parameters that may be omitted at call sites. This section covers optional syntax, default value fallback, and nullability.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 可选标记 | ✅ `name?: Type` | ❌（通过重载模拟） | ✅ `name: Type?` |
| 默认值支持 | ✅ `name: Type = value` | ❌（需重载） | ✅ `name: Type = value` |
| 调用时省略 | ✅ 省略即为 `undefined` | ❌ | ✅ 省略即为 `nil` 或默认值 |
| 类型安全 | ✅ 类型变为 `T | undefined` | N/A | ✅ 类型变为 `T?` |

## 核心结论

ArkTS behavior in this section is largely consistent with Swift norms for optional/default parameters. Java lacks native optional parameter support.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
