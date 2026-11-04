# 6.1 Assignment-like Contexts — Design Issues Report

## Issue #1: float 字面量类型歧义

| Field | Detail |
|-------|--------|
| **描述** | ArkTS 中十进制字面量 `3.14` 默认为 `double` 类型，无法直接赋值给 `float` 变量 |
| **复现用例** | `let f: float = 3.14` → `ESE0318: Type 'Double' cannot be assigned to type 'Float'` |
| **实测错误** | 编译期 `Semantic error ESE0318` |
| **跨语言对比** | Java: `float f = 3.14f;` (有 `f` 后缀) — OK<br>Swift: `let f: Float = 3.14` — OK (字面量推断)<br>ArkTS: 无 `float` 字面量后缀，必须经由 `int→float` 间接赋值 |
| **严重性** | MEDIUM |
| **改进建议** | 支持 `3.14f` 语法或允许 `float` 从 `double` 字面量隐式转换 |

## Issue #2: Union Widening 严格性过高

| Field | Detail |
|-------|--------|
| **描述** | `byte→short|int` 有两个更大成员(short, int)即被拒绝，即使只有一个"最近"的合适目标 |
| **复现用例** | `let u: short|int = b` (where `b: byte`) → `ESE0255: Ambiguous union type operation` |
| **实测错误** | 编译期 `Semantic error ESE0255` |
| **跨语言对比** | Java: N/A (no union types)<br>Swift: `let u: Int16 | Int32 = Int8(1)` — 需要显式转换确定目标<br>ArkTS: 即便 `short` 是"最近"的 narrowing target，也因存在两个选项而拒绝 |
| **严重性** | LOW |
| **改进建议** | 考虑选择"最近"更大类型而非要求唯一更大类型 |

## Issue #3: `as` Cast 已废弃于数值类型

| Field | Detail |
|-------|--------|
| **描述** | 数值类型间的 `as` 表达式被标记为 deprecated，必须使用 `.toInt()` / `.toLong()` 等标准库方法 |
| **复现用例** | `b as int` → `ESE123811: 'As' expression for cast is deprecated for numeric types` |
| **实测错误** | 编译期 `Semantic error ESE123811` |
| **跨语言对比** | Java: `(int) b` — OK (traditional cast)<br>Swift: `Int(b)` — OK (type constructor)<br>ArkTS: 强制要求 `.toXxx()` 方法 |
| **严重性** | MEDIUM |
| **改进建议** | 文档中明确标注弃用时间线和迁移路径，或保留 `as` 作为显式转换语法糖 |
