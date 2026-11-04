# 4.7.6 Shadowing by Parameter - Cross-Language Comparison (ArkTS / Java / Swift)

## 概览

Shadowing by Parameter defines when function parameters shadow outer scope declarations. This section covers shadowing rules, warnings, and access to shadowed declarations.

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 参数遮蔽外层变量 | ✅ 允许 | ✅ 允许 | ✅ 允许 |
| 编译器警告 | ❌ 默认无警告 | ❌ 默认无警告 | ❌ 默认无警告 |
| 被遮蔽变量访问 | ❌ 无法访问 | ❌ 无法访问 | ❌ 无法访问 |
| 同名遮蔽优先级 | 参数 > 局部变量 > 成员 | 参数 > 局部变量 > 成员 | 参数 > 局部变量 > 成员 |

## 核心结论

ArkTS behavior in this section is largely consistent with Java/Swift norms for parameter shadowing. All three languages allow parameter shadowing without mandatory warnings.

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录
