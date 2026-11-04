# 3.21.2 NonNullable Utility Type - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 一、行为差异与规范一致性概览

`NonNullable<T>` 从 T 中移除 null 和 undefined，是编译期 utility type。

## 二、已验证的 ArkTS 规范一致行为

| 类型变换 | 用例 | 结果 |
|---------|------|------|
| `NonNullable<Object|null|undefined>` → Object | 001 | ✅ |
| `NonNullable<int|string>` → int\|string | 002 | ✅ |
| `NonNullable<union\|null\|undefined>` → union | 003 | ✅ |
| 泛型 `NonNullable<T>` 字段 | 004 | ✅ |
| `NonNullable<Any>` | 005 | ✅ |
| `NonNullable<null>` → never 拒绝赋值 | 006 | ✅ |
| `NonNullable<undefined>` → never 拒绝赋值 | 007 | ✅ |

## 三、跨语言对比

| Null/Non-null 区分 | ArkTS | Java | Swift |
|-------------------|-------|------|-------|
| 编译期 NonNullable | ✅ | ❌ | ❌ |
| 类似概念 | union `T\|null` | `Optional<T>`（运行时） | `T?`（编译期） |
| Object 可空 | `Object \| null` | `Object` 可 null | `AnyObject?` |

## 四、分类汇总

| 分类 | 数量 |
|------|------|
| 符合 ArkTS spec 的语言设计差异 |  |
| 已验证规范一致行为 | 7 项 |
| Spec 与实现不一致 | 0 |