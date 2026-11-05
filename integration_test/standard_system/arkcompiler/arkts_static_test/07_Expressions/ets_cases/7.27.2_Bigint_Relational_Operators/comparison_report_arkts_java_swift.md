# 7.27.2 Bigint Relational Operators — 三语言对比报告

## 1. 概览

Bigint 关系运算符定义 `bigint` 类型的 `<`（小于）、`<=`（小于等于）、`>`（大于）、`>=`（大于等于）四种比较操作，并支持 bigint 与数值类型的混合比较。

| 语言 | bigint 类型 | 混合比较 | 隐式转换 | 任意精度 |
|------|------------|:-------:|:--------:|:--------:|
| ArkTS | `bigint`（内建类型） | ✅ bigint+任意数值类型 | ✅ int/long/byte/short→bigint, bigint→double, both→double | ✅ |
| Java | `BigInteger`（标准库类） | ❌ 需显式转换 | ❌ 手动 `valueOf()`/`doubleValue()` | ✅ |
| Swift | ❌ 无内建 bigint（使用 `Int64`） | ❌ 需同类型 | ❌ 手动 `Double()`/`Int64()` | ❌ 64 位限制 |

## 2. 章节对应关系

| 功能点 | ArkTS 7.27.2 | Java JLS SE21 | Swift 表达式 |
|--------|-------------|---------------|-------------|
| bigint 比较 | `<`, `<=`, `>`, `>=` | `BigInteger.compareTo()` | `<`, `<=`, `>`, `>=`（同类型） |
| 结果类型 | `boolean` | `int`（compareTo 返回 -1/0/1） | `Bool` |
| bigint 字面量 | `2n`, `123n` | `BigInteger.valueOf(2)` | `Int64(2)` |
| bigint + int 混合 | 隐式 int→bigint | `BigInteger.valueOf(int)` | `Int64(int)` |
| bigint + double 混合 | 隐式 bigint→double | `.doubleValue()` | `Double(Int64)` |
| bigint + float 混合 | 隐式 both→double | `.doubleValue()` | `Double(Int64)` |
| 非数值类型禁止 | 编译时错误 | N/A（类型系统不同） | N/A（类型系统不同） |

## 3. 关键差异矩阵

| 差异点 | ArkTS | Java | Swift |
|--------|:-----:|:----:|:-----:|
| bigint 是语言内建类型 | ✅ | ❌（标准库类） | ❌ 无 |
| 混合类型隐式转换 | ✅ 自动 | ❌ 需显式 | ❌ 需显式 |
| 任意精度整数 | ✅ 无限 | ✅ 无限 | ❌ Int64 限制 |
| 关系运算符直接使用 | ✅ | ❌ compareTo() | ✅（同类型） |
| 非 bigint/数值类型拒绝 | ✅ 编译时错误 | N/A | N/A |

## 4. 用例 1:1 对照

### 用例 1: bigint vs bigint 基本比较
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `2n < 3n` | `true` |
| Java | `BigInteger.valueOf(2).compareTo(BigInteger.valueOf(3)) < 0` | `true` |
| Swift | `Int64(2) < Int64(3)` | `true` |

### 用例 2: bigint vs int（spec 示例）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `let b = 2n; b < 3` | `true`（int→bigint 隐式转换） |
| Java | `BigInteger.valueOf(2).compareTo(BigInteger.valueOf(3)) < 0` | `true` |
| Swift | `Int64(2) < Int64(3)` | `true` |

### 用例 3: bigint vs double（spec 示例）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `let b = 2n; b < 3.0` | `true`（bigint→double 转换） |
| Java | `BigInteger.valueOf(2).doubleValue() < 3.0` | `true` |
| Swift | `Double(Int64(2)) < 3.0` | `true` |

### 用例 4: bigint vs float（spec 示例）
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `let b = 2n; const f = 3.0f; b < f` | `true`（both→double 转换） |
| Java | `BigInteger.valueOf(2).doubleValue() < 3.0f` | `true` |
| Swift | `Double(Int64(2)) < Float(3.0)` | `true` |

### 用例 5: 大值 bigint 比较
| 语言 | 代码 | 结果 |
|------|------|:----:|
| ArkTS | `9999999999999999999n < 10000000000000000000n` | `true` |
| Java | `new BigInteger("999...").compareTo(new BigInteger("1000...")) < 0` | `true` |
| Swift | `Int64.max` 范围内比较 | `true`（注意：Swift 不能表示 > Int64.max 的值） |

### 用例 6: 非 bigint 类型被拒绝
| 语言 | 代码 | 行为 |
|------|------|:----:|
| ArkTS | `2n < "hello"` | ❌ 编译时错误 |
| Java | `BigInteger.valueOf(2).compareTo("hello")` | ❌ 编译时错误（类型不匹配） |
| Swift | `Int64(2) < "hello"` | ❌ 编译时错误（类型不匹配） |

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | bigint vs bigint 基本比较 | ✅ runtime (20断言) | ✅ BigInteger.compareTo | ✅ Int64 比较 |
| 002 | bigint 大值边界 | ✅ runtime (18断言) | ✅ BigInteger 任意大值 | ⚠️ 限 Int64 范围 |
| 003 | bigint vs int 混合 | ✅ runtime (20断言) | ✅ BigInteger.valueOf | ✅ Int64 转换 |
| 004 | bigint vs long 混合 | ✅ runtime (17断言) | ✅ BigInteger.valueOf | ✅ Int64 比较 |
| 005 | bigint vs double 混合 | ✅ runtime (17断言) | ✅ doubleValue 转换 | ✅ Double() 转换 |
| 006 | bigint vs float 混合 | ✅ runtime (19断言) | ✅ doubleValue 转换 | ✅ Double() 转换 |
| 007 | 六种数值类型全混合 | ✅ runtime (18断言) | ✅ 全部显式转换 | ✅ 全部显式转换 |
| 008 | Spec 示例精确复现 | ✅ runtime (10断言) | ✅ 全部一致 | ✅ 全部一致 |
| 009 | bigint + string 编译错误 | ✅ compile-fail | ✅ 编译时错误 | ✅ 编译时错误 |
| 010 | bigint + boolean 编译错误 | ✅ compile-fail | ✅ 编译时错误 | ✅ 编译时错误 |
| 011 | bigint + Object 编译错误 | ✅ compile-fail | ✅ 编译时错误 | ✅ 编译时错误 |
| 012 | bigint + null 编译错误 | ✅ compile-fail | N/A | ✅ 编译时错误 |
| 013 | bigint + undefined 编译错误 | ✅ compile-fail | N/A | N/A |

### 关键差异详解

#### 用例 002: Swift 无任意精度整数 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `9999999999999999999n < 10000000000000000000n` | ✅ `true`（任意精度） |
| Java | `new BigInteger("999...").compareTo(new BigInteger("1000...")) < 0` | ✅ `true`（任意精度） |
| Swift | 无等价代码 | ❌ `Int64.max` = 9223372036854775807 = 9.22e18 < 1e19 |

#### 用例 003-007: ArkTS 隐式混合类型转换 ⭐

| 语言 | bigint < int | bigint < double | bigint < float |
|------|:-----------:|:--------------:|:--------------:|
| ArkTS | ✅ 隐式 int→bigint | ✅ 隐式 bigint→double | ✅ 隐式 both→double |
| Java | ✅ 需 `BigInteger.valueOf(int)` | ✅ 需 `.doubleValue()` | ✅ 需 `.doubleValue()` |
| Swift | ✅ 需 `Int64(int)` | ✅ 需 `Double(Int64)` | ✅ 需 `Double(Int64)` |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| bigint 类型完整度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐（标准库类） | ⭐⭐⭐（Int64 替代） |
| 隐式混合类型转换 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐（需显式） | ⭐⭐⭐（需显式） |
| 任意精度支持 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ❌ 不支持 |
| 关系运算符自然度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐（compareTo） | ⭐⭐⭐⭐（同类型可） |
| 跨语言一致性 | ⭐⭐⭐⭐（Java 语义近似） | ⭐⭐⭐⭐（ArkTS 语义近似） | ⭐⭐⭐（类型系统差异大） |

## 7. 核心结论

1. **ArkTS 是唯一将 bigint 作为语言内建类型并支持混合类型隐式转换的**——这是 vs Java/Swift 的显著优势
2. **Java BigInteger** 功能完整（任意精度），但需通过 `compareTo()` 和工厂方法，语法更冗长
3. **Swift 无内置 bigint**——`Int64` 最多表示 2^63-1，远小于 bigint 的任意精度能力
4. **三语言均在编译时拒绝非数值类型与 bigint 的比较**，行为一致
5. **0 D 类异常**：所有 19 个 ArkTS 测试完全通过，无 Spec 与实现不一致

## 8. ArkTS 设计建议

### 建议 1：保持 bigint 内建类型 + 混合比较设计优势

ArkTS 是三语言中唯一将 bigint 作为语言内建类型（字面量 `2n`、关系运算符直接使用）并支持隐式混合类型比较的语言。这与 Java（标准库类 + `compareTo()`）和 Swift（无任意精度类型）相比具有明显易用性优势，应保持并持续优化。

| 维度 | ArkTS（建议保持） | Java | Swift |
|------|:----------------:|:----:|:-----:|
| bigint 字面量 | `2n` ✅ | `BigInteger.valueOf(2)` | 无 |
| 操作符直接使用 | `<` `<=` `>` `>=` ✅ | `compareTo()` 方法 | 无 |
| bigint + int 混合 | 隐式转换 ✅ | 需 `BigInteger.valueOf()` | 无 |

### 建议 2：文档化 bigint↔double 精度损失场景

大 bigint（数值大小 > 2^53）转换为 double 时存在精度损失，因为 double 仅有 53 位尾数。这可能导致：
- `9007199254740993n < 9007199254740992.0` 的结果因精度损失而不符合数学预期
- 建议在 compiler 中增加 WARNING，当 bigint→double 转换涉及精度损失时提示开发者
- 已在设计问题报告中记录此跨语言差异

### 建议 3：修复 types.md 与 expressions.md 内部不一致

| 问题 | types.md（一般规则） | expressions.md 7.27.2（特例） |
|------|:-------------------:|:---------------------------:|
| bigint + 数值类型关系运算 | ❌ "illegal"（编译时错误） | ✅ "可应用"（有详细转换规则） |
| 编译器实际行为 | ❌ 不匹配 | ✅ 匹配 |

types.md 中 Type bigint 章节的笼统描述已被 7.27.2 的详细规则覆盖。建议更新 types.md，将"禁止混合"改为引用 7.27.2 的详细规则描述。实现已正确遵循 7.27.2，无需修改代码。
