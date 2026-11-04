# 4.7.3 Readonly Parameters - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Readonly Parameters defines the `readonly` parameter modifier that prevents parameter reassignment. This section covers immutability guarantees and reassignment prevention.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| readonly 支持 | ✅ `readonly` 关键字 | ❌ 无等价机制 | ✅ 参数默认不可变（`let` 语义） |
| 参数重新赋值阻止 | ✅ 编译错误 | ✅ （`final` 参数可选） | ✅ 默认阻止 |
| 可变参数 | 默认可变 | 默认可变 | 默认不可变 |

## 核心结论

ArkTS behavior in this section is largely consistent with Swift norms for parameter immutability. Java has no direct `readonly` parameter modifier but supports `final` parameters.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
