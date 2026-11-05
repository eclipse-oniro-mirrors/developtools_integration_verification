# 15.11.8 Overload Set at Method Call - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 调用时重载解析 | ✅ 支持 | ✅ 支持 | ✅ 支持 |
| 解析时机 | 编译时 | 编译时 | 编译时 |
| 解析依据 | 实参类型、数量、顺序 | 实参类型、数量、顺序 | 实参类型、数量、顺序 |
| 类型不匹配 | ❌ 编译报错 | ❌ 编译报错 | ❌ 编译报错 |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 调用时重载解析 | `function show(x: int); function show(x: string)` | `String show(int x); String show(String x)` | `func show(x: Int) -> String; func show(x: String) -> String` |
| 类型不匹配拒绝 | ❌ 编译报错 | ❌ 编译报错 | ❌ 编译报错 |
| 运行时调用 | ✅ 正确调用 | ✅ 正确调用 | ✅ 正确调用 |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **调用时解析** | ✅ 每个调用点解析 | ✅ 每个调用点解析 | ✅ 每个调用点解析 |
| **解析时机** | 编译时 | 编译时 | 编译时 |
| **类型声明位置** | 参数后加 `: type` | 参数前加 `type` | 参数后加 `: type` |
| **重载歧义** | ❌ 编译报错 | ❌ 编译报错 | ❌ 编译报错 |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 调用时重载解析

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 调用时重载解析 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
function show(x: int): string { return "i"; }
function show(x: string): string { return "s"; }
function main(): void {
    let r: string = show(1) + show("a");
    console.log(r);
}
```

Java:
```java
static String show(int x) { return "i"; }
static String show(String x) { return "s"; }
public static void main(String[] args) {
    String r = show(1) + show("a");
    System.out.println(r);
}
```

Swift:
```swift
func show(x: Int) -> String { return "i" }
func show(x: String) -> String { return "s" }
let r = show(x: 1) + show(x: "a")
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
    f(true);  // 编译错误：实参类型不匹配
}
```

Java (compile-fail):
```java
static void f(int x) {}
public static void main(String[] args) {
    f(true);  // 编译错误：实参类型不匹配
}
```

Swift (compile-fail):
```swift
func f(x: Int) {}
f(x: true)  // 编译错误：实参类型不匹配
```

**三语言一致**: 实参类型不匹配时都编译报错。

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
| 调用时重载解析 | ★★★★★ | ★★★★★ | ★★★★★ |
| 类型安全 | ★★★★★ | ★★★★★ | ★★★★★ |
| 语法简洁性 | ★★★★☆ | ★★★☆☆ | ★★★★☆ |
| 编译错误提示 | ★★★★☆ | ★★★★★ | ★★★★★ |

## 6. 核心结论

1. **三语言调用时重载解析机制基本一致**：都是在每个调用点根据实参形成重载集并解析。
2. **解析时机一致**：三语言都在编译时进行重载解析。
3. **类型安全**：三语言都有严格的类型检查，类型不匹配时编译报错。
4. **语法差异**：主要是类型声明位置不同，核心机制一致。

## 7. ArkTS 设计建议

1. **当前设计合理**：与 Java、Swift 一致，符合主流语言设计。
2. **建议增强错误提示**：当重载歧义时，提供更详细的错误信息。
3. **考虑支持重载歧义检测**：在编译时检测并报告重载歧义。

## 8. 三环境实测结果

> ✅ **实测时间**：2026-06-22
> ✅ **实测环境**：ArkTS static_core / Java SE 21 / Swift 5.10

### ArkTS 实测结果

| 用例 | 结果 |
|------|------|
| SEM_15_11_08_001 | ✅ compile-pass |
| SEM_15_11_08_099 | ✅ compile-fail |
| SEM_15_11_08_100 | ✅ runtime |

### Java 实测结果

| 用例 | 结果 |
|------|------|
| 调用时重载解析 | ✅ compile-pass |
| 类型不匹配 | ✅ compile-fail |
| 运行时调用 | ✅ runtime |

### Swift 实测结果

| 用例 | 结果 |
|------|------|
| 调用时重载解析 | ✅ compile-pass |
| 类型不匹配 | ✅ compile-fail |
| 运行时调用 | ✅ runtime |

### 关键发现

- **三语言调用时重载解析机制一致**：核心规则相同，语法略有差异。
- **类型安全**：三语言都有严格的类型检查，类型不匹配时编译报错。
- **运行时行为一致**：重载函数在运行时都能正确调用。

---

**报告生成时间**：2026-06-22
**报告状态**：✅ 三语言一致
