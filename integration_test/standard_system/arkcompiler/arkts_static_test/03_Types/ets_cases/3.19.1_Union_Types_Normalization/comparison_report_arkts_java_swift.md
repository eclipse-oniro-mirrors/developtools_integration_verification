# 3.19.1 Union Types Normalization - ArkTS vs Java vs Swift 对比报告

## 概述

ArkTS 支持原生 union type，并定义规范化流程。Java 和 Swift 均无原生 union type，因此只能用 interface/class hierarchy 或 enum 关联值模拟。

## Java/Swift 实测环境

| 语言 | 文件 | 实测结果 |
|------|------|---------|
| Java | `cross_lang_verify/3.19.1_union_normalization/JavaUnionNormalization.java` | ✅ pass=9 fail=0 |
| Swift | `cross_lang_verify/3.19.1_union_normalization/SwiftUnionNormalization.swift` | ✅ pass=10 fail=0 |

## 对比表

| 特性 | ArkTS | Java（实测） | Swift（实测） |
|------|-------|-------------|---------------|
| 原生 union | ✅ | ❌（interface 模拟） | ❌（enum 模拟） |
| 嵌套 union 扁平化 | ✅ | N/A | N/A |
| type alias 展开 | ✅ | N/A | ✅ typealias（但无 union） |
| 重复类型消除 | ✅ | N/A | N/A |
| string literal 被 string 吸收 | ✅ | N/A（字面量天然是 String） | N/A（字面量天然是 String） |
| never 消除 | ✅ | N/A（无 never） | Never 存在但无 union normalization |
| readonly union priority | ⚠️ Spec 支持，实测有 bug | N/A | N/A（let/var 控制） |

## ArkTS 独有能力

```typescript
type U = (int | string) | (boolean | double)
// 自动归一化为 int | string | boolean | double
```

Java/Swift 需要显式建模：

```java
interface UnionValue {}
final class IntValue implements UnionValue { int value; }
final class StringValue implements UnionValue { String value; }
```

```swift
enum UnionValue {
  case int(Int)
  case string(String)
  case bool(Bool)
}
```

## 关键问题

Spec 要求：

```typescript
number[] | readonly number[] // normalized as readonly number[]
```

但实测：

```typescript
type U = number[] | readonly number[]
let arr: number[] = [1.0, 2.0]
let u: U = arr
u[0] = 3.0 // 编译通过，违反 spec
```

已记录为 `D-3.19.1-01`。

## 结论

1. ArkTS union normalization 是强表达力特性，Java/Swift 无原生对应
2. Java/Swift 的 union 模拟都需要显式 wrapper，无法自动归一化
3. 当前 ArkTS 实现对 readonly priority 未完全符合 spec
4. 该问题已保留 FAIL 用例并记录到 issue_report.md
