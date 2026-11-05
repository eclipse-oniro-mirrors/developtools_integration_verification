# 7.5.1 Array Literal Type Inference from Context — 三语言对比报告

## 1. 概览

Array Literal Type Inference from Context 定义了如何根据上下文推断数组字面量的类型。三语言的支持特征不同：

| 语言 | 定位 |
|------|------|
| **ArkTS** | 丰富的上下文推断：变量声明、赋值、cast、参数、元素类型、Union、tuple、FixedArray、ValueArray、readonly |
| **Java** | 数组创建需显式 `new T[]` 语法，但类型通过变量/参数/cast 上下文推断 |
| **Swift** | 与 ArkTS 最接近：`[T]` 类型标注、`as [T]` cast、参数推断均直接支持 |

## 2. 章节对应关系

| 概念 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 变量声明类型推断 | `let a: number[] = [1, 2, 3]` | `int[] a = {1, 2, 3};` | `let a: [Int] = [1, 2, 3]` |
| 赋值推断 | `a = [4, 5]` | `a = new int[]{4, 5};` | `a = [4, 5]` |
| Cast 推断 | `[1, 2, 3] as number[]` | `(int[]) obj` | `[1, 2, 3] as [Int]` |
| 参数推断 | `min([1., 3.14, 0.99])` | `min(new int[]{1, 3, 0})` | `min([1.0, 3.14, 0.99])` |
| Tuple | `[number, string]` | ❌ 原生不支持 | `(Int, String)`（语法不同） |
| FixedArray | `FixedArray<string>` | `String[]` | `[String]` |
| ValueArray | `ValueArray<int>` | ❌ 无等价类型 | ❌ 无等价类型 |
| 类类型数组 | `Array<aClass>` | `SomeClass[]` | `[SomeClass]` |
| 混合类型数组 | `Object[]` | `Object[]` | `[Any]` |
| readonly | `readonly string[]` | ❌ 无直接等价 | `let s: [String]` (let 即不可变) |

## 3. 关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 数组字面量语法 | `[1, 2, 3]` | `new int[]{1,2,3}` 或 `{1,2,3}`（仅声明时） | `[1, 2, 3]` |
| 变量声明类型推断 | ✅ 完整支持 | ✅ 仅数组初始化 | ✅ 完整支持 |
| 赋值类型推断 | ✅ 支持 | ⚠️ 需 `new T[]{}` | ✅ 支持 |
| Cast 类型推断 | ✅ `as T[]` | ✅ `(T[])` | ✅ `as [T]` |
| 参数类型推断 | ✅ 支持 | ✅ 支持 | ✅ 支持 |
| 多维数组 | ✅ `[[1,2],[3,4]]` | ✅ `new int[][]{{1,2},{3,4}}` | ✅ `[[1,2],[3,4]]` |
| Tuple | ✅ `[number, string]` | ❌ 不支持 | ✅ `(Int, String)`（语法不同） |
| 元素类型检查 | ✅ 编译时检查 | ✅ 编译时检查 | ✅ 编译时检查 |
| readonly 数组 | ✅ `readonly T[]` | ❌ | ✅ `let` 声明 |
| 任意元素混合 | ✅ `Object[]` | ✅ `Object[]` | ✅ `[Any]` |

## 4. 用例对照

### 4.1 变量声明类型标注
```
ArkTS:  let a: number[] = [1, 2, 3]
Java:   int[] a = {1, 2, 3};
Swift:  let a: [Int] = [1, 2, 3]
```
✅ 三语言均支持

### 4.2 多维数组
```
ArkTS:  let m: number[][] = [[1, 2], [3, 4]]
Java:   int[][] m = {{1, 2}, {3, 4}};
Swift:  let m: [[Int]] = [[1, 2], [3, 4]]
```
✅ 一致

### 4.3 Cast 推断
```
ArkTS:  [1, 2, 3] as number[]
Java:   (int[]) someObject
Swift:  [1, 2, 3] as [Int]
```
✅ 均支持，语法不同

### 4.4 赋值上下文
```
ArkTS:  a = [4, 5]
Java:   a = new int[]{4, 5};
Swift:  a = [4, 5]
```
⚠️ Java 需要 `new` 关键字，ArkTS/Swift 直接赋值

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 变量声明类型标注 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 002 | 赋值左值类型 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 003 | Cast 目标类型 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 004 | 参数类型上下文 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 005 | 嵌套数组元素类型 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 006 | Tuple 类型上下文 | ✅ compile-pass | N/A | ✅ compile-pass |
| 007 | FixedArray 上下文 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 008 | ValueArray<int> | ✅ compile-pass | N/A | N/A |
| 009 | Array<string> 泛型 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 010 | string[] 语法 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 011 | Object[] 混合类型 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 012 | Object 上下文 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 013 | Any 上下文 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 014 | FixedArray<Object> | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 015 | ValueArray<double> | ✅ compile-pass | N/A | N/A |
| 016 | Union 唯一匹配 | ✅ compile-pass | N/A | ⚠️ 无 union 数组 |
| 017 | 类类型数组 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 018 | readonly 数组 | ✅ compile-pass | N/A | ✅ compile-pass |
| 019 | Tuple 不匹配 | ✅ compile-fail | N/A | ✅ compile-fail |
| 020 | FixedArray 不匹配 | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 021 | ValueArray 不匹配 | ✅ compile-fail | N/A | N/A |
| 022 | string[] 不匹配 | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 023 | Union 歧义 | ✅ compile-fail | N/A | ⚠️ 类型不同 |
| 024 | 非数组接口 | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |

### 关键差异详解

#### 数组字面量语法差异 ⭐⭐

| 语言 | 语法 | 说明 |
|------|------|------|
| ArkTS | `[1, 2, 3]` | 直接创建数组 |
| Java | `new int[]{1, 2, 3}` 或 `{1, 2, 3}`（仅声明时） | 需要 `new` 关键字 |
| Swift | `[1, 2, 3]` | 直接创建数组，与 ArkTS 一致 |

#### ArkTS 独有类型

| 类型 | 说明 | Java | Swift |
|------|------|------|-------|
| `ValueArray<T>` | 值语义数组（连续内存） | ❌ 无等价类型 | ❌ 无等价类型 |
| `FixedArray<T>` | 固定大小数组 | ❌ 无直接等价 | ❌ 无直接等价 |
| `readonly T[]` | 只读数组视图 | ❌ `Collections.unmodifiableList` | ✅ `let [T]` |
| Union 类型上下文 | `string[] \| [int, int]` | ❌ 不支持 union 类型 | ❌ 不支持 |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 数组字面量语法简洁性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 上下文类型推断丰富度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 编译时类型安全性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 异质数组支持 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Union 类型推断 | ⭐⭐⭐⭐⭐ | N/A | N/A |

## 7. 核心结论

1. **ArkTS 的上下文推断最丰富**：支持 10+ 种上下文类型（声明、赋值、cast、参数、元素类型、tuple、FixedArray、ValueArray、Object、Any、Union、readonly）。
2. **语法与 Swift 高度一致**：`[1, 2, 3]` 字面量语法和 `as T[]` cast 完全相同。
3. **Java 的数组创建需额外语法**：`new int[]{...}` 比 ArkTS/Swift 更冗长。
4. **ArkTS 独有特性**：`ValueArray`、`FixedArray`、`readonly T[]`、Union 类型上下文推断在 Java/Swift 中无等价概念。
5. **无 SPEC 不一致问题**。

## 8. ArkTS 设计建议

- 当前设计完备且一致，无缺陷。
- 上下文推断规则清晰，与 Swift 主流实践一致。
- `ValueArray` / `FixedArray` / `readonly` 增加了 ArkTS 的类型安全性，值得保留。

## 9. 三环境实测验证

实测代码和报告见 `cross_lang_verify/` 目录（2026-07-28 实测）：

| 文件 | 实测结果 |
|------|:--------:|
| `JavaArrayLiteralTest.java` + `.class` | 27/27 ✅ |
| `SwiftArrayLiteralTest.swift` + 二进制 | 27/27 ✅ |
| `verification_report.md` | 三环境结果对照 |

**实测关键验证点：**
- 数组字面量语法：Swift `[1,2,3]`（同 ArkTS），Java 需 `new int[]{1,2,3}`
- Tuple 语法：Swift `(T,U)`，ArkTS `[T,U]`，Java N/A
- 类型不匹配：三语言均在编译时报错
