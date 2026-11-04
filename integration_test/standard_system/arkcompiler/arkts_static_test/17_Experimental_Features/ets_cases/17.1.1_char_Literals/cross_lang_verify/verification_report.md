# 17.1.1 char Literals - 三环境实测验证报告

## ArkTS 实测

| 用例 | 代码 | 结果 |
|------|------|------|
| ASCII 字面量 | `c'a'`, `c'Z'`, `c'0'` | ✅ compile-pass |
| 转义序列 | `c'\n'`, `c'\t'`, `c'\r'`, `c'\\'` | ✅ compile-pass |
| 十六进制转义 | `c'\x41'`, `c'\x7F'`, `c'\x00'`, `c'\xFF'` | ✅ compile-pass |
| Unicode 转义 | `c'A'` (U+0041) | ✅ compile-pass |
| 边界值 | `c'\x00'` (U+0000), `c'￿'` (U+FFFF) | ✅ compile-pass |
| 空字面量 | `c''` | ❌ compile-fail |
| 多字符 | `c'ab'` | ❌ compile-fail |
| 超出范围 | `c'\u{FFFFF}'` | ❌ compile-fail |
| 非法转义 | `c'\q'` | ⚠️ compiles OK (SPEC 不一致) |
| 非法十六进制 | `c'\xGG'` | ❌ compile-fail |
| 值验证 | `c'a' == 0x61` (97) | ✅ runtime true |
| 转义值 | `c'\n' == 0x0A` (10) | ✅ runtime true |
| 边界值 | `c'￿' == 65535` | ✅ runtime true |

## Java 实测

| 用例 | 代码 | 结果 |
|------|------|------|
| ASCII 字面量 | `'a'`, `'Z'`, `'0'` | ✅ compile-pass |
| 转义序列 | `'\n'`, `'\t'` | ✅ compile-pass |
| 十六进制转义 | N/A（Java 不支持 \xHH） | ❌ compile-fail |
| Unicode 转义 | `'A'` (U+0041) | ✅ compile-pass |
| 边界值 | `0`, `65535` | ✅ compile-pass |
| 空字面量 | `''` | ❌ compile-fail |
| 多字符 | `'ab'` | ❌ compile-fail |
| 超出范围 | `'\u{FFFFF}'` | ❌ compile-fail（非法语法） |
| 值验证 | `'a' == 0x61` | ✅ runtime true |
| 边界值 | `65535 (U+FFFF)` | ✅ runtime true |

## Swift 实测

Swift 无 char 字面量概念。Swift 使用 `Character` 类型：
```swift
let c: Character = "a"  // 字符串字面量
```
Swift 不支持 `c'X'` 或 `\xHH` 格式的字符字面量。转义序列在 Swift 字符串中使用 `\n`、`\t` 等。

## 关键差异

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| char 字面量语法 | `c'X'` | `'X'` | N/A（使用字符串字面量） |
| 十六进制转义 | `\xHH` | 不支持 | N/A |
| Unicode 转义 | `A` | `A` | `{N}` 在字符串中 |
| 超出 BMP 码点 | `\u{FFFFF}` 编译错误 | 无此语法 | N/A |
| 字面量类型 | char | char (int) | N/A |
