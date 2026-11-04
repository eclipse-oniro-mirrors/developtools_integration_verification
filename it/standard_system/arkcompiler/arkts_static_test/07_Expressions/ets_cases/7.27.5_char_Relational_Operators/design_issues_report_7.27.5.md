# 7.27.5 char Relational Operators — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

**D 类（Spec 与实现不一致）**：无。所有 12 用例通过，与 Spec 完全一致。

---

### ID-01: char + 数值类型比较（ArkTS/Java 支持 vs Swift 不支持）

| 字段 | 值 |
|------|-----|
| **复现用例** | N/A（跨语言设计差异） |
| **实测结果** | ArkTS/Java 支持 char 与 int 等数值类型直接比较（char 隐式拓宽为 int/long/double）；Swift 不支持 Character 与 Int 直接比较 |
| **错误信息** | 无错误 |

**描述**：Swift 的 `Character` 是 Unicode 标量（extended grapheme cluster），不是固定位宽的整型，因此不能与数值类型直接比较。ArkTS 和 Java 的 `char` 都是 16-bit 无符号整数，与数值类型兼容。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `c'A' < 66` | ✅ char 隐式拓宽为 int/long/double 后比较 |
| Java | `'A' < 66` | ✅ char 自动数值提升（widening primitive conversion） |
| Swift | `Character("A") < 66` | ❌ 不支持，Character 不能与 Int 直接比较（类型安全设计） |

**分类**：跨语言设计差异

**建议**：保持现状。ArkTS char 关系运算符实现符合规范，无需修改。

---

### ID-02: char 的字符模型差异（固定位宽整型 vs Unicode 标量）

| 字段 | 值 |
|------|-----|
| **复现用例** | N/A（跨语言设计差异） |
| **实测结果** | ArkTS/Java 的 char 是 16-bit 无符号整数，支持数值比较；Swift 的 Character 是 Unicode scalar value，非数值模型 |
| **错误信息** | 无错误 |

**描述**：ArkTS 和 Java 的 char 同为 16-bit 无符号整数，关系运算符行为完全一致。Swift 的 Character 不是固定位宽整型，不支持与数值类型比较，但支持字符之间基于 Unicode 规范的 Comparable 比较。Swift 无法直接复制 ArkTS/Java 的 char 关系运算行为，需通过 `Character` 的比较方法实现等价的字符序比较。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `char`（16-bit 无符号整数） | ✅ 固定位宽整型，支持数值比较 |
| Java | `char`（16-bit 无符号整数） | ✅ 固定位宽整型，支持数值比较 |
| Swift | `Character`（Unicode scalar value） | ❌ 非数值模型，位宽可变，不支持数值比较 |

**分类**：跨语言设计差异

**建议**：无需修改。ArkTS char = Java char，同为 16-bit 无符号整数，关系运算符行为完全一致。

---

### 结论

- **0 D 类异常**：实现与 Spec 完全一致。
- **ArkTS char = Java char**：同为 16-bit 无符号整数，关系运算符行为完全一致。
- **Swift Character 差异显著**：Swift 的 Character 不是固定位宽整型，不支持与数值类型比较，但支持字符之间基于 Unicode 规范的 Comparable 比较。

---
