# 7.11.1 Selection of Type to Use — 三语言对比报告

## 1. 概览

方法调用分为三种 objectReference 形式，三语言均有对应概念。

| 形式 | ArkTS | Java | Swift |
|------|-------|------|-------|
| typeReference | `Class.method()` | `Class.method()` | `Type.method()` |
| super | `super.method()` | `super.method()` | `super.method()` |
| expression (class) | `obj.method()` | `obj.method()` | `obj.method()` |
| expression (interface) | `iface.method()` | `iface.method()` | `protocol.method()` |
| expression (type param) | `T.method()` | `T.method()` | `T.method()` |

## 2. 章节对应关系

| 规则 | ArkTS | Java | Swift |
|------|-------|------|-------|
| typeReference → 类 | `MyClass.method()` | `MyClass.method()` | `Type.method()` |
| typeReference → 接口 | ❌ 编译时错误 | `Interface.method()` | ❌ 编译时错误 |
| super → 超类方法 | `super.method()` | `super.method()` | `super.method()` |
| expression (class) | `obj.method()` | `obj.method()` | `obj.method()` |
| expression (interface) | `iface.method()` | `iface.method()` | `protocol.method()` |
| expression (type param) | `T.method()` | `T.method()` | `T.method()` |
| null 表达式 | ❌ 编译时错误 | ⚠️ 编译通过 NPE | ❌ 编译时错误 |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类 typeReference 静态方法 | ✅ | ✅ | ✅ |
| 接口 typeReference 静态方法 | ❌ 编译错误 | ✅ 接口静态方法 | ❌ 编译错误 |
| super 方法调用 | ✅ | ✅ | ✅ |
| 类表达式方法 | ✅ | ✅ | ✅ |
| 接口表达式方法 | ✅ | ✅ | ✅ |
| 类型参数方法 | ✅ | ✅ | ✅ |
| null 表达式方法 | ❌ 编译错误 | ⚠️ 编译通过 NPE | ❌ 编译错误 |

## 4. 用例对照

### 4.1 接口 typeReference 静态方法 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `Drawable.draw()` | ❌ 编译时错误 |
| Java | `Drawable.draw()` | ✅ 编译通过（接口静态方法） |
| Swift | `Drawable.draw()` | ❌ 编译时错误 |

**分析**：ArkTS 和 Swift 禁止接口名直接调用静态方法，Java 8+ 允许接口静态方法。

### 4.2 null 表达式方法调用 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `null.toString()` | ❌ 编译时错误 |
| Java | `null.toString()` | ⚠️ 编译通过，运行时 NPE |
| Swift | `nil.description` | ❌ 编译时错误 |

**分析**：ArkTS 和 Swift 在编译时进行 null 安全检查，Java 允许但运行时 NPE。

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | typeReference 静态方法 | ✅ compile-pass | ✅ | ✅ |
| 002 | super 方法调用 | ✅ compile-pass | ✅ | ✅ |
| 003 | 类表达式方法 | ✅ compile-pass | ✅ | ✅ |
| 004 | 接口表达式方法 | ✅ compile-pass | ✅ | ✅ |
| 005 | union 类型方法 | ✅ compile-pass | ✅ | ✅ |
| 006 | 类型参数方法 | ✅ compile-pass | ✅ | ✅ |
| 007 | 接口 typeReference | ❌ 编译错误 | ⚠️ 允许 | ❌ 编译错误 |
| 008 | null 表达式方法 | ❌ 编译错误 | ⚠️ NPE | ❌ 编译错误 |
| 009 | 静态方法运行时 | ✅ runtime | ✅ | ✅ |
| 010 | super 方法运行时 | ✅ runtime | ✅ | ✅ |
| 011 | 接口多态运行时 | ✅ runtime | ✅ | ✅ |
| 012 | 类型参数运行时 | ✅ runtime | ✅ | ✅ |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类型严格性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 编译时检查 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 三语言一致性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 7. 核心结论

1. **三语言基本语义一致**：三种 objectReference 形式均有对应。
2. **ArkTS 严格性优势**：禁止接口 typeReference 和 null 表达式方法调用。
3. **Java 最宽松**：允许接口静态方法和 null 表达式方法（运行时 NPE）。
4. **Swift 与 ArkTS 一致**：均严格检查。

## 8. ArkTS 设计建议

- 禁止接口 typeReference 是合理设计，减少混淆。
- 禁止 null 表达式方法调用是 null 安全的重要体现。
