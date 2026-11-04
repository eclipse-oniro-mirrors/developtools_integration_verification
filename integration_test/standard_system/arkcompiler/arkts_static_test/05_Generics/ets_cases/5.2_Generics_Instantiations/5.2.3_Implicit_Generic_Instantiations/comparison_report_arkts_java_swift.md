# 5.2.3 Implicit Generic Instantiations - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Implicit Generic Instantiations refer to type inference where the compiler deduces type arguments from the context without explicit annotation.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 参数类型推断 | ✅ 从实参推断 | ✅ 从实参推断 | ✅ 从实参推断 |
| 返回类型推断 | ✅ 有限支持 | ✅ 有限支持 | ✅ 支持较好 |
| 链式调用推断 | ✅ | ✅ | ✅ |
| 泛型 lambda 推断 | ✅ | ❌ (类型擦除) | ✅ |

## 核心结论

ArkTS behavior in this section is consistent with Java/Swift norms.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

**验证用例：** GEN_05_02_03_001~003 (PASS), GEN_05_02_03_100~102 (FAIL), GEN_05_02_03_200 (RUNTIME)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
