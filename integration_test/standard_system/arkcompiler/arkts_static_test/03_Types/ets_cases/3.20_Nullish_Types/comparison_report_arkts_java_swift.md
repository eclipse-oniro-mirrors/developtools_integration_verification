# 3.20 Nullish Types - ArkTS vs Java vs Swift 对比报告

## 实测环境

| 语言 | 文件 | 实测结果 |
|------|------|---------|
| ArkTS | 3.20_Nullish_Types 用例集 | ✅ pass=22 fail=0 |
| Java | `cross_lang_verify/JavaNullishTypes.java` | ✅ pass=9 fail=0 |
| Swift | `cross_lang_verify/SwiftNullishTypes.swift` | ✅ pass=9 fail=0 |

## 对比表

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| nullish 形式 | `T|null`, `T|undefined` | `null` / `Optional<T>` | `T?` |
| undefined | ✅ | ❌ | ❌ |
| null | ✅ | ✅ | ✅ nil |
| Object 接收 null | ❌ | ✅ | ❌ AnyObject? 才可 nil |
| safe field | `obj?.field` | 手动判 null | `obj?.field` |
| nullish coalescing | `??` | `Optional.orElse` 或判空 | `??` |
| ensure not nullish | `expr!` | 手动判断 / Objects.requireNonNull | `expr!` |
| direct null member access | compile-fail | runtime NPE | compile-fail（optional 未解包） |

## 关键差异

### ArkTS vs Java

Java 的 null 可赋给任意引用类型：

```java
String s = null;
Object o = null;
```

ArkTS 更严格：

```typescript
let s: string = null   // compile-fail
let o: Object = null   // compile-fail
let s2: string | null = null // OK
```

### ArkTS vs Swift

Swift 与 ArkTS 都是类型系统级 null 安全：

```swift
var s: String? = nil
let x = s ?? "fallback"
let len = s?.count
```

ArkTS 对应：

```typescript
let s: string | undefined = undefined
let x = s ?? "fallback"
let len = s?.length
```

## 结论

1. ArkTS nullish 类型设计更接近 Swift Optional，而不是 Java null
2. ArkTS 比 Java 安全：Object 不接受 null/undefined
3. ArkTS 比 Swift 多出 undefined 维度，并推荐使用 `T | undefined`
4. Java Optional 是库类型，不是语言级 nullish type
