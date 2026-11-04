# 10.2 Superinterfaces and Subinterfaces - 跨语言对比报告 ArkTS / Java / Swift

## 概览

Superinterfaces/Subinterfaces 定义接口继承关系。三语言支持单继承和多继承，限制类似。

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 接口继承 | `extends` | `extends` | `:` |
| 多继承 | ✅ | ✅ | ✅ |
| 循环继承检测 | ✅ 编译错误 | ✅ 编译错误 | ✅ 编译错误 |
| 自继承检测 | ✅ 编译错误 | ✅ 编译错误 | ✅ 编译错误 |

## 核心结论

三语言行为一致。ArkTS 遵循 Java 风格的 `extends` 关键字。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 单继承 | `interface A extends B` | `interface A extends B` | `protocol A: B` |
| 多继承 | `interface A extends B, C` | `interface A extends B, C` | `protocol A: B, C` |
| 循环继承检测 | 编译错误 | 编译错误 | 编译错误 |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | 多接口继承 | `interface C extends A, B {}` | `interface C extends A, B {}` | `protocol C: A, B {}` |

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

## 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 继承语法 | ★★★★★ | ★★★★★ | ★★★★☆ |
| 循环检测 | ★★★★★ | ★★★★★ | ★★★★★ |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
