# 10.5 Interface Method Declarations - 跨语言对比报告 ArkTS / Java / Swift

## 概览

Interface Method Declarations（接口方法声明）定义接口中的抽象方法声明。三语言语义高度一致。

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 抽象方法声明 | ✅ 隐式 abstract | ✅ 隐式 abstract | ✅ protocol 要求 |
| 方法参数 | ✅ | ✅ | ✅ |
| 返回类型 | ✅ | ✅ | ✅ |
| void 方法 | ✅ | ✅ | ✅ |
| 缺失实现检测 | ✅ 编译错误 | ✅ 编译错误 | ✅ 编译错误 |
| 多接口实现 | ✅ | ✅ | ✅ |

## 核心结论

三语言的接口方法声明方式基本一致。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 抽象方法 | `foo(): void` | `void foo();` | `func foo()` |
| 参数类型 | 类型注解 | 显式类型 | 类型注解 |
| 返回类型 | `: type` / `: void` | `type` / `void` | `-> Type` / 省略Void |
| 默认方法 | ✅ 可定义实现 | ✅ `default` 方法 | ✅ protocol extension |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | 抽象方法声明 | `interface I { foo(x: number): string }` | `interface I { String foo(int x); }` | `protocol P { func foo(x: Int) -> String }` |

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
| 方法声明语法 | ★★★★★ | ★★★★☆ | ★★★★★ |
| 默认方法支持 | ★★★★★ | ★★★★★ | ★★★★★ |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
