# 7.25.2 Additive Operators for Numeric Types — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 整数溢出处理方式

| 字段 | 值 |
|------|-----|
| **复现用例** | 多个涉及整数溢出加减法的用例 |
| **实测结果** | ArkTS `MAX_INT + 1` = `-2147483648`（二进制补码截断，不抛异常） |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 与 Java 一致采用静默溢出（二进制补码截断），这是 C/Java 传统的性能优先设计。Swift 则默认检查整数溢出并抛出运行时错误，要求开发者显式使用 `&+`/`&-` 表示需要溢出行为。这不是实现缺陷，而是安全设计哲学差异。

**跨语言对比**：

| 语言 | `MAX_INT + 1` | 结果 | 说明 |
|------|:------------:|:----:|------|
| ArkTS | `2147483647 + 1` | -2147483648 | 二进制补码截断，不抛异常 |
| Java | `Integer.MAX_VALUE + 1` | -2147483648 | 二进制补码截断，不抛异常 |
| Swift | `Int.max + 1` | ❌ 运行时错误 | 默认溢出检测 |
| Swift | `Int.max &+ 1` | -9223372036854775808 | 需 `&+` 溢出运算符 |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：保持现状，ArkTS 数值加减法与 Java 完全一致，符合 Java 开发者预期。

---

### ID-02: 类型提升自动性

| 字段 | 值 |
|------|-----|
| **复现用例** | 多个涉及数值类型提升的用例 |
| **实测结果** | ArkTS 自动类型提升链：byte→short→int→long→float→double |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：三语言的类型提升规则不同。ArkTS/Java 使用统一提升链（byte→short→int→long→float→double）。Swift 使用分离链（Int8→Int16→Int32→Int64 和 Float→Double），需要显式跨链转换。

**跨语言对比**：

| 语言 | int+float | int+double | long+double |
|------|:---------:|:----------:|:-----------:|
| ArkTS | float（自动） | double（自动） | double（自动） |
| Java | float（自动） | double（自动） | double（自动） |
| Swift | ❌ 编译错误 | Double（自动） | Double（自动） |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：保持现状。

---

### ID-03: bigint 数值运算支持

| 字段 | 值 |
|------|-----|
| **复现用例** | 多个涉及 bigint 加减法的用例 |
| **实测结果** | ArkTS 唯一支持 `bigint + bigint` 和 `bigint - bigint` 原生运算，严格拒绝 `bigint + int` 混合（编译错误） |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 唯一支持 `bigint + bigint` 和 `bigint - bigint` 原生运算。ArkTS 严格拒绝 `bigint + int` 混合（编译错误），强制类型安全。Java/Swift 无 bigint 原始类型加减法运算符。

**跨语言对比**：

| 语言 | bigint + bigint | bigint + int |
|------|:--------------:|:------------:|
| ArkTS | ✅ 原生支持 | ❌ 编译错误（类型安全） |
| Java | ❌ 需 BigInteger.add() | ❌ 需 BigInteger.add() |
| Swift | ❌ 无 bigint 原始类型 | ❌ 无 bigint 原始类型 |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：`bigint` 与数值严格隔离是类型安全设计，应继续保持。

---

### 差异说明

#### 1. IEEE 754 浮点实现

三语言在浮点加法上行为完全一致：
- NaN + X = NaN
- +∞ + (-∞) = NaN
- +∞ + finite = +∞
- (+0) + (-0) = +0
- `a - b = a + (-b)` 对 int 和 float 均成立
- `0.0 - (+0.0) = +0.0` ≠ `-(+0.0) = -0.0`
