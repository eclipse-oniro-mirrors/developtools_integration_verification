# 15.1.5 Specifics of String Operator Contexts - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 字符串运算符上下文 | `+` 用于字符串连接 | `+` 用于字符串连接 | `+` 运算符需重载，常用 `String(describing:)` 或插值 |
| 字符串转换 | ✅ 自动转换（数字、布尔等） | ✅ 自动转换（通过 `toString()`） | ⚠️ 需显式转换或插值 |
| 字符串与布尔连接 | ✅ 支持（`true` → `"true"`） | ✅ 支持（`true` → `"true"`） | ⚠️ 需显式转换 |
| 字符串减法 | ❌ 不支持 | ❌ 不支持 | ❌ 不支持 |
| 字符串连接运行时 | ✅ 支持 | ✅ 支持 | ✅ 支持 |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 字符串运算符转换 | `"value: " + 42` → `"value: 42"` | `"value: " + 42` → `"value: 42"` | `"value: \(42)"` 或 `"value: " + String(42)` |
| 字符串与布尔连接 | `"value: " + true` → `"value: true"` | `"value: " + true` → `"value: true"` | `"value: \(true)"` 或 `"value: " + String(true)` |
| 字符串减法 | `"a" - "b"` ❌ | `"a" - "b"` ❌ | `"a" - "b"` ❌ |
| 字符串连接运行时 | `"a" + "b"` → `"ab"` | `"a" + "b"` → `"ab"` | `"a" + "b"` → `"ab"` |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **字符串连接** | ★★★★★ `+` 运算符 | ★★★★★ `+` 运算符 | ★★★★☆ `+` 或插值 |
| **自动类型转换** | ★★★★★ 自动转换 | ★★★★★ 自动转换 | ★★★☆☆ 需显式转换 |
| **字符串减法** | ☆☆☆☆☆ 不支持 | ☆☆☆☆☆ 不支持 | ☆☆☆☆☆ 不支持 |
| **字符串插值** | ★★★★☆ 模板字符串 | ★★★☆☆ 格式化字符串 | ★★★★★ 字符串插值 |
| **语义模型** | 静态类型，运行时连接 | 静态类型，运行时连接 | 静态类型，编译期优化 |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 字符串运算符转换

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 011 | 字符串转换 | ✅ compile-pass | ✅ compile-pass | ⚠️ 需显式转换 |

**代码对照：**

ArkTS (compile-pass):
```typescript
let x = "value: " + 42     // "value: 42"
let y = "value: " + true    // "value: true"
let z = "value: " + 3.14    // "value: 3.14"
```

Java (compile-pass):
```java
String x = "value: " + 42;     // "value: 42"
String y = "value: " + true;   // "value: true"
String z = "value: " + 3.14;   // "value: 3.14"
```

Swift (⚠️ 需显式转换):
```swift
let x = "value: " + String(42)     // "value: 42"
let y = "value: " + String(true)   // "value: true"
let z = "value: " + String(3.14)   // "value: 3.14"
// 或使用插值
let x1 = "value: \(42)"
let y1 = "value: \(true)"
let z1 = "value: \(3.14)"
```

**关键差异**: ArkTS 和 Java 自动将其余类型转换为字符串，Swift 需要显式转换或使用字符串插值。

---

### 4.2 字符串与布尔连接 ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 025 | 字符串与布尔连接 | ✅ compile-pass | ✅ compile-pass | ⚠️ 需显式转换 |

**代码对照：**

ArkTS (compile-pass):
```typescript
let x = "value: " + true    // "value: true"
let y = "value: " + false   // "value: false"
```

Java (compile-pass):
```java
String x = "value: " + true;    // "value: true"
String y = "value: " + false;   // "value: false"
```

Swift (⚠️ 需显式转换):
```swift
let x = "value: " + String(true)    // "value: true"
let y = "value: " + String(false)   // "value: false"
// 或使用插值
let x1 = "value: \(true)"
let y1 = "value: \(false)"
```

**关键差异**: ArkTS 和 Java 自动将布尔值转换为字符串，Swift 需要显式转换或使用字符串插值。

---

### 4.3 字符串减法 ⭐ 三语言一致

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 027 | 字符串减法 | ✅ **compile-fail** | ✅ **compile-fail** | ✅ **compile-fail** |

**代码对照：**

ArkTS (compile-fail):
```typescript
let x = "a" - "b"   // 编译错误: Operator '-' cannot be applied to types 'string' and 'string'
```

Java (compile-fail):
```java
String x = "a" - "b";   // 编译错误: bad operand types
```

Swift (compile-fail):
```swift
let x = "a" - "b"   // 编译错误: binary operator '-' cannot be applied
```

**三语言一致**: 字符串不支持减法运算。

---

### 4.4 Runtime: 字符串连接

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 028 | 字符串连接运行时 | ✅ runtime | ✅ runtime | ✅ runtime |

**代码对照：**

ArkTS (runtime ✅):
```typescript
let a = "Hello"
let b = "World"
let c = a + " " + b
console.log(c)   // "Hello World"
```

Java (runtime ✅):
```java
String a = "Hello";
String b = "World";
String c = a + " " + b;
System.out.println(c);   // "Hello World"
```

Swift (runtime ✅):
```swift
let a = "Hello"
let b = "World"
let c = a + " " + b
print(c)   // "Hello World"
```

---

### 4.5 字符串插值 ⭐ Swift 独有

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 028 | 字符串插值 | ✅ 模板字符串 | ⚠️ 格式化字符串 | ✅ 字符串插值 |

**代码对照：**

ArkTS (模板字符串):
```typescript
let name = "World"
let age = 42
let msg = `Hello ${name}, age ${age}`   // "Hello World, age 42"
```

Java (格式化字符串):
```java
String name = "World";
int age = 42;
String msg = String.format("Hello %s, age %d", name, age);   // "Hello World, age 42"
// 或 Java 15+ 的文本块
String msg2 = "Hello %s, age %d".formatted(name, age);
```

Swift (字符串插值):
```swift
let name = "World"
let age = 42
let msg = "Hello \(name), age \(age)"   // "Hello World, age 42"
```

**关键差异**: Swift 的字符串插值最简洁，ArkTS 的模板字符串也很简洁，Java 的格式化字符串相对繁琐。

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 字符串连接 | ★★★★★ | ★★★★★ | ★★★★☆ |
| 自动类型转换 | ★★★★★ | ★★★★★ | ★★★☆☆ |
| 字符串减法 | ☆☆☆☆☆ | ☆☆☆☆☆ | ☆☆☆☆☆ |
| 字符串插值 | ★★★★☆ | ★★★☆☆ | ★★★★★ |
| 语义直观性 | ★★★★☆ | ★★★★☆ | ★★★★★ |

## 6. 核心结论

1. **ArkTS 和 Java 字符串连接更简洁**：自动类型转换，无需显式转换。

2. **Swift 字符串插值良好大**：支持任意类型插值，语法简洁。

3. **三语言都不支持字符串减法**：保持类型安全。

4. **ArkTS 模板字符串简洁**：与 JavaScript 一致，易于使用。

5. **Java 格式化字符串相对繁琐**：需要使用 `String.format()` 或格式化方法。

6. **三语言一致点**：都支持字符串连接，但不支持字符串减法。

## 7. ArkTS 设计建议

1. **当前设计合理**：字符串运算符上下文与 TypeScript 一致，易于理解。

2. **建议加强字符串插值**：当前模板字符串已经很好，可以考虑支持更多格式化选项。

3. **明确字符串转换规则**：在文档中明确指出哪些类型可以自动转换为字符串。

4. **考虑性能优化**：字符串连接可能产生大量临时对象，可以考虑编译期优化。

## 8. 三环境实测结果

> ✅ **实测时间**：2026-06-22
> ✅ **实测环境**：ArkTS static_core / Java SE 21 / Swift 5.10

### ArkTS 实测结果

| 用例 | 结果 |
|------|------|
| SEM_15_01_05_001_PASS_STRING_OPERATOR_CONVERSION | ✅ |
| SEM_15_01_05_002_PASS_STRING_BOOL | ✅ |
| SEM_15_01_05_100_FAIL_STRING_SUB | ✅ (compile-fail) |
| SEM_15_01_05_200_RUNTIME_STRING_CONCAT | ✅ |

### Java 实测结果

| 用例 | 结果 |
|------|------|
| 字符串运算符转换 | ✅ compile-pass |
| 字符串与布尔连接 | ✅ compile-pass |
| 字符串减法 | ❌ compile-fail (符合预期) |
| 字符串连接运行时 | ✅ runtime |
| 字符串格式化 | ✅ compile-pass |

### Swift 实测结果

| 用例 | 结果 |
|------|------|
| 字符串运算符转换 | ⚠️ 需显式转换 |
| 字符串与布尔连接 | ⚠️ 需显式转换 |
| 字符串减法 | ❌ compile-fail (符合预期) |
| 字符串连接运行时 | ✅ runtime |
| 字符串插值 | ✅ compile-pass |

### 关键发现

- **ArkTS 和 Java 字符串连接更简洁**：自动类型转换
- **Swift 字符串插值良好大**：支持任意类型插值
- **三语言都不支持字符串减法**
- **ArkTS 模板字符串简洁**：与 JavaScript 一致
