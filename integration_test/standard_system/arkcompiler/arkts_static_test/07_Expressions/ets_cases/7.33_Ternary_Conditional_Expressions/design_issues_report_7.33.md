# 7.33 Ternary Conditional Expressions — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 非 boolean 条件 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_33_010~013_PASS_CONDITION_INT_TYPE, PASS_CONDITION_DOUBLE_TYPE, PASS_CONDITION_STRING_TYPE, PASS_CONDITION_OBJECT_TYPE |
| **实测结果** | ArkTS 允许任意类型作为三元条件（int/double/string/object），Java/Swift 要求 boolean/Bool |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 允许 int/double/string/object 等非 boolean 类型作为三元条件表达式条件，与 JavaScript 的 truthy/falsy 语义一致。Java 和 Swift 则严格要求条件类型为 boolean/Bool。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let x = 5 ? "a" : "b"` | ✅ 编译通过，接受 int 作为条件 |
| Java | `int x = 5; String r = x ? "a" : "b"` | ❌ 编译错误：Type mismatch: cannot convert from int to boolean |
| Swift | `let x = 5; let r = x ? "a" : "b"` | ❌ 编译错误：Type 'Int' cannot be used as a boolean |

**分类**：符合 ArkTS spec 的语言设计差异（ArkTS 继承自 JS truthy/falsy 设计）

---

### ID-02: 混合类型分支结果差异

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_33_003_PASS_CONDITION_UNKNOWN_TYPE, EXP_07_33_004_PASS_MIXED_TYPES |
| **实测结果** | 三元表达式 whenTrue 和 whenFalse 类型不同时，ArkTS 原生支持联合类型 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 原生支持 `string|int` 等联合类型作为三元表达式的结果类型；Java 自动推为公共父类（如 Object）；Swift 要求两分支类型严格一致，否则编译错误。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let x: string \| int = cond ? "hello" : 42` | ✅ 结果类型为 string \| int |
| Java | `Object x = cond ? "hello" : 42` | ✅ 结果类型为 Object（自动装箱） |
| Swift | `let x = cond ? "hello" : 42` | ❌ 编译错误：类型不匹配 |

**分类**：符合 ArkTS spec 的语言设计差异
