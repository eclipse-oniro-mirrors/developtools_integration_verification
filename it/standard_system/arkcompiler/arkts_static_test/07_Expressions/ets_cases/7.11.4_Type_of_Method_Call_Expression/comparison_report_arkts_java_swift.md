# 7.11.4 Type of Method Call Expression — 三语言对比报告

## 1. 概览

方法调用表达式的类型是方法的返回类型。三语言均遵循此规则，但对 void 返回值赋值给变量的行为有差异。

| 语言 | 语法 | void 作语句 | void 赋值给变量 | 非 void 返回值 |
|------|------|-------------|----------------|---------------|
| **ArkTS** (spec) | `expr.method()` | ✅ 允许 | ❌ 编译时错误 | ✅ 允许 |
| **Java** | `expr.method()` | ✅ 允许 | ❌ 编译时错误 | ✅ 允许 |
| **Swift** | `expr.method()` | ✅ 允许 | ⚠️ warning（推断为 `()`） | ✅ 允许 |

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 方法调用表达式类型 = 返回类型 | ✅ | ✅ | ✅ |
| void 方法作为语句 | `A.method()` | `A.method()` | `A.method()` |
| 非 void 方法赋值 | `let x: T = obj.method()` | `T x = obj.method()` | `let x: T = obj.method()` |
| void 方法结果赋值 | ❌ 编译时错误 | ❌ 编译时错误 | ⚠️ warning |
| 方法类型推导 | `let x = obj.method()` | `var x = obj.method()` | `let x = obj.method()` |

## 3. 关键差异矩阵

| 维度 | ArkTS (spec) | ArkTS (实现) | Java | Swift |
|------|-------------|-------------|------|-------|
| void 方法作语句 | ✅ 编译通过 | ✅ 编译通过 | ✅ 编译通过 | ✅ 编译通过 |
| 非 void 方法赋值 | ✅ 编译通过 | ✅ 编译通过 | ✅ 编译通过 | ✅ 编译通过 |
| void 方法结果赋值 | ❌ 编译错误 | ⚠️ 编译通过（D 类） | ❌ 编译错误 | ⚠️ warning |
| 链式调用返回值 | ✅ 编译通过 | ✅ 编译通过 | ✅ 编译通过 | ✅ 编译通过 |
| 方法类型推导 | ✅ 编译通过 | ✅ 编译通过 | ✅ 编译通过 | ✅ 编译通过 |

## 4. 用例对照

### 4.1 void 方法结果赋值 ⭐⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `let x = A.method()` | ❌ Compile-time error as void cannot be used as type annotation |
| ArkTS (实现) | `let x = A.method()` | ✅ 编译通过（推断为 undefined 类型）⚠️ 与 spec 不一致 |
| Java | `var x = doSomething()` | ❌ 编译时错误：cannot infer type for local variable x (variable initializer is 'void') |
| Swift | `let x = doSomething()` | ⚠️ 编译通过但有 warning：constant 'x' inferred to have type '()' |

**差异原因**：ArkTS spec 要求禁止 void 作为类型注解（与 Java 一致），但编译器实现允许通过（与 Swift 行为更接近）。

### 4.2 非 void 方法返回值（三语言一致）

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let x: int = Calculator.add(10, 20)` | ✅ 编译通过，x = 30 |
| Java | `int x = Calculator.add(10, 20)` | ✅ 编译通过，x = 30 |
| Swift | `let x = Calculator.add(10, 20)` | ✅ 编译通过，x = 30 |

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | static void 方法作为语句 | ✅ compile-pass | ✅ | ✅ |
| 002 | instance void 方法作为语句 | ✅ compile-pass | ✅ | ✅ |
| 003 | static 返回 int 赋值 | ✅ compile-pass | ✅ | ✅ |
| 004 | instance 返回 string 赋值 | ✅ compile-pass | ✅ | ✅ |
| 005 | 方法返回值类型推导 | ✅ compile-pass | ✅ | ✅ |
| 006 | 方法返回值在表达式 | ✅ compile-pass | ✅ | ✅ |
| 007 | static void 结果赋值（❌spec） | ⚠️ 编译通过（D类） | ❌ 编译时错误 | ⚠️ warning |
| 008 | instance void 结果赋值（❌spec） | ⚠️ 编译通过（D类） | ❌ 编译时错误 | ⚠️ warning |
| 009 | static 返回 int 运行时 | ✅ runtime | ✅ | ✅ |
| 010 | instance 返回 string 运行时 | ✅ runtime | ✅ | ✅ |
| 011 | void 方法副作用运行时 | ✅ runtime | ✅ | ✅ |
| 012 | 链式调用返回值运行时 | ✅ runtime | ✅ | ✅ |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类型严格性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 编译时检查 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 三语言一致性 | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

## 7. 核心结论

1. **三语言基本语义一致**：非 void 方法的返回值赋值和 void 方法作语句，三语言行为一致。
2. **void 赋值差异**：ArkTS spec 要求禁止（同 Java），但编译器实现允许通过。
3. **Swift 居中**：对 void 赋值给出 warning 但不阻止编译。
4. **D 类不一致**：EXP_07_11_04_007/008 是 Spec 与实现不一致问题。

## 8. ArkTS 设计建议

- **建议按 spec 实现**：对 void 方法赋值给变量应产生编译时错误，与 Java 一致。
- 或**更新 spec**：如果目的是允许 void 作为表达式值（类似 Swift 的 `()` 类型），应更新 spec 说明。
- 当前状态（spec 禁止但实现允许）是技术债，建议明确方向。

## 9. 三环境实测验证

实测代码见 `cross_lang_verify/`（2026-07-29 实测）：

| 文件 | 实测结果 |
|------|:--------:|
| `JavaVoidMethodTest.java` + `.class` | 4/4 ✅ |
| `SwiftVoidMethodTest.swift` + 二进制 | 4/4 ✅ |
| `verification_report.md` | 三环境结果报告 |
