# 7.27.2 Bigint Relational Operators — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

**D 类（Spec 与实现不一致）**：无。所有 19 用例通过，与 Spec 完全一致。

**Spec 内部一致性说明**：ArkTS spec 的 `types.md`（Type bigint 章节）有一行一般性表述："Relational operators that use an operand of type bigint along with an operand of another type are illegal." 然而 `expressions.md` 的 7.27.2 小节明确提供了混合 bigint+数值类型关系运算的详细转换规则和示例代码。编译器实际行为遵循 expressions.md 7.27.2 的详细规则，未对混合 bigint+数值类型关系运算报错。这属于 Spec 内部一般性规则与特例之间的不一致，而非实现缺陷。已确认实现正确遵循了更具体的 7.27.2 规则。

---

### ID-01: 隐式混合类型转换

| 字段 | 值 |
|------|-----|
| **复现用例** | N/A（跨语言设计差异） |
| **实测结果** | ArkTS 允许 bigint 与 int/long/byte/short/double 自动混合比较；Java/Swift 需显式转换 |
| **错误信息** | 无错误 |

**描述**：ArkTS 7.27.2 是唯一允许 bigint 与数值类型自动混合比较的语言。这简化了混合 bigint/数值运算的代码编写，但可能导致意外的类型转换（如大 bigint 转 double 时的精度损失）。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `2n > 1` | ✅ 自动转换 int→bigint，支持混合类型比较 |
| Java | `BigInteger.valueOf(2).compareTo(BigInteger.valueOf(1)) > 0` | ❌ 需显式调用方法，不支持运算符语法 |
| Swift | `Int64(2) > 1` | ❌ 需显式构造 Int64，Swift 无内建 bigint 类型 |

**分类**：跨语言设计差异

**建议**：保持现状。bigint 关系运算符实现完全符合 spec 7.27.2 定义，无需修改。

---

### ID-02: 任意精度整数支持

| 字段 | 值 |
|------|-----|
| **复现用例** | N/A（跨语言设计差异） |
| **实测结果** | ArkTS 内建 bigint 字面量语法 `2n`；Java 通过 BigInteger 标准库类支持；Swift 标准库无任意精度整数 |
| **错误信息** | 无错误 |

**描述**：ArkTS 和 Java 都支持任意精度整数，但 ArkTS 将 bigint 作为语言内建类型（有字面量写法和操作符），Java 将其作为标准库类（需方法调用）。Swift 标准库无任意精度整数，限制了其处理大整数场景。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `2n` | ✅ 内建 bigint 字面量语法，关系运算符直接使用 |
| Java | `BigInteger.valueOf(2)` | ✅ 标准库 BigInteger 类，需 compareTo() 方法 |
| Swift | N/A | ❌ 无内建任意精度整数，仅 Int64 范围（2^63-1） |

**分类**：跨语言设计差异

**建议**：1. 更新 types.md，将 Type bigint 章节中的"禁止混合 relational operators"一般性表述改为"见 7.27.2 详细规则"的引用，解决内部不一致。2. 明确说明 bigint 与 double/float 混合比较的精度损失场景（bigint→double 对大值有精度损失）。

---
