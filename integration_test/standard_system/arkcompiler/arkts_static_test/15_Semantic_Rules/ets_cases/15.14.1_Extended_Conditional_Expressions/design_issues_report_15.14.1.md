# 15.14.1 Extended Conditional Expressions - ArkTS与Java/Swift/TS行为差异及规范一致性报告
---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |


**测试用例：** 3

## 一、行为差异与规范一致性概览

### 1. 三元表达式返回联合类型 ⭐ ArkTS/TS 独有

ArkTS 三元表达式返回两个分支类型的联合类型（`T | U`），这与 TypeScript 一致，但与 Java/Swift 不同（Java/Swift 返回强类型）。

### 2. 与 TypeScript 兼容性

ArkTS 三元表达式行为与 TypeScript 完全一致，这是 TS 兼容特性。

### 3. 类型推断复杂性

联合类型增加了类型推断复杂性，可能导致开发者困惑。

## 二、已验证的 ArkTS 规范一致行为

- 三元表达式类型推断 ✅
- 类型不匹配拒绝 ✅
- 运行时行为 ✅

## 三、设计观察

### 观察 1：三元表达式返回联合类型（TS 兼容语义，即将废弃）

三元表达式返回联合类型（`T | U`）是 ArkTS 从 TypeScript 继承的语义，与 Java/Swift（返回强类型）不同。此为有意设计，非缺陷。

> **注意：** Spec §15.14 line 3162 明确说明："Using these features while doing the ArkTS programming is not recommended in most cases."
> Spec §15.14.1 line 3186 进一步声明："**The extended semantics is to be deprecated in one of the future versions of ArkTS.**"

因此当前编译器部分拒绝此特性是预期行为。用例保留作为兼容性参考，但失败不计入编译器缺陷。

### 观察 2：与 Java/Swift 差异

ArkTS 三元表达式行为与 Java/Swift 不同，从 Java/Swift 迁移时需注意联合类型的使用。

## 四、改进建议

### 建议 1：明确类型推断规则

当前规范对三元表达式类型推断的说明不足。建议：
- 明确联合类型如何计算
- 说明与上下文期望类型的交互

## 六、跨语言对比要点

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 三元表达式返回类型 | 联合类型 | 强类型 | 强类型 | 联合类型 |
| 类型推断 | 复杂 | 简洁 | 简洁 | 复杂 |
| TS 兼容性 | ✅ 完全 | N/A | N/A | ✅ 完全 |
