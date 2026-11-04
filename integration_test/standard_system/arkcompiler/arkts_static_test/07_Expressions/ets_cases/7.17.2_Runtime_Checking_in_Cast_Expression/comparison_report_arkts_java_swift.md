# 7.17.2 Runtime Checking in Cast Expression — 三语言对比报告

## 1. 概览

运行时 cast 检查用于在运行时验证表达式的实际类型是否是指定类型的子类型。ArkTS 和 Swift 使用 `as` 关键字；Java 使用 `(Type)` 强制转换语法。

| 语言 | 关键字 | 语法 | 运行时错误 | 安全替代方案 |
|------|--------|------|-----------|-------------|
| **ArkTS** | `as` | `expr as T` | `ClassCastError` (可捕获) | `instanceof + as` |
| **Java** | `(Type)` | `(T) expr` | `ClassCastException` (可捕获) | `instanceof + (T)` |
| **Swift** | `as!` / `as?` | `expr as! T` / `expr as? T` | `fatal error` (不可恢复) | `as?` 可选转换 |

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 子类型 cast 成功 | `d as C` ✅ | `(C) d` ✅ | `d as C` ✅ |
| 非子类型 cast 抛异常 | `42 as string` → ClassCastError | `(String) 42` → ClassCastException | `42 as! String` → fatal error |
| instanceof 守卫 + cast | `if(x instanceof T) x as T` | `if(x instanceof T) (T)x` | `if let p = x as? T` |
| 不相关类 cast | A 实例 as B → ClassCastError | `(B) new A()` → ClassCastException | `a as! B` → fatal error |
| instanceof false → as 抛异常 | `!(x instanceof T) ⇒ as T` → ClassCastError | 同左 | `x as! T` |
| 编译时 always-succeeds 警告 | ✅ W1001506 | ❌ 无警告 | ⚠️ 无警告 (上行 as 无操作) |
| 编译时 always-throws 警告 | ✅ W1001506 | ❌ 无警告 | ❌ 无警告 |
| Smart cast (不写 as) | ✅ `if(x instanceof T) x.field` | ✅ Java 16+ | ✅ `if let` |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 运行时类型检查 | ✅ as | ✅ (Type) | ✅ as! / as? |
| 异常类型 | `ClassCastError` | `ClassCastException` | `fatal error` (不可恢复) |
| 异常可捕获 | ✅ | ✅ | ❌ |
| 安全可选转换 | instanceof + as | instanceof + (Type) | as? (原生支持) |
| 编译时始终成功警告 | ✅ | ❌ | ❌ |
| 编译时始终失败警告 | ✅ | ❌ | ❌ |
| Smart cast 免 cast | ✅ | ✅ Java 16+ | ✅ if let |

## 4. 关键差异详解

### 4.1 异常可恢复性 — Java = ArkTS > Swift ⭐⭐⭐

| 语言 | 非子类型 cast | 异常 | 可捕获 |
|------|--------------|------|--------|
| ArkTS | `x as string` (x=42) | `ClassCastError` | ✅ try-catch |
| Java | `(String) x` (x=42) | `ClassCastException` | ✅ try-catch |
| Swift | `x as! String` (x=42) | `fatal error` | ❌ 不可恢复 |

Swift 的 `as!` 强制解包是语言设计中的"程序员确信"语义，类型不匹配时直接崩溃。ArkTS 和 Java 的运行时类型检查是可恢复异常，更健壮。

### 4.2 安全 cast 模式 — Swift > ArkTS > Java ⭐⭐

```java
// Swift — 原生 as? 安全可选转换
if let p = x as? Person {
    print(p.name)
}
```

```typescript
// ArkTS — instanceof + as 模式
if (x instanceof Person) {
    // Smart cast: 不需要 as Person
    console.log(x.name)
}
```

```java
// Java — instanceof + (Type) 模式
if (x instanceof Person p) {  // Java 16+
    System.out.println(p.name);
}
```

三语言都支持安全 cast 模式，但 Swift 的 `as?` 语法最简洁（一行完成检查+转换）。ArkTS 的 Smart cast 使 instanceof 后无需写 as，使用体验良好。

### 4.3 编译时警告 — ArkTS 独有 ⭐

| 场景 | ArkTS | Java | Swift |
|------|-------|------|-------|
| always-succeeds cast | ✅ W1001506 警告 | ❌ 无警告 | ❌ 无警告 |
| always-throws cast | ✅ W1001506 警告 | ❌ 无警告 | ❌ 无警告 |

ArkTS 是唯一在编译时对已知 always-succeeds/always-throws 的 cast 发出警告的语言。这是有益的质量辅助。

### 4.4 子类型 cast 语义 — 三语言一致 ⭐

```typescript
// ArkTS
let d: D = new D()
let c: C = d as C  // 运行时成功
```

```java
// Java
D d = new D();
C c = (C) d;  // 运行时成功
```

```swift
// Swift
let d = D()
let c = d as C  // 编译时安全，无运行时开销
```

三语言子类型 cast 语义完全一致。

### 4.5 Swift as 关键差异 — Swift ≠ ArkTS/Java ⭐⭐⭐

Swift 有三种 as 变体：
- `as` — 编译时已知安全的上行转型（如 D→C）
- `as?` — 运行时可选转换，失败返回 nil
- `as!` — 运行时强制解包，失败 fatal error

ArkTS/Java 只有一种运行时 cast 语法，失败抛异常。Swift 的 `as!` 不可恢复与其安全至上的设计哲学看似矛盾，实际是"程序员明确承担风险"的语义标记。

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | Object as string（编译） | ✅ compile-pass | ✅ | ✅ |
| 002 | 子类 as 超类（编译+警告） | ✅ compile-pass | ✅ | ✅ |
| 003 | 不相关子类 as（编译+警告）| ✅ compile-pass | ✅ | ✅ |
| 004 | instanceof 守卫+as（编译） | ✅ compile-pass | ✅ | ✅ |
| 005 | string as Object（编译） | ✅ compile-pass | ✅ | ✅ |
| 006 | instanceof smart cast | ✅ compile-pass | ✅ | ✅ |
| 011 | 子类 as 超类（运行时） | ✅ runtime | ✅ | ✅ |
| 012 | 非子类型 as（→ClassCastError）| ✅ ClassCastError | ✅ ClassCastException | ❌ fatal error |
| 013 | instanceof 守卫（运行时安全）| ✅ runtime | ✅ | ✅ as? |
| 014 | 不相关类 as（→ClassCastError）| ✅ ClassCastError | ✅ ClassCastException | ❌ fatal error |
| 015 | instanceof false 后 as（→ClassCastError）| ✅ ClassCastError | ✅ ClassCastException | ❌ fatal error |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 运行时检查正确性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 异常可恢复性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐ |
| 安全 cast 便利性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 编译时警告 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| 语法一致性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ (三种变体) |
| 开发者体验 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 7. 核心结论

1. **ArkTS ≈ Java**：`as`/`(Type)` 运行时类型检查语义高度一致，异常都可捕获
2. **编译时警告是 ArkTS 独有优势**：对 always-succeeds/always-throws 的 cast 发出警告
3. **Swift `as!` 不可恢复**：Swift 强制解包设计与 ArkTS/Java 的异常处理体系不同
4. **Swift `as?` 更简洁**：`as?` 原生安全可选转换比 `instanceof + as` 模式更直接
5. **Smart cast 是共性**：三语言都支持 instanceof/is 检查后的类型收窄
6. **0 D 类 Spec 不一致**：11/11 用例全部通过

## 8. ArkTS 设计建议

- 当前实现完全符合 spec 规范
- 编译时 always-succeeds/always-throws 警告（W1001506）是独有优势，建议保持
- Smart cast + instanceof 的组合使大多数场景无需写 as，体验良好
- ClassCastError 可捕获的设计比 Swift as! 更健壮
- 无括号 `expr as T` 语法比 Java `(T) expr` 前缀转换更可读
