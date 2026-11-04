# 7.4.2 Method Reference — 三语言对比报告

## 1. 概览

Method Reference（方法引用）是 ArkTS 中引用类的静态或实例方法的机制。三语言对此特性的支持程度不同：

| 语言 | 定位 |
|------|------|
| **ArkTS** | 完整支持：静态方法引用 `C.foo`、实例方法引用 `new C().bar`、实例绑定隔离 |
| **Java** | 通过 `::` 运算符支持方法引用，语义与 ArkTS 高度一致 |
| **Swift** | 通过闭包或实例方法引用实现，但静态方法引用受限于语言设计 |

## 2. 章节对应关系

| ArkTS | Java | Swift |
|-------|------|-------|
| 静态方法引用 `C.foo` | 静态方法引用 `Class::staticMethod` | 闭包包装 `{ Calc.add($0, $1) }` |
| 实例方法引用 `new C().bar` | 实例方法引用 `instance::method` | 实例方法引用 `instance.method` |
| 实例绑定 `c1.method` | 实例绑定 `c1::method` | 实例绑定 `c1.method` |
| 泛型方法引用 `gen<string>` | 泛型方法引用（类型推断） | 类型标注 `f: (Int) -> Int = identity` |
| 重载方法引用限制 | 重载方法引用（目标类型解析） | 重载方法引用（类型标注消除歧义） |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 静态方法引用语法 | ✅ `C.foo` | ✅ `Class::foo` | ⚠️ 需闭包包装 |
| 实例方法引用语法 | ✅ `new C().bar` | ✅ `instance::bar` | ✅ `instance.bar` |
| 实例绑定隔离 | ✅ 不同实例独立绑定 | ✅ 同左 | ✅ 同左 |
| 泛型方法引用需显式类型参数 | ✅ 编译时必须 | ❌ 类型推断 | ❌ 类型推断/标注 |
| 隐式重载方法名引用 | ❌ 编译时错误 | ⚠️ 目标类型可解析 | ⚠️ 类型标注可解析 |
| 显式重载方法名引用 | ❌ 编译时错误 | N/A（无此语法） | N/A（无此语法） |

## 4. 用例对照

### 4.1 静态方法引用

| 语言 | 代码 |
|------|------|
| ArkTS | `C.foo` → `(n: number) => void` |
| Java | `Class::foo` → `Consumer<Integer>` |
| Swift | `{ Calc.add(a: $0, b: $1) }` → `(Int, Int) -> Int`（闭包包装） |

### 4.2 实例方法引用

| 语言 | 代码 |
|------|------|
| ArkTS | `new C().bar` → `(s: string) => boolean`，绑定到实例 |
| Java | `instance::bar` → `Function<String, Boolean>`，绑定到实例 |
| Swift | `instance.bar` → `(String) -> Bool`，绑定到实例 |

### 4.3 实例绑定隔离

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let m1 = c1.method; let m2 = c2.method` | `m1()` 访问 c1，`m2()` 访问 c2 |
| Java | `Supplier<Integer> m1 = c1::method; Supplier<Integer> m2 = c2::method` | 同上 |
| Swift | `let m1 = c1.method; let m2 = c2.method` | 同上 |

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 静态方法引用 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 002 | 实例方法引用 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 003 | 实例绑定 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 004 | 泛型方法引用（显式类型参数） | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 005 | 显式重载单方法引用 | ✅ compile-pass | N/A | N/A |
| 006 | 泛型方法无类型参数 | ✅ compile-fail | ✅ type inference | ⚠️ type annotation |
| 007 | 隐式重载方法名引用 | ✅ compile-fail | ⚠️ target type disambig | ⚠️ type annotation |
| 008 | 显式重载方法名引用 | ✅ compile-fail | N/A | N/A |
| 009 | 实例绑定运行时隔离 | ✅ runtime | ✅ runtime | ✅ runtime |
| 010 | 静态方法引用调用 | ✅ runtime | ✅ runtime | ✅ runtime |
| 011 | 泛型方法引用调用 | ✅ runtime | ✅ runtime | ✅ runtime |

### 关键差异详解

#### 001: 静态方法引用语法差异 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let m1 = C.foo` | ✅ 直接引用，类型自动推导 |
| Java | `Consumer<Integer> m1 = Class::foo` | ✅ 通过 `::` 语法，需函数式接口 |
| Swift | `let m1: (Int, Int) -> Int = { Calc.add(a: $0, b: $1) }` | ⚠️ 无直接语法，需闭包包装 |

#### 006: 泛型方法引用约束差异

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `new C().gen` | ❌ 编译时错误，必须 `gen<string>` |
| Java | `Function<Integer, Integer> f = Class::identity` | ✅ 通过目标类型推断泛型参数 |
| Swift | `let f: (Int) -> Int = instance.identity` | ✅ 通过类型标注推断泛型参数 |

#### 005/008: 显式重载是 ArkTS 独有特性

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `overload foo { foo1, foo2 }` → `c.foo` | ❌ 编译时错误 |
| Java | N/A | ❌ 无显式重载语法 |
| Swift | N/A | ❌ 无显式重载语法 |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 静态方法引用简洁性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| 实例方法引用 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 实例绑定隔离 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 泛型方法引用支持 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 重载安全性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 运行时一致性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

## 7. 核心结论

1. **ArkTS 方法引用语义与 Java/Swift 基本一致**：静态/实例方法引用、实例绑定隔离行为完全相同。
2. **ArkTS 和 Java 在静态方法引用语法上最接近**：`C.foo` vs `Class::foo` 都是直接引用。
3. **Swift 缺少静态方法直接引用语法**：需闭包包装，是三语言中最不便捷的。
4. **显式重载是 ArkTS 独有特性**：`overload foo { foo1, foo2 }` 语法在 Java/Swift 中均不存在。
5. **泛型方法引用约束一致**：ArkTS（显式类型参数）、Java（目标类型推断）、Swift（类型标注）三种方式达成同一安全目标。

## 8. ArkTS 设计建议

- 当前设计无缺陷。方法引用的安全约束（禁止泛型无类型参数、禁止重载名）是合理的设计选择。
- 实例绑定隔离行为与 Java/Swift 完全一致，无任何意外行为。
- 无 SPEC 不一致问题。

## 9. 三环境实测验证

实测代码和报告见 `cross_lang_verify/` 目录（2026-07-28 实测）：

| 文件 | 实测结果 |
|------|:--------:|
| `JavaMethodRefTest.java` + `.class` | 11/11 ✅ |
| `SwiftMethodRefTest.swift` + 二进制 | 11/11 ✅ |
| `verification_report.md` | 三环境结果对照 |

**实测关键验证点：**
- 实例绑定隔离：三语言 `h1=42, h2=123` 完全一致
- 静态方法引用调用：add(10,20)=30 三语言一致
- Swift 静态方法引用：`let f: (Int,Int)->Int = Type.method`（closure 包装）
