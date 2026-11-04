# 6.3.2 char Conversions for Relational/Equality — Design Issues Report

## Issue #1: char 字面量语法 `c'X'` 无 Java/Swift 等价

| Field | Detail |
|-------|--------|
| **描述** | ArkTS 使用 `c'A'` 作为 char 字面量语法，与其余语言不同 |
| **对比** | Java: `'A'` (单引号即 char)<br>Swift: `"A"` (String) 或 `Character("A")`<br>ArkTS: `c'A'` (c 前缀) |
| **严重性** | N/A (设计特性，已记录) |
| **建议** | 这是 ArkTS 区分 char 与 string 字面量的显式语法选择 |

## Issue #2: char 为无符号类型，但未在 spec 中明确说明

| Field | Detail |
|-------|--------|
| **描述** | char 值范围为 0-65535（无符号），与负值比较时行为正确但 spec §6.3.2 未提及无符号特性 |
| **复现用例** | CON_06_03_02_025 (char vs 负值比较) |
| **跨语言对比** | Java: char 明确为 `0 to 65535` (JLS §4.2.1)<br>ArkTS: spec 未明确说明范围<br>Swift: `UnicodeScalar.value` 为 `UInt32`，文档明确 |
| **严重性** | LOW |
| **改进建议** | 在 spec 中补充 char 类型的值域范围和无符号语义说明 |
