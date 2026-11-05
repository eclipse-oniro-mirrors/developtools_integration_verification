# 6.3 Numeric Operator Contexts — Cross-Language Comparison Report

## 1. Overview

| Dimension | ArkTS | Java (SE 21) | Swift (5.x) |
|-----------|-------|-------------|-------------|
| Mixed-type arithmetic (`int+long`) | Implicit widening | Implicit widening | **Explicit only** |
| `int*double` | Implicit (int→double) | Implicit | `Double(i1) * d1` |
| `int<<long` | Implicit widening | Implicit | Same-type only |
| `int&long` | Implicit widening | Implicit | Same-type only |
| Exponentiation | `**` operator → `Double` | `Math.pow()` → `double` | `pow()` → `Double` |
| Enum in arithmetic | `Val.B + 5` (implicit) | `Val.B.v + 5` (field/ordinal) | `Val.B.rawValue + 5` |
| Compound `+=` cross-type | Implicit widening | Implicit widening | Explicit only |
| Unary `~` on byte/short | Widens to int | Widens to int | Widens to Int |

## 2. Operator-by-Operator Comparison

### 2.1 Unary (`+` `-` `~`)

| | ArkTS | Java | Swift |
|--|-------|------|-------|
| `+int` | ✓ int | ✓ int | ✓ Int |
| `-int` | ✓ int | ✓ int | ✓ Int |
| `~int` | ✓ int (`~10 == -11`) | ✓ int (`~10 == -11`) | ✓ Int (`~10 == -11`) |
| `~byte` | Widens→int | Widens→int | Widens→Int |

**All three identical.**

### 2.2 Exponentiation (`**`)

| | ArkTS | Java | Swift |
|--|-------|------|-------|
| Syntax | `a ** b` (operator) | `Math.pow(a, b)` (method) | `pow(a, b)` (function) |
| Return type | `Double` | `double` | `Double` |
| `2 ** 3` | `8.0` | `8.0` | `8.0` |
| `10 ** 0` | `1.0` | `1.0` | `1.0` |

ArkTS is unique in having a built-in `**` operator.

### 2.3 Multiplicative (`*` `/` `%`)

| | ArkTS | Java | Swift |
|--|-------|------|-------|
| `int * double` | ✓ (int→double) | ✓ (int→double) | `Double(i1) * d1` |
| `int * long` | ✓ (int→long) | ✓ (int→long) | `Int64(i2) * l2` |
| `int / int` | Integer division | Integer division | Integer division |
| `7 / 2` | `3` | `3` | `3` |
| `7 % 2` | `1` | `1` | `1` |

### 2.4 Shift (`<<` `>>`)

| | ArkTS | Java | Swift |
|--|-------|------|-------|
| `int << long` | ✓ (widening) | ✓ (widening) | Same-type only |
| `int >> byte` | ✓ | ✓ | `c1 >> Int(d1)` |
| `1 << 3` | `8` | `8` | `8` |

### 2.5 Bitwise (`&` `|` `^`)

| | ArkTS | Java | Swift |
|--|-------|------|-------|
| `int & long` | ✓ (long result) | ✓ (long result) | Same-type only |
| `0xFF & 0x0F` | `0x0F` | `0x0F` | `0x0F` |
| `0xFF ^ 0x0F` | `0xF0` | `0xF0` | `0xF0` |

### 2.6 Compound Assignment (`+=` `-=` `*=` `/=` `<<=` `>>=`)

| | ArkTS | Java | Swift |
|--|-------|------|-------|
| `long += int` | ✓ (int→long) | ✓ (int→long) | `la += Int64(10)` |
| `double *= int` | ✓ (int→double) | ✓ (int→double) | `dc *= Double(3)` |
| `long <<= int` | ✓ | ✓ | Same-type |

### 2.7 Enum in Arithmetic

| | ArkTS | Java | Swift |
|--|-------|------|-------|
| Syntax | `Val.B + 5` | `Val.B.v + 5` | `Val.B.rawValue + 5` |
| Mechanism | Enum→Numeric implicit (§6.4.3) | Field access / ordinal() | `.rawValue` explicit |
| `enum * int` | ✓ | Needs field | Needs `.rawValue` |
| `enum | int` | ✓ | Needs field | Needs `.rawValue` |
| `~enum` | ✓ | Needs field | Needs `.rawValue` |

## 3. Composite Scoring

| Dimension | ArkTS | Java | Swift |
|-----------|:--:|:--:|:--:|
| Mixed-type arithmetic ergonomics | ★★★★★ | ★★★★★ | ★★ |
| Exponentiation ergonomics | ★★★★★ (`**` operator) | ★★★ (`Math.pow`) | ★★★ (`pow()`) |
| Enum arithmetic ergonomics | ★★★★★ (implicit) | ★★ (field/ordinal) | ★★★ (rawValue) |
| Type safety (no surprise conversion) | ★★★★ | ★★★ | ★★★★★ |
| **Overall** | **4.6** | **3.4** | **3.2** |

## 4. Core Conclusions

1. **ArkTS and Java share identical implicit widening** for all arithmetic operations — `int+long`, `int*double`, `long+=int` all work the same way.

2. **Swift requires explicit conversion everywhere** — every cross-type arithmetic operation needs `Int64()`, `Double()`, etc. This makes Swift code more verbose but eliminates ambiguity.

3. **ArkTS `**` operator is unique** — neither Java nor Swift has a dedicated exponentiation operator. Both use library functions.

4. **ArkTS enum arithmetic is the most ergonomic** — `Val.B + 5` works directly. Java needs `.v` or `.ordinal()`, Swift needs `.rawValue`.

5. **All three agree on semantics** — integer division truncation, modulo, shift, and bitwise operations produce identical results once types are aligned.

## 5. Test Results

| Language | Files | Pass | Notes |
|----------|:--:|:--:|-------|
| ArkTS | 27 | 27/27 | es2panda + ark VM |
| Java SE 21 | 3 | 3/3 | javac + java -ea |
| Swift 5.x | 3 | — | Env unavailable (code ready) |
