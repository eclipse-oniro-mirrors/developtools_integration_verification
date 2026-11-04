# 3.21.1 Awaited Utility Type - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 一、行为差异与规范一致性概览

`Awaited<T>` 是 ArkTS 编译期 utility type，递归移除 `Promise` 包装。Java 和 Swift 均无编译期等价类型。

## 二、已验证的 ArkTS 规范一致行为

| 类型变换 | 结果 | 用例 |
|---------|------|------|
| `<Promise<string>>` | string | 001 ✅ |
| `<Promise<Promise<number>>>` | number | 002 ✅ |
| `<Promise<Promise<n>\|Promise<s>\|Promise<b>>>` | number\|string\|boolean | 003 ✅ |
| `<boolean \| Promise<number>>` | boolean \| number | 004 ✅ |
| `<Object>` 非 Promise | Object | 005 ✅ |
| `<Promise<(p:Promise<string>)=>Promise<n>>>` | 函数内 Promise 不展开 | 006 ✅ |
| `<Promise<Array<Promise<n>>>>` | 数组内 Promise 不展开 | 007 ✅ |
| `<T>` 协变 | Awaited\<SubType\> <: Awaited\<SuperType\> | 008 ✅ |

## 三、跨语言对比

| 编译期 Promise 类型展开 | ArkTS | Java | Swift |
|------------------------|-------|------|-------|
| `Awaited` 编译期 | ✅ | ❌ | ❌ |
| 对应运行时 | — | `CompletableFuture.thenApply` / `CompletableFuture.join` | `async` / `await` |

## 四、分类汇总

| 分类 | 数量 |
|------|------|
| 符合 ArkTS spec 的语言设计差异 | Awaited 是编译期 unique type，Java/Swift 无对应 |
| 已验证规范一致行为 | 8 项 |
| Spec 与实现不一致 | 0 |

## 报告分类口径

| 分类 | 含义 |
|------|------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec |