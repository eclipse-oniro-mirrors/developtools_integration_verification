# 6.4.2 Widening Numeric to a Union Type — Cross-Language Comparison

## 1. Overview

| Dimension | ArkTS | Java (SE 21) | Swift (5.x) |
|-----------|-------|-------------|-------------|
| Union types | ✓ Native `T \| U` syntax | **✗** No union types | **✗** No union types |
| `byte \| int` variable | ✓ | Use `int` directly (widening covers it) | Use `Int` or enum (associated values) |
| Literal inference | `byte\|int = 256` → int | `int x = 256` (always int literal) | `let x = 256` → Int |
| Subtyping | `int → byte\|int` (direct) | `int = int` (trivial) | `Int = Int` (trivial) |
| Widening to union | `short → byte\|int` (int larger) | `int = short` (implicit) | `Int(short)` (explicit) |
| Ambiguity detection | `byte → short\|int` → error (2 larger) | N/A | N/A |
| `instanceof` on union | ✓ Native | ✗ (no union) | ✗ (use `switch enum`) |

## 2. Unique ArkTS Feature

ArkTS's union type widening is a **unique language feature** with no direct equivalent:

```typescript
// ArkTS: variable can hold two types with widening
let u: byte | int = 256    // literal → int
u = short_var              // short → int (only larger member)
u = int_var                // int → byte|int (subtyping)
```

**Java equivalent** (no union — just use wider type):
```java
int u = 256;        // always int
u = short_var;      // implicit widening to int
u = int_var;        // trivial
```

**Swift equivalent** (no union — use enum with associated values):
```swift
enum IntOrByte {
    case intValue(Int)
    case byteValue(Int8)
}
var u = IntOrByte.intValue(256)
u = .intValue(Int(short_var))
```

## 3. Closest Equivalents Matrix

| ArkTS Union Concept | Java Equivalent | Swift Equivalent |
|--------------------|-----------------|-----------------|
| `T \| U` declaration | Use `T` (widest) or method overloading | enum with associated values |
| Literal → union member inference | Literal type determined by context (int default) | Literal type inference |
| Subtyping (`T` is member) | Direct assignment (same type) | Direct enum case |
| Widening to larger member | Implicit primitive widening | Explicit type construction |
| Ambiguity rejection | N/A (no multiple-larger detection) | N/A |
| `instanceof` check | `instanceof` (reference types only) | `switch enum` / `if case let` |

## 4. Design Implications

| Aspect | ArkTS Advantage | ArkTS Disadvantage |
|--------|:--:|:--:|
| **Expressiveness** | Precise type constraints (`byte\|int`) | More verbose than single wider type |
| **Safety** | Ambiguity detection prevents silent bugs | Excessive strictness (2 larger members rejected) |
| **Migration** | No Java/Swift equivalent to port from | Requires different mental model |

## 5. Core Conclusions

1. **ArkTS union types with widening are unique** — neither Java nor Swift has a feature combining union types with implicit widening rules. This is a novel language design element.

2. **Java's implicit widening partially covers the same ground** — if you just want "a type that can hold byte or int", Java's answer is simply `int` (the wider type). ArkTS union types are more precise but more restrictive.

3. **The "exactly one larger member" rule has no parallel** — Java's widening is always unambiguous (single destination type). ArkTS's ambiguity detection for `byte→short|int` (2 larger members) is a purely ArkTS concept.

4. **ArkTS should work correctly** — all 16 ArkTS test cases passed with 100% rate, confirming the union widening rules are consistently enforced by the compiler.

## 6. Test Results

| Language | Files | Pass | Notes |
|----------|:--:|:--:|-------|
| ArkTS | 16 | 16/16 | es2panda + ark VM |
| Java SE 21 | 1 | 1/1 | javac + java -ea |
| Swift | 1 | — | Ready, env unavailable |
