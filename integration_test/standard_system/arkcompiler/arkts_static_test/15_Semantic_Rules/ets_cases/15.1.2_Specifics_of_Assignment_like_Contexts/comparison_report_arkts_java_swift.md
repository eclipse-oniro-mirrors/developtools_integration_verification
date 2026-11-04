# 15.1.2 Specifics of Assignment-like Contexts - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 赋值上下文类型检查 | 严格类型匹配，支持类型推断 | 严格类型匹配，支持协变 | 严格类型匹配，支持类型推断 |
| 右侧已知类型赋值 | ✅ 编译通过 | ✅ 编译通过 | ✅ 编译通过 |
| 右侧未知类型推断 | ✅ 类型推断 | ✅ 类型推断 | ✅ 类型推断 |
| 类型不匹配赋值 | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| 赋值语义（值/引用） | 取决于类型（基本类型值传递，对象引用传递） | 基本类型值传递，对象引用传递 | 值类型值传递，引用类型引用传递 |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 已知右侧类型赋值 | `let x: number = 42` | `int x = 42;` | `let x: Int = 42` |
| 未知右侧类型推断 | `let x = expr` | `var x = expr;` | `let x = expr` |
| 类型不匹配赋值 | `let x: number = "hello"` ❌ | `int x = "hello";` ❌ | `let x: Int = "hello"` ❌ |
| 赋值语义（基本类型） | 值传递 | 值传递 | 值传递 |
| 赋值语义（对象类型） | 引用传递 | 引用传递 | 引用传递（class）/ 值传递（struct） |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **类型推断能力** | ★★★★★ 强类型推断 | ★★★☆☆ 有限类型推断 | ★★★★★ 强类型推断 |
| **赋值类型检查** | 严格，不支持隐式转换 | 支持协变（子类赋给父类） | 严格，支持协变 |
| **null 安全** | ✅ strict null checking | ⚠️ 可空类型 @Nullable | ✅ Optional 类型安全 |
| **赋值语义** | 混合（基本类型值，对象引用） | 混合（基本类型值，对象引用） | 明确（值类型值，引用类型引用） |
| **语义模型** | 静态类型，运行时检查 | 静态类型，运行时检查 | 静态类型，编译期检查 |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 已知右侧类型赋值

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 006 | 已知类型赋值 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
let x: number = 42
let y: string = "hello"
let z: boolean = true
```

Java:
```java
int x = 42;
String y = "hello";
boolean z = true;
```

Swift:
```swift
let x: Int = 42
let y: String = "hello"
let z: Bool = true
```

---

### 4.2 未知右侧类型推断 ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 007 | 类型推断 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
let x = 42          // 推断为 number
let y = "hello"     // 推断为 string
let z = true        // 推断为 boolean
```

Java (compile-pass):
```java
var x = 42;         // 推断为 int
var y = "hello";    // 推断为 String
var z = true;       // 推断为 boolean
```

Swift (compile-pass):
```swift
let x = 42          // 推断为 Int
let y = "hello"     // 推断为 String
let z = true        // 推断为 Bool
```

**关键差异**: Java 使用 `var` 关键字进行类型推断，ArkTS 和 Swift 直接使用 `let` 进行类型推断。

---

### 4.3 类型不匹配赋值 ⭐ 三语言一致

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 014 | 类型不匹配 | ✅ **compile-fail** | ✅ **compile-fail** | ✅ **compile-fail** |

**代码对照：**

ArkTS (compile-fail):
```typescript
let x: number = "hello"   // 编译错误: Type 'string' is not assignable to type 'number'
```

Java (compile-fail):
```java
int x = "hello";   // 编译错误: incompatible types
```

Swift (compile-fail):
```swift
let x: Int = "hello"   // 编译错误: cannot convert value
```

**三语言一致**: 类型不匹配的赋值都会导致编译错误。

---

### 4.4 赋值语义（基本类型）⭐ 三语言一致

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 016 | 基本类型赋值语义 | ✅ runtime | ✅ runtime | ✅ runtime |

**代码对照：**

ArkTS (runtime ✅):
```typescript
let a: number = 42
let b: number = a
b = 100
console.log(a)   // 42 (值传递，a 不受影响)
```

Java (runtime ✅):
```java
int a = 42;
int b = a;
b = 100;
System.out.println(a);   // 42 (值传递，a 不受影响)
```

Swift (runtime ✅):
```swift
let a: Int = 42
var b: Int = a
b = 100
print(a)   // 42 (值传递，a 不受影响)
```

**三语言一致**: 基本类型都是值传递，赋值时创建副本。

---

### 4.5 赋值语义（对象类型）⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 016 | 对象类型赋值语义 | ✅ runtime | ✅ runtime | ⚠️ 取决于类型 |

**代码对照：**

ArkTS (runtime ✅):
```typescript
class Point {
  x: number
  y: number
  constructor(x: number, y: number) { this.x = x; this.y = y }
}
let p1 = new Point(1, 2)
let p2 = p1
p2.x = 100
console.log(p1.x)   // 100 (引用传递，p1 受影响)
```

Java (runtime ✅):
```java
class Point {
    int x, y;
    Point(int x, int y) { this.x = x; this.y = y; }
}
Point p1 = new Point(1, 2);
Point p2 = p1;
p2.x = 100;
System.out.println(p1.x);   // 100 (引用传递，p1 受影响)
```

Swift (runtime ⚠️):
```swift
// class (引用类型)
class PointClass {
    var x: Int
    var y: Int
    init(x: Int, y: Int) { self.x = x; self.y = y }
}
let p1 = PointClass(x: 1, y: 2)
let p2 = p1
p2.x = 100
print(p1.x)   // 100 (引用传递，p1 受影响)

// struct (值类型)
struct PointStruct {
    var x: Int
    var y: Int
}
let p3 = PointStruct(x: 1, y: 2)
var p4 = p3
p4.x = 100
print(p3.x)   // 1 (值传递，p3 不受影响)
```

**关键差异**: Swift 明确区分值类型（struct）和引用类型（class），ArkTS 和 Java 所有对象都是引用传递。

---

### 4.6 Runtime: 赋值语义验证

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 016 | 赋值语义运行时验证 | ✅ runtime | ✅ runtime | ✅ runtime |

**代码对照：**

ArkTS (runtime ✅):
```typescript
let a: number = 42
let b: number = a
b = 100
console.log(a)   // 42

class Point {
  x: number
  constructor(x: number) { this.x = x }
}
let p1 = new Point(1)
let p2 = p1
p2.x = 100
console.log(p1.x)   // 100
```

Java (runtime ✅):
```java
int a = 42;
int b = a;
b = 100;
System.out.println(a);   // 42

class Point {
    int x;
    Point(int x) { this.x = x; }
}
Point p1 = new Point(1);
Point p2 = p1;
p2.x = 100;
System.out.println(p1.x);   // 100
```

Swift (runtime ✅):
```swift
let a: Int = 42
var b: Int = a
b = 100
print(a)   // 42

class Point {
    var x: Int
    init(x: Int) { self.x = x }
}
let p1 = Point(x: 1)
let p2 = p1
p2.x = 100
print(p1.x)   // 100
```

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类型推断能力 | ★★★★★ | ★★★☆☆ | ★★★★★ |
| 赋值类型检查 | ★★★★☆ | ★★★★☆ | ★★★★★ |
| null 安全 | ★★★★★ | ★★★☆☆ | ★★★★★ |
| 赋值语义清晰度 | ★★★☆☆ | ★★★☆☆ | ★★★★★ |
| 语义直观性 | ★★★★☆ | ★★★★☆ | ★★★★★ |

## 6. 核心结论

1. **ArkTS 类型推断能力与 Swift 相当**：都支持较强的类型推断，Java 的类型推断相对有限（需要 `var` 关键字）。

2. **Swift 赋值语义最清晰**：明确区分值类型和引用类型，ArkTS 和 Java 所有对象都是引用传递。

3. **三语言类型检查一致**：类型不匹配的赋值都会导致编译错误。

4. **ArkTS 的优势是 null 安全**：strict null checking 与 TypeScript 一致，比 Java 的可空类型更安全。

5. **Swift 的优势是语义明确**：值类型和引用类型的区分使赋值语义更清晰。

6. **三语言一致点**：基本类型都是值传递，赋值时创建副本。

## 7. ArkTS 设计建议

1. **当前设计合理**：赋值上下文的类型检查和推断与 TypeScript 一致，易于理解。

2. **建议明确赋值语义**：在文档中明确指出基本类型是值传递，对象类型是引用传递。

3. **考虑引入值类型**：参考 Swift 的 struct，引入值类型可以提高性能并明确语义。

4. **加强类型推断文档**：明确说明类型推断的规则和限制。

## 8. 三环境实测结果

> ✅ **实测时间**：2026-06-22
> ✅ **实测环境**：ArkTS static_core / Java SE 21 / Swift 5.10

### ArkTS 实测结果

| 用例 | 结果 |
|------|------|
| SEM_15_01_02_001_PASS_KNOWN_RHS_ASSIGN | ✅ |
| SEM_15_01_02_002_PASS_UNKNOWN_RHS_INFER | ✅ |
| SEM_15_01_02_100_FAIL_TYPE_MISMATCH | ✅ (compile-fail) |
| SEM_15_01_02_200_RUNTIME_ASSIGN_SEMANTICS | ✅ |

### Java 实测结果

| 用例 | 结果 |
|------|------|
| 已知类型赋值 | ✅ compile-pass |
| 类型推断 | ✅ compile-pass |
| 类型不匹配赋值 | ❌ compile-fail (符合预期) |
| 基本类型赋值语义 | ✅ runtime (值传递) |
| 对象类型赋值语义 | ✅ runtime (引用传递) |

### Swift 实测结果

| 用例 | 结果 |
|------|------|
| 已知类型赋值 | ✅ compile-pass |
| 类型推断 | ✅ compile-pass |
| 类型不匹配赋值 | ❌ compile-fail (符合预期) |
| 基本类型赋值语义 | ✅ runtime (值传递) |
| 对象类型赋值语义 | ⚠️ 取决于类型 (class 引用传递，struct 值传递) |

### 关键发现

- **ArkTS 与 Swift 类型推断能力相当**：都支持较强的类型推断
- **Swift 赋值语义最清晰**：明确区分值类型和引用类型
- **三语言类型检查一致**：类型不匹配都会导致编译错误
- **ArkTS null 安全性强**：strict null checking 比 Java 更安全
