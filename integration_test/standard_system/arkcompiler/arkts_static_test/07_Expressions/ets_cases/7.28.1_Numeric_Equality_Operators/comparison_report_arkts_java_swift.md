# 7.28.1 Numeric Equality Operators — 三语言对比报告

## 1. 概览

数值等值运算符定义 `==`、`===`、`!=`、`!==` 四种等值比较操作。

| 语言 | 数值类型 | 浮点比较 | IEEE 754 支持 | byte/short 提升 | bigint 支持 | ===/!== |
|------|---------|---------|:------------:|:--------------:|:-----------:|:-------:|
| ArkTS | byte/short/int/long/float/double | float/double 比较 | ✅ NaN/Inf/-0.0 | ✅ 自动提升 int | ✅ bigint | ✅ 支持 |
| Java | byte/short/int/long/float/double | float/double 比较 | ✅ NaN/Inf/-0.0 | ✅ 自动提升 int | ❌ BigInteger.equals() | ❌ 无 |
| Swift | Int/Int8/Int16/Int32/Int64/Float/Double | Float/Double 比较 | ✅ NaN/Inf/-0.0 | ✅ 需显式转换 | ❌ 无 | ❌ 无（===为引用相等） |

## 2. 章节对应关系

| 功能点 | ArkTS 7.28.1 | Java JLS §15.21.1 | Swift 表达式 |
|--------|-------------|-------------------|-------------|
| 等值 | `==`, `===` | `==` | `==` |
| 不等 | `!=`, `!==` | `!=` | `!=` |
| 结果类型 | `boolean` | `boolean` | `Bool` |
| int 数值 | 32-bit signed | 32-bit signed | Int32（显式） |
| long 数值 | 64-bit signed | 64-bit signed | Int64 |
| float | 32-bit IEEE 754 | 32-bit IEEE 754 | Float |
| double | 64-bit IEEE 754 | 64-bit IEEE 754 | Double |
| byte/short | 自动 int 提升 | 自动 int 提升 | Int8/Int16 需显式转换 |
| NaN 比较 | == false, != true | 同左 | 同左（编译时警告） |
| -0.0 == +0.0 | true | true | true |
| bigint | 支持 | ❌ | ❌ |

## 3. 关键差异矩阵

| 差异点 | ArkTS | Java | Swift |
|--------|:-----:|:----:|:-----:|
| 浮点字面量后缀 | `f` 后缀需要 | `f` 后缀需要 | 类型推断自动 |
| long 字面量 | 无 `L` 后缀 | `L` 后缀 | 无（Int64 类型推断） |
| 隐式跨类型数值比较 | ✅ 自动提升 | ✅ 自动提升 | ❌ 需显式转换 |
| Object == int | ⚠️ 允许通过 | ❌ 编译时错误 | ❌ 类型错误 |
| enum == int | ⚠️ 允许通过 | ❌ 编译时错误 | ❌ 类型错误 |
| null == int | ⚠️ 允许通过 | ❌ 编译时错误 | ❌ 类型错误 |
| ===/!== 运算符 | ✅ 数值语义 | ❌ 无 | ❌ 引用语义 |
| bigint 支持 | ✅ | ❌ | ❌ |
| NaN 编译时警告 | ❌ 无 | ❌ 无 | ✅ 有警告 |

## 4. 用例 1:1 对照

### 用例 1: int 等值（spec 示例）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `5 == 5` | `true` |
| Java | `5 == 5` | `true` |
| Swift | `5 == 5` | `true` |

### 用例 2: NaN 比较（IEEE 754 核心规则）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `nan == 1.0` | `false` |
| Java | `Double.NaN == 1.0` | `false` |
| Swift | `Double.nan == 1.0` | `false` |

### 用例 3: NaN != NaN（IEEE 754 特殊规则）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `nan != nan` | `true` |
| Java | `Double.NaN != Double.NaN` | `true` |
| Swift | `Double.nan != Double.nan` | `true` |

### 用例 4: -0.0 == 0.0
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `-0.0 == 0.0` | `true` |
| Java | `-0.0 == 0.0` | `true` |
| Swift | `-0.0 == 0.0` | `true` |

### 用例 5: int == double（spec 示例）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `5 == 5.0` | `true` |
| Java | `5 == 5.0` | `true` |
| Swift | `Double(5) == 5.0` | `true` |

### 用例 6: bigint 等值
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `5n == 5n` | `true` |
| Java | ❌ N/A | ❌ |
| Swift | ❌ N/A | ❌ |

### 用例 7: bigint vs numeric（结果为 false）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `5n == 5` | `false` |
| Java | ❌ N/A | ❌ |
| Swift | ❌ N/A | ❌ |

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|:-----:|:----:|:-----:|
| 001 | int 基本等值 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 002 | long 基本等值 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 003 | byte/short 提升 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 004 | float 等值 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 005 | double 等值 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 006 | char vs 数值 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 007 | 混合数值类型 | ✅ compile-pass | ✅ compile-pass | ⚠️ 需显式转换 |
| 008 | bigint 等值 | ✅ compile-pass | ❌ N/A | ❌ N/A |
| 009 | bigint vs 数值 | ✅ compile-pass | ❌ N/A | ❌ N/A |
| 010 | Number 包装对象 | ✅ compile-pass | ✅ compile-pass | ❌ N/A |
| 011 | spec 示例代码 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass |
| 012 | NaN/Inf/Zero 编译 | ✅ compile-pass | ✅ compile-pass | ✅ compile-pass（NaN 警告） |
| 013 | boolean vs 数值 | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 014 | string vs 数值 | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 015 | Object vs 数值 | ⚠️ D 类 | ✅ compile-fail | ✅ compile-fail |
| 016 | enum vs 数值 | ⚠️ D 类 | ✅ compile-fail | ✅ compile-fail |
| 017 | null vs 数值 | ⚠️ D 类 | ✅ compile-fail | ✅ compile-fail |
| 018 | int 等值运行时 | ✅ runtime | ✅ runtime | ✅ runtime |
| 019 | IEEE 754 浮点 | ✅ runtime | ✅ runtime | ✅ runtime |
| 020 | 混合类型运行时 | ✅ runtime | ✅ runtime | ⚠️ 需显式转换 |
| 021 | bigint 运行时 | ✅ runtime | ❌ N/A | ❌ N/A |

### 关键差异详解

#### 差异 1: Object/enum/null 与数值比较 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `new Object() == 5` | 编译通过（D 类） |
| Java | `new Object() == 5` | ❌ 编译错误：incomparable types |
| Swift | `Object() == 5` | ❌ 编译错误 |

ArkTS 在此场景比 Java/Swift 宽松，允许引用类型与数值类型通过 `==` 比较。

#### 差异 2: Swift 需要显式类型转换

```swift
let i = 5       // Int (64-bit)
let i32: Int32 = 5
// i == i32     // ❌ 编译错误
Int64(i32) == Int64(i)  // ✅ 需显式转换
```

ArkTS 和 Java 均自动进行数值加宽转换。

#### 差异 3: ArkTS 支持 ===/!== 数值语义

ArkTS 的 `===` 和 `!==` 对数值类型具有与 `==`/`!=` 相同的语义。Java 无此运算符。Swift 的 `===` 仅用于引用相等。

#### 差异 4: ArkTS 是唯一原生支持 bigint 的语言

ArkTS 的 bigint 类型支持 `==`/`!=`/`===`/`!==` 等值比较。Java 有 `BigInteger` 类但需用 `equals()` 方法。Swift 无内置大整数类型。

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:----:|:----:|:-----:|
| 类型严格性 | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 数值精度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| IEEE 754 合规 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| bigint 支持 | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐ |
| 语法简洁性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| 混合类型安全 | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

## 7. 核心结论

1. **IEEE 754 规则三语言一致**：NaN/Infinity/零比较行为相同
2. **ArkTS 是唯一原生支持 bigint 等值比较的语言**
3. **ArkTS 三类类型检查更宽松**（Object/enum/null），Java/Swift 更严格
4. **Swift NaN 编译时警告**是额外的安全特性
5. **ArkTS 不支持 long 字面量 `L` 后缀**（与 Java 不同）

## 8. ArkTS 设计建议

1. **考虑为 ===/!== 添加文档说明**：明确 `===` 对数值类型与 `==` 语义相同
2. **评估 D 类问题**：是否允许 Object/enum/null 与数值比较是有意设计决策
3. **考虑 long 字面量后缀**：添加 `L` 后缀支持可提高 Java 开发者的移植体验
