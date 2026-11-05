# 6.4 Implicit Conversions — Cross-Language Comparison

## 1. Implicit Conversion Spectrum

```
Swift  ─────────────────── ArkTS ─────────────────── Java
(ZERO implicit)          (controlled)              (most permissive)
```

## 2. Conversion Type Matrix

| Conversion | ArkTS | Java | Swift |
|-----------|:--:|:--:|:--:|
| **Widening Numeric** (int→long) | ✓ Implicit | ✓ Implicit | ✗ `Int64(i)` |
| **Narrowing Numeric** (double→int) | ✗ | ✗ | ✗ |
| **Enum→Numeric** | ✓ Implicit | ✗ (ordinal/field) | ✗ (rawValue) |
| **Enum→String** | ✓ Implicit | ✗ (field/toString) | ✗ (rawValue) |
| **Widening→Union** | ✓ Unique feature | N/A | N/A |
| **int→string** (+ operator) | ✓ Implicit | ✓ Implicit | ✗ `String()` or `\( )` |
| **bool→string** | ✓ Implicit | ✓ Implicit | ✗ explicit |
| **null→string** | ✓ `"null"` | ✓ `"null"` | ✗ `String(describing:)` |
| **undefined→string** | ✓ `"undefined"` | N/A | N/A |
| **Reference→string** | ✓ toString() | ✓ toString() | ✗ `String(describing:)` |

## 3. Design Philosophy

| Language | Philosophy | Safety | Convenience |
|----------|-----------|:--:|:--:|
| **Swift** | "No surprises" — everything explicit | ★★★★★ | ★★ |
| **ArkTS** | "Controlled convenience" — implicit where safe | ★★★★ | ★★★★ |
| **Java** | "Get it done" — implicit wherever possible | ★★★ | ★★★★★ |

## 4. Core Conclusions

1. **ArkTS occupies a deliberate middle ground** between Swift's total explicitness and Java's permissive implicitness. It allows implicit conversions only where spec-defined rules guarantee safety.

2. **ArkTS has 3 unique implicit conversions**: enum→numeric, enum→string, and widening to union — none exist in Java or Swift.

3. **ArkTS is most similar to Java** in string context implicitness and numeric widening. The key differences are ArkTS's stricter union-type rules and enum ergonomics.

## 5. Test Results

| Language | Files | Pass |
|----------|:--:|:--:|
| ArkTS | 23 | 23/23 |
| Java | 1 | 1/1 |
