# 6.4.3 Enumeration to Numeric Type — Cross-Language Comparison

## 1. Overview

| Dimension | ArkTS | Java (SE 21) | Swift (5.x) |
|-----------|-------|-------------|-------------|
| Enum→int (same base) | `int_var = enum_val` (implicit) | `ordinal()` or field access | `.rawValue` |
| Enum→long (larger) | `long_var = enum_val` (implicit) | `(long) ordinal()` (explicit cast) | `Int64(rawValue)` |
| Enum→double | `double_var = enum_val` (implicit) | `(double) ordinal()` | `Double(rawValue)` |
| Enum in arithmetic | `Val.Ten + 5` (implicit) | `Val.Ten.v + 5` (field) | `Val.Ten.rawValue + 5` |
| Enum→union (int\|long) | ✓ (implicit) | N/A | N/A |

## 2. 1:1 Comparison

| Operation | ArkTS | Java | Swift |
|-----------|-------|------|-------|
| enum→int | `let v: int = e` | `int v = e.ordinal()` | `let v = e.rawValue` |
| enum→long | `let v: long = e` | `long v = e.ordinal()` | `let v = Int64(e.rawValue)` |
| enum→double | `let v: double = e` | `double v = e.ordinal()` | `let v = Double(e.rawValue)` |
| enum+int | `e + 5` | `e.v + 5` | `e.rawValue + 5` |
| enum*int | `e * 3` | `e.v * 3` | `e.rawValue * 3` |

## 3. Key Finding

**ArkTS is the most ergonomic** — `let v: int = enum_val` works directly. Java requires `.ordinal()` or custom field. Swift requires `.rawValue`. ArkTS's implicit enum→numeric conversion (§6.4.3) provides the smoothest developer experience.

## 4. Test Results

| Language | Files | Pass |
|----------|:--:|:--:|
| ArkTS | 17 | 17/17 |
| Java | 1 | 1/1 |
