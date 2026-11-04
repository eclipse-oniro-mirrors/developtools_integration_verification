# 5.1.3 Type Parameter Variance - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Type Parameter Variance defines subtyping relationships for generic types, controlling how type arguments can vary.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 变体模型 | 声明点 out/in | 使用点 ? extends/? super | 默认不变 |
| 协变语法 | `out T` | `? extends T` | N/A |
| 逆变语法 | `in T` | `? super T` | N/A |
| 不变支持 | 默认不变 | 默认不变 | 默认不变 |

## 核心结论

ArkTS behavior in this section is consistent with Java/Swift norms.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

**验证用例：** GEN_05_01_03_001~010 (PASS), GEN_05_01_03_100~106 (FAIL), GEN_05_01_03_200 (RUNTIME)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
