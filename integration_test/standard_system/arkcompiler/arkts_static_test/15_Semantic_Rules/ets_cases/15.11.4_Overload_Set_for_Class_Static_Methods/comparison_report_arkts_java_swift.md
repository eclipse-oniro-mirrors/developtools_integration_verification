# 15.11.4 Overload Set for Class Static Methods - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类静态方法重载 | ✅ 支持 | ✅ 支持 | ✅ 支持（static 方法） |
| 重载解析依据 | 参数类型、数量、顺序 | 参数类型、数量、顺序 | 参数类型、数量、顺序 |
| 调用方式 | `ClassName.method()` | `ClassName.method()` | `ClassName.method()` |
| 类型不匹配 | ❌ 编译报错 | ❌ 编译报错 | ❌ 编译报错 |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 类静态方法重载集 | `class Calc { static convert(x: int); static convert(x: string) }` | `class Calc { static String convert(int x); static String convert(String x); }` | `struct Calc { static func convert(x: Int) -> String; static func convert(x: String) -> String }` |
| 调用静态方法 | `Calc.convert(42)` | `Calc.convert(42)` | `Calc.convert(x: 42)` |
| 类型不匹配拒绝 | ❌ 编译报错 | ❌ 编译报错 | ❌ 编译报错 |
| 运行时调用 | ✅ 正确调用 | ✅ 正确调用 | ✅ 正确调用 |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **静态方法定义语法** | `static methodName(params)` | `static returnType methodName(params)` | `static func methodName(params) -> returnType` |
| **调用语法** | `ClassName.method()` | `ClassName.method()` | `ClassName.method()` |
| **类型声明位置** | 参数后加 `: type` | 参数前加 `type` | 参数后加 `: type` |
| **泛型静态方法** | ✅ 支持 | ✅ 支持 | ✅ 支持 |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 类静态方法重载集

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 类静态方法重载集 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
class Calc {
    static convert(x: int): string { return "int"; }
    static convert(x: string): string { return "str"; }
}
function main(): void {
    let r: string = Calc.convert(42);
    console.log(r);
}
```

Java:
```java
class Calc {
    static String convert(int x) { return "int"; }
    static String convert(String x) { return "str"; }
}
public static void main(String[] args) {
    String r = Calc.convert(42);
    System.out.println(r);
}
```

Swift:
```swift
struct Calc {
    static func convert(x: Int) -> String { return "int" }
    static func convert(x: String) -> String { return "str" }
}
let r: String = Calc.convert(x: 42)
print(r)
```

---

### 4.2 类型不匹配拒绝

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 099 | 类型不匹配 | ✅ **compile-fail** | ✅ **compile-fail** | ✅ **compile-fail** |

**代码对照：**

ArkTS (compile-fail):
```typescript
class C { static f(x: int): void {} }
function main(): void {
    C.f(true);  // 编译错误：参数类型不匹配
}
```

Java (compile-fail):
```java
class C { static void f(int x) {} }
public static void main(String[] args) {
    C.f(true);  // 编译错误：参数类型不匹配
}
```

Swift (compile-fail):
```swift
struct C { static func f(x: Int) {} }
C.f(x: true)  // 编译错误：参数类型不匹配
```

**三语言一致**: 参数类型不匹配时都编译报错。

---

### 4.3 运行时验证

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 100 | 运行时调用 | ✅ runtime | ✅ runtime | ✅ runtime |

**代码对照：**

ArkTS (runtime ✅):
```typescript
class C { static f(x: int): string { return "ok"; } }
function main(): void {
    let r = C.f(1);
    if (r != "ok") throw new Error("fail");
    console.log("verified");
}
```

Java (runtime ✅):
```java
class C { static String f(int x) { return "ok"; } }
public static void main(String[] args) {
    String r = C.f(1);
    if (!r.equals("ok")) throw new Error("fail");
    System.out.println("verified");
}
```

Swift (runtime ✅):
```swift
struct C { static func f(x: Int) -> String { return "ok" } }
let r = C.f(x: 1)
assert(r == "ok", "fail")
print("verified")
```

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类静态方法重载表达力 | ★★★★★ | ★★★★★ | ★★★★★ |
| 类型安全 | ★★★★★ | ★★★★★ | ★★★★★ |
| 语法简洁性 | ★★★★☆ | ★★★☆☆ | ★★★★☆ |
| 调用便利性 | ★★★★★ | ★★★★★ | ★★★★☆ |
| 编译错误提示 | ★★★★☆ | ★★★★★ | ★★★★★ |

## 6. 核心结论

1. **三语言类静态方法重载机制基本一致**：都是在类中定义多个同名静态方法形成重载集，通过类名调用静态方法时根据参数列表选择最匹配的版本。
2. **调用方式一致**：三语言都通过类名调用静态方法。
3. **类型安全**：三语言都有严格的类型检查，类型不匹配时编译报错。
4. **语法差异**：主要是类型声明位置不同，核心机制一致。

## 7. ArkTS 设计建议

1. **当前设计合理**：与 Java、Swift 一致，符合主流语言设计。
2. **建议增强错误提示**：当静态方法不存在时，提供更详细的错误信息。
3. **考虑支持默认参数**：Swift 的默认参数可以减少重载数量，提高代码可读性。

## 8. 三环境实测结果

> ✅ **实测时间**：2026-06-22
> ✅ **实测环境**：ArkTS static_core / Java SE 21 / Swift 5.10

### ArkTS 实测结果

| 用例 | 结果 |
|------|------|
| SEM_15_11_04_001 | ✅ compile-pass |
| SEM_15_11_04_099 | ✅ compile-fail |
| SEM_15_11_04_100 | ✅ runtime |

### Java 实测结果

| 用例 | 结果 |
|------|------|
| 类静态方法重载集 | ✅ compile-pass |
| 类型不匹配 | ✅ compile-fail |
| 运行时调用 | ✅ runtime |

### Swift 实测结果

| 用例 | 结果 |
|------|------|
| 结构体静态方法重载集 | ✅ compile-pass |
| 类型不匹配 | ✅ compile-fail |
| 运行时调用 | ✅ runtime |

### 关键发现

- **三语言类静态方法重载机制一致**：核心规则相同，语法略有差异。
- **类型安全**：三语言都有严格的类型检查，类型不匹配时编译报错。
- **调用方式一致**：三语言都通过类名/结构体名调用静态方法。
- **运行时行为一致**：静态方法在运行时都能正确调用。

---

**报告生成时间**：2026-06-22
**报告状态**：✅ 三语言一致
