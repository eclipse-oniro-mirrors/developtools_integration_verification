# 7.16 instanceof Expression — 三语言对比报告

## 1. 概览

instanceof 表达式用于运行时检查对象的实际类型是否是指定类型的子类型。ArkTS 和 Java 使用 `instanceof` 关键字；Swift 使用 `is` 关键字。

| 语言 | 关键字 | 语法 | 结果类型 |
|------|--------|------|---------|
| **ArkTS** | `instanceof` | `expr instanceof T` | `boolean` |
| **Java** | `instanceof` | `expr instanceof T` | `boolean` |
| **Swift** | `is` | `expr is T` | `Bool` |

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 基本类型检查 | `x instanceof B` | `x instanceof B` | `x is B` |
| 不相关类型 | ✅ 返回 false | ✅ 返回 false | ✅ 返回 false |
| null/undefined | ✅ 返回 false | ✅ 返回 false | ✅ 返回 false |
| 泛型类名（擦除） | ✅ `x instanceof B` | ✅ `x instanceof B` | ✅ `x is B<String>` |
| 泛型类型参数 | ❌ `B<T>` 编译错误 | ❌ 类似错误 | ✅ 可对具体类型 |
| 裸类型参数 T | ❌ `T` 编译错误 | ❌ 编译错误 | ❌ 需约束 |
| 接口引用检查 | ✅ `i instanceof A` | ✅ `i instanceof A` | ✅ `i is A` |
| Smart cast | ✅ `if(x instanceof B) x.bar()` | ✅ Java 16+ | ✅ `if let` / `as?` |
| 始终 true 警告 | ✅ W1001506 | ❌ 无警告 | ✅ `is` always true |
| 始终 false 警告 | ✅ W1001506 | ❌ 无警告 | ❌ 无警告 |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 关键字 | `instanceof` | `instanceof` | `is` |
| 泛型类型参数限制 | ❌ 编译错误 | ❌ 编译错误 | ✅ 允许具体泛型 |
| 编译时始终 true 警告 | ✅ | ❌ | ✅ |
| 编译时始终 false 警告 | ✅ | ❌ | ❌ |
| Smart cast 支持 | ✅ if 子句 | ✅ Java 16+ | ✅ if let/as? |

## 4. 关键差异详解

### 4.1 关键字差异 — ArkTS = Java > Swift ⭐

| 语言 | 语法 | 示例 |
|------|------|------|
| ArkTS | `instanceof` | `a instanceof B` |
| Java | `instanceof` | `a instanceof B` |
| Swift | `is` | `a is B` |

ArkTS 和 Java 语法一致；Swift 使用不同的关键字。

### 4.2 泛型类型参数限制 — ArkTS = Java > Swift ⭐⭐

| 语言 | `x instanceof B<T>` | `x instanceof T` |
|------|--------------------|-----------------|
| ArkTS | ❌ ESY18871 | ❌ ESE38251 |
| Java | ❌ 编译错误 | ❌ 编译错误 |
| Swift | ✅ `x is B<String>` | ❌ 需 `T: HasInit` |

ArkTS 和 Java 因类型擦除禁止在 instanceof 中使用泛型类型参数；Swift 因类型具体化允许。

### 4.3 编译时始终 true/false 警告 — ArkTS ≈ Swift > Java ⭐

| 语言 | 始终 true | 始终 false |
|------|-----------|-----------|
| ArkTS | ✅ `W1001506: known at compile-time as true` | ✅ `W1001506: known at compile-time as false` |
| Java | ❌ 无警告 | ❌ 无警告 |
| Swift | ✅ `'is' test is always true` | ❌ 无警告 |

ArkTS 对两种场景都有警告；Swift 仅对始终 true 有警告；Java 完全无此机制。

### 4.4 Smart cast 支持 — 三语言一致 ⭐

```typescript
// ArkTS
if (x instanceof B) {
  return x.bar()  // smart cast: x is B here
}
```

```java
// Java 16+ pattern matching
if (x instanceof B b) {
  return b.bar();
}
```

```swift
// Swift
if let b = x as? B {
  return b.bar()
}
```

三语言都支持 instanceof/is 检查后的类型收窄，只是语法不同。

### 4.5 null/undefined 检查 — 三语言一致 ⭐

`null instanceof Type` 和 `undefined instanceof Type` 都返回 false，三语言一致。

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 基本 instanceof 类层次 | ✅ compile-pass | ✅ | ✅ |
| 002 | Smart cast | ✅ compile-pass | ✅ | ✅ |
| 003 | 泛型类名（擦除） | ✅ compile-pass | ✅ | ✅ |
| 004 | 不相关类型 | ✅ compile-pass | ✅ | ✅ |
| 005 | 超类检查 | ✅ compile-pass | ✅ | ✅ |
| 006 | 布尔表达式 | ✅ compile-pass | ✅ | ✅ |
| 007 | 始终 true 警告 | ✅ compile-pass | ✅（无警告）| ✅（有警告）|
| 008 | 始终 false 警告 | ✅ compile-pass | ✅（无警告）| ✅（无警告）|
| 009 | 泛型参数 `B<T>` | ❌ ESY18871 | ❌ 编译错误 | ✅ 允许 |
| 010 | 类型参数 `T` | ❌ ESE38251 | ❌ 编译错误 | ❌ 需约束 |
| 011 | 运行时 true | ✅ runtime | ✅ | ✅ |
| 012 | 运行时 false | ✅ runtime | ✅ | ✅ |
| 013 | undefined instanceof | ✅ runtime | ✅ | ✅ |
| 014 | 接口引用 instanceof | ✅ runtime | ✅ | ✅ |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语法一致性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| 编译时检查 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 泛型友好度 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 运行时安全 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 开发者体验 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 7. 核心结论

1. **ArkTS ≈ Java**：`instanceof` 关键字和语义高度一致
2. **编译时警告是核心优势**：ArkTS 对始终 true/false 的警告（W1001506）是有价值的质量辅助
3. **泛型限制一致**：类型擦除导致 ArkTS 和 Java 都禁止 `x instanceof B<T>`
4. **Swift `is` 更灵活**：Swift 因类型具体化支持 `x is B<String>`
5. **0 D 类 Spec 不一致**：14/14 用例全部通过

## 8. ArkTS 设计建议

- 当前实现完全符合 spec 规范
- 编译时始终 true/false 警告（W1001506）是有用的功能，建议保持
- 泛型类型参数错误（ESY18871、ESE38251）的提示清晰明确
- Smart cast 与 if 子句的结合使用体验良好
