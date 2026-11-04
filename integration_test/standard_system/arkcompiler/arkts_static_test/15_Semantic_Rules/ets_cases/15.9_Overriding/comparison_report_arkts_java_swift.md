# 15.9 Overriding - ArkTS/Java/Swift/TypeScript 跨语言对比报告

## 1. 概述
本节对比 ArkTS 与 Java、Swift、TypeScript 在覆写方面的行为差异。覆写涵盖：类方法 override、接口实现、兼容签名检查。

## 2. 对比表格
| 方面 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 类方法覆写 | override 关键字 ✅ | @Override 注解（可选） | override 关键字 ✅ | 不需要 |
| 接口实现 | 必须实现所有方法 | 必须实现所有方法（除非是抽象类） | 必须实现所有协议方法 | 必须实现所有方法 |
| 兼容签名检查 | 签名需兼容 ✅ | 签名需兼容 ✅ | 签名需兼容 ✅ | 结构化类型，自动兼容 |
| 运行时派发 | ✅ 多态派发 | ✅ 多态派发 | ✅ 多态派发 | ✅ 多态派发 |

## 3. 子章节测试用例统计
| 子章节 | 重点 | 测试用例数 |
|---------|-------|----------|
| 15.9.1 | Overriding in Classes | 3 |
| 15.9.2 | Overriding in Interfaces | 3 |
| 15.9.3 | Override Compatible Signatures | 3 |

## 4. 主目录测试用例对比
| 用例编号 | 类型 | ArkTS | Java | Swift | TypeScript |
|---------|------|-------|------|-------|------------|
| SEM_15_09_099 | compile-fail | ✅ | ✅ | ✅ | ❌ |
| SEM_15_09_100 | compile-pass | ✅ | ✅ | ✅ | ✅ |
| SEM_15_09_101 | runtime | ✅ | ✅ | ✅ | ✅ |

## 5. 结论
ArkTS 在覆写方面的行为与 Java、Swift 一致，但比 TypeScript 更严格（TypeScript 使用结构化类型，不需要显式声明 override 或检查签名兼容性）。
---

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
