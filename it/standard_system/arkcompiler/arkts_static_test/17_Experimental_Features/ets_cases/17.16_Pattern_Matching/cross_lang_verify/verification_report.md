# 17.16 Pattern Matching - 三环境实测验证报告

**测试日期：** 2026-06-23

---

## ArkTS 实测结果

| 用例 | 描述 | 结果 |
|------|------|------|
| 001 PASS | instanceof String | ✅ compile-pass |
| 002 PASS | instanceof Class hierarchy | ✅ compile-pass |
| 003 PASS | instanceof branch dispatch | ✅ compile-pass |
| 004 PASS | instanceof multi-type | ✅ compile-pass |
| 010 FAIL | `is` operator | ✅ compile-fail (ESY169587) |
| 011 FAIL | Type predicate `is` | ✅ compile-fail (ESY169587) |
| 012 FAIL | instanceof mismatch | ⚠️ compile-pass with W1001506 (SPEC不一致) |
| 013 FAIL | Wrong type context | ✅ compile-fail |
| 020 RUNTIME | instanceof String at runtime | ✅ PASS |
| 021 RUNTIME | instanceof class hierarchy | ✅ PASS |
| 022 RUNTIME | instanceof branch dispatch | ✅ PASS |
| 023 RUNTIME | instanceof null | ✅ PASS |

---

## Java 实测结果 (Java 21.0.11)

| 测试 | 描述 | 结果 |
|------|------|------|
| test1 | instanceof String | ✅ PASS |
| test2 | instanceof class hierarchy | ✅ PASS |
| test3 | instanceof branch | ✅ PASS |
| test4 | instanceof null | ✅ PASS |
| test5 | instanceof int (incompatible) | ✅ compile ERROR (javac rejects) |
| test6 | Java 16+ pattern matching `String s` | ✅ PASS (superior to ArkTS) |

### Java vs ArkTS 关键差异
- **instanceof 不兼容类型**：Java 编译错误（incompatible types），ArkTS 仅警告
- **Java 16+ 模式绑定**：`if (x instanceof String s)` 直接绑定变量，ArkTS 需手动转换

---

## Swift 实测结果

**状态：** Swift 5.10 编译器在此系统不可用。以下为等效 Swift 代码（未经编译验证）。

### Swift 参考代码

```swift
// Swift 5.x - Pattern Matching via 'is' and 'as?'
// Note: Swift uses 'is' for type checking (same keyword that ArkTS rejects!)

class Animal { var name = "animal" }
class Dog: Animal { func bark() { print("woof") } }
class Cat: Animal { func meow() { print("meow") } }

// Test 1: 'is' type checking (Swift's equivalent of instanceof)
let obj: Any = "hello"
if obj is String { print("PASS: is String") }
if !(obj is Int) { print("PASS: not Int") }

// Test 2: Class hierarchy
let v: Animal = Dog()
if v is Animal { print("PASS: Dog is Animal") }
if v is Dog { print("PASS: Dog is Dog") }
if !(v is Cat) { print("PASS: Dog not Cat") }

// Test 3: Switch pattern matching (Swift feature beyond ArkTS)
let fruit: Any = Apple()
switch fruit {
case let a as Apple: print("apple")
case let b as Banana: print("banana")
default: print("unknown")
}

// Test 4: null/nil
let nullObj: Any? = nil
// nil is String? evaluates to false
if !(nil is String) { print("PASS") }

// Key difference: Swift uses 'is' where ArkTS uses 'instanceof'
// ArkTS explicitly rejects 'is' with ESY169587
```

### Swift vs ArkTS 关键差异
| 特性 | ArkTS | Swift |
|------|-------|-------|
| 类型检查关键字 | `instanceof` | `is` |
| `is` 关键字 | ❌ ESY169587 | ✅ 原生类型检查 |
| `switch` 模式匹配 | ❌ 无 | ✅ 支持 |
| Optional 绑定 | 联合类型收窄 | `if let x = opt` |

---

## 三环境对比总结

| 特性 | ArkTS | Java (21) | Swift (5.x) |
|------|-------|-----------|-------------|
| 类型检查语法 | `instanceof` | `instanceof` | `is` |
| `is` 运算符 | ❌ 编译错误 | ❌ 不存在 | ✅ 原生 |
| 模式绑定 | ❌ 手动转换 | ✅ Java 16+ `String s` | ✅ `if let` / `case let` |
| `match`/`switch` 模式 | ❌ 不支持 | ✅ Java 21 switch patterns | ✅ 完整 |
| 类型谓词 | ❌ 编译错误 | ❌ 不存在 | ❌ 不存在 |
| 不兼容类型 instanceof | ⚠️ 仅警告 | ❌ 编译错误 | ❌ 编译错误 |
| null/nil 与 instanceof/is | false (符合预期) | false | false |
