# 5.1 Type Parameters - 跨语言对比报告 ArkTS / Java / Swift

## 概览

Type Parameters（类型参数）是泛型的核心。ArkTS 继承 TypeScript 的泛型语法，与 Java 和 Swift 在约束、默认值和循环检测上存在差异。

## 章节对应关系

| ArkTS (§5.1) | Java (JLS §4.5) | Swift (Generics) |
|------|------|-------|
| 泛型类/接口 | Generic Classes/Interfaces | Generic Types |
| 泛型函数 | Generic Methods | Generic Functions |
| 类型参数约束 | Bounded Type Parameters | Type Constraints |
| 默认类型参数 | ❌ | Default Generic Arguments |
| 循环依赖检测 | ❌ (编译时) | ✅ |

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 泛型类/接口 | ✅ `<T>` | ✅ `<T>` | ✅ `<T>` |
| 泛型函数 | ✅ | ✅ | ✅ |
| 约束语法 | `extends` | `extends` | `:` |
| 默认类型 | ✅ `= Type` | ❌ | ✅ |
| 循环依赖检测 | ✅ | ❌ (运行时) | ✅ |
| `keyof` 约束 | ✅ | ❌ | ✅ |
| 多参数支持 | ✅ | ✅ | ✅ |

## 用例 1:1 对照

### 基本泛型类
| ArkTS | Java | Swift |
|-------|------|-------|
| `class Box<T> { value: T; }` | `class Box<T> { T value; }` | `class Box<T> { var value: T }` |

### 类型参数约束
| ArkTS | Java | Swift |
|-------|------|-------|
| `class G<T extends Base> {}` | `class G<T extends Base> {}` | `class G<T: Base> {}` |

### 默认类型参数
| ArkTS | Java | Swift |
|-------|------|-------|
| `class C<T = number> {}` | ❌ | `struct C<T = Int> {}` |

## 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 泛型表达力 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 约束灵活性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 编译期安全性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 默认值支持 | ⭐⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ |

## 核心结论

ArkTS 在泛型参数能力上介于 Java 和 Swift 之间：比 Java 多了默认类型参数和循环依赖检测，但比 Swift 缺少一些高级特性。约束语法（`extends`）与 Java 一致，降低 Java 开发者学习成本。

## ArkTS 设计建议

保持当前设计。`extends` 约束语法与 Java 一致是有意为之。如未来需要，可考虑添加 `where` 子句支持更复杂的约束表达。

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
