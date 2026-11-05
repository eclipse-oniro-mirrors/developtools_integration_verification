# 3.19 Union Types - ArkTS vs Java vs Swift 对比报告

## 实测环境

| 语言 | 文件 | 实测结果 |
|------|------|---------|
| ArkTS | 3.19_Union_Types 用例集 | 10/11（1 个 spec 不一致保留） |
| Java | `cross_lang_verify/JavaUnionTypes.java` | ✅ pass=13 fail=0 |
| Swift | `cross_lang_verify/SwiftUnionTypes.swift` | ✅ pass=12 fail=0 |

---

## 对比表

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 原生 union type | ✅ | ❌ | ❌ |
| 基本 union 值 | ✅ | 接口/类包装 | enum 关联值 |
| union 参数 | ✅ | 接口参数模拟 | enum 参数模拟 |
| instanceof / pattern 收窄 | ✅ instanceof | ✅ instanceof + cast | ✅ switch pattern |
| common field 直接访问 | ✅ | ❌ | ❌ |
| common method 直接访问 | ✅ | ❌（interface 模拟） | ❌（protocol 模拟） |
| 字段类型不同检查 | ⚠️ spec 要求报错，实测未报 | N/A | N/A |
| static member 禁止 | ✅ | N/A | N/A |
| method 签名不同禁止 | ✅ | N/A | N/A |

---

## ArkTS 优势

ArkTS 原生 union 使以下代码直接成立：

```typescript
let u: int | string = 42
u = "hello"

function process(x: int | string): int {
  if (x instanceof string) return x.length
  return x as int
}
```

Java/Swift 需要包装类型：

```java
interface Value {}
final class IntValue implements Value { int value; }
final class StringValue implements Value { String value; }
```

```swift
enum Value { case int(Int), string(String) }
```

---

## ArkTS 问题

Spec 规定 common member 访问要求同名字段类型相同：

```typescript
class A { s: string = "text" }
class B { s: number = 3.14 }
let u: A | B = new A()
console.log(u.s) // spec 预期 compile-time error
```

实测：编译通过。

该问题已记录为：
- `D-3.19-01`（3.19）
- `D-3.19-02`（3.19.2）

---

## 结论

1. ArkTS union type 表达力显著高于 Java/Swift。
2. Java/Swift 需要显式 wrapper 和分支匹配。
3. ArkTS 当前 common field 类型检查不完整，是 spec/实现不一致。
