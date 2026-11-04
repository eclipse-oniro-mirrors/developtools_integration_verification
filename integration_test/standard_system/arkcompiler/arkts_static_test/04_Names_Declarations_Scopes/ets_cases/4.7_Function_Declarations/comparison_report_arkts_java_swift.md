# 4.7 Function Declarations - 跨语言对比报告 ArkTS / Java / Swift

## 概览

Function Declarations（函数声明）涵盖函数的声明语法、参数类型（可选/只读/rest）、返回类型规则以及 native 函数。ArkTS 的顶层函数和 readonly 参数是区别于 Java 的显著特征。

## 章节对应关系

| ArkTS (§4.7) | Java (JLS §8.4) | Swift (Functions) |
|------|------|-------|
| 函数声明 | Method Declarations | Function Declarations |
| 可选参数 | ❌ (重载替代) | Default Parameter Values |
| 只读参数 | ❌ (Java 无) | let (默认) |
| Rest 参数 | Variable Arity (varargs) | Variadic Parameters |
| 返回类型 | Return Type | Return Type |
| Native 函数 | native keyword | ❌ |

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 顶层函数 | ✅ | ❌ (静态方法) | ✅ |
| 可选参数 | ✅ (默认值/?) | ❌ (重载) | ✅ |
| 只读参数 | ✅ (`readonly`) | ❌ | ✅ (let 默认) |
| Rest 参数 | ✅ (`...`) | ❌ (`varargs` 仅数组) | ✅ (`...`) |
| 返回类型推断 | ✅ | ❌ | ✅ |
| Native 函数 | ✅ | ✅ (`native`) | ❌ |
| 函数签名单独声明 | ✅ | ✅ (abstract) | ✅ (protocol) |

## 用例 1:1 对照

### 顶层函数
| ArkTS | Java | Swift |
|-------|------|-------|
| `function add(a: number, b: number): number { return a + b; }` | ❌ 必须封装在类中 | `func add(a: Int, b: Int) -> Int { a + b }` |

### 可选参数
| ArkTS | Java | Swift |
|-------|------|-------|
| `function f(x?: number): void {}` | ❌ 需重载 | `func f(x: Int? = nil) {}` |
| `function g(x: number = 5): void {}` | ❌ 需重载 | `func g(x: Int = 5) {}` |

### Rest 参数
| ArkTS | Java | Swift |
|-------|------|-------|
| `function sum(...nums: number[]): number` | `int sum(int... nums)` | `func sum(_ nums: Int...) -> Int` |

## 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 函数表达力 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 参数灵活性 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 类型安全 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 简洁性 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

## 核心结论

ArkTS 在函数声明能力上远超 Java（可选参数、只读参数、返回类型推断、顶层函数），与 Swift 高度对齐。Java 因其纯 OO 设计，缺少顶层函数和可选参数。

## ArkTS 设计建议

保持当前设计。函数声明能力是 ArkTS 相比 Java 的核心优势之一，有助于函数式编程风格的表达。

---

## 用例 1:1 对照（三环境实测结果）

**实测日期：** 2026-06-24
**实测环境：** ArkTS (es2panda + ark) / Java (javac + java SE 21) / Swift (5.10, /opt/swift/usr/bin/swift)

| 语言 | 编译 | 运行 | 验证结论 |
|------|------|------|---------|
| ArkTS | ✅ es2panda 编译通过 | ✅ ark 运行通过 | 行为符合预期 |
| Java | ✅ javac 编译通过 | ✅ java 运行通过 | 行为一致或差异已标注 |
| Swift | ✅ swift 编译通过 | ✅ swift 运行通过 | 行为一致或差异已标注 |

> 完整实测代码见章级 `cross_lang_verify/` 目录，详细输出见 `cross_lang_verify/verification_report.md`
