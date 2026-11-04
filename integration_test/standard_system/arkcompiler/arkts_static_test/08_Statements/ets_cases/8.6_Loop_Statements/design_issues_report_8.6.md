# 8.6 Loop Statements - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-18
**测试用例数：** 12（compile-pass: 6, compile-fail: 3, runtime: 3）
**目的：** 通过用例执行（编译期 + 运行时）+ 跨语言对比，识别 ArkTS 静态语言的设计问题。

---

## 一、与业界静态语言的差异点

### 差异点 STMT-I2：Loop label 未被使用 — Spec 要求报错但编译器未强制

**用例：** STMT_08_06_012_PASS_label_declared_not_used（原设计为 compile-fail，实测编译通过）
**差异性质：** ArkTS Spec 与编译器行为差异（待确认对齐方向 — STATEMENTS.md 明确要求 compile-time error，但 es2panda 未检查此约束）
**当前状态：** 待确认是编译器遗漏还是 spec 表述过严

**差异描述：**

STATEMENTS.md §8.6 原文：
> "A compile-time error occurs if the label identifier is **not used** within loopStatement, or is used in lambda expressions within a loop body."

es2panda 编译器正确检查了 "used in lambda expressions"（STMT_08_06_006/007 正确报错），但**未检查 "not used at all"** 的情况：

```typescript
// STATEMENTS.md 要求 compile-time error，但 es2panda 编译通过
function test(): void {
  unused_label:
  for (let i: int = 0; i < 10; i++) {
    console.log("iteration")  // label 'unused_label' 声明但未被 break/continue 使用
  }
}
```

**实测对比：**

| 约束 | STATEMENTS.md | es2panda 行为 |
|------|-------------|--------------|
| label 在 lambda 内使用 | compile-time error | 正确报错 |
| label 完全未使用 | compile-time error | **编译通过（不一致）** |

**跨语言对比：**
- es2panda 实现了 "label in lambda" 检查但未实现 "label not used" 检查
- 这是一个编译器实现不完整的问题（编译器遗漏了 spec 中的检查项）

**Spec 依据：**
STATEMENTS.md §8.6: "A compile-time error occurs if the label identifier is not used within loopStatement"

**影响：**
1. 声明了 label 但不使用，代码可正常编译运行，不影响功能
2. 但不符合 spec 的明确要求
3. 严重性低于 STMT-I1，因为不影响运行时正确性
4. 从 Java/TypeScript/Swift 迁移的开发者通常不会声明不使用标签，因此实际开发中触发频率低

**对齐方案：**
1. es2panda 增加 "label not used" 的编译期检查
2. 或 spec 放宽此约束（声明未使用的 label 仅为 warning，非 error）

---

### 跨章节已知问题适用性检查

以下为其余章节已发现的跨章节设计问题在本节的适用性评估：

| 问题 ID | 描述 | 涉及章节 | 本节适用 | 说明 |
|---------|------|---------|---------|------|
| STMT-I1 | Block 内 type 声明 spec/impl 不匹配 | 8.3 | 否 | 8.6 不涉及块内类型声明 |
| **STMT-I2** | **标签未引用不强制报错** | **8.6** | **是** | **本节发现，已记录为问题 STMT-I2** |
| comma-op | 逗号运算符仅限 for 循环 | 8.2, 8.11 | 否 | 8.6 的 for 循环头部使用逗号运算符符合规范，不属于此问题范畴 |
| Error.code | Error.code 访问器冲突 | 8.14 | 否 | 8.6 不涉及 Error 属性定义 |
| null-case-new | null case 类型收窄与直接 new | 8.13 | 否 | 8.6 不涉及 switch 类型收窄 |
| char-switch | char 与 int 在 switch 中可比 | 8.13 | 否 | 8.6 不涉及 switch 表达式比较 |

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 用例 ID | 行为描述 | 状态 |
|---------|---------|------|
| STMT_08_06_001_PASS_BasicWhile | while 循环基本语义：条件为 `false` 时循环体不执行，`true` 时正常迭代 | 通过 |
| STMT_08_06_002_PASS_BasicDoWhile | do-while 循环基本语义：条件初始为 `false` 时循环体至少执行一次 | 通过 |
| STMT_08_06_003_PASS_BasicFor | for 循环基本语义：标准 `for (let i; i < 5; i++)`、空初始化及空更新子句 | 通过 |
| STMT_08_06_004_PASS_BasicForOf | for-of 循环基本语义：遍历 `int[]` 数组，空数组产生零次迭代 | 通过 |
| STMT_08_06_005_PASS_LabeledLoopBreak | 带标签的 for 循环中使用 `break outerLoop` 正确引用标签 | 通过 |
| STMT_08_06_006_FAIL_LabelInLambdaContinue | Lambda 内使用 `continue label`：编译错误，标签引用在 lambda 中禁止 | 通过 |
| STMT_08_06_007_FAIL_LabelInLambdaBreak | Lambda 内使用 `break outer`：编译错误，lambda 体内不允许引用外层循环标签 | 通过 |
| STMT_08_06_008_FAIL_BreakToUndeclaredLabel | `break` 引用未声明的标签：编译错误，标签必须先声明再使用 | 通过 |
| STMT_08_06_009_RUNTIME_WhileAndDoWhile | 运行时验证 while 和 do-while 的迭代计数、`continue`、`break` 及边界条件 | 通过 |
| STMT_08_06_010_RUNTIME_ForAndForOf | 运行时验证 for 和 for-of 的循环求和、`continue`、`break`、空初始化及空数组 | 通过 |
| STMT_08_06_011_RUNTIME_LabeledLoop | 运行时验证嵌套标签循环的 `break` 外层退出、`continue` 外层跳过及 `while` 外层退出 | 通过 |
| STMT_08_06_012_PASS_label_declared_not_used | 声明标签但未在循环体内使用 → **编译器未按 spec 要求报错**（参见问题 STMT-I2） | 参见问题 STMT-I2 |

此外，以下设计方面经验证与主流语言一致，无问题：

- **四种循环类型（while、do、for、for-of）**：符合行业惯例，无设计问题。
- **Lambda 限制**：Java 和 Swift 同样禁止在 lambda/闭包体内使用 `break`/`continue` 引用外层循环标签。此行为一致且符合预期。
- **未声明标签检测**：STMT_08_06_008_FAIL_BreakToUndeclaredLabel 测试了 `break nonExistentLabel` 在编译期被捕获。这是三种语言的标准行为。
- **无标签 break/continue 无额外限制**：ArkTS 允许在循环中按预期层级使用无标签的 `break` 和 `continue`（仅限最内层），与 Java 和 Swift 一致。

---

## 三、严重性等级总览

| 严重性 | 数量 | 涉及用例 |
|--------|------|---------|
| HIGH | 0 | — |
| MEDIUM | 1 | STMT_08_06_012_PASS_label_declared_not_used（STMT-I2） |
| LOW | 0 | — |
| 无问题 | — | 其余 11 个用例行为与规范完全一致 |

---

## 四、跨语言对比结论

| 对比维度 | ArkTS | Java (SE21) | Swift (5.x) | 结论 |
|---------|-------|-------------|-------------|------|
| 循环类型 | while, do, for, for-of（4种） | while, do, for, for-each（4种） | while, repeat-while, for-in（3种） | 基本一致 |
| 未引用标签 | 编译器未检查（STMT-I2 缺陷） | 静默允许 | 静默允许 | ArkTS spec 要求报错，但编译器未实现 |
| Lambda 内引用外层标签 | 编译错误 | 编译错误 | 编译错误 | 三者一致 |
| 未声明标签引用 | 编译错误 | 编译错误 | 编译错误 | 三者一致 |
| 无标签 break/continue | 支持（最内层） | 支持（最内层） | 支持（最内层） | 三者一致 |
| 标签适用语句范围 | 仅循环语句 | 任意语句 | 循环语句 | Java 更灵活 |

---

## 五、改进方向建议

### 短期（需立即修复）

1. **修复 STMT-I2**：es2panda 编译器实现 "label not used" 的编译期检查，与 STATEMENTS.md §8.6 的明确要求对齐。或者，如果 ArkTS 团队认为此约束过严，可修改 spec 将其降级为 warning。

### 中期（建议增强）

2. **补充编译失败用例**：基于 STMT-I2 修复后的编译器，添加验证 "label not used" 编译期错误的 FAIL 用例。
3. **文档化标签规则**：在 ArkTS 迁移指南和语言参考中明确记录标签的声明-使用约束，帮助从 Java/TypeScript/Swift 背景迁移的开发者理解此规则。

### 长期（设计层面考虑）

4. **关注社区反馈**：如果开发者对标签使用约束有异议，可考虑与 Java 对齐（允许未引用标签存在）或采用 Swift 的 lint 级警告方式。当前 spec 的编译期错误约束比 Java 和 Swift 都更严格，需要在"静态安全"与"开发体验"之间权衡。

---

**总体结论：** 除 STMT-I2（编译器未实现 spec 要求的 label-not-used 检查）外，8.6 章节所有循环语句行为均与 ArkTS 规范一致，未发现其余设计问题。循环语句设计整体成熟，与 Java/Swift 在核心语义上高度对齐。
