# 7.17.2 Runtime Checking in Cast Expression — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: Swift as! 不可恢复 — 与 ArkTS/Java 的异常处理体系不同 ⭐⭐⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_17_02_012_RUNTIME_NON_SUBTYPE_CLASS_CAST_ERROR |
| **实测结果** | Swift `as!` 导致 fatal error（不可恢复崩溃），ArkTS `as` 抛可捕获 ClassCastError |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：Swift 的 `as!` 强制解包在类型不匹配时导致 fatal error，不可被 try/catch 捕获。ArkTS 的 `ClassCastError` 和 Java 的 `ClassCastException` 都是可捕获异常。这是三语言在设计哲学上的根本差异。

**跨语言对比**：

| 语言 | 非子类型 cast | 异常 | 可捕获 |
|------|--------------|------|--------|
| ArkTS | `x as string` (x=42) | `ClassCastError` | ✅ try-catch |
| Java | `(String) x` (x=42) | `ClassCastException` | ✅ try-catch |
| Swift | `x as! String` (x=42) | `fatal error` | ❌ 不可恢复 |

**分类**：符合 ArkTS spec 的语言设计差异（Swift 的设计不同）

**建议**：ArkTS 当前设计更健壮。建议保持 ClassCastError 可捕获的设计，提供程序恢复的机会。

---

### ID-02: Swift as? 安全转换 — Swift 的原生可选转换 ⭐⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_17_02_004_PASS_INSTANCEOF_GUARD_AS / EXP_07_17_02_013_RUNTIME_INSTANCEOF_PREVENTS_ERROR |
| **实测结果** | Swift `as?` 一行完成检查+转换，ArkTS 需要 `instanceof + as` 两步 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：Swift 原生支持 `as?` 可选转换（返回 Optional），比 ArkTS 的 `instanceof + as` 模式更简洁。但 ArkTS 的 Smart cast 机制使 instanceof 后不写 as 也能工作，使得实际编码体验差距缩小。

**跨语言对比**：

| 语言 | 安全 cast 模式 | 语法 |
|------|---------------|------|
| ArkTS | `if (x instanceof T) { x as T }` | Smart cast 使 as 可省略 |
| Java | `if (x instanceof T) { (T) x }` | Java 16+ 支持模式匹配 |
| Swift | `if let p = x as? T` | 一行完成，最简洁 |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：当前 `instanceof + as` + Smart cast 的组合体验良好，无需改变。

---

### ID-03: Java 字段隐藏与 ArkTS 字段访问 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | 多个涉及子类字段的 cast 用例 |
| **实测结果** | Java 中字段是隐藏而非覆写，ArkTS 中 `as` 是引用转换不影响字段访问 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：Java 中字段是隐藏（hiding）而非覆写（overriding），访问子类字段需通过子类引用或构造器赋值。ArkTS 中字段语法类似，但 `as` 是引用转换，不影响字段访问方式。

**跨语言对比**：

| 语言 | 字段机制 | cast 后字段访问 |
|------|---------|----------------|
| ArkTS | 字段可覆写 | 引用转换后字段访问按实际类型 |
| Java | 字段隐藏 | 需通过子类引用访问子类字段 |
| Swift | 计算/存储属性 | 类型转换后按转换类型访问 |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：当前设计符合 ArkTS 语言规范，无需调整。

---

### 总结

| ID | 差异描述 | 分类 | 影响程度 |
|----|---------|------|:--------:|
| ID-01 | Swift as! 不可恢复 vs ArkTS ClassCastError 可捕获 | 语言设计差异 | ⭐⭐⭐ |
| ID-02 | Swift as? 安全转换 vs ArkTS instanceof+as | 语言设计差异 | ⭐⭐ |
| ID-03 | Java 字段隐藏 vs ArkTS 字段覆写 | 语言设计差异 | ⭐ |
