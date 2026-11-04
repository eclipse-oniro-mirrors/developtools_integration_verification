# 7.25.1 String Concatenation — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: string + null / undefined 行为

| 字段 | 值 |
|------|-----|
| **复现用例** | 多个涉及 null/undefined 字符串拼接的用例 |
| **实测结果** | ArkTS: `"a" + null` = `"anull"`，`"b" + undefined` = `"bundefined"` |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 和 Java 都会将 `null` 自动转换为字符串 `"null"`。ArkTS 额外支持 `undefined` → `"undefined"`。Swift 完全禁止 nil 参与字符串拼接，这是语言设计哲学的差异（nil 安全优先）。

**跨语言对比**：

| 语言 | `"a" + null` | `"b" + undefined` |
|------|:------------:|:------------------:|
| ArkTS | `"anull"` ✅ | `"bundefined"` ✅ |
| Java | `"anull"` ✅ | ❌ 无 undefined 概念 |
| Swift | ❌ 编译错误 | ❌ 编译错误 |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：保持现状，ArkTS 字符串上下文隐式转换覆盖面系统，与 Java 一致优于 Swift。

---

### ID-02: bigint → string 隐式转换

| 字段 | 值 |
|------|-----|
| **复现用例** | 涉及 bigint 字符串拼接的用例 |
| **实测结果** | ArkTS 唯一支持 `bigint` 隐式转换为十进制字符串 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 的 `bigint` 类型在字符串上下文中自动转换为十进制数字字符串，这是 ArkTS 独有的能力。Java 的 BigInteger 需要通过 `.toString()` 显式调用，Swift 无对应原始类型。

**跨语言对比**：

| 语言 | bigint → string |
|------|:---------------:|
| ArkTS | ✅ 隐式转换 |
| Java | ❌ 需 `BigInteger.toString()` 显式转换 |
| Swift | ❌ 无 bigint 原始类型 |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：建议规范文档增加 bigint→string 转换的说明。当前 spec 展示了 bigint 示例（"BigInt is " + 123n），但 String Operator Contexts 的规则枚举中未明确列出 bigint，仅通过示例暗示。

---

### ID-03: 类型转换严格性范围

| 字段 | 值 |
|------|-----|
| **复现用例** | 多个涉及类型隐式转换的拼接用例 |
| **实测结果** | ArkTS 隐式支持 int→String、boolean→String、null→String |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 和 Java 在字符串拼接中具有较宽松的隐式类型转换，而 Swift 严格要求显式转换。这是语言设计哲学的差异。

**跨语言对比**：

| 语言 | 隐式 int→String | 隐式 boolean→String | 隐式 null→String |
|------|:---------------:|:-------------------:|:----------------:|
| ArkTS | ✅ | ✅ | ✅ |
| Java | ✅ | ✅ | ✅ |
| Swift | ❌ 需显式 `String()` | ❌ 需显式 `String()` | ❌ 编译错误 |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：保持现状。

---

### 差异说明

#### 1. 左结合性

`+` 运算符在所有三语言中都是左结合：
- `1+2+"!"` → `"3!"`（先做数值加法，再拼接）
- `"!"+1+2` → `"!12"`（先拼接左操作数）
- 三语言行为一致
