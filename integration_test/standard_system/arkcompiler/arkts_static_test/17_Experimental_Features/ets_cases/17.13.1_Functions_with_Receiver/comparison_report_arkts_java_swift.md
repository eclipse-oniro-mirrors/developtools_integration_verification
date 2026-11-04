# 17.13.1 Functions with Receiver — 三语言对比报告

**生成日期：** 2026-06-25
**规范来源：** ArkTS Static Spec §17.13.1, Java JLS SE21, Swift Language Reference (Extensions)
**测试基础：** 15 个用例（7 compile-pass + 4 compile-fail + 4 runtime 真实执行）

---

## 一、概览：三语言定位

| 语言 | Receiver 函数 / 扩展方法 | 设计哲学 |
|------|-----------------------|---------|
| **ArkTS** | 顶层函数 `function f(this: T)`，支持 `obj.f()` 和 `f(obj)` 两种调用 | 顶层扩展：为已有类型添加方法而不修改类型定义 |
| **Java** | N/A — 无 receiver 函数语法 | 方法必须在类体内定义；扩展需通过继承/装饰器/默认方法 |
| **Swift** | `extension` 关键字，在扩展块内定义方法 | 类型扩展：为已有类型（class/struct/enum/protocol）添加方法 |

---

## 二、章节对应关系

| ArkTS 17.13.1 | Java | Swift | 备注 |
|--------------|------|-------|------|
| `function greet(this: StringBuilder): void` | N/A | `extension StringBuilder { func greet() { ... } }` | 语法完全不同 |
| 方法调用 `sb.greet()` | N/A | `sb.greet()` | 调用语法相同，但定义方式不同 |
| 普通调用 `greet(sb)` | N/A | N/A | ArkTS 独有：receiver 函数同时支持两种调用 |
| 泛型 receiver `<T>` | N/A | `extension Array where Element: Equatable { ... }` | Swift 通过 where 约束 |
| 仅顶层函数支持方法调用 | N/A | 仅 extension 内的方法 | 规则不同 |
| 静态分发 | N/A | 静态分发（extension 方法） | 两者一致 |
| 实例方法优先级高于 receiver 函数 | N/A | 实例方法优先级高于 extension 方法 | 一致（但语法不同） |

---

## 三、关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Receiver/扩展方法定义位置 | 类外部（顶层函数） | 无此语法 | 类外部（extension 块） |
| 定义关键字 | `function f(this: T)` | N/A | `extension T { func f() }` |
| 方法调用语法 `obj.f()` | ✅（仅顶层函数） | N/A | ✅ |
| 普通调用语法 `f(obj)` | ✅ | N/A | ❌（Swift 不支持） |
| 泛型 receiver | ✅ | N/A | ✅（where 约束） |
| this/self 访问 receiver 成员 | ✅ `this.field` | N/A | ✅ `self.field` |
| 私有成员访问 | ❌ | N/A | ❌（extension 不能访问 private） |
| 静态分发 | ✅ | N/A | ✅ |
| 与实例方法冲突 | 实例方法优先 | N/A | 实例方法优先 |

---

## 四、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 基本 receiver 函数方法调用 `sb.greet()` | ✅ compile-pass | N/A | N/A |
| 002 | 普通调用语法 `greet(sb)` | ✅ compile-pass | N/A | N/A |
| 003 | 泛型 receiver 函数 | ✅ compile-pass | N/A | N/A |
| 004 | 通过 this 访问公有成员 | ✅ compile-pass | N/A | N/A |
| 005 | 带额外参数的 receiver 函数 | ✅ compile-pass | N/A | N/A |
| 006 | 命名空间中的 receiver 函数 | ✅ compile-pass | N/A | N/A |
| 007 | 多类型的 receiver 函数 | ✅ compile-pass | N/A | N/A |
| 008 | 访问私有成员 | ✅ compile-fail (ESE0293) | N/A | N/A |
| 009 | this 不是第一个参数 | ✅ compile-fail (ESY0158) | N/A | N/A |
| 010 | 缺少 this 参数 | ✅ compile-fail (ESE0203) | N/A | N/A |
| 011 | this 参数名称错误 | ✅ compile-fail (ESE0087) | N/A | N/A |
| 012 | 方法调用语法运行时验证 | ✅ runtime | N/A | N/A |
| 013 | 普通调用语法运行时验证 | ✅ runtime | N/A | N/A |
| 014 | this 绑定正确性验证 | ✅ runtime | N/A | N/A |
| 015 | 泛型 receiver 函数运行时验证 | ✅ runtime | N/A | N/A |

### 关键差异详解

#### 用例 001/002: Receiver 函数的两种调用语法 ⭐

| 语言 | 方法调用语法 `obj.f()` | 普通调用语法 `f(obj)` |
|------|---------------------|---------------------|
| ArkTS | ✅ `sb.greet()` | ✅ `greet(sb)` |
| Java | N/A | N/A |
| Swift | ✅ `sb.greet()` (extension 方法) | ❌ 不支持 |
| TypeScript | N/A | N/A |

ArkTS 的 receiver 函数是唯一同时支持两种调用语法的设计。

#### 最接近的 Java 等价物: 默认方法 (default method)

```java
// Java 中最接近的设计——但不能为已有类添加方法，只能通过接口默认方法
interface StringBuilderLike {
    default void greet() {
        this.append("Hello"); // this 指向实现类
    }
    void append(String s);
}
```

Java 的默认方法只能在**定义接口时**添加，不能为**已存在的第三方类**（如标准库的 StringBuilder）事后添加。ArkTS 的 receiver 函数可以做到。

#### 最接近的 Swift 等价物: extension

```swift
// Swift extension——语法最接近但定义方式完全不同
extension StringBuilder {
    func greet() {
        self.append("Hello")
    }
}
sb.greet() // ✅ 仅方法调用语法
```

Swift extension 仅支持 `obj.f()` 方法调用语法，不支持 `f(obj)` 普通调用语法。ArkTS receiver 函数更灵活但需要顶层函数定义。

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 扩展已有类型的能力 | ★★★★★ | ★★☆☆☆ | ★★★★★ |
| 调用灵活度（双语法） | ★★★★★ | N/A | ★★★☆☆ |
| 类型安全性 | ★★★★★ | N/A | ★★★★★ |
| 语法简洁性 | ★★★★☆ | N/A | ★★★★★ |
| Spec 一致性 | ★★★★★ (15/15) | N/A | N/A |

---

## 六、核心结论

1. **Receiver 函数是 ArkTS 独有的顶层扩展机制**：Java 完全无等价语法；Swift extension 语义相近但语法属于不同的设计范式（扩展块 vs 顶层函数）。
2. **双调用语法是 ArkTS receiver 函数的关键创新**：`obj.f()` 和 `f(obj)` 两种语法均可用，这不同于 Swift（仅方法语法）和 （receiver lambda 仅一种语法）。
3. **Java 最接近的等价物是接口默认方法**，但它不能为已有类事后添加方法。
4. **本章节所有 15 个用例与 spec 完全一致**，编译器行为符合预期，无 SPEC 不一致。

---

## 七、ArkTS 设计建议

1. 当前 receiver 函数的设计（顶层函数 + this: Type 第一参数 + 双调用语法）是一致且合理的。
2. 可考虑在未来扩展中支持 receiver 函数用于更多类型（如 interface 的 receiver 函数可被实现类继承）。
3. 静态分发的语义应保持明确文档化，避免开发者误以为 receiver 函数是多态方法。
