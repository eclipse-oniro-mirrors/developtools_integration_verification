# 4.6 Variable and Constant Declarations - 跨语言对比报告 ArkTS / Java / Swift

## 概览

变量和常量声明是语言的基础。ArkTS 使用 `let`/`const`（继承自 TS），Java 使用 `type name`/`final`，Swift 使用 `var`/`let`。三语言在类型推断能力上差异显著。

## 章节对应关系

| ArkTS (§4.6) | Java (JLS §4.12, §14.4) | Swift (Declarations) |
|------|------|-------|
| 变量声明 | Local Variable Declaration | var Declaration |
| 常量声明 | final Variable | let Declaration |
| 类型推断 | Local Variable Type Inference | Type Inference |
| 字面量类型 | ❌ (const 保留) | Literal Types |

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 变量声明 | `let` | `type name` | `var` |
| 常量声明 | `const` | `final` | `let` |
| 类型推断 | ✅ (从初始化) | ❌ (Java 10+ 局部推断有限) | ✅ |
| 字面量类型保留 | `const` 保留 | N/A | ✅ |
| null/undefined 推断 | ✅ (null/undefined) | N/A | Optional |
| 多声明 | ✅ `let x=1, y=2` | ✅ `int x=1, y=2` | ❌ 一行一声明 |

## 用例 1:1 对照

### 变量声明
| ArkTS | Java | Swift |
|-------|------|-------|
| `let x: number = 1;` | `int x = 1;` | `var x: Int = 1` |
| `let y = 1;` (推断) | `var y = 1;` (Java 10+) | `var y = 1` (推断) |

### 常量声明
| ArkTS | Java | Swift |
|-------|------|-------|
| `const x: number = 1;` | `final int x = 1;` | `let x: Int = 1` |

## 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 类型推断 | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 常量安全 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 声明简洁性 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 字面量类型 | ⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ |

## 核心结论

ArkTS 在类型推断上优于 Java（更系统），但不及 Swift（Swift 有更丰富的类型推断和字面量类型系统）。ArkTS 的 `const` 字面量类型保留特性（`const x = 1` → 类型为字面量 `1`）是区别于 Java 和 Swift 的特性。

## ArkTS 设计建议

保持当前设计。`let`/`const` 与 TypeScript 一致，降低 JS/TS 开发者迁移成本。字面量类型保留是独特优势，建议在文档中强调。

---

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
