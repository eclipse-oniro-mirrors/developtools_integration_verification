# 3.7 Reference Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告
---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |


**测试用例：** 11

## 一、新发现问题

**无。**

## 二、已验证的 ArkTS 规范一致行为

- 14 种引用类型声明 ✅
- 多引用共享对象状态 ✅
- 数组引用语义 ✅
- 值 vs 引用对比 ✅

## 三、设计观察

### 观察：ArkTS 引用类型种类最丰富

ArkTS 包含 14 种引用类型，远多于 Java（约 5 种）和 Swift（约 8 种）。

| 维度 | ArkTS 独有 |
|------|----------|
| FixedArray 与 Array 区分 | ✅ |
| Union Type 一等 | ✅ |
| String Literal Type | ✅ |
| bigint 引用类型 | ✅ |

## 四、严重性

| 严重性 | 数量 |
|-------|------|
| HIGH | 0 |
| MEDIUM | 0 |
| LOW | 0 |
| 设计观察 | 1 |
