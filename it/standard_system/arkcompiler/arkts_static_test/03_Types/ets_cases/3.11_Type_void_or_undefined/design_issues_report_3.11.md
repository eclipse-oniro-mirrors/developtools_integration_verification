# 3.11 Type void or undefined - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告
---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |


**测试用例：** 20

## 一、行为差异与规范一致性概览

无。

## 二、已验证的 ArkTS 规范一致行为

- void 与 undefined 同一类型 ✅
- return undefined / return 空语句互通 ✅
- void/undefined 变量互赋值 ✅
- void 作为泛型实参 ✅
- void[] 数组 ✅
- 非 undefined 值拒绝 ✅

## 三、设计观察

### 观察：ArkTS void 比 Java void 表达力强

Java void 只能作为返回类型，ArkTS void 可作为普通类型、泛型实参、数组元素类型。

### 观察：ArkTS void 与 Swift Void 类似但值不同

| 语言 | Void 值 |
|------|--------|
| ArkTS | undefined |
| Swift | () 空元组 |

## 四、严重性

无问题。
