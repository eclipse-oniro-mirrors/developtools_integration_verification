# 17.16.1 Destructuring Assignment - 三环境实测验证报告

**测试日期：** 2026-06-23

---

## ArkTS 实测结果

| 用例 | 描述 | 结果 |
|------|------|------|
| 001 PASS | `let [a, b] = arr` | ✅ compile-pass |
| 002 PASS | `let [first, , third] = arr` | ✅ compile-pass |
| 003 PASS | `let [num, str] = tup` | ✅ compile-pass |
| 004 PASS | `let [a, b] = [100, 200]` | ✅ compile-pass |
| 005 PASS | `let [val] = arr` | ✅ compile-pass |
| 010 FAIL | Non-array RHS | ✅ compile-fail (ESY0049) |
| 011 FAIL | Duplicate binding | ✅ compile-fail (ESE0351) |
| 012 FAIL | More LHS than tuple | ✅ compile-fail (ESY82935) |
| 013 FAIL | Rest element | ✅ compile-fail (ESY165518) |
| 014 FAIL | Type annotation in pattern | ✅ compile-fail (ESY0229) |
| 020 RUNTIME | Array values extraction | ✅ PASS |
| 021 RUNTIME | Skip element works | ✅ PASS |
| 022 RUNTIME | Tuple values extraction | ✅ PASS |
| 023 RUNTIME | String array destructuring | ✅ PASS |

---

## Java 实测结果 (Java 21.0.11)

**注意：** Java 没有数组/元组解构语法。以下为手动等效实现。

| 测试 | 描述 | 结果 |
|------|------|------|
| test1 | Manual array extract `int a = arr[0]` | ✅ PASS |
| test2 | Skip element `int third = arr[2]` | ✅ PASS |
| test3 | Tuple equivalent (Object[] + cast) | ✅ PASS |
| test4 | Single element | ✅ PASS |
| test5 | String array | ✅ PASS |

### Java vs ArkTS 关键差异
- **解构语法**：ArkTS 有 `let [a, b] = arr`，Java 无此语法，需手动索引访问
- **元组类型**：ArkTS 有原生元组 `[int, string]`，Java 需用 Object[] 或自定义类
- **跳过元素**：ArkTS `let [a, , b]` 语法简洁，Java 需跳过索引
- **Rest 元素**：两者均不支持（ArkTS ESY165518）

---

## Swift 实测结果

**状态：** Swift 5.10 编译器在此系统不可用。以下为等效 Swift 代码（未经编译验证）。

### Swift 参考代码

```swift
// Swift 5.x - Tuple destructuring (native support)
// Note: Swift supports tuple destructuring, but NOT array destructuring

// Test 1: Tuple destructuring (Swift uses tuples natively)
let tup = (42, "hello")
let (num, str) = tup
assert(num == 42)
assert(str == "hello")
print("PASS: tuple destructuring")

// Test 2: Array "destructuring" - NOT natively supported in Swift
// Swift does NOT have let [a, b] = arr syntax for arrays
let arr = [10, 20, 30]
let a = arr[0]
let b = arr[1]
// No skip syntax available

// Test 3: Swift tuple with labels
let named = (x: 1, y: 2)
let (x, y) = named
print("x=\(x) y=\(y)")

// Key difference: Swift destructures TUPLES (not arrays)
// ArkTS destructures ARRAYS and TUPLES
// Java destructures neither natively
```

### Swift vs ArkTS 关键差异
| 特性 | ArkTS | Swift |
|------|-------|-------|
| 数组解构 `let [a,b] = arr` | ✅ | ❌（仅元组） |
| 元组解构 `let (a,b) = tup` | ❌（用 `[]` 替代） | ✅ `let (a,b) = tup` |
| 跳过元素 | ✅ `[a, , b]` | ❌ |
| Rest 元素 | ❌ ESY165518 | ❌ |
| 嵌套解构 | ❌ 编译器崩溃 | ✅（元组嵌套） |
| 解构赋值 | ❌ 仅声明 | ✅ |
| 类型注释在模式内 | ❌ ESY0229 | ✅ `let (a: Int, b)` |

**关键发现：ArkTS 用 `[...]` 做数组和元组解构，Swift 用 `(...)` 做元组解构（不支持数组解构）。两者语法相似但语义不同。**

---

## 三环境对比总结

| 特性 | ArkTS | Java (21) | Swift (5.x) |
|------|-------|-----------|-------------|
| 数组解构 | ✅ `[a, b] = arr` | ❌ 手动索引 | ❌ 手动索引 |
| 元组解构 | ✅ `[a, b] = tup` | ❌ 无元组类型 | ✅ `(a, b) = tup` |
| 跳过元素 | ✅ `[a, , b]` | ❌ | ❌ |
| Rest 元素 | ❌ ESY165518 | ❌ | ❌ |
| 嵌套解构 | ❌ 编译器崩溃 | ❌ | ✅ 元组嵌套 |
| 解构赋值 `[x,y]=arr` | ❌ | ❌ | ❌（仅元组） |
| 类型安全解构 | ✅（无需 cast） | ❌（需 cast） | ✅ |
| 对象解构 | ❌ inline type限制 | ❌ | ❌（用 keyPath） |
