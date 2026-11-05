# 3.17.2 Type Tuple - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

---

---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

## 问题 1: unsafeGet 异常类型规范未明确

**问题描述**：spec/types.md:1259 仅说明 "Calls of the method unsafeGet cause a runtime error if..." 但未指定具体异常类型名称。实际实现抛出 `IndexOutOfBoundsError`，而非常见的 `RangeError`（数组越界使用 RangeError）。

**复现用例**：TYP_03_17_02_022, TYP_03_17_02_023

**实测错误信息**：
- 实际抛出：`IndexOutOfBoundsError`
- 规范描述：`runtime error`（未指定具体类型）

**跨语言对比表**：

| 语言 | 异常类型 |
|------|----------|
| ArkTS | IndexOutOfBoundsError |
| Java | ArrayIndexOutOfBoundsException |
| Swift | N/A（编译时检查，无运行时异常） |

**严重性等级**：LOW

**改进建议**：建议在 spec 中明确 `unsafeGet` 抛出的异常类型为 `IndexOutOfBoundsError`，与数组索引的 `RangeError` 区分。

---

## 问题 2: Tuple 子类型关系要求元素 identical 而非 subtype

**问题描述**：spec/semantics.md:450-453 规定 tuple 子类型关系要求前缀元素类型 **identical**，不支持元素级别的子类型（协变）。即 `[Derived, string]` 不是 `[Base, string]` 的子类型，尽管 `Derived <: Base`。

**复现用例**：TYP_03_17_02_007_FAIL_TUPLE_ELEMENT_SUBTYPE

**跨语言对比表**：

| 语言 | 行为 | 安全性 |
|------|------|--------|
| ArkTS | compile-fail: 元素需 identical | ✅ 编译时安全 |
| Java | compile-pass: 数组协变（运行时检查） | ⚠️ 运行时 ArrayStoreException |
| Swift | N/A: 元组无继承子类型 | ✅ |

**严重性等级**：LOW

**改进建议**：当前设计是安全的（编译时拒绝而非运行时才发现类型错误）。建议保持不变，但可在 spec 中增加更详细的说明和示例。

---

## 问题 3: Tuple 值元素不可修改的规范表述

**问题描述**：spec/types.md:1281-1283 说明 "No element of a Tuple value can be changed"，但仅提及 runtime error，未明确是否在编译时就应阻止通过 Tuple 类型修改元素的尝试。

**复现用例**：TYP_03_17_02_015_FAIL_TUPLE_MUTATE

**实测结果**：编译时即报错（compile-time error），符合预期。

**严重性等级**：LOW

**改进建议**：建议在 spec 中明确 Tuple 值元素修改是 compile-time error 而非仅 runtime error。

---

**报告生成时间**：2026-06-21
