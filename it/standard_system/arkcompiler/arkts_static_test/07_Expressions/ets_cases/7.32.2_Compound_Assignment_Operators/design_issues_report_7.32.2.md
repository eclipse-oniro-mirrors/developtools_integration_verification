# 7.32.2 Compound Assignment Operators — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: ??= (Nullish Coalescing Assignment) 编译器不支持 ⭐⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_32_02_005_FAIL_NULLISH_COALESCING_UNSUPPORTED, EXP_07_32_02_008_FAIL_NULLISH_NONNULLABLE, EXP_07_32_02_011_FAIL_NULLISH_BEHAVIOR_UNSUPPORTED |
| **实测结果** | 编译报 Syntax error ESY0227（期望编译通过） |
| **错误信息** | Syntax error ESY0227: Unexpected token '??=' |

**描述**：Spec 7.32.2 文档中显式声明了 `??=` 运算符的语义："While the nullish-coalescing assignment (??=) only evaluates the right operand, and assigns to the left operand if the left operand is null or undefined." 但编译器完全不识别该运算符，报 Syntax error。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `a ??= b` | ❌ ESY0227 Syntax error（Spec 定义但未实现）|
| Java | `a ??= b` | ❌ 无此运算符 |
| Swift | `a ??= b` | ❌ 无此运算符（用 `a = a ?? b` 替代）|

**分类**：D 类 — Spec 与实现不一致

**建议**：该运算符已在 Spec 中明确定义，但编译器完全不识别，应优先实现 `??=` 运算符的支持。

---

### ID-02: >>>= （无符号右移赋值）三语言对比

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_32_02_002_PASS_SHIFT_BITWISE_COMPOUND |
| **实测结果** | ArkTS/Java 支持 `>>>=`，Swift 不支持 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：无符号右移赋值 `>>>=` 在 ArkTS 和 Java 中均受支持，但 Swift 没有无符号右移运算符，因此不支持。

**跨语言对比**：

| 语言 | `>>>=` 支持 |
|------|------------|
| ArkTS | ✅ |
| Java | ✅ |
| Swift | ❌ 不支持 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-03: Boolean 复合运算差异

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_32_02_002_PASS_SHIFT_BITWISE_COMPOUND |
| **实测结果** | ArkTS/Java 支持 boolean 的 `&=`、`|=`、`^=`，Swift 仅整数支持 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 和 Java 均支持 boolean 类型的位运算复合赋值 `&=`、`|=`、`^=`，而 Swift 中这些运算符仅对整数有效，Bool 类型需使用 `&&=`、`||=`，且无 `^=` 等价运算符。

**跨语言对比**：

| 语言 | `boolean &=` | `boolean \|=` | `boolean ^=` |
|------|:-----------:|:------------:|:------------:|
| ArkTS | ✅ | ✅ | ✅ |
| Java | ✅ | ✅ | ✅ |
| Swift | ❌（整数专用） | ❌（整数专用） | ❌ |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-04: string += int 隐式转换差异

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_32_02_003_PASS_STRING_CONCAT_COMPOUND |
| **实测结果** | ArkTS/Java 支持 `string += int` 自动转换，Swift 需显式转换 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：字符串拼接复合赋值中，ArkTS 和 Java 会自动将 int/double 等数值类型转换为字符串进行拼接，而 Swift 需要显式调用 `String()` 转换。

**跨语言对比**：

| 语言 | `s += 42` 结果 |
|------|---------------|
| ArkTS | ✅ "hello42" |
| Java | ✅ "hello42" |
| Swift | ❌ 需 `s += String(42)` |

**分类**：符合 ArkTS spec 的语言设计差异
