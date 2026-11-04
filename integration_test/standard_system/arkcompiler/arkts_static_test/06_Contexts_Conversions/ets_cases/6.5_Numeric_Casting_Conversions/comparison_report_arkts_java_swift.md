# 6.5 Numeric Casting Conversions — Cross-Language Comparison

## 1. Syntax Comparison

| Operation | ArkTS | Java | Swift |
|-----------|-------|------|-------|
| double→int | `d.toInt()` | `(int)d` | `Int(d)` |
| int→long | `i.toLong()` | `(long)i` | `Int64(i)` |
| int→byte | `i.toByte()` | `(byte)i` | `Int8(truncatingIfNeeded: i)` |
| long→int | `l.toInt()` | `(int)l` | `Int(l)` |
| double→float | `d.toFloat()` | `(float)d` | `Float(d)` |
| Chained | `d.toInt().toLong().toDouble()` | `(double)(long)(int)d` | `Double(Int64(Int(d)))` |

## 2. Semantic Comparison

| Behavior | ArkTS | Java | Swift |
|----------|-------|------|-------|
| float→int: truncation to zero | ✓ | ✓ | ✓ |
| 3.14→int | 3 | 3 | 3 |
| -3.14→int | -3 | -3 | -3 |
| int→byte: low 8 bits | ✓ | ✓ | ✓ (with truncatingIfNeeded) |
| 255→byte | -1 | -1 | -1 |
| int→byte overflow safety | Never runtime error | Never runtime error | **Crashes by default** (trapping) |
| NaN→int | 0 (spec defined) | 0 (Java spec) | Traps (runtime error) |
| ±∞→int | MAX/MIN (spec defined) | MAX/MIN | Traps |

## 3. Swift Overflow Safety Difference

Swift's `Int8(255)` **crashes at runtime** (overflow trap). Both ArkTS and Java silently truncate. Swift provides `truncatingIfNeeded:` initializer for silent truncation, matching ArkTS/Java behavior.

## 4. ArkTS Syntax Uniqueness

ArkTS is the **only** language using method-call syntax (`.toInt()`) for numeric casting. Java uses C-style cast `(type)`. Swift uses type-constructor `Type()`. ArkTS's approach is:
- More explicit than Java's (type) syntax
- Discoverable via IDE autocomplete
- Consistent with standard library design

## 5. Test Results

| Language | Files | Pass |
|----------|:--:|:--:|
| ArkTS | 16 | 16/16 |
| Java | 1 | 1/1 |
