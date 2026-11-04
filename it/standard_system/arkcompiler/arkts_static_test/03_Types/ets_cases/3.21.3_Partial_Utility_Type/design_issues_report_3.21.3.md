# 3.21.3 Partial Utility Type - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 一、行为差异与规范一致性概览

`Partial<T>` 将 class/interface 字段设为 optional，用于部分更新等场景。

## 二、已验证的 ArkTS 规范一致行为

| 行为 | 用例 | 结果 |
|------|------|------|
| interface Partial 字段 optional | 001 | ✅ |
| U<:T ⇒ Partial<U> <: Partial<T> | 002 | ✅ |
| class Partial | 003 | ✅ |
| Object literal 赋值 Partial | 004 | ✅ |
| T 不可赋给 Partial<T> | 005 | ✅ |
| 方法不在 Partial 内 | 007 | ✅ |
| runtime optional 字段 | 008,009,010 | ✅ |

## 三、待确认问题 / Spec 与实现不一致记录

**D-3.21.3-01** — Partial 应用于非 class/interface 不应编译通过

- Spec 要求：`Partial<int>` 应编译错误（T must be class or interface）
- 实际：编译通过
- 复现：TYP_03_21_03_006_FAIL_PARTIAL_NON_CLASS
- 分类：D 类（Spec 与实现不一致）

## 四、跨语言对比

| 编译期可选字段类型 | ArkTS | Java | Swift |
|------------------|-------|------|-------|
| Partial<T> | ✅ | ❌ N/A | ❌ N/A |
| 模拟方式 | Partial<Interface> | null 字段 / Optional | 可选属性 `T?` |

## 五、分类汇总

| 分类 | 数量 |
|------|------|
| 符合 ArkTS spec 的语言设计差异 |  |
| 已验证规范一致行为 | 7 |
| Spec 与实现不一致 | 1（Partial 非 class/interface） |