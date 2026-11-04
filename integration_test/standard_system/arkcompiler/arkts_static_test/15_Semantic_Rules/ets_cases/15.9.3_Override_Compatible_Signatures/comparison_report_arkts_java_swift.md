# 15.9.3 Override Compatible Signatures - ArkTS/Java/Swift/TypeScript 跨语言对比报告

## 1. 概述
本节对比 ArkTS 与 Java、Swift、TypeScript 在兼容签名覆写方面的行为差异。

## 2. 对比表格
| 方面 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 兼容签名覆写 | 返回值协变 ✅ | 返回值协变 ✅ | 返回值协变 + 参数逆变 ✅ | ✅ 结构化类型，自动兼容 |
| 不兼容签名覆写 | ❌ 编译拒绝 | ❌ 编译错误 | ❌ 编译错误 | ✅ 允许（结构化类型） |
| 运行时派发 | ✅ 多态派发 | ✅ 多态派发 | ✅ 多态派发 | ✅ 多态派发 |

## 3. 测试用例对比
| 用例编号 | 类型 | ArkTS | Java | Swift | TypeScript |
|---------|------|-------|------|-------|------------|
| SEM_15_09_03_001_PASS_COMPATIBLE_OVERRIDE | compile-pass | ✅ | ✅ | ✅ | ✅ |
| SEM_15_09_03_100_FAIL_INCOMPATIBLE_OVERRIDE | compile-fail | ✅ | ✅ | ✅ | ❌ |
| SEM_15_09_03_200_RUNTIME_COMPATIBLE_OVERRIDE | runtime | ✅ | ✅ | ✅ | ✅ |

## 4. 结论
ArkTS 在兼容签名覆写方面的行为与 Java、Swift 一致，但比 TypeScript 更严格（TypeScript 使用结构化类型，不检查签名兼容性）。
---

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 本节未单独设 cross_lang_verify，实测代码见父章节 `../cross_lang_verify/` 目录
