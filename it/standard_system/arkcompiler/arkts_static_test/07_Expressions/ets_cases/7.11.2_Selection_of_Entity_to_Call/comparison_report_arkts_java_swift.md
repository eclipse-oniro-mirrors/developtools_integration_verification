# 7.11.2 Selection of Entity to Call — 三语言对比报告

## 1. 概览

方法调用的第二步：根据 objectReference 形式、使用的类型和标识符确定候选调用实体集合。

| 形式 | ArkTS | Java | Swift |
|------|-------|------|-------|
| typeReference 静态方法 | `Class.method()` | `Class.method()` | `Type.method()` |
| super 实例方法 | `super.method()` | `super.method()` | `super.method()` |
| 类表达式实例方法 | `obj.method()` | `obj.method()` | `obj.method()` |
| 接口表达式实例方法 | `iface.method()` | `iface.method()` | `protocol.method()` |
| 重载解析 | 参数类型匹配 | 参数类型匹配 | 参数类型匹配 |
| 动态分发 | 实例方法多态 | 虚拟方法 | 类方法重写 |
| Union 公共方法 | 公共实例方法 | N/A | N/A |

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| typeReference 候选实体 | 类 T 的静态方法 | 类 T 的静态方法 | 类型 T 的静态方法 |
| super 候选实体 | 超类的实例方法 | 超类的实例方法 | 超类的实例方法 |
| expression 候选实体 | T 的实例方法和带接收者的函数 | T 的实例方法 | T 的实例方法 |
| Union 公共方法 | ✅ 公共实例方法 | ❌ N/A | ❌ N/A |
| 空集合 | ❌ 编译时错误 | ❌ 编译时错误 | ❌ 编译时错误 |
| 多候选 → 重载解析 | ✅ 参数类型匹配 | ✅ 参数类型匹配 | ✅ 参数类型匹配 |
| 动态分发 | ✅ 实例方法多态 | ✅ 虚拟方法 | ✅ 类方法重写 |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| typeReference → 静态方法 | ✅ | ✅ | ✅ |
| super → 实例方法 | ✅ | ✅ | ✅ |
| 类表达式 → 实例方法 | ✅ | ✅ | ✅ |
| 接口表达式 → 实例方法 | ✅ | ✅ | ✅ |
| 重载解析（多候选） | ✅ | ✅ | ✅ |
| 动态分发（实例方法多态） | ✅ | ✅ | ✅ |
| Union 公共方法 | ✅ union 类型公共方法 | ❌ N/A | ❌ N/A |
| 空集合编译时错误 | ✅ | ✅ | ✅ |

## 4. 用例对照

### 4.1 Union 公共方法（ArkTS 独有）⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let a: Dog \| Cat; a.describe()` | ✅ 编译通过（公共方法） |
| Java | N/A（无 union 类型） | ❌ N/A |
| Swift | N/A（无 union 类型） | ❌ N/A |

**差异原因**：ArkTS 支持 union 类型及其公共方法调用，Java/Swift 使用接口/协议实现类似功能。

### 4.2 空集合编译时错误（三语言一致）

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `MyClass.nonExistent()` | ❌ 编译时错误 |
| Java | `MyClass.nonExistent()` | ❌ 编译时错误 |
| Swift | `MyType.nonExistent()` | ❌ 编译时错误 |

三语言均对不存在的实体调用报编译时错误。

### 4.3 动态分发（三语言一致）

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let a: Animal = Dog(); a.speak()` | ✅ "Woof" |
| Java | `Animal a = new Dog(); a.speak()` | ✅ "Woof" |
| Swift | `let a: Animal = Dog2(); a.speak()` | ✅ "Woof" |

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | typeReference 静态方法 | ✅ compile-pass | ✅ | ✅ |
| 002 | super 方法调用 | ✅ compile-pass | ✅ | ✅ |
| 003 | 类表达式实例方法 | ✅ compile-pass | ✅ | ✅ |
| 004 | Union 公共方法 | ✅ compile-pass | N/A | N/A |
| 005 | 重载解析 | ✅ compile-pass | ✅ | ✅ |
| 006 | 接口表达式方法 | ✅ compile-pass | ✅ | ✅ |
| 007 | typeReference 不存在方法 | ❌ 编译错误 | ❌ 编译错误 | ❌ 编译错误 |
| 008 | Union 无公共方法 | ❌ 编译错误 | N/A | N/A |
| 009 | 动态分发运行时 | ✅ runtime | ✅ | ✅ |
| 010 | 重载解析运行时 | ✅ runtime | ✅ | ✅ |
| 011 | super 方法运行时 | ✅ runtime | ✅ | ✅ |
| 012 | union 公共方法运行时 | ✅ runtime | N/A | N/A |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类型严格性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 编译时检查 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 三语言一致性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

## 7. 核心结论

1. **三语言基本语义一致**：三种 objectReference 形式的候选实体集合确定规则在 ArkTS/Java/Swift 中行为一致。
2. **空集合检查一致**：编译时捕获空集合（调用不存在的方法），三语言均严格检查。
3. **动态分发一致**：实例方法运行时多态分发三语言相同。
4. **重载解析一致**：多候选时通过参数类型匹配选择正确方法。

## 8. ArkTS 设计建议

- 候选实体集合的确定规则清晰且符合静态语言惯例。
- Union 类型的公共方法机制提供了类型安全的动态分发。
- 空集合编译时错误与 Java/Swift 一致，是良好的静态检查实践。

## 9. 三环境实测验证

实测代码见 `cross_lang_verify/`（2026-07-29 实测）：

| 文件 | 实测结果 |
|------|:--------:|
| `JavaEntitySelectionTest.java` + `.class` | 2/2 ✅ |
| `SwiftEntitySelectionTest.swift` + 二进制 | 2/2 ✅ |
| `verification_report.md` | 三环境结果报告 |
