# 7.23.2 Division — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 字面量整数除零未产生编译时错误 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_23_02_027_FAIL_DIVISION_BY_ZERO_LITERAL |
| **实测结果** | 编译通过（期望编译时错误） |
| **错误信息** | 无错误 |

**描述**：根据 ArkTS spec 规则："if the divisor value of integer division is detected to be 0 during compilation, then a compile-time error occurs"。但编译器允许 `a / 0` 正常编译通过。bigint 字面量 `a / 0n` 被正确检测并报错。编译器对 int 和 bigint 的除零检测策略不一致。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `a / 0` | 编译时错误 |
| ArkTS (实现) | `a / 0` | 编译通过 |
| Java | `a / 0` | 编译通过，运行时 ArithmeticException |
| Swift | `a / 0` | 编译通过，运行时 fatal error |

**分类**：D 类 — Spec 与实现不一致

**建议**：实现 spec 中字面量整数除零的编译时检测，统一 int 和 bigint 的字面量除零检测策略。

---

### ID-02: 隐式类型提升差异（设计差异，非缺陷）

| 字段 | 值 |
|------|-----|
| **复现用例** | 多个类型组合编译通过用例 |
| **实测结果** | byte/short 自动提升到 int，运算结果取最大操作数类型 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 与 Java 一致：byte/short 自动提升到 int，运算结果取最大操作数类型。Swift 要求所有操作数类型一致或显式转换。

**跨语言对比**：

| 语言 | byte/byte → | int/long → |
|------|-------------|-----------|
| ArkTS | int | long |
| Java | int | long |
| Swift | Int8 | 编译错误 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-03: Swift 整数除法溢出处理差异

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_23_02_032_RUNTIME_INT_MIN_DIV_MINUS_ONE |
| **实测结果** | INT_MIN / -1 静默返回 INT_MIN |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 和 Java 的 INT_MIN / -1 静默返回 INT_MIN；Swift 会触发运行时 trap（fatal error）。Swift 有 `&*` 乘法溢出包装但没有 `&/` 除法溢出运算符。

**跨语言对比**：

| 语言 | INT_MIN / -1 | 溢出行为 |
|------|-------------|---------|
| ArkTS | INT_MIN | 静默溢出 |
| Java | INT_MIN | 静默溢出 |
| Swift | trap | 运行时 fatal error |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-04: Swift 除零行为差异

| 字段 | 值 |
|------|-----|
| **描述** | Swift 中整数除零触发不可捕获的 fatal error，Java 的 ArithmeticException 可捕获 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**跨语言对比**：

| 语言 | 整数除零行为 | 可捕获性 |
|------|-------------|---------|
| ArkTS | ArithmeticError | 可捕获 |
| Java | ArithmeticException | 可捕获 |
| Swift | fatal error | 不可捕获 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-05: 除法向零取整一致性

| 字段 | 值 |
|------|-----|
| **描述** | ArkTS、Java、Swift 的整数除法全部向零取整（truncation toward zero），三种语言行为完全一致 |
| **差异类型** | 一致（无差异） |

**分类**：一致（无差异）

---

### ID-06: 字面量除零检测策略差异（int vs bigint）

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_23_02_027 vs EXP_07_23_02_028 |
| **实测结果** | bigint `a / 0n` 被检测，int `a / 0` 未被检测 |
| **差异类型** | D 类 — Spec 与实现不一致 |

**描述**：ArkTS 编译器能检测 `a / 0n`（bigint 字面量除零），但不能检测 `a / 0`（int 字面量除零），说明检测机制可能只覆盖了部分场景。

**分类**：D 类 — Spec 与实现不一致

**建议**：统一 int 和 bigint 的字面量除零检测策略。当前所有浮点除法 IEEE 754 行为与 Java/Swift 完全一致。
