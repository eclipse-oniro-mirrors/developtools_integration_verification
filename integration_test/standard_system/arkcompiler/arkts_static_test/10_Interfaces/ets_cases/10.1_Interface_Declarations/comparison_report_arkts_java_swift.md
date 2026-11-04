# 10.1 Interface Declarations - 跨语言对比报告 ArkTS / Java / Swift

## 概览

Interface Declarations（接口声明）定义了接口的语法和泛型接口。三语言均支持接口/协议概念。

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 关键字 | `interface` | `interface` | `protocol` |
| 泛型接口 | ✅ | ✅ | ✅ `associatedtype` |
| 实例变量 | ❌ 不允许 | ❌ 不允许 | ✅ 可定义属性 |
| 多继承 | ✅ `extends` | ✅ `extends` | ✅ `:` |

## 核心结论

三语言接口概念高度一致。Swift 用 `protocol` 替代 `interface`，语义类似。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 接口声明 | `interface I {}` | `interface I {}` | `protocol P {}` |
| 泛型接口 | `interface I<T>` | `interface I<T>` | `protocol P { associatedtype T }` |
| 访问修饰符 | 默认public | `public` / 包级 | `public` / `internal` |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | 泛型接口声明 | `interface Container<T> { add(item: T): void }` | `interface Container<T> { void add(T item); }` | `protocol Container { associatedtype T; func add(_ item: T) }` |

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
| 语法简洁性 | ★★★★☆ | ★★★★☆ | ★★★★★ |
| 泛型支持 | ★★★★★ | ★★★★★ | ★★★★☆ |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
