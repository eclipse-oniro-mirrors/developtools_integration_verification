# 6.3.1 Numeric Conversions for Relational and Equality Operands — Cross-Language Comparison

## 1. Overview

| Dimension | ArkTS | Java (SE 21) | Swift (5.x) |
|-----------|-------|-------------|-------------|
| Implicit widening in `<` `>` | ✓ (int<long → widen) | ✓ (int<long → widen) | **✗** (must `Int64(a)`) |
| Implicit widening in `==` `!=` | ✓ | ✓ | **✗** |
| `byte < int` | ✓ (byte→int) | ✓ (byte→int) | ✗ (`Int(b1) < i1`) |
| `short < long` | ✓ | ✓ | ✗ |
| `double > int` | ✓ (int→double) | ✓ | ✗ (`Double(i2)`) |
| `int == long` | ✓ | ✓ | ✗ |
| Non-numeric `<` (string<int) | compile error | compile error | compile error |
| enum `<` enum (numeric base) | ✓ (widening to base type) | ✗ (need `.compareTo()`) | ✓ (with `Comparable`) |
| enum `<` int | ✓ | ✗ | ✗ |

## 2. Key Difference: Implicit Widening

This is the **defining difference** across all three languages:

| | ArkTS | Java | Swift |
|--|-------|------|-------|
| **Widening model** | Controlled implicit | Full implicit primitive widening | **No implicit widening** |
| **int + long comparison** | `a < b` (int→long) | `a < b` (int→long) | `Int64(a) < b` |
| **byte + int comparison** | `b < i` (byte→int) | `b < i` (byte→int) | `Int(b) < i` |
| **Safety** | Catches ambiguous cases (e.g., byte→short\|int) | Permissive (any widening) | Strict (compile error on mismatch) |

## 3. Enum Comparison Behavior

| | ArkTS | Java | Swift |
|--|-------|------|-------|
| **enum < enum** | ✓ (implicit to int, then compare) | ✗ (must use `compareTo()`) | ✓ (if `Comparable`, or `.rawValue`) |
| **enum < int** | ✓ (`Priority.Medium > 1`) | ✗ (cannot mix enum and int) | ✗ (`Priority.Medium.rawValue > 1`) |
| **enum == enum** | ✓ | ✓ | ✓ |

ArkTS is **unique** in allowing direct `enum < int` comparisons. This leverages the Enumeration to Numeric conversion (§6.4.3) combined with the relational operator context (§6.3.1).

## 4. 1:1 Test Case Comparison

### 4.1 int < long

**ArkTS:**
```typescript
let a: int = 10; let b: long = 20
let r = a < b  // true, a widened to long
```

**Java:**
```java
int a = 10; long b = 20;
boolean r = a < b;  // true, a widened to long
```

**Swift:**
```swift
let a: Int = 10; let b: Int64 = 20
let r = Int64(a) < b  // explicit conversion required
```

### 4.2 byte < int

**ArkTS:**
```typescript
let b: byte = 5; let i: int = 10
b < i  // true, both widened to int
```

**Java:**
```java
byte b = 5; int i = 10;
b < i;  // true, b widened to int
```

**Swift:**
```swift
let b: Int8 = 5; let i: Int = 10
Int(b) < i  // explicit conversion
```

### 4.3 Enum relational comparison

**ArkTS:**
```typescript
Priority.Low < Priority.High  // true (0 < 2)
Priority.Medium > 0           // true (1 > 0)
```

**Java:**
```java
Priority.Low.compareTo(Priority.High) < 0  // true
// Priority.Low < Priority.High  // compile error
// Priority.Medium > 0           // compile error
```

**Swift:**
```swift
Priority.Low < Priority.High   // true (Comparable)
Priority.Medium.rawValue > 0   // explicit .rawValue
```

## 5. Composite Scoring

| Dimension | ArkTS | Java | Swift |
|-----------|:--:|:--:|:--:|
| Widening convenience | ★★★★★ | ★★★★★ | ★★ |
| Type safety | ★★★★ | ★★★ | ★★★★★ |
| Enum comparison ergonomics | ★★★★★ | ★★ | ★★★★ |
| Cross-type comparison clarity | ★★★ (silent widening) | ★★★ | ★★★★★ (explicit) |
| **Overall** | **4.0** | **3.2** | **3.8** |

## 6. Core Conclusions

1. **ArkTS and Java share identical implicit widening semantics** for relational/equality operators — the key difference is ArkTS adds union-type ambiguity detection that Java doesn't have.

2. **Swift takes a fundamentally different approach** — zero implicit widening, requiring explicit type conversion for every cross-type comparison. This is safer but less ergonomic.

3. **ArkTS enum comparison is the most powerful** — allowing `enum < int`, `enum < long` etc. via the chained "enumeration→numeric" + "numeric widening" conversion. Neither Java nor Swift supports this.

4. **Non-numeric rejection is consistent** — all three languages reject `string < int` and `boolean > int` at compile time.

## 7. Test Results

| Language | Files | Pass | Notes |
|----------|:--:|:--:|-------|
| ArkTS | 28 | 28/28 | es2panda + ark VM |
| Java SE 21 | 3 | 3/3 | javac + java -ea |
| Swift 5.x | 3 | — | Not available in WSL |
