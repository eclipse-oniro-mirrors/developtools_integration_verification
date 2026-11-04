# 5.2.1 Type Arguments - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Type Arguments are the concrete types supplied when instantiating a generic type or calling a generic function.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语法 | `<Type>` | `<Type>` | `<Type>` |
| 原始类型参数 | ✅ 支持 `number` | ❌ 必须装箱 `Integer` | ✅ 支持 `Int` |
| 菱形运算符 | N/A | ✅ `<>` 类型推断 | N/A |
| 多类型参数 | ✅ `<T, U>` | ✅ `<T, U>` | ✅ `<T, U>` |

## 核心结论

ArkTS behavior in this section is consistent with Java/Swift norms.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

**验证用例：** GEN_05_02_01_001~005 (PASS), GEN_05_02_01_100 (FAIL), GEN_05_02_01_200 (RUNTIME)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
