# 17.1 Type char - 三环境实测验证报告

## ArkTS 实测

| 用例 | 代码 | 结果 |
|------|------|------|
| char 声明 | `let c: char = c'a'` | ✅ compile-pass |
| char 赋给 Object | `let o: Object = c` | ✅ compile-pass |
| int 赋给 char | `let c: char = 65` (int literal) | ❌ compile-fail |
| char 赋给 int | `let n: int = c` | ❌ compile-fail |
| char 作为变量名 | `let char: int = 65` | ❌ compile-fail |
| char 值验证 | `c'a' == 0x61` | ✅ runtime true |
| char 数组 | `char[]` 声明和访问 | ✅ runtime OK |

## Java 实测

| 用例 | 代码 | 结果 |
|------|------|------|
| char 声明 | `char a = 'a'` | ✅ compile-pass |
| char 赋给 Object | `Object o = a` (auto-boxing) | ✅ compile-pass |
| int 赋给 char | `char c = 65` (literal narrowing) | ✅ compile-pass (不同于 ArkTS) |
| char 赋给 int | `int n = a` (widening) | ✅ compile-pass (不同于 ArkTS) |
| char 算术运算 | `a + 1` | ✅ compile-pass (不同于 ArkTS) |
| char 作为变量名 | `int char = 65` | ❌ compile-fail |
| char 值验证 | `'a' == 0x61` | ✅ runtime true |

## Swift 实测

| 用例 | 代码 | 结果 |
|------|------|------|
| char 声明 | N/A（无 char 类型） | N/A |
| Character 类型 | `let c: Character = "a"` | 使用 Character 类型（String 的 Element） |

**Swift 说明：** Swift 没有独立的 char 整数类型。Swift 的 `Character` 类型是扩展字位簇（extended grapheme cluster），可以包含多个 Unicode 标量。Swift 中不存在 char 作为 16 位整数类型的概念。

## 关键差异

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| char 类型本质 | class 类型 | 原始整数类型 | 无对应（Character 是引用类型） |
| char->int 转换 | 禁止 | 允许（widening） | N/A |
| char 算术 | 禁止 | 允许 | N/A |
| char->Object | 直接赋值（子类型） | 自动装箱 | N/A |
