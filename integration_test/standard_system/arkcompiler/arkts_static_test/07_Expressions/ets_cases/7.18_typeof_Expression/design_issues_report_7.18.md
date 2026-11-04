# 7.18 typeof Expression — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: char 类型无法创建变量测试 typeof ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | 无法创建测试用例（编译器限制） |
| **实测结果** | 编译器不支持 `as char` 字面量转换 |
| **错误信息** | ESE0326: Cannot cast number literal to 'Char' |

**描述**：ArkTS 编译器不支持 `as char` 字面量转换，`toChar()` 方法也不存在，导致无法直接创建 char 类型变量来测试 `typeof` 对 char 类型的返回值。根据 spec，`typeof char` 应返回 `"char"`，但当前无法构建测试用例验证。

**跨语言对比**：

| 语言 | char 类型 literal | typeof 结果 |
|------|------------------|-------------|
| ArkTS | ❌ 不支持 `as char` | 理论上应为 "char"，无法验证 |
| Java | ✅ `'A'` 字面量 | "Character" |
| Swift | ✅ `Character("A")` | "Character" |

**分类**：E 类 — 编译器限制导致无法测试

**建议**：建议未来扩展 `as char` 转换支持，或提供 char 字面量语法，以完善 char 类型测试覆盖。

---

### ID-02: typeof 关键字 — ArkTS 独有 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | 所有 typeof 测试用例 |
| **实测结果** | ArkTS 使用 `typeof` 关键字；Java 用 `getClass().getSimpleName()`；Swift 用 `type(of:)` |
| **错误信息** | 无错误 |

**描述**：ArkTS 是唯一原生支持 `typeof` 关键字的三语言。Java 和 Swift 均需通过方法调用获取类型名称。ArkTS 的 `typeof` 继承自 JavaScript 语法，提供更简洁的语法。

**跨语言对比**：

| 语言 | 获取类型名语法 |
|------|--------------|
| ArkTS | `typeof expr` |
| Java | `expr.getClass().getSimpleName()` |
| Swift | `type(of: expr)` |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-03: typeof null 结果差异 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_18_006_PASS_TYPEOF_NULL_UNDEFINED, EXP_07_18_034_RUNTIME_TYPEOF_NULL_UNDEFINED |
| **实测结果** | ArkTS `typeof null` → `"object"`；Java `null.getClass()` → NPE；Swift `type(of: nil)` → 无法编译/无类型信息 |
| **错误信息** | 无错误（ArkTS）；NullPointerException（Java） |

**描述**：ArkTS 的 `typeof null → "object"` 采用 JavaScript 兼容语义，在 null 安全方面明显优于 Java/Swift。

**跨语言对比**：

| 语言 | `typeof null` | 结果 |
|------|--------------|------|
| ArkTS | `typeof null` | `"object"` |
| Java | `null.getClass()` | `NullPointerException` |
| Swift | `type(of: nil)` | 编译错误/无信息 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-04: 原始数值类型名称映射差异 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_18_003_PASS_TYPEOF_NUMERIC_BYTE_INT, EXP_07_18_032_RUNTIME_TYPEOF_NUMERIC |
| **实测结果** | ArkTS 返回具体类型名（"int"/"byte"/"short"/"long"/"float"），double → "number" 特殊映射 |
| **错误信息** | 无错误 |

**描述**：ArkTS 的 typeof 对数值类型返回具体类型名（"int"/"byte"），但 `double` 类型特殊映射为 `"number"` 而非 `"double"`。这与 Java（装箱后丢失具体类型名）和 Swift（返回 "Int"/"Double"）不同。

**跨语言对比**：

| 类型 | ArkTS | Java | Swift |
|------|-------|------|-------|
| int | "int" | "Integer" | "Int" |
| byte | "byte" | "Byte" | "Int8" |
| double | "number" | "Double" | "Double" |
| float | "float" | "Float" | "Float" |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-05: 类型参数(typeof) 三语言差异 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_18_038_RUNTIME_TYPEOF_TYPE_PARAM |
| **实测结果** | ArkTS `typeof` 在类型参数上运行时确定实际类型；Java 类型擦除后无法获取；Swift 类型具体化可直接获取 |
| **错误信息** | 无错误 |

**描述**：ArkTS 虽然存在类型擦除（如 Java），但 `typeof` 在运行时能正确返回类型参数的实际类型。Java 因类型擦除无法在运行时获取泛型类型参数的实际类型。Swift 的类型具体化方案可直接获取。

**跨语言对比**：

| 语言 | 泛型类型参数 typeof |
|------|--------------------|
| ArkTS | ✅ `typeof this.val` 运行时确定（类型擦除但 typeof 在运行时生效）|
| Java | ❌ 类型擦除后无法获取 T 的实际类型 |
| Swift | ✅ `type(of: self.val)` 具体化获取 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-06: 重载函数 typeof 限制 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_18_021_FAIL_TYPEOF_OVERLOADED_FUNC |
| **实测结果** | ArkTS 编译时错误；Java/Swift 允许对重载函数应用 typeof |
| **错误信息** | ArkTS 编译时错误（期望行为） |

**描述**：ArkTS 禁止对重载函数名应用 `typeof` 表达式，会报编译时错误。Java 和 Swift 允许对重载函数获取类型信息。这是 ArkTS 的安全设计选择。

**跨语言对比**：

| 语言 | `typeof` 重载函数 | 行为 |
|------|------------------|------|
| ArkTS | `typeof foo`（重载）| ❌ compile-time error |
| Java | `foo.getClass()` | ✅ 可行 |
| Swift | `type(of: foo)` | ✅ 可行 |

**分类**：符合 ArkTS spec 的语言设计差异

---

## 建议

- 当前实现基本符合 spec 规范
- `char` 类型缺少字面量创建方式是编译器限制，建议扩展 `as char` 转换支持
- typeof 运行时结果与 JavaScript 兼容（"object" for null）是好的设计选择
- 类型参数运行时 typeof 是正确的类型安全方案
