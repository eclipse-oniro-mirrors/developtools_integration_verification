# 7.6.3 Object Literal of Record Type — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: Record 字面量语法（ArkTS 独有）⭐

| 字段 | 值 |
|------|-----|
| 复现用例 | EXP_07_06_03_001 ~ 010 |
| 实测结果 | ArkTS 支持专用 Record 字面量语法，Java/Swift 无等价语法 |
| 错误信息 | 无 |

**描述**：ArkTS 是唯一支持 `Record<K, V>` 专用字面量语法的语言。Java 使用 `HashMap.put()`，Swift 用下标赋值。

**跨语言对比**：

| 语言 | 实现方式 |
|------|---------|
| ArkTS | `let m: Record<string, number> = {"John": 25, "Mary": 21}` |
| Java | `Map<String, Integer> m = new HashMap<>(); m.put("John", 25); m.put("Mary", 21);` |
| Swift | `var m: [String: Int] = [:]; m["John"] = 25; m["Mary"] = 21` |

**分类**：语言特性差异 — 符合各自语言设计哲学，非实现缺陷。

**建议**：当前设计完善，维持不变。

---

### ID-02: 字面量 union Key 完整性检查（ArkTS 独有）⭐

| 字段 | 值 |
|------|-----|
| 复现用例 | EXP_07_06_03_011_FAIL_MISSING_LITERAL_KEY |
| 实测结果 | ArkTS 编译时报错缺失变体，Java/Swift 编译通过但运行时返回 null/nil |
| 错误信息 | 编译时错误：missing literal variant |

**描述**：ArkTS 对 `Record<"text"|"bb", V>` 要求所有变体在字面量中列出，编译时检查。Java/Swift 无此检查，缺少的 key 在运行时返回 null/nil。

**跨语言对比**：

| 语言 | `Record<"text"\|"bb", number>` 只提供 "text" |
|------|----------------------------------------|
| ArkTS | 编译时错误：缺失 "bb" |
| Java | 编译通过，运行时 `map.get("bb")` → null |
| Swift | 编译通过，运行时 `map["bb"]` → nil |

**分类**：编译时安全策略差异 — 符合 ArkTS 设计。

**建议**：保持当前编译时完整性检查，这是重要的安全特性。

---

### ID-03: Key 类型限制 ⭐

| 字段 | 值 |
|------|-----|
| 复现用例 | EXP_07_06_03_014_FAIL_INVALID_KEY_TYPE |
| 实测结果 | ArkTS 禁止 boolean 作为 Record Key，Java/Swift 允许 |
| 错误信息 | 编译时错误：invalid key type |

**描述**：ArkTS 禁止非数值/非 string 类型（如 boolean）作为 Record 的 Key。Java/Swift 允许更多类型。

**跨语言对比**：

| 语言 | 允许的 Key 类型 |
|------|----------------|
| ArkTS | 数值类型、string、字面量 string union（boolean 编译时错误） |
| Java | 任意引用类型（boolean 可作为 Boolean） |
| Swift | 任意 Hashable 协议类型（Bool 可作为 Hashable） |

**分类**：类型系统差异 — 符合各自语言设计哲学。

**建议**：当前限制合理，维持不变。

---

### ID-04: 数值键 ⭐

| 字段 | 值 |
|------|-----|
| 复现用例 | EXP_07_06_03_003_PASS_NUMERIC_KEYS, EXP_07_06_03_017_RUNTIME_NUMERIC_INDEXING |
| 实测结果 | ArkTS `{1: "a"}` 编译通过并正确运行 |
| 错误信息 | 无 |

**描述**：ArkTS `{1: "a"}`、Java `map.put(1, "a")`、Swift `map[1] = "a"` 语义等价。

**跨语言对比**：

| 语言 | `Record<number, string>` |
|------|-------------------------|
| ArkTS | `{1: "a", 2: "b"}` 编译通过 |
| Java | `map.put(1, "a")` 自动装箱 |
| Swift | `map[1] = "a"` 原生支持 Int key |

**分类**：语法机制差异 — 语义等价。

**建议**：当前设计完善，维持不变。
