# 10.4 Interface Properties - 跨语言对比报告 ArkTS / Java / Swift

## 概览

Interface Properties（接口属性）定义 required/optional、readonly/readwrite、getter/setter 属性。ArkTS 的接口属性系统最为丰富。

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 接口属性 | ✅ | ❌（仅方法） | ✅ protocol 属性 |
| required readonly | ✅ | ❌ | ✅ `{ get }` |
| required readwrite | ✅ | ❌ | ✅ `{ get set }` |
| getter-only | ✅ | ❌ | ✅ |
| setter-only | ✅ | ❌ | ✅ |
| 可选属性 `?` | ✅ | ❌ | ✅ Optional 属性 |

## 核心结论

Java 接口不支持属性声明（只能用 getter/setter 方法模拟）。ArkTS 和 Swift 均原生支持接口属性。

## ArkTS 设计建议

接口属性系统是 ArkTS 相对 Java 的重要优势，保持当前设计。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 必需属性 | `readonly` / 读写属性 | ❌ 仅方法模拟 | `{ get }` / `{ get set }` |
| 可选属性 | `?: type` | ❌ 不支持 | `Optional<T>` 或 `@objc optional` |
| getter-only | `get` 属性 | ❌ | `{ get }` |
| setter-only | `set` 属性 | ❌ | `{ get set }` 无set-only |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | 必需只读属性 | `interface I { readonly name: string }` | 无接口属性，用 `String getName()` | `protocol P { var name: String { get } }` |
| 2 | 可选属性 | `interface I { age?: number }` | ❌ 不支持 | `protocol P { var age: Int? { get set } }` |

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
| 属性支持 | ★★★★★ | ★★☆☆☆ | ★★★★★ |
| 语法简洁性 | ★★★★★ | ★★☆☆☆ | ★★★★☆ |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
