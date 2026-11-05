# 15.11.1 Forming an Overload Set - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 重载集形成 | 同名函数自动构成重载集 | 同名方法自动构成重载集 | 同名函数自动构成重载集 |
| 重载判定依据 | 参数类型、数量、顺序 | 参数类型、数量、顺序 | 参数类型、数量、顺序 |
| 返回类型影响 | 仅返回类型不同不构成重载 | 仅返回类型不同不构成重载 | 仅返回类型不同不构成重载 |
| 类型不匹配 | ❌ 编译报错 | ❌ 编译报错 | ❌ 编译报错 |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 重载集形成 | `function proc(x: int)` + `function proc(x: string)` | `void proc(int x)` + `void proc(String x)` | `func proc(x: Int)` + `func proc(x: String)` |
| 类型不匹配拒绝 | ❌ 编译报错 | ❌ 编译报错 | ❌ 编译报错 |
| 运行时调用 | ✅ 正确调用 | ✅ 正确调用 | ✅ 正确调用 |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **重载语法** | `function name(params)` | `returnType name(params)` | `func name(params) -> returnType` |
| **类型声明位置** | 参数后加 `: type` | 参数前加 `type` | 参数后加 `: type` |
| **重载解析时机** | 编译时 | 编译时 | 编译时 |
| **泛型重载** | ✅ 支持 | ✅ 支持（类型擦除） | ✅ 支持 |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 重载集形成

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 形成重载集 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
function proc(x: int): string { return "int"; }
function proc(x: string): string { return "str"; }
function main(): void {
    let r: string = proc(42);
    console.log(r);
}
```

Java:
```java
static String proc(int x) { return "int"; }
static String proc(String x) { return "str"; }
public static void main(String[] args) {
    String r = proc(42);
    System.out.println(r);
}
```

Swift:
```swift
func proc(x: Int) -> String { return "int" }
func proc(x: String) -> String { return "str" }
let r = proc(x: 42)
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
function f(x: int): void {}
function main(): void {
    f("s");  // 编译错误：参数类型不匹配
}
```

Java (compile-fail):
```java
static void f(int x) {}
public static void main(String[] args) {
    f("s");  // 编译错误：参数类型不匹配
}
```

Swift (compile-fail):
```swift
func f(x: Int) {}
f(x: "s")  // 编译错误：参数类型不匹配
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
function f(x: int): string { return x.toString(); }
function main(): void {
    let r = f(1);
    if (r != "1") throw new Error("fail");
    console.log("verified");
}
```

Java (runtime ✅):
```java
static String f(int x) { return Integer.toString(x); }
public static void main(String[] args) {
    String r = f(1);
    if (!r.equals("1")) throw new Error("fail");
    System.out.println("verified");
}
```

Swift (runtime ✅):
```swift
func f(x: Int) -> String { return String(x) }
let r = f(x: 1)
assert(r == "1", "fail")
print("verified")
```

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 重载表达力 | ★★★★★ | ★★★★★ | ★★★★★ |
| 类型安全 | ★★★★★ | ★★★★★ | ★★★★★ |
| 语法简洁性 | ★★★★☆ | ★★★☆☆ | ★★★★☆ |
| 泛型重载 | ★★★★☆ | ★★★☆☆ | ★★★★★ |
| 编译错误提示 | ★★★★☆ | ★★★★★ | ★★★★★ |

## 6. 核心结论

1. **三语言重载机制基本一致**：都是基于方法名和参数列表来区分重载。
2. **仅返回类型不同不构成重载**：三语言都遵循这一规则。
3. **类型不匹配时都编译报错**：三语言都有严格的类型检查。
4. **语法差异**：主要是类型声明位置不同，核心机制一致。

## 7. ArkTS 设计建议

1. **当前设计合理**：与 Java、Swift 一致，符合主流语言设计。
2. **建议增强错误提示**：当重载歧义时，提供更详细的错误信息。
3. **考虑支持可选参数**：Swift 的可选参数可以减少重载数量，提高代码可读性。

## 8. 三环境实测结果

> ✅ **实测时间**：2026-06-22
> ✅ **实测环境**：ArkTS static_core / Java SE 21 / Swift 5.10

### ArkTS 实测结果

| 用例 | 结果 |
|------|------|
| SEM_15_11_01_001 | ✅ compile-pass |
| SEM_15_11_01_099 | ✅ compile-fail |
| SEM_15_11_01_100 | ✅ runtime |

### Java 实测结果

| 用例 | 结果 |
|------|------|
| 重载集形成 | ✅ compile-pass |
| 类型不匹配 | ✅ compile-fail |
| 运行时调用 | ✅ runtime |

### Swift 实测结果

| 用例 | 结果 |
|------|------|
| 重载集形成 | ✅ compile-pass |
| 类型不匹配 | ✅ compile-fail |
| 运行时调用 | ✅ runtime |

### 关键发现

- **三语言重载机制一致**：核心规则相同，语法略有差异。
- **类型安全**：三语言都有严格的类型检查，类型不匹配时编译报错。
- **运行时行为一致**：重载函数在运行时都能正确调用。

---

**报告生成时间**：2026-06-22
**报告状态**：✅ 三语言一致
