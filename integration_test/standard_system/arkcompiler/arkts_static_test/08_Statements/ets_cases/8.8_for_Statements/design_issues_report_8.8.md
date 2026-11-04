# 8.8 for Statements - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-18
**测试用例数：** 22（13 compile-pass + 3 compile-fail + 6 runtime）
**目的：** 通过用例执行（编译期 + 真实运行时）+ 跨语言对比，识别 ArkTS for 语句作为静态语言的设计问题。

---

## 一、与业界静态语言的差异点

本章节未发现新的设计问题。所有 22 个测试用例的行为均与 ArkTS 规范 §8.8 完全一致，本次执行 100% 通过。

### 已知问题的章节归属确认

| 问题 | 来源章节 | 8.8 是否受波及 | 备注 |
|------|---------|:------:|------|
| STMT-I1：Block 内 type declaration spec/impl 不一致 | 8.3 | 否 | for 循环体中的类型声明由 8.3 规范统一约束，8.8 不引入额外规则 |
| STMT-I2：Label 未使用 spec 要求报错但编译器未强制 | 8.6 | 否 | 8.8 用例 014/018 均正确使用了 label（`break outer`），不触发此问题 |
| 逗号运算符仅限于 for 循环 | 8.2 / 8.11 | 是（合规使用） | 8.8 用例 012/013/017 验证逗号在 forInit/forUpdate 中合法，行为符合 spec |
| Error.code 访问器冲突 | 8.14 | 否 | throw 语句相关，8.8 不涉及 |
| null case 类型收窄与直接 new | 8.13 | 否 | switch 语句相关，8.8 不涉及 |
| char 在 switch 中可与 int 比较 | 8.13 | 否 | switch 语句相关，8.8 不涉及 |

---

## 二、符合ArkTS spec的语言设计差异（与规范一致）

| 用例 ID | 行为描述 | 状态 |
|---------|---------|:----:|
| 001, 008 | 基础 for 循环：forInit 声明新变量 + 显式类型 `int` | OK |
| 002 | forInit 类型推导（`let i = 0`，自动推导为 int） | OK |
| 003, 009 | 使用已存在变量作为循环索引（forInit 为空） | OK |
| 004 | forInit 和 forUpdate 均为空，仅保留条件表达式 | OK |
| 005 | forContinue 为空（无终止条件），靠内部 break 退出 | OK |
| 006 | 扩展条件表达式：forContinue 为 int 类型（非 boolean），当前版本编译通过 | OK |
| 007, 019 | forInit 声明的变量具有循环作用域（loop scope），循环外访问 → 编译错误 | OK |
| 009 | 无限循环 `for(;;)` 三部分为空，break 正确退出 | OK |
| 010 | for 括号内缺少分号 → 语法错误 | OK |
| 011 | `for(;;)` 空所有部分，运行时 break 正确退出 | OK |
| 012 | forInit 使用 expressionSequence（逗号表达式）初始化多个变量 | OK |
| 013 | forUpdate 使用 expressionSequence（逗号表达式）同时更新多个变量 | OK |
| 014 | for 循环体使用 labeled statement，`break outer` 跳出外层循环 | OK |
| 015 | forInit 声明的循环变量在 forContinue、forUpdate 和循环体中均可访问 | OK |
| 016 | forUpdate 为空，循环变量在循环体内手动更新 | OK |
| 017 | 运行时验证 expressionSequence 求值顺序和执行正确性 | OK |
| 018 | 单层 for 循环使用 labeled break 提前退出循环体 | OK |
| 020 | 递减循环 `i--` 作为 forUpdate 表达式，运行时正确 | OK |
| 021 | 复合条件 `&&` 作为 forContinue 表达式，运行时正确 | OK |

---

## 三、严重性等级总览

| 严重性 | 数量 | 涉及用例 |
|-------|------|---------|
| HIGH | 0 | - |
| MEDIUM | 0 | - |
| LOW | 0 | - |
| 设计观察（非问题） | 2 | A（逗号运算符限定）、B（循环作用域一致性） |

---

## 四、设计观察

### 观察 A：逗号运算符仅限于 for 循环的 forInit/forUpdate

**背景：** ArkTS 规范 §8.2/8.11 明确逗号运算符仅在 for 语句的 forInit 和 forUpdate 部分合法。8.8 用例 012（forInit 逗号表达式）、013（forUpdate 逗号表达式）、017（运行时逗号表达式验证）确认了此行为。

**用例 012：** `for (let i = 0, j = 10; i < 10; i++, j--)` -- forInit 和 forUpdate 中逗号合法。
**用例 017：** 运行时验证逗号表达式求值顺序（左到右）和执行正确性。

**对比：**

| 语言 | forInit/forUpdate 逗号 | forContinue/循环体逗号 |
|------|:---:|:---:|
| ArkTS | 合法 | 不合法（仅限于 for 头部） |
| Java | 合法 | 不合法（JLS 同样限制） |
| Swift | N/A（无 C 风格 for） | N/A |

**评价：** 此限制与 Java 一致。逗号在 for 头部的初始化/更新部分有明确的语法角色（顺序求值、返回最右值），在 forContinue 或循环体中应使用代码块替代逗号表达式。这是 ArkTS 限制逗号运算符的合理设计选择。

### 观察 B：循环作用域（loop scope）与 Java 完全一致

**spec §8.8 规则：** forInit 中声明的变量具有 loop scope，作用域覆盖 forContinue 表达式、forUpdate 表达式和循环体。循环结束后变量不可访问。

**用例 007：**
```typescript
for (let loopIdx: int = 0; loopIdx < 5; loopIdx++) { }
let after: int = loopIdx   // 编译错误：loopIdx 不在作用域内
```

**用例 019：** 第一个 for 的 forInit 变量不能在第二个不同 for 的 forContinue 中引用。

| 语言 | forInit 变量作用域 | 循环外访问 |
|------|------------------|:---:|
| ArkTS | 严格限于循环内 | 编译错误 |
| Java | 严格限于循环内 | 编译错误 |
| Swift | N/A（无 C 风格 for） | N/A |

**评价：** 行为与 Java 完全一致，循环作用域规则清晰且严格执行。

---

## 五、本章节核心结论

| 维度 | 评价 |
|------|------|
| 与 spec 一致性 | 一致（执行 100% 通过，22/22） |
| 设计严密性 | 与 Java 一致，无缺口 |
| for 循环设计 | 标准 C 风格三部分循环，行为可预测 |
| 逗号运算符 | 限定于 forInit/forUpdate，与 Java 对齐 |
| 循环作用域 | 与 Java 完全一致 |
| STMT-I1 / STMT-I2 波及 | 否（8.8 不受已有设计问题影响） |

---

## 六、累积发现汇总（含已完成的 Statements 章节）

| 严重性 | 总数 | 来源章节 |
|-------|------|---------|
| HIGH | 1 | 8.3: STMT-I1（Block 内 type declaration spec/impl 不一致） |
| MEDIUM | 1 | 8.6: STMT-I2（Label 未使用 spec 要求报错但编译器未强制） |
| LOW | 0 | - |
| 设计观察 | 2 | 8.8: A（逗号运算符限定）、B（循环作用域一致性） |

---

## 七、对齐建议

无建议。8.8 章节设计清晰，实现与规范完全一致。

| 维度 | 评价 |
|------|------|
| 与规范一致性 | OK（执行 100% 通过） |
| 设计严密性 | OK（与 Java 对齐） |
| 跨语言对比 | 与 Java 高度一致，Swift 已移除 C 风格 for |
| 已有问题波及 | 0（8.8 不触发任何已知设计问题） |
