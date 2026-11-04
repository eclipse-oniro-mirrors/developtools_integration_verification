# 10.6 Interface Inheritance - 跨语言对比报告 ArkTS / Java / Swift

## 概览

Interface Inheritance（接口继承）涵盖通过继承链访问成员、菱形继承和类同时继承+实现。三语言行为一致。

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 接口继承链方法访问 | ✅ | ✅ | ✅ |
| 菱形继承 | ✅ 无歧义 | ✅ 无歧义 | ✅ 无歧义 |
| 继承属性访问限制 | ✅ getter-only/setter-only | ❌ 无接口属性 | ✅ |
| 类 extends + implements | ✅ | ✅ | ✅（继承 + protocol）|

## 核心结论

三语言的接口继承行为高度一致。ArkTS 额外检查继承属性的访问权限（getter-only/setter-only），Java 无此必要（无接口属性）。

## 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 继承链方法访问 | ✅ | ✅ | ✅ |
| 菱形继承 | ✅ 无歧义 | ✅ 无歧义 | ✅ 无歧义 |
| 类继承+接口实现 | `class C extends B implements I` | `class C extends B implements I` | `class C: B, P` |

## 用例 1:1 对照（关键用例的三语言代码对比）

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | 菱形继承 | `interface A { foo(): void }` → `B extends A`, `C extends A`, `D extends B, C` ✅ 无歧义 | `interface A { void foo(); }` → 同 ArkTS ✅ 无歧义 | `protocol A { func foo() }` → 同 ✅ 无歧义 |

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
| 继承链支持 | ★★★★★ | ★★★★★ | ★★★★★ |
| 菱形继承处理 | ★★★★★ | ★★★★★ | ★★★★★ |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
