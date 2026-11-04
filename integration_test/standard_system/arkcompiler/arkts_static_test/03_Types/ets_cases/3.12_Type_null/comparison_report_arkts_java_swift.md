# 3.12 Type null - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| null 类型 | 独立类型 `null`，唯一值 `null` | 无 `null` 类型，`null` 是引用类型的特殊值 | 无 `null` 类型，`nil` 是 Optional 的特殊值 |
| null 在类型系统中的位置 | `null` 是 `Any` 的子类型，不是 `Object` 的子类型 | `null` 可赋给任何引用类型 | `nil` 是 `Optional<T>.none`，不直接存在于类型系统 |
| 推荐做法 | 推荐用 `undefined` 替代 `null` | `null` 是标准做法 | 推荐用 Optional（非 nil） |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| null 字面量声明 | `let x: null = null` | N/A（无 null 类型） | N/A |
| 联合类型 T \| null | `int \| null` | `Integer`（包装类） | `Int?`（Optional） |
| 三重联合 T \| null \| undefined | 支持 | N/A | N/A |
| null 赋值给非空类型 | **compile-time error** | 引用类型：OK；基本类型：compile error | compile error |
| nullish 不兼容 Object | **compile-time error** | OK（null 是 Object 兼容的） | N/A（Optional 解包） |
| null 在 switch-case | `case null:` 支持 | 不支持（NPE） | `case nil:` 支持 |
| null 与 undefined 区别 | 严格不同类型 | N/A（Java 只有 null） | N/A（Swift 只有 nil） |
| Any 接受 null | OK（null 是 Any 子类型） | OK（Object 接受 null） | N/A |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **类型严格性** | `null` 是独立类型，`int \| null` 必须显式声明 | 基本类型自动拒绝 null，引用类型隐式 nullable | 所有类型默认 non-null，`Optional<T>` 显式 nullable |
| **类型表达力** | `T \| null`、`T \| undefined`、`T \| null \| undefined` 三种 nullish | 仅引用类型可 null，无联合类型语法 | `T?` 即 Optional<T>，单一 nullable 语法 |
| **null 安全** | nullish 不兼容 Object（compile-time error） | null 可赋给任何引用类型（无编译期保护） | Optional 强制解包，编译期安全 |
| **数值精确度** | `int \| null` 明确区分 null 和 0 | `Integer` 可为 null，unboxing 可能 NPE | `Int?` 明确区分 |
| **整数溢出安全** | `int \| null` 不影响整数运算 | `Integer` null 导致 unboxing NPE | `Int?` 安全 |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 Null 字面量声明

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | null 字面量声明 `let x: null = null` | ✅ compile-pass | ✅ `String x = null` (引用类型可 null) | ✅ `String? x = nil` (Optional) |

**代码对照：**

ArkTS (compile-pass):
```typescript
let x: null = null
let y: null = null
```

Java:
```java
String x = null;  // 引用类型隐式 nullable
Object y = null;
```

Swift:
```swift
var x: String? = nil   // Optional<String>
var y: String? = nil
```

---

### 4.2 Nullable 值类型 (int | null)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 002 | `int \| null` / `Integer` / `Int?` | ✅ compile-pass | ✅ `Integer` 包装类 | ✅ `Int?` Optional |

**代码对照：**

ArkTS:
```typescript
let x: int | null = null
x = 42
x = null
```

Java:
```java
Integer x = null;
x = 42;    // autoboxing
x = null;
```

Swift:
```swift
var x: Int? = nil
x = 42
x = nil
```

---

### 4.3 Nullable 引用类型 (string | null)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 003 | `string \| null` | ✅ compile-pass | ✅ `String` 天然 nullable | ✅ `String?` Optional |

---

### 4.4 Nullable Object (Object | null)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 004 | `Object \| null` / `Object` nullable / `Any?` | ✅ compile-pass | ✅ `Object` 天然 nullable | ✅ `Any?` |

---

### 4.5 三重联合 (T | null | undefined)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 005 | `int \| null \| undefined` | ✅ compile-pass | N/A（无 undefined 概念） | N/A（无 undefined 概念） |

ArkTS 独有：Java 和 Swift 都没有与 `undefined` 对应的概念。

---

### 4.6 函数返回 null

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 006 | 函数返回 `string \| null` | ✅ compile-pass + runtime ✅ | ✅ `String` 天然可返 null | ✅ `String?` |

**代码对照：**

ArkTS:
```typescript
function maybeNull(v: int): string | null {
  if (v > 0) return "positive"
  return null
}
```

Java:
```java
static String maybeNull(int v) {
    if (v > 0) return "positive";
    return null;
}
```

Swift:
```swift
func maybeNull(_ v: Int) -> String? {
    if v > 0 { return "positive" }
    return nil
}
```

---

### 4.7 函数参数传 null

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 007 | `acceptNullable(string \| null)` | ✅ compile-pass + runtime ✅ | ✅ `String` 天然可传 null | ✅ `String?` |

---

### 4.8 Null 在 switch-case ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 008 | `case null:` / `case nil:` | ✅ compile-pass | ❌ **NullPointerException** (runtime) | ✅ `case nil` |

**代码对照：**

ArkTS (compile-pass, runtime ✅):
```typescript
let x: string | null = null
switch (x) {
  case null: break
  default: break
}
```

Java (**runtime NPE**):
```java
String x = null;
switch (x) {          // throws NullPointerException!
  case null: break;   // never reached
}
// 必须用 if-else 替代：
if (x == null) { ... }
```

Swift (compile-pass, runtime ✅):
```swift
var x: String? = nil
switch x {
case nil: break
default: break
}
```

---

### 4.9 Any 接受 null ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 009 | `Any` 类型接受 null | ✅ compile-pass + runtime ✅ | ✅ `Object` 接受 null | ✅ `Any?` |

---

### 4.10 类字段 T | null

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 010 | 类字段 `string \| null = null` | ✅ compile-pass | ✅ `String` 字段默认 null | ✅ `String?` |

---

### 4.11 数组元素 T | null

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 011 | `(string \| null)[]` | ✅ compile-pass | ✅ `String[]` 天然包含 null | ✅ `[String?]` |

---

### 4.12 null 与 undefined 类型不兼容

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 012 | `null` 类型 vs `undefined` 类型 | ✅ compile-pass | N/A | N/A |

ArkTS 独有概念。

---

### 4.13 ⭐ null 赋值给非空类型 (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 013 | `let n: int = null` 等 | ✅ **compile-fail** (预期报错) | ⚠️ 引用类型 OK, 基本类型 compile error | ✅ **compile-fail** (预期报错) |

**代码对照：**

ArkTS (compile-fail, 符合预期):
```typescript
let n: int = null       // ✅ compile-time error
let s: string = null     // ✅ compile-time error
let o: Object = null    // ✅ compile-time error
```

Java (⚠️ 引用类型允许 null):
```java
String s = null;         // ⚠️ OK - 引用类型隐式 nullable
Object o = null;         // ⚠️ OK - 引用类型隐式 nullable
int n = null;            // ✅ compile error - 基本类型
```

Swift (compile-fail, 符合预期):
```swift
var n: Int = nil        // ✅ compile error
var s: String = nil      // ✅ compile error (String 默认 non-null)
```

**关键差异**: ArkTS 和 Swift 都在编译期拒绝 null 赋给非空类型；Java 仅对基本类型拒绝，引用类型隐式允许 null。

---

### 4.16 ⭐ Nullish 不兼容 Object (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 016 | `Object \| null` 赋值给 `Object` | ✅ **compile-fail** (预期报错) | ⚠️ **compile-pass** (Java 允许) | ✅ **compile-fail** (需解包) |

**代码对照：**

ArkTS (compile-fail):
```typescript
let nullable: Object | null = null
let o: Object = nullable  // compile-time error
```

Java (⚠️ compile-pass):
```java
Object nullable = null;
Object o = nullable;      // OK - null is assignment-compatible with Object
```

Swift (compile-fail):
```swift
let nullable: Any? = nil
let o: Any = nullable     // compile error - must unwrap Optional
```

---

### 4.17 null 类型只能持有 null

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 017 | `let x: null = 42` | ✅ compile-fail | N/A | N/A |

---

### 4.18 undefined 不能赋给 null 类型

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 018 | `let x: null = undefined` | ✅ compile-fail | N/A | N/A |

---

### 4.19 函数返回非空类型但返回 null

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 019 | `function f(): string { return null }` | ✅ compile-fail | ⚠️ compile-pass (String 天然 nullable) | ✅ compile-fail |

---

### 4.22 Runtime: null 联合类型收窄

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 022 | `if (s == null)` 后安全访问 | ✅ runtime | ✅ runtime (`if (s == null)`) | ✅ runtime (`if let s = s`) |

---

### 4.23 Runtime: null 与 undefined 严格不等

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 023 | `null !== undefined` | ✅ runtime | N/A (Java 无 undefined) | N/A (Swift 无 undefined) |

---

### 4.24 Runtime: null 在数组中的检测

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 024 | 遍历 `(string \| null)[]` 统计 null | ✅ runtime | ✅ runtime | ✅ runtime |

---

### 4.25 Runtime: null 在 switch-case

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 025 | `case null:` / `case nil:` 匹配 | ✅ runtime | ❌ NPE (必须用 if-else) | ✅ runtime |

---

### 4.26 Runtime: 函数返回 null

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 026 | 函数返回 null/nil | ✅ runtime | ✅ runtime | ✅ runtime |

---

### 4.27 Runtime: Any 接受 null

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 027 | `Any` 变量持有 null | ✅ runtime | ✅ runtime (`Object`) | ✅ runtime (`Any?`) |

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类型严格性 | ★★★★★ | ★★☆☆☆ | ★★★★★ |
| 类型表达力 | ★★★★☆ | ★★☆☆☆ | ★★★★☆ |
| null 安全 | ★★★★★ | ★☆☆☆☆ | ★★★★★ |
| 数值精确度 | ★★★★★ | ★★★☆☆ | ★★★★★ |
| 整数溢出安全 | ★★★★☆ | ★★★☆☆ | ★★★★★ |

## 6. 核心结论

1. **ArkTS 的 null 设计比 Java 更安全**：ArkTS 强制 `null` 不能赋给非空类型，且 nullish 类型不兼容 `Object`，这比 Java 的隐式 nullable 更严格。
2. **ArkTS 与 Swift 哲学相似**但语法不同：ArkTS 用联合类型 `T | null`，Swift 用 `Optional<T>` / `T?`。
3. **ArkTS 独有的 `undefined`**：Java 和 Swift 没有与 `undefined` 对应的概念，这使得 ArkTS 的 nullish 体系更复杂（`T | null`、`T | undefined`、`T | null | undefined`）。
4. **ArkTS 推荐用 `undefined` 替代 `null`** 是合理的设计决策，因为 `undefined` 与 `void` 等价，语义更清晰。

## 7. ArkTS 设计建议

1. **当前设计合理**：null 不兼容 Object 的规则在编译期消除了大量 NPE 风险。
2. **`undefined` 替代 `null` 的推荐**是正确的，可简化 nullish 体系为 `T | undefined` 单一形式。
3. **`case null:` 在 switch 中支持**是一个好的设计，比 Java 的 NullPointerException 更安全。
4. **建议考虑**：在未来的版本中是否可以废弃 `null` 关键字，统一使用 `undefined`，以减少语言复杂度。

## 8. Swift 实测结果

Swift 5.10 在 WSL 中实测，所有用例编译并运行通过：

| 用例 | 结果 |
|------|------|
| 001_NullLiteral | ✅ `x=nil, y=nil` |
| 002_NullableInt | ✅ `x=-1, y=-1` (Int? 解包) |
| 003_NullableString | ✅ `s=nil` |
| 004_NullableObject | ✅ `o=nil` |
| 005_TripleUnion | ✅ `x=nil` (Any?) |
| 006_FunctionReturnNull | ✅ `r1=positive, r2=nil` |
| 007_FunctionParamNull | ✅ 返回 -1 和 5 |
| 008_NullSwitch | ✅ `is_nil, is_empty, is_string` |
| 009_NullAny | ✅ `a=42` |
| 013_NullAssignNonNullish | ✅ DIFFERENCE 标注：Swift 不允许 nil 赋给非 Optional |
| 016_NullishToObject | ✅ DIFFERENCE 标注：Swift 需要解包 |
| 022_RuntimeNarrowing | ✅ assert 通过 |
| 025_RuntimeSwitch | ✅ assert 通过 |

关键发现：
- Swift 的 `nil` 行为与 ArkTS 的 `null` 高度一致（不允许赋给非 Optional 类型）
- Swift 用 `Optional<T>` / `T?` 替代 ArkTS 的 `T | null`
- Swift `case nil:` 在 switch 中与 ArkTS `case null:` 语义等价