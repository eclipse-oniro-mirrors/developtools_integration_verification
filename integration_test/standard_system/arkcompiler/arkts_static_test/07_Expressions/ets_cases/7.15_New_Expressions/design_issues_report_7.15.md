# 7.15 New Expressions — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 无括号 new 表达式 — ArkTS 独有 ⭐⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_15_006_PASS_NEW_NO_PARENS |
| **实测结果** | `let a = new A` 编译通过 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 允许 `let a = new A`（无括号创建实例），而 Java 和 Swift 都要求必须有括号。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let a = new A` | ✅ 编译通过 |
| Java | `A a = new A` | ❌ 语法错误（必须 `new A()`）|
| Swift | `let a = A` | ❌ 语法错误（必须 `A()`）|

**分类**：语言设计差异（ArkTS 独有特性）

---

### ID-02: new 关键字 — ArkTS = Java > Swift ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | 通用跨语言对比 |
| **实测结果** | ArkTS 和 Java 使用 `new` 关键字，Swift 无 `new` |
| **差异类型** | 符合各自语言 spec 的语言设计差异 |

**描述**：ArkTS 和 Java 使用 `new` 关键字创建实例；Swift 使用 `A()` 直接调用 init，无 `new` 关键字。

**跨语言对比**：

| 语言 | 关键字 | 示例 |
|------|--------|------|
| ArkTS | `new` | `new A()` |
| Java | `new` | `new A()` |
| Swift | 无关键字 | `A()` |

**分类**：语言设计差异

---

### ID-03: 类型参数限制 — 三语言一致 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_15_009_FAIL_NEW_TYPE_PARAM |
| **实测结果** | `new T()` 产生编译时错误 |
| **差异类型** | 三语言行为一致 |

**描述**：三语言都禁止或限制泛型类型参数作为 new 的 typeReference。

**跨语言对比**：

| 语言 | `new T()`（T 是类型参数）|
|------|------------------------|
| ArkTS | ❌ 编译时错误 |
| Java | ❌ 编译时错误（type erasure）|
| Swift | ❌ 需 `T: HasInit` 约束 |

**分类**：三语言行为一致

---

### ID-04: 接口/抽象类实例化 — 三语言一致 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_15_011_FAIL_NEW_INTERFACE, EXP_07_15_012_FAIL_NEW_ABSTRACT |
| **实测结果** | `new I()` / `new A()`（接口/抽象类）产生编译时错误 |
| **差异类型** | 三语言行为一致 |

**描述**：三语言都禁止 new 接口或抽象类。

**跨语言对比**：

| 语言 | 接口实例化 | 抽象类实例化 |
|------|-----------|-------------|
| ArkTS | ❌ 编译时错误 | ❌ 编译时错误 |
| Java | ❌ 编译时错误 | ❌ 编译时错误 |
| Swift | ❌ 编译时错误 | ❌ 编译时错误 |

**分类**：三语言行为一致

---

### ID-05: new A.method() 错误 — ArkTS ≈ Java ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_15_008_FAIL_NEW_METHOD_NO_PARENS |
| **实测结果** | `new A.method()` 产生编译时错误 |
| **差异类型** | ArkTS ≈ Java 行为一致 |

**描述**：ArkTS 和 Java 都禁止 `new A.method()`（缺少括号），需要写 `(new A).method()` 或 `new A().method()`。Swift 无 `new` 关键字所以不适用。

**跨语言对比**：

| 语言 | `new A.method()` | 正确写法 |
|------|-----------------|---------|
| ArkTS | ❌ 编译时错误 | `new A().method()` 或 `(new A).method()` |
| Java | ❌ 编译时错误 | `new A().method()` 或 `(new A()).method()` |
| Swift | N/A（无 `new`）| `A().method()` |

**分类**：ArkTS ≈ Java 一致

---

### ID-06: FixedArray 类型参数限制 — ArkTS 独有 ⭐⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_15_010_FAIL_FIXED_ARRAY_TYPE_PARAM |
| **实测结果** | `new FixedArray<T>(5, element)` 当 T 是类型参数时产生编译时错误 |
| **差异类型** | ArkTS 独有机制 |

**描述**：ArkTS 明确禁止 `new FixedArray<T>(5, element)` 当 T 是类型参数。Java/Swift 无 FixedArray 概念。

**跨语言对比**：

| 语言 | FixedArray 类型参数限制 |
|------|------------------------|
| ArkTS | ❌ `new FixedArray<T>(5, element)` 编译时错误 |
| Java | N/A（无 FixedArray 概念）|
| Swift | N/A（无 FixedArray 概念）|

**分类**：ArkTS 独有机制

---

| 项目 | 数值 |
|------|------|
| 总用例 | 16/16 |
| D 类 Spec 不一致 | 0 |
| 主要设计差异 | 无括号语法（ArkTS 独有）、FixedArray 限制（ArkTS 独有）、Swift 无 new 关键字 |
| 一致性评级 | ArkTS ≈ Java（高度一致，语法相近）|
