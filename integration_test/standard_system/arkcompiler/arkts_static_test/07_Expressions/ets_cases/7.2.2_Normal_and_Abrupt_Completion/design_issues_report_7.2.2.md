# 7.2.2 Normal and Abrupt Completion — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

本节全部 22 个测试用例 100% 通过。发现 1 个 Spec 与实现不一致的问题（D类）。

### ID-01: Swift fatal error 与可捕获异常 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | 多个 runtime 用例 |
| **实测结果** | ArkTS 可捕获异常，Swift fatal error 不可捕获 |
| **错误信息** | 无 |

**描述**：ArkTS 和 Java 使用可捕获的异常（RangeError / ArrayIndexOutOfBoundsException）来处理运行时错误，而 Swift 使用不可捕获的 fatal error。这意味着数组越界、除零等错误在 Swift 中会直接终止进程，不适用异常传播机制。

**跨语言对比**：

| 语言 | 数组越界 | 除零 | 类型转换失败 |
|------|---------|------|------------|
| ArkTS | RangeError 可捕获 | ArithmeticError 可捕获 | ClassCastError 可捕获 |
| Java | ArrayIndexOutOfBoundsException 可捕获 | ArithmeticException 可捕获 | ClassCastException 可捕获 |
| Swift | fatal error 不可捕获 | fatal error 不可捕获 | as! 崩溃 不可捕获 |

**分类**：符合各自语言设计哲学的差异

**建议**：无，这是语言设计层面的根本差异。

---

### ID-02: Java 协变数组与 ArkTS FixedArray 不变类型 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_02_02_003_PASS_NORMAL_FIXED_ARRAY_ASSIGN |
| **实测结果** | ArkTS 不变类型编译通过 |
| **错误信息** | 无 |

**描述**：Java 数组是协变的（covariant），允许 `Object[] arr = new String[3]`，运行时可能抛出 ArrayStoreException。ArkTS 的 FixedArray 为不变类型，ArrayStoreError 仅在不兼容类型赋值时触发。

**跨语言对比**：

| 语言 | 数组协变 | 运行时错误类型 |
|------|---------|--------------|
| ArkTS | 不变（invariant） | ArrayStoreError |
| Java | 协变（covariant） | ArrayStoreException |
| Swift | 编译时类型安全 | N/A |

**分类**：符合各自语言设计哲学的差异

---

### ID-03: ArkTS 编译时检测字面量除零/取余零 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_02_02_013_FAIL_DIVISION_BY_LITERAL_ZERO, EXP_07_02_02_014_FAIL_REMAINDER_BY_LITERAL_ZERO |
| **实测结果** | 编译时错误 |
| **错误信息** | Division by zero / Remainder by zero |

**描述**：ArkTS spec 明确规定整数除/取余字面量零为编译时错误，与 Java（仅运行时异常）不同，与 Swift（编译警告+运行时崩溃）也不同。

**跨语言对比**：

| 语言 | `1 / 0` | `1 % 0` |
|------|---------|---------|
| ArkTS | 编译时错误 | 编译时错误 |
| Java | 编译通过，运行时 ArithmeticException | 编译通过，运行时 ArithmeticException |
| Swift | 编译警告，运行时崩溃 | 编译警告，运行时崩溃 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-ISSUE-001: 字面量负数组索引编译时错误 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_02_02_017_FAIL_NEGATIVE_ARRAY_INDEX |
| **实测结果** | 编译时错误（期望运行时 RangeError） |
| **错误信息** | Index value cannot be less than zero |

**描述**：ArkTS spec 规定数组负索引应运行时抛出 RangeError，但编译器在编译时静态检测字面量负索引并报错 `Index value cannot be less than zero`。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `arr[-1]` | 编译时错误（实现额外保护） |
| Java | `arr[-1]` | 编译通过，运行时 ArrayIndexOutOfBoundsException |
| Swift | `arr[-1]` | 编译通过，运行时 fatal error |

**分类**：D 类 — Spec 与实现不一致

**建议**：这是一个良性的编译器增强（避免潜在 bug 更早暴露）。建议更新 spec 允许编译器在可静态检测负索引时产生编译时错误，与字面量除零的规则保持一致。

---

## 结论

| 指标 | 数值 |
|------|------|
| 总用例数 | 22 |
| 通过率 | 100% |
| Spec 不一致（D类） | 1 个（负数组索引编译时错误） |
| 跨语言设计差异 | 3 个（Swift fatal error、Java 数组协变、编译时检测） |
