# 17.1.2 char Operations - 三环境实测验证报告

## ArkTS 实测

| 用例 | 代码 | 结果 |
|------|------|------|
| char == char | `c'a' == c'a'` | ✅ compile-pass, runtime true |
| char < char | `c'a' < c'b'` | ✅ compile-pass, runtime true |
| char === char | `c'a' === c'a'` | ✅ compile-pass, runtime true |
| char == int | `c'a' == 0x61` | ✅ compile-pass, runtime true |
| char < int | `c'a' < 200` | ✅ compile-pass, runtime true |
| char > double | `c'a' > 3.14` | ✅ compile-pass, runtime true |
| char == string | `c'a' == "a"` | ❌ compile-fail |
| char == boolean | `c'a' == true` | ❌ compile-fail |
| char + char | `c'a' + c'b'` | ❌ compile-fail |
| char - int | `c'z' - 1` | ❌ compile-fail |
| char * int | `c'1' * 2` | ❌ compile-fail |
| 无符号比较 | U+FFFF (65535) > U+0041 (65) | ✅ runtime true |

## Java 实测

| 用例 | 代码 | 结果 |
|------|------|------|
| char == char | `'a' == 'a'` | ✅ true |
| char < char | `'a' < 'b'` | ✅ true |
| char == int | `'a' == 0x61` | ✅ true |
| char < int | `'a' < 200` | ✅ true |
| char > double | `'a' > 3.14` | ✅ true |
| char == string | `'a' == "a"` | ❌ compile-fail |
| char == boolean | `'a' == true` | ❌ compile-fail |
| char + char | `'a' + 'b'` | ✅ compile-pass (result: 195, int) |
| char - int | `'z' - 1` | ✅ compile-pass (result: 121, int) |
| char * int | `'1' * 2` | ✅ compile-pass (result: 98, int) |
| 无符号比较 | U+FFFF (65535) > U+0041 (65) | ✅ true |

## Swift 实测

Swift 无 char 整数类型，因此无对应操作。Swift 的 `Character` 类型支持 `==` 但不支持 `<`、`>` 等关系运算。

```swift
let c1: Character = "a"
let c2: Character = "b"
// c1 < c2  // Error: Character does not conform to Comparable
```

## 关键差异

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 比较运算 (==, <, >) | ✅ char vs char, char vs numeric | ✅ char vs char, char vs numeric | ❌ (Character 不支持比较) |
| 算术运算 | ❌ 禁止 | ✅ 允许（结果为 int） | N/A |
| 严格相等 === | ✅ 支持 | N/A（Java 无 ===） | N/A |
| 与 string 比较 | ❌ 编译错误 | ❌ 编译错误 | N/A |
| 无符号 16 位语义 | ✅ | ✅ | N/A |
