# 7.13.3 Record Indexing Expression — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: Case 1 编译时字面量检查 — ArkTS 独有 ⭐

| 字段 | 值 |
|------|-----|
| **问题描述** | ArkTS 在 Case 1（Key 为纯字面量联合）时，编译时检查索引是否属于联合中的字面量 |
| **分类** | ArkTS 独有特性，Java/Swift 无此机制 |
| **结论** | 符合 ArkTS spec，是良好的类型安全设计 |

**跨语言对比**：

| 语言 | Case 1 行为 |
|------|------------|
| ArkTS | ✅ 编译时字面量检查 |
| Java | ❌ 无此机制，运行时 Map.get() 返回 null |
| Swift | ❌ 无此机制，运行时 dict[key] 返回 nil |

**分类**：ArkTS 独有特性

**建议**：保持此特性，这是 ArkTS 相比 Java/Swift 的显著安全优势。

---

### ID-02: Case 2 缺失键返回值差异 ⭐

| 字段 | 值 |
|------|-----|
| **问题描述** | 三语言对缺失键返回不同值：ArkTS undefined、Java null、Swift nil |
| **分类** | 符合各语言语言设计 |
| **结论** | 语义等价，命名不同 |

**跨语言对比**：

| 语言 | 缺失键返回值 | 可检查方式 |
|------|-------------|-----------|
| ArkTS | `undefined` | `if (s == undefined)` |
| Java | `null` | `if (s == null)` |
| Swift | `nil` | `if s == nil` / `if let s = dict[key]` |

**分类**：符合各语言设计

**建议**：无。

---

### ID-03: D 类 — 字段访问符号未实现 ⭐⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_13_03_003_PASS_CASE1_FIELD_ACCESS |
| **实测结果** | 编译失败（期望编译通过） |
| **错误信息** | `Semantic error: Property 'key2' does not exist on type 'Record'` |

**描述**：ArkTS spec 规定 `x.key2` 等价于 `x['key2']`，但编译器报 "Property does not exist on type 'Record'"。

**跨语言对比**：

| 语言 | 代码 | 结果 |
|------|------|------|
| ArkTS (spec) | `x.key2` | ✅ 等价于 `x['key2']` |
| ArkTS (实现) | `x.key2` | ❌ Property does not exist on type 'Record' |
| Java | `x.key2` | ❌ 语法错误 |
| Swift | `x.key2` | ❌ 语法错误 |

**分类**：D 类 — Spec 与实现不一致

**建议**：实现 spec 定义的 `x.key2` 等价于 `x['key2']` 功能。

**受影响的测试**：

| 用例 | 文件 | 说明 |
|------|------|------|
| 003 | EXP_07_13_03_003_PASS_CASE1_FIELD_ACCESS | compile-pass 预期 → 实际 compile-fail |
| 016 | EXP_07_13_03_016_RUNTIME_CASE1_FIELD_ACCESS_VALUE | 已移除字段访问代码，仅用方括号索引 |

---

### ID-04: D 类 — Case 1 变量索引被编译器接受 ⭐⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_13_03_010_FAIL_CASE1_VARIABLE_INDEX |
| **实测结果** | 编译通过（期望编译时错误） |
| **错误信息** | 无错误 |

**描述**：ArkTS spec 规定 Case 1（字面量联合 Key）的索引必须是字面量，但编译器允许 `let k = 'key1'; x[k]`。Spec: "A compile-time error occurs if an index expression is not a valid literal"。

**跨语言对比**：

| 语言 | 代码 | 结果 |
|------|------|------|
| ArkTS (spec) | `x[k]` (k=string) | ❌ Compile-time error |
| ArkTS (实现) | `x[k]` (k=string) | ✅ 编译通过 |
| Java | `map.get(k)` | ✅ 编译通过（Map 无此限制） |
| Swift | `dict[k]` | ✅ 编译通过（Dictionary 无此限制） |

**分类**：D 类 — Spec 与实现不一致

**建议**：按 spec 要求在 Case 1 中禁止非字面量索引。

**影响**：编译器将 Case 1 的字面量联合 Key 视为 string 的子类型，因此 string 变量作为索引时被接受。这削弱了 Case 1 的类型安全性。

---

### ID-05: 数值字面量类型不支持

| 字段 | 值 |
|------|-----|
| **问题描述** | ArkTS 不支持数值字面量类型（`type NKeys = 1 \| 2 \| 3` 语法错误） |
| **分类** | 非 Spec 不一致，ArkTS 设计限制 |
| **结论** | 已移除无效测试 EXP_07_13_03_004_PASS_CASE1_NUMERIC_LITERAL_UNION，替换为 Case2 测试 |

**描述**：ArkTS 不支持数值字面量类型（`type NKeys = 1 \| 2 \| 3` 语法错误），引用 CLAUDE.md 说明："Only string literal types supported (not number/boolean literal types)"。

**跨语言对比**：

| 语言 | 数值字面量类型支持 |
|------|-------------------|
| ArkTS | ❌ 不支持 |
| Java | ❌ 不支持（无对应特性） |
| Swift | ✅ 支持（如 `enum` 或字面量协议） |

**分类**：ArkTS 设计限制，非 Spec 不一致

**建议**：已移除无效测试并替换为 Case2 测试，无需进一步操作。

---

## 总结

| 项目 | 数值 |
|------|------|
| 总用例 | 16/16 |
| D 类 Spec 不一致 | 2 个（字段访问符号未实现、变量索引被接受）|
| 测试设计修正 | 1 个（数值字面量类型不支持，已替换）|
| Java/Swift 差异 | 无编译时字面量检查、缺失键返回 null/nil |
