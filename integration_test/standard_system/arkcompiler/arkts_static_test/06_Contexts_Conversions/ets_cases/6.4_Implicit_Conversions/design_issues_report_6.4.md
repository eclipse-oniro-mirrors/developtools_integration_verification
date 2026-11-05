# 6.4 Implicit Conversions — Design Issues Report

## Issue #1: ArkTS 隐式转换范围介于 Java 与 Swift 之间

| Field | Detail |
|-------|--------|
| **描述** | ArkTS 允许比 Swift 多但比 Java 少的隐式转换：enum→numeric/string 是 ArkTS 独有优势，但 union widening 的"恰好一个更大成员"规则比 Java 更严 |
| **严重性** | N/A (设计哲学确认) |
| **建议** | 在语言推广中突出"受控的隐式转换"定位 — 比 Swift 方便，比 Java 安全 |

## Issue #2: 缺少跨语言统一的隐式转换分类框架

| Field | Detail |
|-------|--------|
| **描述** | 三个语言的隐式转换粒度不同：ArkTS 按 spec 章节细分 (6.4.1~6.4.4)，Java 按 JLS §5 分类，Swift 基本无隐式转换 |
| **严重性** | LOW |
| **建议** | 考虑在 ArkTS 文档中增加与 Java/Swift 的转换粒度对比附录 |
