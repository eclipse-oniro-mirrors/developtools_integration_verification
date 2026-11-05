# 6.2 String Operator Contexts — Cross-Language Comparison Report

## 1. Overview

| Dimension | ArkTS | Java (SE 21) | Swift (5.x) |
|-----------|-------|-------------|-------------|
| String + Int | Implicit: `"v: " + 42` | Implicit: `"v: " + 42` | **Explicit only**: `"v: " + String(42)` or `"v: \(42)"` |
| String + Float | Implicit: `"pi: " + 3.14` | Implicit: `"pi: " + 3.14` | Explicit only |
| String + Boolean | Implicit: `"f: " + true` | Implicit: `"f: " + true` | Explicit only |
| String + null | `"" + null` → `"null"` | `"" + null` → `"null"` | `String(describing: nil)` → `"nil"` |
| String + undefined | `"" + undefined` → `"undefined"` | N/A (no undefined) | N/A (Optional.none) |
| String + Enum (string base) | Implicit member value | Custom `toString()` | `.rawValue` explicit |
| String + Reference | Implicit `toString()` | Implicit `toString()` | `CustomStringConvertible` |
| integer formatting | Decimal form | Decimal form | Decimal form |
| float formatting | Decimal, no info loss | Decimal, may have info loss | Decimal |
| boolean formatting | `"true"` / `"false"` | `"true"` / `"false"` | `"true"` / `"false"` |

## 2. Key Differences

### 2.1 Implicit vs Explicit Conversion

| Feature | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **Implicit string concat** | ✓ (via `+` with string operand) | ✓ (via `+` with string operand) | **✗** (type error without String()) |
| **String interpolation** | Not available | Not available | `"\(value)"` preferred |
| **Conversion basis** | Type-specific rules per spec §6.2 | Universal `toString()` on all objects | `CustomStringConvertible` protocol |

### 2.2 Type-Specific Conversion Behavior

| Type | ArkTS Result | Java Result | Swift Approach |
|------|-------------|-------------|----------------|
| `int` 42 | `"42"` | `"42"` | `String(42)` → `"42"` |
| `double` 0.0 | `"0"` (integer form!) | `"0.0"` | `String(0.0)` → `"0.0"` |
| `double` 3.14 | `"3.14"` | `"3.14"` | `"3.14"` |
| `boolean` true | `"true"` | `"true"` | `"true"` |
| `null` | `"null"` | `"null"` | `"nil"` |
| `undefined` | `"undefined"` | N/A | N/A |
| int-enum | `toString()` (ordinal) | `toString()` (name) | `String(describing:)` |
| string-enum | member value | custom toString | `.rawValue` |

### 2.3 ArkTS Notable Behaviors

1. **`0.0` → `"0"`**: ArkTS formats `0.0` as `"0"` (integer representation), unlike Java/Swift which produce `"0.0"`. This was discovered during runtime testing (§6.2 case 017).

2. **`null` vs `undefined`**: ArkTS is unique in having **both** nullish values, producing distinct strings `"null"` and `"undefined"`. Java has only `null`. Swift has only `Optional.none`/`nil`.

3. **String enum implicit conversion**: ArkTS allows `"text " + StringEnum.Member` to directly produce the member's string value. Java requires explicit `toString()` override. Swift requires explicit `.rawValue`.

4. **`void` result + string**: ArkTS accepts `"result: " + voidFunction()` (does not produce compile error). This is a spec-vs-implementation divergence.

## 3. 1:1 Test Case Comparison

### 3.1 Integer Concatenation

**ArkTS:**
```typescript
let s: string = "value: " + 42        // "value: 42"
let s2: string = (-7) + " items"       // "-7 items"
```

**Java:**
```java
String s = "value: " + 42;             // "value: 42"
String s2 = (-7) + " items";           // "-7 items"
```

**Swift:**
```swift
let s = "value: " + String(42)         // "value: 42"
let s2 = String(-7) + " items"         // "-7 items"
// Or: let s = "value: \(42)"
```

### 3.2 Floating-point Concatenation

**ArkTS:**
```typescript
"pi: " + 3.14    // "pi: 3.14"
0.0 + " is zero" // "0 is zero"  ← NOTE: ArkTS drops .0
```

**Java:**
```java
"pi: " + 3.14    // "pi: 3.14"
0.0 + " is zero" // "0.0 is zero"  ← Java keeps .0
```

**Swift:**
```swift
"pi: " + String(3.14)    // "pi: 3.14"
String(0.0) + " is zero" // "0.0 is zero"
```

### 3.3 null/undefined Concatenation

**ArkTS:**
```typescript
"" + null       // "null"
"" + undefined  // "undefined"
```

**Java:**
```java
"" + null       // "null"
// no undefined
```

**Swift:**
```swift
String(describing: nil as Int?)  // "nil"
// no undefined
```

## 4. Composite Scoring

| Dimension | ArkTS | Java | Swift |
|-----------|:--:|:--:|:--:|
| Implicit conversion convenience | ★★★★★ | ★★★★★ | ★★ |
| Type safety (no surprise conversions) | ★★★★ | ★★★ | ★★★★★ |
| Float formatting precision | ★★★ (0.0→"0") | ★★★★ | ★★★★ |
| null/undefined distinction | ★★★★★ | ★★ | ★★★ |
| Enum-to-string ergonomics | ★★★★★ | ★★★ | ★★★ (rawValue explicit) |
| **Overall** | **4.0** | **3.4** | **3.6** |

## 5. Core Conclusions

1. **ArkTS and Java share implicit string concat semantics** — both use `+` with a string operand to trigger implicit conversion. Swift rejects this entirely, requiring explicit `String()` or interpolation.

2. **ArkTS has the richest nullish type → string mapping** — producing distinct `"null"` and `"undefined"` strings. No other language has this.

3. **ArkTS float formatting drops trailing .0** — `0.0` becomes `"0"` rather than `"0.0"`. This is a notable behavioral difference from both Java and Swift.

4. **ArkTS string enum integration is the most seamless** — `"prefix" + StrEnum.X` works directly. Java needs custom `toString()`, Swift needs `.rawValue`.

5. **`void` + string compiles in ArkTS** — this was unexpected (spec says "no applicable conversion → compile error") but the implementation accepts it.

## 6. Test Execution Results

| Language | Files | Pass | Notes |
|----------|:--:|:--:|-------|
| ArkTS | 25 | 25/25 | es2panda + ark VM |
| Java SE 21 | 3 | 3/3 | javac + java -ea |
| Swift 5.x | 3 | — | Not available in WSL (code ready) |

---

*Report generated per TESTING_PROCESS_GUIDE.md Step 5*
