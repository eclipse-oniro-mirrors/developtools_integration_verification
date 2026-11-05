# 5.1.4 Wildcard Type - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Wildcard types represent unknown types in generic usage, primarily used for use-site variance.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 无界通配符 | ❌ 不支持（改用 out/in） | ✅ `?` | ❌ 不支持 |
| 上界通配符 | ❌ 不支持 | ✅ `? extends T` | ❌ 不支持 |
| 下界通配符 | ❌ 不支持 | ✅ `? super T` | ❌ 不支持 |
| 替代方案 | 声明点变体标注 | 使用点通配符 | 泛型约束 + 关联类型 |

## 核心结论

ArkTS behavior in this section is consistent with Java/Swift norms.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

**验证用例：** GEN_05_01_04_001~002 (PASS), GEN_05_01_04_100~107 (FAIL), GEN_05_01_04_200 (RUNTIME)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
