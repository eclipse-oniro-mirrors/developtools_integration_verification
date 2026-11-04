# 7.35.2 Lambda Body — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 未初始化局部变量在 lambda 中捕获 ⭐⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_35_02_009_FAIL_UNINIT_LOCAL_CAPTURE |
| **实测结果** | 编译通过（期望编译时错误） |
| **错误信息** | 无错误（D 类 Spec 不一致） |

**描述**：根据 ArkTS spec 规则 6，局部变量在 lambda 体中使用但未在 lambda 中声明且未在之前赋值应产生 compile-time error。但 ArkTS 编译器实际允许该表达式通过，未报错。与 Java 的"variable x might not have been initialized"检测形成对比。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let x: int; const f = (): int => x` | ✅ 编译通过（❌ 应 compile-fail） |
| Java | `int x; Supplier<Integer> f = () -> x` | ✅ compile-error |
| Swift | `var x: Int; let f = { x }` | ✅ compile-pass（Swift 无此限制） |

**分类**：D 类 — Spec 与实现不一致

**建议**：在编译器中添加未初始化变量捕获检测，使 lambda 中使用了未赋值局部变量时能正确报错。与 Java 的 "variable x might not have been initialized" 行为一致。

---

### ID-02: 块体无 return 检测差异 ⭐⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_35_02_010_FAIL_MISSING_RETURN_BLOCK / EXP_07_35_02_011_FAIL_VOID_STMT_NO_RETURN |
| **实测结果** | ArkTS compile-error（非 void/never 类型块体无 return 时正确报错） |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：非 void/never 返回类型的 lambda 块体中没有 return 语句时，ArkTS 和 Java 均报编译错误，而 Swift 允许隐式返回（单表达式闭包无需 `return` 关键字）。该差异是语言设计选择。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `(): int => { }` | ✅ compile-error（规则 8 检查生效） |
| Java | `() -> { }` | ✅ compile-error（missing return statement） |
| Swift | `{ }` | ⚠️ compile-error（空闭包）；但 `{ x in x + 1 }` 隐式返回无需 `return` |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：当前设计合理，ArkTS 在此处行为与 Java 一致，比 Swift 更严格，有助于防止遗漏 return 语句。

---

### ID-03: Void 调用表达式体简化差异 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_35_02_006_PASS_VOID_CALL_EXPR_BODY |
| **实测结果** | ArkTS 对 void 调用表达式体自动简化（等价 `{ expr; }` 而非 `{ return expr; }`） |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：Lambda 体为返回类型 void 的调用表达式时，ArkTS Spec 有明确规则：等价于 `{ expression; }` 而非 `{ return expression; }`。Java 和 Swift 无等价概念，因为 void 方法调用在两者中本身就是语句形式。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `(): void => logMsg(msg)` | ✅ Spec 明确规则：等价于 `{ logMsg(msg); }` |
| Java | `msg -> System.out.println(msg)` | ⚠️ 无等价概念。void 方法调用本就是语句 |
| Swift | `{ msg in print(msg) }` | ⚠️ 无等价概念。Void 函数调用作为 closure body 自动应用隐式返回规则 |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：ArkTS 有显式规范描述是好的做法，Java/Swift 无对应规则。

---

### 结论

| 分类 | 状态 |
|:----:|:------|
| **D 类**（Spec 与实现不一致） | **1 个**：未初始化变量捕获 |
| **compile-pass** | **8/8** ✅ |
| **compile-fail** | **2/3** ✅（1 个 D 类不一致） |
| **runtime** | **1/1** ✅ |
| **Java** | **11/11** ✅ |
| **Swift** | **13/13** ✅ |
