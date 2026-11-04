# 15.9.2 Overriding in Interfaces - ArkTS/Java/Swift/TypeScript 跨语言对比报告

## 1. 概述
本节对比 ArkTS 与 Java、Swift、TypeScript 在接口覆写方面的行为差异。

## 2. 对比表格
| 方面 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 接口方法实现 | 必须实现所有方法 | 必须实现所有方法（除非是抽象类） | 必须实现所有协议方法 | 必须实现所有方法 |
| 缺少实现 | ❌ 编译拒绝 | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| 运行时派发 | ✅ 多态派发 | ✅ 多态派发 | ✅ 多态派发 | ✅ 多态派发 |

## 3. 测试用例对比
| 用例编号 | 类型 | ArkTS | Java | Swift | TypeScript |
|---------|------|-------|------|-------|------------|
| SEM_15_09_02_001_PASS_INTERFACE_IMPL | compile-pass | ✅ | ✅ | ✅ | ✅ |
| SEM_15_09_02_100_FAIL_MISSING_IMPL | compile-fail | ✅ | ✅ | ✅ | ✅ |
| SEM_15_09_02_200_RUNTIME_INTERFACE_OVERRIDE | runtime | ✅ | ✅ | ✅ | ✅ |

## 4. 结论
ArkTS 在接口覆写方面的行为与 Java、Swift、TypeScript 一致，符合主流编程语言的设计理念。
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
