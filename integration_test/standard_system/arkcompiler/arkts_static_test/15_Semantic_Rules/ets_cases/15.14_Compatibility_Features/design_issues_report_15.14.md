# 15.14 Compatibility Features - ArkTS与Java/Swift/TS行为差异及规范一致性报告
---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |


**测试用例：** 21（compile-pass 2 + compile-fail 2 + runtime 17）

## 一、行为差异与规范一致性概览

### 1. 真值判断与 JavaScript/TypeScript 一致

ArkTS 的真值判断规则与 JavaScript/TypeScript 完全一致：
- `false`, `0`, `NaN`, `""`, `null`, `undefined` → falsy
- 其余 → truthy

这与 Java/Swift 不同（Java/Swift 要求条件表达式必须为 boolean）。

### 2. `&&` 和 `||` 运算符返回操作数

ArkTS 的 `&&` 和 `||` 返回操作数之一（不是 boolean），与 JavaScript/TypeScript 一致。

这与 Java/Swift 不同（Java/Swift 的 `&&`/`||` 返回 boolean）。

### 3. 与 TypeScript 兼容性

ArkTS 尽量与 TypeScript 兼容，但部分 TS 特性不支持（如 `any` 的完全兼容、条件类型等）。

## 二、已验证的 ArkTS 规范一致行为

- 真值判断规则 ✅
- `&&` 和 `||` 运算符行为 ✅
- 条件表达式类型 narrowing ✅

## 三、设计观察

### 观察 1：真值判断遵循 JS/TS 规则（有意设计）

ArkTS 的真值判断规则有意遵循 JavaScript/TypeScript 规则，是 TS 兼容特性的核心组成部分：
- ArkTS: `if (0) { ... }` → 不执行（0 是 falsy）
- Java: `if (0) { ... }` → 编译错误（0 不是 boolean）
- Swift: `if 0 { ... }` → 编译错误（0 不是 boolean）

此为有意设计，非缺陷。从 Java/Swift 迁移时需注意此差异。

### 观察 2：`&&`/`||` 返回操作数（TS 兼容语义）

ArkTS 的 `&&`/`||` 返回操作数之一（不是 boolean），与 JavaScript/TypeScript 一致：
```typescript
let x = 0 && "foo"  // x: number | string
```

Java/Swift 的 `&&`/`||` 返回 boolean。此为设计取舍，非缺陷。

### 观察 3：与 TypeScript 的兼容范围

ArkTS 与 TypeScript 的兼容程度有限：
- 支持：基本真值判断、`&&`/`||` 行为
- 不支持：`any` 完全兼容、条件类型、映射类型等高级特性

## 四、改进建议

### 建议 1：明确真值判断规则

当前规范对真值判断的说明分散在多个章节。建议：
- 在 15.14 中集中说明真值判断规则
- 提供完整的 falsy 值列表
- 说明与 JavaScript/TypeScript 的兼容性

### 建议 2：提供迁移指南

当前真值判断规则与 Java/Swift 不同，可能导致迁移问题。建议：
- 提供从 Java/Swift 迁移的注意事项文档
- 或提供编译器警告（当条件表达式不是 boolean 时）

### 建议 3：明确与 TypeScript 的兼容范围

当前 ArkTS 与 TypeScript 的兼容范围不明确。建议：
- 明确列出支持的 TS 特性
- 明确列出不支持的 TS 特性及原因

## 六、跨语言对比要点

| 维度 | ArkTS | Java | Swift | TypeScript |
|------|-------|------|-------|------------|
| 真值判断 | ✅ JS 规则 | ❌ 必须 boolean | ❌ 必须 boolean | ✅ JS 规则 |
| `&&`/`||` 返回类型 | 操作数类型 | boolean | boolean | 操作数类型 |
| 条件表达式 | 操作数 | boolean | boolean | 操作数 |
| TS 兼容性 | 部分 | N/A | N/A | ✅ 完全 |
