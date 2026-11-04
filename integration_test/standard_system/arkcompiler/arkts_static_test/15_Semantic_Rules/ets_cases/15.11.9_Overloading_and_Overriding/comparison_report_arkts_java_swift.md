# 15.11.9 Overloading and Overriding - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 重载与覆写交互 | ✅ 支持 | ✅ 支持 | ✅ 支持（override + overload） |
| 覆写关键字 | `override` | `@Override` (注解) | `override` |
| 覆写签名兼容性 | ✅ 检查 | ✅ 检查 | ✅ 检查 |
| 签名不兼容 | ❌ 编译报错 | ❌ 编译报错 | ❌ 编译报错 |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 重载与覆写交互 | `class Derived extends Base { override process(x: int); process(x: string) }` | `class Derived extends Base { @Override String process(int x); String process(String x); }` | `class Derived: Base { override func process(x: Int) -> String; func process(x: String) -> String }` |
| 覆写签名不兼容拒绝 | ❌ 编译报错 | ❌ 编译报错 | ❌ 编译报错 |
| 运行时调用 | ✅ 正确调用 | ✅ 正确调用 | ✅ 正确调用 |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **覆写关键字** | `override` | `@Override` (注解) | `override` |
| **重载与覆写交互** | ✅ 支持 | ✅ 支持 | ✅ 支持 |
| **签名兼容性检查** | ✅ 编译时检查 | ✅ 编译时检查 | ✅ 编译时检查 |
| **返回类型协变** | ✅ 支持 | ✅ 支持 | ✅ 支持 |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 重载与覆写交互

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 重载与覆写交互 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |

**代码对照：**

ArkTS (compile-pass):
```typescript
class Base { process(x: int): string { return "base"; } }
class Derived extends Base {
    override process(x: int): string { return "derived"; }
    process(x: string): string { return "str"; }
}
function main(): void {
    let d: Derived = new Derived();
    console.log(d.process(42));
}
```

Java:
```java
class Base { String process(int x) { return "base"; } }
class Derived extends Base {
    @Override
    String process(int x) { return "derived"; }
    String process(String x) { return "str"; }
}
public static void main(String[] args) {
    Derived d = new Derived();
    System.out.println(d.process(42));
}
```

Swift:
```swift
class Base { func process(x: Int) -> String { return "base" } }
class Derived: Base {
    override func process(x: Int) -> String { return "derived" }
    func process(x: String) -> String { return "str" }
}
let d = Derived()
print(d.process(x: 42))
```

---

### 4.2 覆写签名不兼容拒绝

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 099 | 覆写签名不兼容 | ✅ **compile-fail** | ✅ **compile-fail** | ✅ **compile-fail** |

**代码对照：**

ArkTS (compile-fail):
```typescript
class B { f(x: int): void {} }
class D extends B {
    override f(x: string): void {}  // 编译错误：覆写签名不兼容
}
```

Java (compile-fail):
```java
class B { void f(int x) {} }
class D extends B {
    @Override
    void f(String x) {}  // 编译错误：方法未覆写父类方法
}
```

Swift (compile-fail):
```swift
class B { func f(x: Int) {} }
class D: B {
    override func f(x: String) {}  // 编译错误：覆写签名不兼容
}
```

**三语言一致**: 覆写方法签名不兼容时都编译报错。

---

### 4.3 运行时验证

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 100 | 运行时调用 | ✅ runtime | ✅ runtime | ✅ runtime |

**代码对照：**

ArkTS (runtime ✅):
```typescript
class B { f(x: int): string { return "b"; } }
class D extends B { override f(x: int): string { return "d"; } }
function main(): void {
    let d: D = new D();
    let r = d.f(1);
    if (r != "d") throw new Error("fail");
    console.log("verified");
}
```

Java (runtime ✅):
```java
class B { String f(int x) { return "b"; } }
class D extends B { @Override String f(int x) { return "d"; } }
public static void main(String[] args) {
    D d = new D();
    String r = d.f(1);
    if (!r.equals("d")) throw new Error("fail");
    System.out.println("verified");
}
```

Swift (runtime ✅):
```swift
class B { func f(x: Int) -> String { return "b" } }
class D: B { override func f(x: Int) -> String { return "d" } }
let d = D()
let r = d.f(x: 1)
assert(r == "d", "fail")
print("verified")
```

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 重载与覆写交互 | ★★★★★ | ★★★★★ | ★★★★★ |
| 类型安全 | ★★★★★ | ★★★★★ | ★★★★★ |
| 语法简洁性 | ★★★★☆ | ★★★☆☆ | ★★★★☆ |
| 编译错误提示 | ★★★★☆ | ★★★★★ | ★★★★★ |

## 6. 核心结论

1. **三语言重载与覆写交互机制基本一致**：都允许在子类中同时覆写父类方法并添加同名重载。
2. **覆写签名兼容性检查一致**：三语言都检查覆写方法签名是否与父类方法签名兼容。
3. **类型安全**：三语言都有严格的类型检查，覆写签名不兼容时编译报错。
4. **语法差异**：主要是覆写关键字不同，核心机制一致。

## 7. ArkTS 设计建议

1. **当前设计合理**：与 Java、Swift 一致，符合主流语言设计。
2. **建议增强错误提示**：当覆写方法签名不兼容时，提供更详细的错误信息。
3. **考虑支持@Override-like检查**：在编译时严格检查override关键字的使用。

## 8. 三环境实测结果

> ✅ **实测时间**：2026-06-22
> ✅ **实测环境**：ArkTS static_core / Java SE 21 / Swift 5.10

### ArkTS 实测结果

| 用例 | 结果 |
|------|------|
| SEM_15_11_09_001 | ✅ compile-pass |
| SEM_15_11_09_099 | ✅ compile-fail |
| SEM_15_11_09_100 | ✅ runtime |

### Java 实测结果

| 用例 | 结果 |
|------|------|
| 重载与覆写交互 | ✅ compile-pass |
| 覆写签名不兼容 | ✅ compile-fail |
| 运行时调用 | ✅ runtime |

### Swift 实测结果

| 用例 | 结果 |
|------|------|
| 重载与覆写交互 | ✅ compile-pass |
| 覆写签名不兼容 | ✅ compile-fail |
| 运行时调用 | ✅ runtime |

### 关键发现

- **三语言重载与覆写交互机制一致**：核心规则相同，语法略有差异。
- **类型安全**：三语言都有严格的类型检查，覆写签名不兼容时编译报错。
- **运行时行为一致**：覆写方法在运行时都能正确调用。

---

**报告生成时间**：2026-06-22
**报告状态**：✅ 三语言一致
