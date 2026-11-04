# 7.2.4 Evaluation of Arguments — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 参数异常传播 — ArkTS 与 Java 一致，Swift 因 fatal error 不可比 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_02_04_008_RUNTIME_LEFT_ABRUPT_SKIP_RIGHT |
| **实测结果** | ArkTS trace="left" → ArithmeticError；Java trace="left" → ArithmeticException；Swift trace="left" → fatal error |
| **错误信息** | ArkTS: ArithmeticError; Java: ArithmeticException; Swift: fatal error（不可恢复） |

**描述**：ArkTS 和 Java 在参数异常传播上行为完全一致：左侧参数除零抛异常（ArithmeticError / ArithmeticException），右侧参数不被求值，异常可被 try-catch 捕获。Swift 中整数除零触发 fatal error（不可恢复、不可捕获），无法进行等效对比。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `test(errArg("left", 0), track("mid"), track("right"))` | trace="left" → ArithmeticError |
| Java | `consume(errTrack("left", 0), track("mid"), track("right"))` | trace="left" → ArithmeticException |
| Swift | `test1Helper(errTrack("left", 0), track("mid"), track("right"))` | trace="left" → fatal error |

**分类**：ArkTS 与 Java 一致，Swift 因 fatal error 不可比

**建议**：无需修改，ArkTS 可捕获异常模型优于 Swift 的 fatal error 设计

---

### ID-02: 异常命名差异 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_02_04_008_RUNTIME_LEFT_ABRUPT_SKIP_RIGHT |
| **实测结果** | ArkTS 使用 ArithmeticError，Java 使用 ArithmeticException，Swift 没有可捕获的算术异常 |
| **错误信息** | 无 |

**描述**：ArkTS 使用 `ArithmeticError` 命名算术错误，Java 使用 `ArithmeticException`，Swift 没有可捕获的算术异常（除零直接 fatal error）。这是符合各自语言设计哲学的命名差异。

**跨语言对比**：

| 语言 | 除零异常类型 |
|------|-------------|
| ArkTS | `ArithmeticError` |
| Java | `ArithmeticException` |
| Swift | `fatal error`（不可恢复） |

**分类**：符合各自语言设计哲学的命名差异

**建议**：无需修改

---

### ID-03: 左到右求值语义三语言完全一致 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_02_04_001~007, 009 |
| **实测结果** | 三语言行为完全一致，全部通过 |
| **错误信息** | 无 |

**描述**：ArkTS、Java、Swift 在函数/方法/构造调用的参数求值顺序上行为完全一致：全部从左到右求值，左侧参数异常时右侧不被求值。包括嵌套函数调用中"子表达式先于父参数求值"的规则也完全一致。

**跨语言对比**：

| 语言 | 函数参数 L→R | 方法参数 L→R | 构造参数 L→R | 嵌套参数顺序 |
|------|-------------|-------------|-------------|-------------|
| ArkTS | 强制 | 强制 | 强制 | 子表达式先于父参数 |
| Java | 强制 | 强制 | 强制 | 同上 |
| Swift | 强制 | 强制 | 强制 | 同上 |

**分类**：三语言行为一致

**建议**：无需修改

## 结论

| 指标 | 数值 |
|------|------|
| 总用例数 | 9 |
| 通过率 | 100% |
| Spec 不一致（D类） | 0 |
| 跨语言差异 | 1 个（Swift 除零 fatal error 不可捕获） |
