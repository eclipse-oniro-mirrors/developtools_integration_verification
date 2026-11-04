# 10.4.2 Optional Interface Properties - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Optional Interface Properties（可选接口属性）定义可选的接口属性。ArkTS用`?`标记可选属性，Swift用`Optional`类型，Java不支持。

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 可选属性标记 | `?` | ❌ 不支持 | `Optional<T>` |
| 实现可选性 | 属性可选 | N/A | protocol可选属性 |

## 核心结论

ArkTS的`?`可选属性语法简洁。Swift使用Optional类型。Java接口不支持可选属性。

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
