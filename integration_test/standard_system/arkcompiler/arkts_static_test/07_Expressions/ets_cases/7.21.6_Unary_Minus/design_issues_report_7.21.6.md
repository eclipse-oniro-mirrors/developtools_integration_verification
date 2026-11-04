# 7.21.6 Unary Minus — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

无 D 类 Spec 不一致。20/20 用例全部通过。

### ID-01: int.MIN 求反溢出 — ArkTS/Java 静默包装 vs Swift 编译时检测 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_21_06_008_PASS_NEGATE_INT_MIN、EXP_07_21_06_032_RUNTIME_INT_MIN_NEGATE |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS/Java 对 `-int.MIN_VALUE` 静默包装为 int.MIN；Swift 编译时检测溢出报错，需 `0 &- x` 包装运算。

**跨语言对比**：

| 语言 | `-int.MIN_VALUE` |
|------|-----------------|
| ArkTS | ✅ 静默包装为 int.MIN |
| Java | ✅ 静默包装为 Integer.MIN_VALUE |
| Swift | ⚠️ 编译时检测溢出 |

---

### ID-02: byte/short → int 拓宽 — ArkTS = Java ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 和 Java 的 `-byte`/`-short` 拓宽为 int；Swift 无 byte/short 类型。

**跨语言对比**：

| 语言 | `-byte(10)` 类型 | `-short(1)` 类型 |
|------|-----------------|-----------------|
| ArkTS | **int** | **int** |
| Java | **int** | **int** |
| Swift | N/A | N/A |

---

### ID-03: 浮点特殊值 — 三语言完全一致 ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：三语言对 `-(-0.0)=+0.0`, `-(-inf)=inf`, `-NaN=NaN` 处理完全一致（IEEE 754 标准）。

**跨语言对比**：

| 场景 | 期望结果 | ArkTS | Java | Swift |
|------|---------|-------|------|-------|
| `-(-0.0)` | +0.0 | ✅ | ✅ | ✅ |
| `-(-infinity)` | infinity | ✅ | ✅ | ✅ |
| `-NaN` | NaN | ✅ | ✅ | ✅ |

---

### ID-04: bigint 支持 — ArkTS 独有 ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 唯一支持 `-bigint`。

**跨语言对比**：

| 语言 | `-bigint` |
|------|-----------|
| ArkTS | ✅ `-1n` → `-1n`，`-(-1n)` → `1n` |
| Java | ❌ |
| Swift | ❌ |

---

### ID-05: null 拒绝 — ArkTS vs JavaScript ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS/Java/Swift 编译时拒绝 `-null`；JavaScript `-null → -0`。

**跨语言对比**：

| 语言 | `-null` |
|------|---------|
| ArkTS | ❌ 编译时错误 |
| JavaScript | ✅ `-null → -0` |
| Java | ❌ 编译时错误 |
| Swift | ❌ 编译时错误 |

**建议**：当前实现完全符合 spec 规范。浮点特殊值处理正确，与 Java/Swift 一致。
