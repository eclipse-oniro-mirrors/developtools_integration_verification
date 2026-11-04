# 8.15.2 finally Clause - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-18
**测试用例数：** 18（8 compile-pass + 3 compile-fail + 7 runtime）
**目的：** 通过用例执行（编译期 + 真实运行时）+ 跨语言对比，识别 ArkTS finally 子句的静态语言设计问题。

---

## 一、与业界静态语言的差异点

**本节未发现任何设计问题。** 所有 18 个用例本次执行（修复过时语法 `catch(e: Error)` 为 `catch(e)` 后）100% 通过，未触发编译器异常或语义不符合预期行为。

### 不适用本节的设计问题

以下已知的跨章节设计问题经核查均不适用于 8.15.2（finally 子句）节：

| 问题 ID | 描述 | 来源章节 | 8.15.2 是否适用 |
|---------|------|---------|:---:|
| STMT-I1 | Block 内 type declaration — spec 措辞与编译器行为不一致 | 8.3 | 否 |
| STMT-I2 | Label not used 规则未被编译器强制执行 | 8.6 | 否 |
| (未编号) | 逗号运算符仅限 for 循环内使用 | 8.2, 8.11 | 否 |
| (未编号) | Error.code 访问器与标准库属性冲突 | 8.14 | 否 |
| (未编号) | switch 中 char 可与 int 比较 | 8.13 | 否 |
| (未编号) | null case 下直接 new 的类型收窄问题 | 8.13 | 否 |

finally 子句是一段独立的清理代码块，不涉及上述任何语法结构（block 内 type declaration、label、comma operator、Error.code、switch 或 null 类型收窄）。因此所有已知设计问题在本节均不重现。

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

### compile-pass（8/8 通过）

| 用例 ID | 行为描述 | 状态 |
|---------|----------|:---:|
| STMT_08_15_2_001 | 基本 try-catch-finally 结构正确编译 | ✅ |
| STMT_08_15_2_002 | finally 在 catch 子句之后正确编译 | ✅ |
| STMT_08_15_2_003 | try 块含 return 时 finally 仍正确编译 | ✅ |
| STMT_08_15_2_004 | try-finally 无 catch 子句正确编译 | ✅ |
| STMT_08_15_2_005 | 嵌套 try-catch-finally 结构正确编译 | ✅ |
| STMT_08_15_2_012 | finally 块内 throw 语句合法编译 | ✅ |
| STMT_08_15_2_013 | finally 块内 return 语句合法编译 | ✅ |
| STMT_08_15_2_014 | 循环内 finally 与 break/continue 组合合法编译 | ✅ |

### compile-fail（3/3 通过）

| 用例 ID | 行为描述 | 状态 |
|---------|----------|:---:|
| STMT_08_15_2_006 | finally 作为标识符使用被编译器拒绝 | ✅ |
| STMT_08_15_2_007 | finally 块内声明局部类被编译器拒绝 | ✅ |
| STMT_08_15_2_008 | finally 块内声明嵌套函数被编译器拒绝 | ✅ |

### runtime（7/7 — ark VM 真实执行 + assert 验证）

| 用例 ID | 行为描述 | 状态 |
|---------|----------|:---:|
| STMT_08_15_2_009 | finally 始终执行（正常完成、异常完成、return 路径） | ✅ |
| STMT_08_15_2_010 | try/catch 含 return 时 finally 先于 return 执行；返回值被保存后 finally 运行 | ✅ |
| STMT_08_15_2_011 | catch 重新抛出异常后 finally 仍执行 | ✅ |
| STMT_08_15_2_015 | finally 内 throw 新异常覆盖原异常并向上传播 | ✅ |
| STMT_08_15_2_016 | finally 内 return 覆盖 try/catch 的 return 值 | ✅ |
| STMT_08_15_2_017 | 循环内 break 前 finally 保证执行 | ✅ |
| STMT_08_15_2_018 | 循环内 continue 前 finally 保证执行 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 涉及问题 |
|--------|------|----------|
| 编译器待完善 | 0 | — |
| 语言差异 | 0 | — |
| 设计观察 | 0 | — |
| 设计观察（非问题） | 3 | A, B, C |

18 个用例（compile-pass、compile-fail、runtime）本次执行全部通过，未发现任何设计问题。

---

## 四、跨章节差异点

**无重现。** 8.15.2 节不涉及任何已知跨章节设计问题所涉及的语法结构（block 内 type declaration、label、comma operator、Error.code、switch / null 类型收窄）。finally 子句本身的语义（执行保证、异常覆盖、return 覆盖）与 Java 一致且被编译器正确实现。

---

## 五、值得关注的设计观察

### 观察 A：finally 语义与 Java 完全一致——无意外

ArkTS finally 子句的语义（无论正常完成还是异常中断都始终执行；即使在 try/catch 中有 return 或抛出新错误也会执行）与 Java JLS SE21 第 14.20.2 节完全相同。这是一个经过充分理解且久经考验的设计，不存在任何歧义。

**对比：**

| 语言 | finally 语义 |
|------|-------------|
| ArkTS | `finally` 块始终执行，无论正常还是异常完成 |
| Java | `finally` 块在 try 块退出时始终执行（JLS SE21 §14.20.2） |
| Swift | `defer` 在作用域退出时执行；**并非**与 try 结构绑定 |

**评价：** ArkTS 忠实地遵循 Java 模型。无设计顾虑。

### 观察 B：finally 内 throw 覆盖原始异常（规则 4）- 与 Java 一致

用例 012、015 验证了 finally 块内 `throw` 的语义：当 finally 中抛出异常时，新异常覆盖 try 中（正常或异常完成）或 catch 中的原始异常，并向外传播。这在 spec §8.15.3 规则 4 中明确定义，与 Java JLS SE21 §14.20.2 完全一致。

**用例场景：**
- finally throw 覆盖正常 try 完成（015 scenario 1）
- finally throw 覆盖 try 中抛出的异常（015 scenario 2）
- finally throw 覆盖 catch 中重新抛出的异常（015 scenario 3）

**评价：** 标准语义，无意外。

### 观察 C：finally 内 return 覆盖 try/catch 的 return 值——与 Java 一致

用例 013、016 验证了 finally 块内 `return` 的语义：当 finally 包含 `return` 时，该值成为最终返回值，覆盖 try 或 catch 中的 `return`。这在测试通过 `assert` 精确验证：

- `tryReturnOverridden()`: try 中 `return 100`，finally 中 `return 200`，结果 `200`
- `catchReturnOverridden()`: catch 中 `return 300`，finally 中 `return 400`，结果 `400`

**评价：** 与 Java 语义完全一致。虽然 finally 中 `return` 在实践中不推荐（掩盖原始返回意图），但编译器行为正确。

---

## 六、跨语言对比结论

| 对比维度 | ArkTS (8.15.2) | Java (JLS SE21 §14.20.2) | Swift (5.x) |
|---------|---------------|--------------------------|-------------|
| 基础 finally 语义 | finally 始终执行 | finally 始终执行 | defer 在作用域退出时执行 |
| finally 中 throw | 覆盖原始异常，向外传播 | 同 ArkTS | defer 中 throw 导致运行时错误（如同时有另一错误传播） |
| finally 中 return | 覆盖 try/catch 的 return 值 | 同 ArkTS | 不适用（defer 无此机制） |
| try-with-resources | 不支持 | 支持（JLS §14.20.3） | 不适用（无等价概念） |
| finally 块内局部声明限制 | 禁止局部类、type alias、嵌套函数 | 允许 | 允许 |
| 与自身 spec 一致性 | 100%（18/18 通过） | ✅ | ✅ |

### 综合维度评价

| 维度 | 评价 |
|------|------|
| 与 spec 一致性 | ⭐⭐⭐⭐⭐（执行 100% 通过） |
| 设计严密性 | ⭐⭐⭐⭐⭐ — 忠实地遵循 Java finally 语义 |
| 可预测性 | 无意外 — finally 行为符合开发者预期 |
| 表达能力 | 完整覆盖 finally 所有语义路径（执行保证、异常覆盖、return 覆盖、循环 break/continue 交互） |
| 与 Java/Swift 的对比 | ArkTS = Java > Swift（finally 比 defer 更直观、与 try 结构语义绑定更强） |

### 关键差异矩阵

| 特性 | ArkTS | Java SE21 | Swift 5.x |
|------|-------|-----------|-----------|
| finally 始终执行 | ✅ | ✅ | N/A（使用 defer） |
| finally 内 throw 覆盖原异常 | ✅ | ✅ | N/A |
| finally 内 return 覆盖原返回值 | ✅ | ✅ | N/A |
| 循环内 finally + break/continue 交互 | ✅ | ✅ | N/A |
| 嵌套 finally 执行顺序（内→外） | ✅ | ✅ | ✅（defer 后进先出） |
| 自动资源管理语法糖 | 无 | try-with-resources | 无（defer 不同用途） |

---

## 七、改进方向建议

### 短期
- 当前设计无需改进。finally 子句的所有 18 个用例均通过，行为与 spec 和 Java 一致。

### 中期
- 无。finally 子句的设计已稳定且被充分理解。

### 长期
- 如果资源管理模式在 ArkTS 中变得普遍，可考虑添加 `using` 或 `try-with-resources` 结构以实现自动清理（类似于 Java JLS §14.20.3），但这需要评估对 ArkTS 极简主义语言哲学的影响。

---

## 八、8.15.2 节核心结论

| 维度 | 评估 |
|------|------|
| 规范一致性 | 100%（18 个用例本次执行全部通过） |
| 设计严谨性 | 良好——finally 语义忠实地遵循 Java JLS SE21 §14.20.2，覆盖正常/异常/return 所有路径 |
| 可预测性 | 无意外——finally 行为（执行保证、异常覆盖、return 覆盖）符合开发者基于 Java 经验的预期 |
| 测试覆盖 | 完整——涵盖基础结构、边界条件（无 catch）、嵌套、保留字/局部类/嵌套函数拒绝、循环交互（break/continue） |
| 已知问题适用性 | 无——所有跨章节设计问题（STMT-I1、STMT-I2、comma operator、Error.code、switch/null）均不适用于 finally 子句 |
| 与 Java/Swift 的对比 | ArkTS = Java > Swift（finally 比 defer 更直观，与 try 结构语义绑定更强） |
