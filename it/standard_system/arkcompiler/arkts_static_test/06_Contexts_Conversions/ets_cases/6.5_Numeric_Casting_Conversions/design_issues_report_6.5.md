# 6.5 Numeric Casting Conversions — Design Issues Report

## Issue #1: `.toFloat()` 依赖 double→float narrowing

| Field | Detail |
|-------|--------|
| **描述** | `d.toFloat()` 是显式 double→float 转换，语义一致，但 float 类型缺乏独立字面量 |
| **严重性** | LOW (已在 6.4.1 中记录) |

## Issue #2: `as` cast 废弃与 `.toXxx()` 语义重复

| Field | Detail |
|-------|--------|
| **描述** | ArkTS 同时有 `as` cast（已废弃于数值类型）和 `.toXxx()` 方法，两者语义重叠 |
| **严重性** | LOW |
| **建议** | 统一为一种转换语法；若保留两种，明确分工（如 `as` 仅用于引用类型转换） |

## Issue #3: ArkTS cast 语法独特性

| Field | Detail |
|-------|--------|
| **描述** | ArkTS 的 `.toInt()` 方法是唯一使用方法调用语法的 cast 方式（Java=Syntax cast，Swift=Type constructor），这是设计选择而非问题 |
| **严重性** | N/A (设计特性) |
