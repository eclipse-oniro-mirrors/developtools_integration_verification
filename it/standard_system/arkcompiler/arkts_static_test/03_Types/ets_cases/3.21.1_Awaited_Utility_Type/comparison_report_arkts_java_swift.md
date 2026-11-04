# 3.21.1 Awaited Utility Type - ArkTS vs Java vs Swift 对比报告

## 实测环境

| 语言 | 文件 | 结果 |
|------|------|------|
| ArkTS | 3.21.1_Awaited_Utility_Type 用例集 | ✅ 10/10 |
| Java | `cross_lang_verify/JavaAwaitedNA.java` | ✅ pass=3 |
| Swift | `cross_lang_verify/SwiftAwaitedNA.swift` | ✅ pass=2 |

## 对比表

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 编译期 `Awaited<T>` | ✅ `Awaited<Promise<string>>` → `string` | ❌（CompletableFuture 是运行时） | ❌（async/await 是运行时） |
| 运行时 Promise 操作 | `.then()` / `await` | `CompletableFuture.thenApply()` / `.get()` | `async` / `await` |
| `Promise` 类型展开 | 编译期递归 | 不适用 | 不适用 |

## ArkTS 示例

```typescript
type A = Awaited<Promise<string>>            // string
type B = Awaited<Promise<Promise<number>>>    // number
type C = Awaited<boolean | Promise<number>>   // boolean | number
```

## Java 等价（仅运行时）

```java
CompletableFuture<Integer> cf = CompletableFuture.completedFuture(42);
String result = cf.thenApply(Object::toString).join(); // 运行时
```

## Swift 等价（仅运行时）

```swift
func foo() async -> String { return "hello" }
let result = await foo()  // 运行时
```

## 结论

ArkTS 的 `Awaited<T>` 是编译期 utility type，Java/Swift 无对应概念。三语言的 Promise/Future/async 都是运行时机制。