# 7.16 instanceof Expression — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 关键字差异 ArkTS = Java > Swift ⭐

| 字段 | 值 |
|------|-----|
| **问题描述** | ArkTS 和 Java 使用 `instanceof` 关键字；Swift 使用 `is` 关键字 |
| **分类** | 语言设计差异 |
| **结论** | 符合各自语言的 spec 定义 |

**跨语言对比**：

| 语言 | 关键字 | 示例 |
|------|--------|------|
| ArkTS | `instanceof` | `a instanceof B` |
| Java | `instanceof` | `a instanceof B` |
| Swift | `is` | `a is B` |

**分类**：语言设计差异

**建议**：无 — 符合各自语言规范。

---

### ID-02: 泛型类型参数限制 ArkTS = Java > Swift ⭐⭐

| 字段 | 值 |
|------|-----|
| **问题描述** | ArkTS 和 Java 禁止在 instanceof 中使用泛型类型参数（`B<T>` 或 `T`）；Swift 对具体泛型类型（`B<String>`）允许 `is` 检查 |
| **分类** | 语言设计差异 |
| **原因** | ArkTS 和 Java 使用类型擦除，运行时无法获取泛型类型参数 |

**跨语言对比**：

| 语言 | `x instanceof B<T>` | `x instanceof T` |
|------|--------------------|-----------------|
| ArkTS | ❌ ESY18871 | ❌ ESE38251 |
| Java | ❌ 编译错误 | ❌ 编译错误 |
| Swift | ✅ `x is B<String>` | ❌ 需 `T: HasInit` |

**分类**：语言设计差异

**建议**：无 — 类型擦除是设计选择。

---

### ID-03: 编译时始终 true/false 警告 ArkTS ≈ Swift > Java ⭐

| 字段 | 值 |
|------|-----|
| **问题描述** | ArkTS 和 Swift 对始终 true/false 的 instanceof/is 表达式发出编译时警告；Java 无此机制 |
| **ArkTS 输出** | `Warning W1001506: the value of the instanceof expression is known at compile-time as true/false` |
| **Swift 输出** | `warning: 'is' test is always true` |
| **分类** | 语言设计差异（Java 缺少此特性） |

**跨语言对比**：

| 语言 | 始终 true | 始终 false |
|------|-----------|-----------|
| ArkTS | ✅ `W1001506: known at compile-time as true` | ✅ `W1001506: known at compile-time as false` |
| Java | ❌ 无警告 | ❌ 无警告 |
| Swift | ✅ `'is' test is always true` | ❌ 无警告 |

**分类**：语言设计差异

**建议**：保持 ArkTS 的编译时警告机制，这是有价值的质量辅助特性。

---

### ID-04: Smart cast 三语言均有支持 ⭐

| 字段 | 值 |
|------|-----|
| **问题描述** | 三语言都支持 instanceof/is 检查后类型收窄 |
| **ArkTS** | `if(x instanceof B) { x.bar() }` |
| **Java** | `if(x instanceof B) { ((B)x).bar() }` 或 Java 16+ `if(x instanceof B b) { b.bar() }` |
| **Swift** | `if let b = x as? B { b.bar() }` |
| **分类** | 三语言一致 |

**跨语言对比**：

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

**分类**：三语言一致

**建议**：无 — 三语言均已支持。

---

### ID-05: 接口引用的 instanceof 三语言一致

| 字段 | 值 |
|------|-----|
| **问题描述** | 三语言都允许对接口类型引用进行 instanceof/is 检查具体类 |
| **分类** | 三语言一致 |

**跨语言对比**：三语言均支持接口引用 instanceof 检查，行为一致。

**分类**：三语言一致

**建议**：无。

---

## 总结

| 项目 | 数值 |
|------|------|
| 总用例 | 14/14 |
| D 类 Spec 不一致 | 0 |
| 主要设计差异 | `is` vs `instanceof` 关键字差异、泛型类型参数限制差异、编译时警告差异 |
| 一致性评级 | ArkTS ≈ Java（最相似）> Swift |
