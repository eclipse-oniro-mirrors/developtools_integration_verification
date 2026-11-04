# 6.4.1 Widening Numeric Conversions — Cross-Language Comparison Report

## 1. Overview

| Dimension | ArkTS | Java (SE 21) | Swift (5.x) |
|-----------|-------|-------------|-------------|
| Implicit widening | ✓ 15 paths per spec table | ✓ 15 paths (identical table) | **✗** All explicit |
| byte→short | Implicit | Implicit | `Int16(b)` |
| byte→int | Implicit | Implicit | `Int(b)` |
| int→long | Implicit | Implicit | `Int64(i)` |
| int→double | Implicit | Implicit | `Double(i)` |
| long→float | Implicit | Implicit | `Float(l)` |
| float→double | Implicit | Implicit | `Double(f)` |
| Narrowing (int→byte) | compile error | compile error | compile error |

## 2. 15-Path Conversion Table

| From → To | short | int | long | float | double |
|-----------|:---:|:---:|:---:|:---:|:---:|
| **byte** | ✓ArkTS ✓Java ✗Swift | ✓✓✗ | ✓✓✗ | ✓✓✗ | ✓✓✗ |
| **short** | | ✓✓✗ | ✓✓✗ | ✓✓✗ | ✓✓✗ |
| **int** | | | ✓✓✗ | ✓✓✗ | ✓✓✗ |
| **long** | | | | ✓✓✗ | ✓✓✗ |
| **float** | | | | | ✓✓✗ |

**ArkTS = Java for all 15 paths.** Swift requires explicit conversion on all 15.

## 3. 1:1 Code Comparison

### byte→int

| Language | Code |
|----------|------|
| ArkTS | `let i: int = b` |
| Java | `int i = b;` |
| Swift | `let i = Int(b)` |

### int→double

| Language | Code |
|----------|------|
| ArkTS | `let d: double = i` |
| Java | `double d = i;` |
| Swift | `let d = Double(i)` |

### long→float

| Language | Code |
|----------|------|
| ArkTS | `let f: float = l` |
| Java | `float f = l;` |
| Swift | `let f = Float(l)` |

## 4. Narrowing Rejection (All Three Agree)

| Attempt | ArkTS | Java | Swift |
|---------|:--:|:--:|:--:|
| `int→byte` | ❌ compile error | ❌ compile error | ❌ compile error |
| `long→int` | ❌ | ❌ | ❌ |
| `double→float` | ❌ | ❌ | ❌ |
| `double→int` | ❌ | ❌ | ❌ |
| With explicit cast | `.toByte()` / `.toInt()` | `(byte)i` / `(int)d` | `Int8(i)` / `Int(d)` |

## 5. Core Conclusion

**ArkTS and Java are 100% identical in widening numeric conversion rules.** Both follow the exact same 15-path conversion table. The only implementation difference is ArkTS's additional restriction on union-type widening (§6.4.2). Swift stands alone as the "no implicit widening" language.

## 6. Test Results

| Language | Files | Pass | Notes |
|----------|:--:|:--:|-------|
| ArkTS | 23 | 23/23 | es2panda + ark VM |
| Java SE 21 | 2 | 2/2 | javac + java -ea |
| Swift | 1 | — | Ready, env unavailable |
