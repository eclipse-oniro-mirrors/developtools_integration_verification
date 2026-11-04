# 6.4.4 Enumeration to string Type — Cross-Language Comparison

## 1. Overview

| Dimension | ArkTS | Java | Swift |
|-----------|-------|------|-------|
| Enum→string | `let s: string = enum_val` (implicit) | `.v` field or `.toString()` | `.rawValue` |
| Enum→string\|X union | Implicit | No union (use Object) | No union (use Any) |
| Enum in string concat | `"x " + enum_val` (implicit) | `"x " + enum_val.v` | `"x " + enum_val.rawValue` |

## 2. 1:1 Comparison

| Operation | ArkTS | Java | Swift |
|-----------|-------|------|-------|
| enum→string | `let s: string = e` | `String s = e.v` | `let s = e.rawValue` |
| "prefix" + enum | `"t: " + e` | `"t: " + e.v` | `"t: " + e.rawValue` |
| enum + "suffix" | `e + " ok"` | `e.v + " ok"` | `e.rawValue + " ok"` |
| enum→string\|X union | `let u: string\|int = e` | N/A | N/A |

## 3. Core Conclusion

**ArkTS string enum integration is the most seamless** — `let s: string = StringEnum.a` works without any qualifier. Java requires field access (`.v`). Swift requires `.rawValue`. ArkTS is the only language where string enum members behave as true string subtypes.

## 4. Test Results

| Language | Files | Pass |
|----------|:--:|:--:|
| ArkTS | 10 | 10/10 |
| Java | 1 | 1/1 |
