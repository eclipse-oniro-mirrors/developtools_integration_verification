# 6.3.2 char Conversions for Relational/Equality Operands — Cross-Language Comparison

## 1. Overview

| Dimension | ArkTS | Java (SE 21) | Swift (5.x) |
|-----------|-------|-------------|-------------|
| char is numeric type? | ✓ (16-bit) | ✓ (16-bit unsigned) | **✗** (grapheme cluster) |
| `char < byte` | ✓ (→int) | ✓ (→int) | ✗ (need `.value`) |
| `char < int` | ✓ (→int) | ✓ (→int) | ✗ (`Int(c.value) < i`) |
| `char < long` | ✓ (→long) | ✓ (→long) | ✗ (`Int64(c.value) < l`) |
| `char < double` | ✓ (→double) | ✓ (→double) | ✗ (`Double(c.value) < d`) |
| `char < char` | ✓ (→int) | ✓ (numeric) | ✗ (`.value` comparison) |
| `char == int` | ✓ | ✓ | ✗ (explicit) |
| char unsigned? | Yes (0-65535) | Yes (0-65535) | `UnicodeScalar.value` is `UInt32` |
| char + char result | int or wider | int | N/A (no + on char) |

## 2. Core Difference: char as Numeric Type

| | ArkTS | Java | Swift |
|--|-------|------|-------|
| **char semantics** | Numeric, 16-bit, widening rules per §6.3.2 | Numeric, 16-bit unsigned, primitive widening | **Grapheme cluster** (1+ Unicode scalars) |
| **Comparison model** | `c'A' < 100` directly | `'A' < 100` directly | `"A".unicodeScalars.first!.value < 100` |

This is the **most dramatic** language difference in Chapter 6. ArkTS and Java treat `char` as a numeric type that implicitly widens. Swift's `Character` type is a semantic text unit, not a number — comparison requires explicit access to the underlying Unicode scalar value.

## 3. 1:1 Code Comparison

### 3.1 char < byte

**ArkTS:**
```typescript
let c: char = c'A'   // 65
let b: byte = 66
c < b                 // true: both→int
```

**Java:**
```java
char c = 'A';        // 65
byte b = 66;
c < b;               // true: both→int
```

**Swift:**
```swift
let c: UnicodeScalar = "A"   // .value = 65
let b: Int8 = 66
Int32(c.value) < Int32(b)    // true — explicit
```

### 3.2 char < long

**ArkTS:**
```typescript
let c: char = c'Z'   // 90
let l: long = 200
c < l                 // true: char→long
```

**Java:**
```java
char c = 'Z';        // 90
long l = 200;
c < l;               // true: char→long
```

**Swift:**
```swift
let c: UnicodeScalar = "Z"
let l: Int64 = 200
Int64(c.value) < l   // explicit
```

### 3.3 char == int

**ArkTS:**
```typescript
c'A' == 65  // true
```

**Java:**
```java
'A' == 65   // true
```

**Swift:**
```swift
UnicodeScalar("A").value == 65  // true — but not direct char==int
```

### 3.4 char vs Negative

**ArkTS & Java:**
```
'A'(65) > -10  // true — char is unsigned 0-65535
```

**Swift:**
```swift
Int(c.value) > -10  // true — but must convert UInt32→Int first
```

## 4. Composite Scoring

| Dimension | ArkTS | Java | Swift |
|-----------|:--:|:--:|:--:|
| char-as-number ergonomics | ★★★★★ | ★★★★★ | ★ |
| Type safety (char vs text) | ★★★ | ★★★ | ★★★★★ |
| Cross-type comparison | ★★★★★ | ★★★★★ | ★★ |
| Unicode correctness | ★★★ | ★★ (UTF-16 surrogate pairs) | ★★★★★ |
| **Overall** | **4.0** | **3.7** | **2.7** (for numeric use case) |

*Note: Swift's low score is domain-specific — for **text processing**, Swift's Character type is far superior. For **numeric char comparison**, Swift's design is verbose.*

## 5. Core Conclusions

1. **ArkTS and Java are nearly identical** in char→numeric widening. Both treat `char` as a 16-bit numeric type with implicit widening to int/long/double. The widening rules match exactly.

2. **Swift is fundamentally different**: `Character` is not a number. This reflects different design goals — Swift prioritizes Unicode-correct text handling, while ArkTS/Java prioritize numeric char comparison convenience.

3. **ArkTS char widening rules are confirmed**: `char→int` for byte/char/int peers, `char→long` for long, `char→double` for double — all work as specified in §6.3.2.

4. **All three languages agree on the result**: The actual comparison outcome (e.g., `'A'(65) > -10` is `true`) is identically correct across languages once the types are aligned.

## 6. Test Results

| Language | Files | Pass | Notes |
|----------|:--:|:--:|-------|
| ArkTS | 26 | 26/26 | es2panda + ark VM |
| Java SE 21 | 3 | 3/3 | javac + java -ea |
| Swift 5.x | 2 | — | Environment unavailable (code ready) |
