# 6.4.1 Widening Numeric Conversions — Design Issues Report

## Issue #1: `float` 无法从 `double` 字面量直接赋值

| Field | Detail |
|-------|--------|
| **描述** | `let f: float = 3.14` 编译失败 — `3.14` 是 double 字面量，不能隐式 narrowing 为 float |
| **复现用例** | CON_06_04_01_005, 006, 007, 020 |
| **实测错误** | `ESE0318: Type 'Double' cannot be assigned to type 'Float'` |
| **跨语言对比** | Java: `float f = 3.14f` (有 `f` 后缀) — OK<br>Swift: `let f: Float = 3.14` — OK (字面量推断支持 Float)<br>ArkTS: 需 `let i: int = 3; let f: float = i` 间接赋值 |
| **严重性** | MEDIUM |
| **改进建议** | 支持 `3.14f` 语法或允许 double 字面量隐式 narrowing 为 float（与 int→float 规则一致） |

## Issue #2: 数值类型 `as` cast 已废弃

| Field | Detail |
|-------|--------|
| **描述** | `b as int` 等数值类型间 cast 表达式被编译器标记为 deprecated，必须使用 `.toInt()` / `.toLong()` 等标准库方法 |
| **复现用例** | CON_06_04_01_022, 023 |
| **实测错误** | `ESE123811: 'As' expression for cast is deprecated for numeric types. Use explicit conversion function Byte.toInt(...) instead.` |
| **跨语言对比** | Java: `(int) b` — 传统 cast 语法，正常使用<br>Swift: `Int(b)` — 类型构造器，正常使用<br>ArkTS: 强制 `.toXxx()` 方法，`as` 被废弃 |
| **严重性** | MEDIUM |
| **改进建议** | 若 `as` 语义与 `.toXxx()` 一致，不应废弃；若不一致，在文档中明确区分两者语义差异 |

## Issue #3: `float` 类型缺乏字面量后缀语法

| Field | Detail |
|-------|--------|
| **描述** | ArkTS 无 `float` 字面量后缀（如 Java 的 `3.14f`），导致 float 变量无法从字面量直接初始化，必须经由 int→float 间接赋值 |
| **复现用例** | 所有涉及 `float` 变量声明的用例 |
| **跨语言对比** | Java: `float f = 3.14f` ✓<br>Swift: `let f: Float = 3.14` ✓（类型推断）<br>ArkTS: 无后缀，需变通 |
| **严重性** | LOW |
| **改进建议** | 添加 `f` / `F` 后缀用于 float 字面量 |
