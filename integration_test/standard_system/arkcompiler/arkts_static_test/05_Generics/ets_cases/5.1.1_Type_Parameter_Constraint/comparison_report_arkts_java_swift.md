# 5.1.1 Type Parameter Constraint - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Type Parameter Constraint defines upper bounds for type parameters, restricting the types that can be used as arguments.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 约束语法 | `T extends SomeType` | `T extends SomeType` | `T: SomeType` |
| 多约束支持 | `T extends A & B` | `T extends A & B` | `T: A & B` or `where` clause |
| 约束位置 | 声明点 | 声明点 | 声明点 / where 子句 |

## 核心结论

ArkTS behavior in this section is consistent with Java/Swift norms.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

**验证用例：** GEN_05_01_01_001~006 (PASS), GEN_05_01_01_100~104 (FAIL), GEN_05_01_01_200 (RUNTIME)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
