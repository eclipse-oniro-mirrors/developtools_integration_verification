# 15.11.2 Overload Set for Functions - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 函数重载 | ✅ 支持 | ✅ 支持（方法重载） | ✅ 支持 |
| 重载解析依据 | 参数类型、数量、顺序 | 参数类型、数量、顺序 | 参数类型、数量、顺序 |
| 类型不匹配 | ❌ 编译报错 | ❌ 编译报错 | ❌ 编译报错 |
| 重载歧义 | ❌ 编译报错 | ❌ 编译报错 | ❌ 编译报错 |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 重载解析（参数数量） | `function range(n)` + `function range(s, e)` | `int[] range(int n)` + `int[] range(int s, int e)` | `func range(n: Int)` + `func range(s: Int, e: Int)` |
| 类型不匹配拒绝 | ❌ 编译报错 | ❌ 编译报错 | ❌ 编译报错 |
| 运行时调用 | ✅ 正确调用 | ✅ 正确调用 | ✅ 正确调用 |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **函数定义语法** | `function name(params)` | `returnType name(params)` | `func name(params) -> returnType` |
| **重载声明** | 直接定义多个同名函数 | 直接定义多个同名方法 | 直接定义多个同名函数 |
| **类型声明位置** | 参数后加 `: type` | 参数前加 `type` | 参数后加 `: type` |
| **泛型函数重载** | ✅ 支持 | ✅ 支持（类型擦除） | ✅ 支持 |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 重载解析（按参数数量）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 重载解析 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
function range(n: int): int[] {
    let r: int[] = [];
    for (let i: int = 0; i < n; i++) r[i] = i;
    return r;
}
function range(s: int, e: int): int[] {
    let r: int[] = [];
    for (let i: int = s; i < e; i++) r[r.length] = i;
    return r;
}
function main(): void {
    let a: int[] = range(5);
    let b: int[] = range(2, 5);
    console.log(`${a[0]} ${b[0]}`);
}
```

Java:
```java
static int[] range(int n) {
    int[] r = new int[n];
    for (int i = 0; i < n; i++) r[i] = i;
    return r;
}
static int[] range(int s, int e) {
    int[] r = new int[e - s];
    for (int i = s; i < e; i++) r[i - s] = i;
    return r;
}
public static void main(String[] args) {
    int[] a = range(5);
    int[] b = range(2, 5);
    System.out.println(a[0] + " " + b[0]);
}
```

Swift:
```swift
func range(n: Int) -> [Int] {
    var r: [Int] = []
    for i in 0..<n { r.append(i) }
    return r
}
func range(s: Int, e: Int) -> [Int] {
    var r: [Int] = []
    for i in s..<e { r.append(i) }
    return r
}
let a = range(n: 5)
let b = range(s: 2, e: 5)
print("\(a[0]) \(b[0])")
```

---

### 4.2 类型不匹配拒绝

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 099 | 类型不匹配 | ✅ **compile-fail** | ✅ **compile-fail** | ✅ **compile-fail** |

**代码对照：**

ArkTS (compile-fail):
```typescript
function f(x: int): void {}
function main(): void {
    f(true);  // 编译错误：参数类型不匹配
}
```

Java (compile-fail):
```java
static void f(int x) {}
public static void main(String[] args) {
    f(true);  // 编译错误：参数类型不匹配
}
```

Swift (compile-fail):
```swift
func f(x: Int) {}
f(x: true)  // 编译错误：参数类型不匹配
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
function f(x: int): string { return "ok"; }
function main(): void {
    let r = f(1);
    if (r != "ok") throw new Error("fail");
    console.log("verified");
}
```

Java (runtime ✅):
```java
static String f(int x) { return "ok"; }
public static void main(String[] args) {
    String r = f(1);
    if (!r.equals("ok")) throw new Error("fail");
    System.out.println("verified");
}
```

Swift (runtime ✅):
```swift
func f(x: Int) -> String { return "ok" }
let r = f(x: 1)
assert(r == "ok", "fail")
print("verified")
```

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 函数重载表达力 | ★★★★★ | ★★★★★ | ★★★★★ |
| 类型安全 | ★★★★★ | ★★★★★ | ★★★★★ |
| 语法简洁性 | ★★★★☆ | ★★★☆☆ | ★★★★☆ |
| 重载解析准确性 | ★★★★★ | ★★★★★ | ★★★★★ |
| 编译错误提示 | ★★★★☆ | ★★★★★ | ★★★★★ |

## 6. 核心结论

1. **三语言函数重载机制基本一致**：都是基于参数列表来区分重载。
2. **重载解析准确**：三语言都能根据参数数量、类型正确选择最匹配的函数版本。
3. **类型安全**：三语言都有严格的类型检查，类型不匹配时编译报错。
4. **语法差异**：主要是类型声明位置不同，核心机制一致。

## 7. ArkTS 设计建议

1. **当前设计合理**：与 Java、Swift 一致，符合主流语言设计。
2. **建议增强错误提示**：当重载歧义时，提供更详细的错误信息。
3. **考虑支持默认参数**：Swift 的默认参数可以减少重载数量，提高代码可读性。

## 8. 三环境实测结果

> ✅ **实测时间**：2026-06-22
> ✅ **实测环境**：ArkTS static_core / Java SE 21 / Swift 5.10

### ArkTS 实测结果

| 用例 | 结果 |
|------|------|
| SEM_15_11_02_001_PASS_OVERLOAD_RESOLUTION | ✅ compile-pass |
| SEM_15_11_02_099 | ✅ compile-fail |
| SEM_15_11_02_100 | ✅ runtime |

### Java 实测结果

| 用例 | 结果 |
|------|------|
| 重载解析（参数数量） | ✅ compile-pass |
| 类型不匹配 | ✅ compile-fail |
| 运行时调用 | ✅ runtime |

### Swift 实测结果

| 用例 | 结果 |
|------|------|
| 重载解析（参数数量） | ✅ compile-pass |
| 类型不匹配 | ✅ compile-fail |
| 运行时调用 | ✅ runtime |

### 关键发现

- **三语言函数重载机制一致**：核心规则相同，语法略有差异。
- **类型安全**：三语言都有严格的类型检查，类型不匹配时编译报错。
- **运行时行为一致**：重载函数在运行时都能正确调用。

---

**报告生成时间**：2026-06-22
**报告状态**：✅ 三语言一致
