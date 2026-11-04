# 3.21.5 Readonly Utility Type - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 一、行为差异与规范一致性概览

`Readonly<T>` 将所有字段设为 readonly。T 可赋值给 Readonly<T>，且 T <: Readonly<T>。

## 二、已验证的 ArkTS 规范一致行为

| 行为 | 用例 | 结果 |
|------|------|------|
| Readonly 声明，字段不可写 | 002 | ✅ |
| U<:T ⇒ Readonly<U> <: Readonly<T> | 003 | ✅ |
| T 可赋值给 Readonly<T> | 005 | ✅ |
| T <: Readonly<T> | 006 | ✅ |
| Readonly 不含方法 | 007 | ✅ |
| runtime 只读字段可读 | 008,009 | ✅ |

## 三、待确认问题 / Spec 与实现不一致

**D-3.21.5-01** — Readonly 应用于非 class/interface 不应编译通过

- Spec 要求：T 必须是 class/interface
- 实际：`Readonly<int>` 编译通过
- 复现：TYP_03_21_05_004_FAIL_NON_CLASS

## 四、跨语言对比

| Readonly 工具类型 | ArkTS | Java | Swift |
|-----------------|-------|------|-------|
| compile-time Readonly<T> | ✅ | ❌ | ❌ |
| 模拟方式 | `Readonly<Interface>` | final 字段 / Collections.unmodifiable | let（值绑定） |

## 五、分类汇总

| 分类 | 数量 |
|------|------|
| 已验证规范一致行为 | 6 |
| Spec 与实现不一致 | 1 |