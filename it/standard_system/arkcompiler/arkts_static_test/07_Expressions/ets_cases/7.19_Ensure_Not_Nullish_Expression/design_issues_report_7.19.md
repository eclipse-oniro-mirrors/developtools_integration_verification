# 7.19 Ensure-Not-Nullish Expression — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: `!` 运算符 — ArkTS == Swift > Java

| 字段 | 值 |
|------|-----|
| **复现用例** | 所有 7.19 测试用例 |
| **实测结果** | ArkTS 使用 `!` 后缀运算符；Java 无直接等价语法需 `Objects.requireNonNull()`；Swift 使用相同的 `!` 后缀 forced unwrapping |

**描述**：ArkTS 的 ensure-not-nullish `!` 运算符在语法上与 Swift 的 forced unwrapping 最接近（后缀 `!`，类型窄化，空值时崩溃）。Java 没有直接等价语法。

**跨语言对比**：

| 语言 | 非空断言语法 | 空值时行为 |
|------|------------|-----------|
| ArkTS | `x!` | NullPointerError |
| Java | `Objects.requireNonNull(x)` | NullPointerException |
| Swift | `x!` (forced unwrap) | 运行时崩溃 (fatal error) |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-02: 编译期警告 — ArkTS 独有特性

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_19_005_PASS_CHAINED_DOUBLE_BANG（非空类型 `!!`） |
| **实测结果** | ArkTS spec §7.19 规定编译期已知始终非空/始终 nullish 时发出编译期警告 |

**描述**：ArkTS spec 规定当 `!` 应用于编译期已知始终非空或始终为 nullish 的表达式时，编译器应发出警告。这是 Java/Swift 规范级别不具备的特性（Swift 编译器在部分场景会提示，但非语言规范要求）。

**跨语言对比**：

| 语言 | 始终非空 + `!` | 始终 nullish + `!` |
|------|---------------|-------------------|
| ArkTS | ✅ compile-time warning | ✅ compile-time warning + 运行时一定抛 |
| Java | ❌ N/A | ❌ 无编译期检查 |
| Swift | ⚠️ 部分工具/nil literal 提示 | ⚠️ 部分场景检查 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-03: 后缀 `!` 与逻辑非 `!` 运算符区别

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_19_005_PASS_CHAINED_DOUBLE_BANG |
| **实测结果** | ArkTS 后缀 `!`（ensure-not-nullish）与前缀 `!`（logical complement）是不同的运算符 |

**描述**：ArkTS 中后缀 `!` 是 ensure-not-nullish 运算符，前缀 `!` 是逻辑非运算符（见 §7.21.8）。`x!!` 解析为 `(x!)!`：先 ensure-not-nullish，结果类型为非空，再 apply ensure-not-nullish（无效果）。这与 TypeScript 的 `!!x`（两次逻辑非转 boolean）行为不同。

**跨语言对比**：

| 语言 | `!!x` 含义 | `x!` 含义 |
|------|-----------|----------|
| ArkTS | `(x!)!` 两次非空断言 | 非空断言 |
| Java | ❌ 不支持 | ❌ 不支持 |
| Swift | `!(!x)` 两次逻辑非 | forced unwrap |

*注：ArkTS 的 `!` 后缀是 postfix operator，与逻辑非 `!` prefix operator 不同。`

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-04: 空值异常命名差异

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_19_032_RUNTIME_UNDEFINED_THROWS, EXP_07_19_033_RUNTIME_NULL_THROWS |
| **实测结果** | ArkTS 抛 `NullPointerError`；Java 抛 `NullPointerException`；Swift 运行时崩溃 |

**描述**：ArkTS 中 `!` 在空值时抛出 `NullPointerError`（与 Java 的 NullPointerException 名称类似，但 Error vs Exception 反映不同的异常层次）。

**跨语言对比**：

| 语言 | 空值异常/错误 |
|------|-------------|
| ArkTS | NullPointerError |
| Java | NullPointerException |
| Swift | 无特定异常类型，fatal error: "unexpectedly found nil" |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-05: `void` 类型表达式 + `!` 行为 — D 类不一致

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_19_021_FAIL_VOID_EXPRESSION |
| **实测结果** | es2panda 编译器允许 `noop()!` 编译通过（预期 compile-fail） |

**描述**：ArkTS spec 规定 ensure-not-nullish 表达式检查"空值类型"（nullish types）。`void` 在 ArkTS 中 ≡ `undefined`，属于 nullish type。理论上 `void` 函数调用不产生值，应用 `!` 应报编译时错误，但当前编译器允许通过。

**跨语言对比**：

| 语言 | void 表达式 + ! |
|------|----------------|
| ArkTS | ❌ 预期 compile-time error，实际编译器允许通过（D 类不一致） |
| Java | N/A（void 方法不返回值） |
| Swift | N/A（void 函数不返回值） |

**分类**：D 类 — Spec 与实现不一致

---

### ID-06: `undefined!` 类型推断 — D 类不一致

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_19_022_FAIL_ALWAYS_NULLISH_ASSIGN |
| **实测结果** | es2panda 编译器允许 `let x: int = undefined!` 编译通过（预期 compile-fail） |

**描述**：`undefined` 是 nullish type，`undefined!` 的类型应为非空类型变体（理论上为 never/uninhabited）。因此 `let x: int = undefined!` 预期是 compile-time error，但当前编译器允许通过。

**跨语言对比**：

| 语言 | `undefined!` 类型 |
|------|------------------|
| ArkTS | ❌ 预期 compile-time error，实际编译器允许通过（D 类不一致） |
| Java | N/A（无 undefined） |
| Swift | N/A（nil! 编译通过但运行崩溃） |

**分类**：D 类 — Spec 与实现不一致

---

## 建议

1. **当前设计合理**：ArkTS 的 `!` 运算符语义清晰，与 Swift 的 forced unwrapping 一致
2. **编译期警告是好设计**：在始终非空/始终 nullish 时发出编译期警告有助于消除冗余代码和发现潜在问题
3. **Java 迁移注意**：Java 开发者需要适应 `!` 后缀运算符的新语法，替代 Java 中的 `Objects.requireNonNull()` 或 `Optional.orElseThrow()`
4. **Swift 开发者友好**：Swift 开发者会发现 ArkTS 的 `!` 运算符与 Swift forced unwrapping 非常相似
