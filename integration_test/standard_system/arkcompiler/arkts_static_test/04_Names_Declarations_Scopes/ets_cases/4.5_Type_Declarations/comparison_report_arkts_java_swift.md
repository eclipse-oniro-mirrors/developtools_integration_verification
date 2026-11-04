# 4.5 Type Declarations - 跨语言对比报告 ArkTS / Java / Swift

## 概览

Type Declarations（类型声明）涵盖类型别名（type alias）和递归类型的支持。Java 没有类型别名机制，因此可比性有限；Swift 的 `typealias` 与 ArkTS 的 `type` 最为接近。

## 章节对应关系

| ArkTS (§4.5) | Java (JLS) | Swift (Type Declarations) |
|------|------|-------|
| Type Alias | ❌ 无 | typealias Declaration |
| 泛型别名 | ❌ 无 | Generic typealias |
| 递归类型别名 | ❌ 无 | Indirect typealias |
| 循环引用检测 | ❌ 无 | ✅ 自动检测 |

## 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| type alias | ✅ `type` | ❌ (无) | ✅ `typealias` |
| 递归别名支持 | 有限（数组/泛型成员） | N/A | ✅ 完全支持（`indirect`） |
| 泛型别名 | ✅ | N/A | ✅ |
| 联合类型别名 | ✅ | N/A | ✅ |
| 循环引用编译检测 | ✅ | N/A | ✅ |
| 类型参数依赖检查 | ✅ | N/A | ✅ |

## 用例 1:1 对照

### 简单类型别名
| ArkTS | Java | Swift |
|-------|------|-------|
| `type MyArray = number[];` | ❌ 无等价语法 | `typealias MyArray = [Int]` |

### 泛型别名
| ArkTS | Java | Swift |
|-------|------|-------|
| `type Box<T> = T[];` | ❌ | `typealias Box<T> = [T]` |

## 用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 012 | class 声明作为类型声明 | ✅ compile-pass | ✅ javac + java | ✅ swiftc + executable |
| 013 | interface 声明作为类型声明 | ✅ compile-pass | ✅ javac + java | ✅ swiftc + executable |
| 014 | enum 声明作为类型声明 | ✅ compile-pass | ✅ javac + java | ✅ swiftc + executable |
| 028 | const enum 当前实现不支持 | ✅ compile-fail | N/A（Java 无 const enum） | N/A（Swift 无 const enum） |

## 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 类型别名支持 | ⭐⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ |
| 递归类型表达 | ⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ |
| 循环引用检测 | ⭐⭐⭐⭐ | N/A | ⭐⭐⭐⭐⭐ |
| 表达能力 | ⭐⭐⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ |

## 核心结论

Java 不支持类型别名，本质差异最大。ArkTS 的类型别名能力和 Swift 最为接近，但在递归类型支持上受限（仅数组/泛型成员，不支持直接递归如 `type Tree = Tree`）。

## ArkTS 设计建议

如果未来需要更复杂的递归类型（如链表、树），可考虑引入 `indirect` 关键字（类似 Swift），明确标记允许递归的类型别名。
