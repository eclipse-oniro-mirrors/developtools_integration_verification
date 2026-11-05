# 3.19.3 Keyof Types - ArkTS vs Java vs Swift 对比报告

## Java/Swift 实测环境

| 语言 | 文件 | 实测结果 |
|------|------|---------|
| Java | `cross_lang_verify/JavaKeyofTypes.java` | ✅ pass=7 fail=0 |
| Swift | `cross_lang_verify/SwiftKeyofTypes.swift` | ✅ pass=4 fail=0 |

## 对比表

| 特性 | ArkTS | Java（实测） | Swift（实测） |
|------|-------|-------------|---------------|
| compile-time keyof | ✅ | ❌ | ❌ |
| class 字段名 union | ✅ | 反射模拟 | Mirror 模拟字段 |
| class 方法名 union | ✅ | 反射可取方法 | Mirror 不含方法 |
| interface/protocol 成员名 | ✅ | 反射可取 | 无 compile-time 支持 |
| 空 class keyof = never | ✅ | 反射空集合 | Mirror 空集合 |
| 非 class/interface 应报错 | ⚠️ spec 要求，实测未报 | N/A | N/A |

## ArkTS 示例

```typescript
class A {
  field: number
  method() {}
}
type KeysOfA = keyof A // "field" | "method"
let k: KeysOfA = "field"
```

## Java 实测模拟

```java
Set<String> keys = keysOfClass(A.class)
keys.contains("field")
keys.contains("method")
```

## Swift 实测模拟

```swift
let names = Mirror(reflecting: A()).children.compactMap { $0.label }
// Mirror 只能拿字段，不包含方法
```

## 关键问题

Spec 要求：

```typescript
type Wrong = keyof number // 应 compile-time error
```

实测：编译通过。

已记录为 `D-3.19-03`。
