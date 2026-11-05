# 4.1 Names - 跨语言对比报告 ArkTS / Java / Swift

## 概览

Names（名称）定义了标识符和限定名的语法规则，是语言的基本组成单元。三语言均支持简单名和限定名，但对标识符字符集的约束有所不同。

## 章节对应关系

| ArkTS (§4.1) | Java (JLS §3.8) | Swift (Lexical Structure) |
|------|------|-------|
| 简单名 (Simple Name) | Identifiers | Identifiers |
| 限定名 (Qualified Name) | Qualified Names | Compound Names |
| 标识符规则 | §3.8 Identifiers | Identifiers |

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 限定名分隔符 | `.` | `.` | `.` |
| 标识符起始字符 | letter / `_` / `$` | letter / `_` / `$` | letter / `_` |
| 关键字做标识符 | ❌ | ❌ | ✅ (backtick) |
| Unicode 标识符 | 有限支持 | ✅ | ✅ |
| 空标识符 | ❌ | ❌ | ❌ |
| `$` 开头 | ✅ | ✅ (约定用于生成代码) | ❌ |

## 用例 1:1 对照

### 简单名声明
| ArkTS | Java | Swift |
|-------|------|-------|
| `let x: number = 1;` | `int x = 1;` | `var x: Int = 1` |

### 关键字作为标识符
| ArkTS | Java | Swift |
|-------|------|-------|
| `let class: number = 1;` ❌ | `int class = 1;` ❌ | `let \`class\`: Int = 1` ✅ |

## 用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 008 | 接口类型变量限定名访问实例成员 | ✅ compile-pass | ✅ javac + java | ✅ swiftc + executable |

## 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 标识符表达力 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 限定名灵活性 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| Unicode 支持 | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 关键字转义 | ⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |

## 核心结论

三语言名称规则高度一致。ArkTS 不支持 backtick 转义关键字做标识符，与 Java 相同。Swift 在标识符灵活性上更宽松。

## ArkTS 设计建议

无需变更。当前规则与 Java 一致，足够覆盖常见场景。
