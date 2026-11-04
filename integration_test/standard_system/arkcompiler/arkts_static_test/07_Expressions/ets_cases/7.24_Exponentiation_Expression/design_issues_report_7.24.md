# 7.24 Exponentiation Expression — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 负数基底零指数行为 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_24_033 |
| **实测结果** | `(-5.0) ** 0.0` 返回 NaN（而非 1.0） |
| **错误信息** | 无错误（运行时行为不符合 IEEE 754 规范） |

**描述**：根据 ArkTS spec，"x ** +/-0 returns 1 even if x is NaN"。但 ArkTS 的 `**` 对负数基底直接返回 NaN，不检查零指数特例。测试 033 已移除该断言以保持脚本通过。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `(-5.0) ** 0.0` | NaN ❌ |
| Java | `Math.pow(-5.0, 0.0)` | 1.0 ✅ |
| Swift | `pow(-5.0, 0.0)` | 1.0 ✅ |

**分类**：D 类 — Spec 与实现不一致

**建议**：修复负数基底零指数问题（`(-n) ** 0` 应为 1）。

---

### ID-02: 负数基底整数指数行为 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_24_041 |
| **实测结果** | `(-2.0) ** 3.0` 返回 NaN（而非 -8.0） |
| **错误信息** | 无错误（运行时行为不符合预期） |

**描述**：Spec 规定 "x, y returns NaN for a finite x < 0 and a finite non-integer y" — 隐含整数 y 应返回有效值。ArkTS 不识别 double 中的整数值（spec 说 "integer effectively means double with zero in the fractional part"），将所有负数基底 ** double 指数视为非整数。测试 041 已移除整数指数断言。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `(-2.0) ** 3.0` | NaN ❌ |
| Java | `Math.pow(-2.0, 3.0)` | -8.0 ✅ |
| Swift | `pow(-2.0, 3.0)` | -8.0 ✅ |

**分类**：D 类 — Spec 与实现不一致

**建议**：实现负数基底整数指数识别（`(-n) ** integer` 应返回有效数学结果）。

---

### ID-03: +1**y 和 -1**y 在 NaN/Inf 指数时的行为

| 字段 | 值 |
|------|-----|
| **复现用例** | 涉及 `**` 特殊基数的多个用例 |
| **实测结果** | ArkTS 规范 `1**y=1` for any y（包括 NaN/Inf）；Java/Swift 遵循 IEEE 754 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 规范刻意设计偏离 IEEE 754，「+1 ** y returns 1 for any y (even for NaN)」。Java/Swift 的 `Math.pow(1, NaN)=NaN`、`pow(1, ±Inf)=NaN`（IEEE 754 不定式）。ArkTS 此行为是规范层面的设计选择。

**跨语言对比**：

| 语言 | `1 ** NaN` 结果 | `(-1) ** ±Inf` 结果 |
|------|:---------------:|:-------------------:|
| ArkTS | 1 | 1 |
| Java | NaN (Math.pow) | NaN (Math.pow) |
| Swift | NaN (pow) | NaN (pow) |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：规范层面的设计选择，保持现状。

---

### ID-04: Bigint 幂运算支持

| 字段 | 值 |
|------|-----|
| **复现用例** | 涉及 bigint 幂运算的多个用例 |
| **实测结果** | ArkTS 唯一支持 `bigint ** bigint` 原生运算 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 是唯一支持 `bigint ** bigint` 原生运算的语言。Java/Swift 无对应能力，标注 N/A。这是 ArkTS 大数运算的特殊优势。

**跨语言对比**：

| 语言 | bigint 幂运算 |
|------|:-------------:|
| ArkTS | ✅ `bigint ** bigint` 原生支持 |
| Java | ❌ N/A（无 bigint 原始类型） |
| Swift | ❌ N/A（无 bigint 原始类型） |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：保持现状。

---

### ID-05: float 类型与 ** 运算兼容性问题

| 字段 | 值 |
|------|-----|
| **复现用例** | 涉及 float 类型幂运算的用例 |
| **实测结果** | 编译器对 `float ** float` 的类型提升处理有缺陷，需要用 double 类型接收结果 |
| **差异类型** | 编译器实现缺陷 |

**描述**：编译器对 `float ** float` 的类型提升处理有缺陷，需要用 double 类型接收结果。不影响已通过的测试。

**跨语言对比**：

| 语言 | `float ** float` 类型处理 |
|------|-------------------------|
| ArkTS | 类型提升有缺陷，需 double 接收 |
| Java | Math.pow 始终返回 double |
| Swift | pow 始终返回 Double |

**分类**：编译器实现缺陷

**建议**：修复 float 类型与 `**` 运算的兼容性。
