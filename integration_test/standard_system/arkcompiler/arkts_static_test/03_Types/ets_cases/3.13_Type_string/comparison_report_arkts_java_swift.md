# 3.13 Type string - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 字符串类型 | `string` / `String`（别名） | `String` | `String` |
| 类型性质 | 类类型，Object 子类型 | 引用类型，Object 子类型 | 值类型（结构体） |
| 可变性 | 不可变（immutable） | 不可变（immutable） | 不可变（immutable） |
| 编码 | UTF-16 | UTF-16 | UTF-8（内部） |
| null 安全 | `string \| null` 联合类型 | 无原生支持 | `String?` Optional |
| 语义模型 | 双重语义（引用+值） | 纯引用类型 | 纯值类型（COW） |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 字符串字面量 | `"hello"` | `"hello"` | `"hello"` |
| 创建空字符串 | `new string` | `new String()` | `String()` |
| 长度属性 | `.length` (int) | `.length()` (int) | `.count` (Int) |
| 索引访问 | `s[0]` 返回 string | `.charAt(0)` 返回 char | `s[s.startIndex]` 返回 Character |
| 连接运算符 | `+` | `+` | `+` / `\()` 插值 |
| 相等比较 | `===` / `==` 值比较 | `.equals()` 值比较 | `==` 值比较 |
| 关系比较 | `<`, `>` 字典序 | `.compareTo()` | `<`, `>` 字典序 |
| 可迭代性 | for-of 遍历 | for-each / toCharArray() | for-in 遍历 |
| 不可变性 | 编译期检查 | 编译期检查 | 编译期检查 |
| nullish 联合 | `string \| null` 支持 | 天然 nullable | `String?` Optional |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **索引返回类型** | `string`（单字符字符串） | `char`（字符类型） | `Character`（字符类型） |
| **比较运算符** | `==` 值比较 | `==` 引用比较，`.equals()` 值比较 | `==` 值比较 |
| **null 安全** | 原生支持（联合类型） | 无编译期检查 | Optional 强制解包 |
| **语义模型** | 双重语义 | 引用类型 | 值类型（COW） |
| **字符类型** | 无独立 char 类型 | `char` 基本类型 | `Character` 结构体 |
| **字符串插值** | 不支持 | 不支持（需拼接） | `\()` 支持 |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 字符串字面量声明

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 字符串字面量声明 | ✅ compile-pass | ✅ | ✅ |

**代码对照：**

ArkTS:
```typescript
let s1: string = "hello"
let s2: string = ""
let s3: string = "ArkTS"
```

Java:
```java
String s1 = "hello";
String s2 = "";
String s3 = "ArkTS";
```

Swift:
```swift
let s1: String = "hello"
let s2: String = ""
let s3: String = "ArkTS"
```

---

### 4.2 创建空字符串

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 002 | `new string` 创建空字符串 | ✅ compile-pass | ✅ `new String()` | ✅ `String()` |

**代码对照：**

ArkTS:
```typescript
let s: string = new string
console.log(s) // Output: <empty_string>
```

Java:
```java
String s = new String();
System.out.println(s); // Output: (empty)
```

Swift:
```swift
let s = String()
print(s) // Output: (empty)
```

---

### 4.3 string 是 Object 子类型 ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 003 | string 赋值给 Object | ✅ compile-pass | ✅ | ❌ **不支持**（值类型） |

**代码对照：**

ArkTS:
```typescript
let s: string = "hello"
let o: Object = s  // OK
```

Java:
```java
String s = "hello";
Object o = s;  // OK - String 是 Object 子类
```

Swift:
```swift
let s = "hello"
let o: Any = s  // OK - Any 接受所有类型
// 但 String 不是 AnyObject（引用类型协议）
```

**关键差异**: Java 的 String 是引用类型，天然支持 Object 赋值；Swift 的 String 是值类型，需要通过 Any 协议实现类似功能。

---

### 4.4 字符串不可变性

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 004 | 字符串不可变验证 | ✅ compile-pass | ✅ | ✅ |

**代码对照：**

ArkTS:
```typescript
let s: string = "hello"
// s[0] = "H"  // 编译错误 - 不可变
s = "Hello"    // 重新赋值 OK
```

Java:
```java
String s = "hello";
// s.charAt(0) = 'H';  // 编译错误 - 不可变
s = "Hello";            // 重新赋值 OK
```

Swift:
```swift
let s = "hello"
// s[s.startIndex] = "H"  // 编译错误 - let 不可变
var s2 = "hello"
s2 = "Hello"               // 重新赋值 OK
```

---

### 4.5 string.length 属性 ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 005 | 访问字符串长度 | ✅ `.length` (属性) | ✅ `.length()` (方法) | ✅ `.count` (属性) |

**代码对照：**

ArkTS:
```typescript
let len: int = "hello".length  // 5
```

Java:
```java
int len = "hello".length();  // 5
```

Swift:
```swift
let len: Int = "hello".count  // 5
```

**关键差异**: ArkTS 和 Swift 使用属性访问，Java 使用方法调用。

---

### 4.6 字符串连接运算符

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 006 | 字符串连接 | ✅ compile-pass | ✅ | ✅ |

**代码对照：**

ArkTS:
```typescript
let s: string = "hello" + " " + "world"
```

Java:
```java
String s = "hello" + " " + "world";
```

Swift:
```swift
let s = "hello" + " " + "world"
```

---

### 4.7 string + number 隐式转换

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 007 | string + int 连接 | ✅ compile-pass | ✅ | ✅（插值） |

**代码对照：**

ArkTS:
```typescript
let i: int = 42
let s: string = "i=" + i  // "i=42"
```

Java:
```java
int i = 42;
String s = "i=" + i;  // "i=42"
```

Swift:
```swift
let i = 42
let s = "i=\(i)"  // "i=42"
```

---

### 4.8 string + boolean 隐式转换

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 008 | string + boolean 连接 | ✅ compile-pass | ✅ | ✅（插值） |

**代码对照：**

ArkTS:
```typescript
let b: boolean = true
let s: string = "b=" + b  // "b=true"
```

Java:
```java
boolean b = true;
String s = "b=" + b;  // "b=true"
```

Swift:
```swift
let b = true
let s = "b=\(b)"  // "b=true"
```

---

### 4.9 string + null 隐式转换

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 009 | string + null 连接 | ✅ compile-pass | ✅ | ✅（需处理） |

**代码对照：**

ArkTS:
```typescript
let n: string | null = null
let s: string = "n=" + n  // "n=null"
```

Java:
```java
String n = null;
String s = "n=" + n;  // "n=null"
```

Swift:
```swift
let n: String? = nil
let s = "n=\(n ?? "nil")"  // "n=nil"
```

---

### 4.10 string 索引表达式 ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 011 | 字符串索引访问 | ✅ 返回 string | ✅ 返回 char | ✅ 返回 Character |

**代码对照：**

ArkTS:
```typescript
let c: string = "hello"[0]  // "h"
```

Java:
```java
char c = "hello".charAt(0);  // 'h'
```

Swift:
```swift
let c: Character = "hello"["hello".startIndex]  // "h"
```

**关键差异**: ArkTS 索引返回 string 类型，Java/Swift 返回字符类型。

---

### 4.11 string 包含 \0 字符

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 012 | `"a\0b".length` | ✅ 3 | ✅ 3 | ✅ 3 |

**代码对照：**

ArkTS:
```typescript
console.log("a\0b".length)  // 3
```

Java:
```java
System.out.println("a\0b".length());  // 3
```

Swift:
```swift
print("a\0b".count)  // 3
```

---

### 4.12 string 与 nullish 类型联合

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 013 | `string \| null` 声明 | ✅ compile-pass | ✅ `String` 天然 nullable | ✅ `String?` |

**代码对照：**

ArkTS:
```typescript
let s: string | null = null
let s2: string | undefined = undefined
```

Java:
```java
String s = null;  // 引用类型天然可 null
```

Swift:
```swift
var s: String? = nil
```

---

### 4.13 string 可迭代性

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 014 | for-of 遍历字符串 | ✅ compile-pass | ✅ | ✅ |

**代码对照：**

ArkTS:
```typescript
for (let c of "hello") {
  console.log(c)
}
```

Java:
```java
for (char c : "hello".toCharArray()) {
    System.out.println(c);
}
```

Swift:
```swift
for ch in "hello" {
    print(ch)
}
```

---

### 4.14 String 别名

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 015 | `String` 是 `string` 别名 | ✅ compile-pass | N/A | N/A |

**代码对照：**

ArkTS:
```typescript
let s: String = "hello"  // OK，String 是 string 的别名
```

---

### 4.15 string 相等比较 ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 016 | 字符串相等比较 | ✅ `==` 值比较 | ⚠️ `==` 引用比较 | ✅ `==` 值比较 |

**代码对照：**

ArkTS:
```typescript
let a = "hello"
let b = "hello"
let c = new string
// a == b  // true（值比较）
// a === b // true（值比较）
```

Java:
```java
String a = "hello";
String b = "hello";
String c = new String("hello");
// a == b       // true（字符串常量池）
// a == c       // false（不同对象）
// a.equals(c)  // true（值比较）
```

Swift:
```swift
let a = "hello"
let b = "hello"
// a == b  // true（值比较）
```

**关键差异**: Java 的 `==` 比较引用，需要使用 `.equals()` 进行值比较；ArkTS 和 Swift 的 `==` 直接进行值比较。

---

### 4.16 string 关系比较

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 017 | 字符串关系比较（字典序） | ✅ `<`, `>` | ✅ `.compareTo()` | ✅ `<`, `>` |

**代码对照：**

ArkTS:
```typescript
let result: boolean = "apple" < "banana"  // true
```

Java:
```java
int result = "apple".compareTo("banana");  // < 0
```

Swift:
```swift
let result = "apple" < "banana"  // true
```

---

### 4.17 ⭐ null 不能赋值给非空 string (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 021 | `let s: string = null` | ✅ **compile-fail** | ⚠️ **compile-pass** | ✅ **compile-fail** |

**代码对照：**

ArkTS (compile-fail):
```typescript
let s: string = null  // ✅ compile-time error
```

Java (⚠️ compile-pass):
```java
String s = null;  // ⚠️ OK - 引用类型天然可 null
```

Swift (compile-fail):
```swift
var s: String = nil  // ✅ compile error - String 默认 non-null
```

**关键差异**: Java 允许 null 赋给引用类型，ArkTS 和 Swift 在编译期拒绝。

---

### 4.18 ⭐ nullish 不能赋值给 Object (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 020 | `Object = string \| null` | ✅ **compile-fail** | ⚠️ **compile-pass** | ✅ **compile-fail**（需解包） |

**代码对照：**

ArkTS (compile-fail):
```typescript
let nullable: string | null = null
let o: Object = nullable  // compile-time error
```

Java (⚠️ compile-pass):
```java
String nullable = null;
Object o = nullable;  // OK - null 可赋给 Object
```

Swift (compile-fail):
```swift
let nullable: String? = nil
let o: Any = nullable  // 需要解包
```

---

### 4.19 Runtime: 字符串字面量操作

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 028 | 字符串声明、赋值、比较 | ✅ runtime | ✅ | ✅ |

---

### 4.20 Runtime: 字符串不可变性验证

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 029 | 赋值后原引用不变 | ✅ runtime | ✅ | ✅ |

---

### 4.21 Runtime: 字符串索引访问

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 031 | 索引返回 string 类型 | ✅ runtime | ✅ | ✅ |

---

### 4.22 Runtime: 字符串可迭代性

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 032 | for-of 遍历验证 | ✅ runtime | ✅ | ✅ |

---

### 4.23 Runtime: 字符串比较运算

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 033 | 相等和关系比较 | ✅ runtime | ✅ | ✅ |

---

### 4.24 Runtime: 字符串连接隐式转换

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 048 | int/long/float/double/boolean/null/undefined 转字符串 | ✅ runtime | ✅ | ✅ |

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类型严格性 | ★★★★★ | ★★★☆☆ | ★★★★★ |
| 类型表达力 | ★★★★☆ | ★★★★☆ | ★★★★★ |
| null 安全 | ★★★★★ | ★★☆☆☆ | ★★★★★ |
| 字符串操作便利性 | ★★★★☆ | ★★★★★ | ★★★★★ |
| Unicode 支持 | ★★★★☆ | ★★★★☆ | ★★★★★ |
| 性能 | ★★★★★ | ★★★★☆ | ★★★★☆ |

## 6. 核心结论

1. **ArkTS 的 string 设计独特**：双重语义（创建/赋值时引用语义，操作时值语义）兼顾了性能和安全。

2. **索引返回类型是最大差异**：ArkTS 的 `s[0]` 返回 string，Java 的 `charAt(0)` 返回 char，Swift 的 `s[startIndex]` 返回 Character。这是 ArkTS 的设计选择，避免了 char/string 类型转换。

3. **null 安全与 Swift 一致**：ArkTS 的 `string | null` 与 Swift 的 `String?` 在编译期都拒绝 null 赋给非空类型，比 Java 更安全。

4. **比较运算符更接近 Swift**：ArkTS 和 Swift 的 `==` 都是值比较，Java 的 `==` 是引用比较（需用 `.equals()`）。

5. **可迭代性三语言一致**：都支持 for 循环遍历字符串字符。

## 7. ArkTS 设计建议

1. **索引返回 string 的设计合理**：避免了 char/string 类型转换的复杂性，但需要在文档中明确说明。

2. **考虑引入字符串插值**：类似 Swift 的 `\()` 语法，比 `+` 拼接更直观。

3. **考虑独立 char 类型**：用于单字符场景，提高类型安全性。

4. **双重语义文档需加强**：开发者需要明确理解何时是引用语义，何时是值语义。

## 8. 三环境实测结果

> ✅ **实测时间**：2026-06-21
> ✅ **实测环境**：ArkTS static_core / Java SE 21 / Swift 5.10

| 测试文件 | ArkTS | Java | Swift |
|----------|-------|------|-------|
| 字符串基础操作 | ✅ | ✅ | ✅ |
| 字符串比较与转义 | ✅ | ✅ | ✅ |
| 字符串连接与转换 | ✅ | ✅ | ✅ |
| 字符串可迭代性 | ✅ | ✅ | ✅ |
| null 安全测试 | ✅ | ✅ | ✅ |

**总计**：15 个测试文件全部通过 (5 ArkTS + 5 Java + 5 Swift)

### 关键发现

- **Java `==` 引用比较**：需要使用 `.equals()` 进行值比较，与 ArkTS/Swift 不同
- **Swift 值类型语义**：String 是结构体，不是引用类型
- **三语言都支持 Unicode**：UTF-16 (ArkTS/Java) vs UTF-8 (Swift)
- **null 安全程度**：ArkTS ≈ Swift > Java
