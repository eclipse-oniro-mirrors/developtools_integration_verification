# 14.7.1 Implementing Ambient Namespace Declaration — 跨语言对比报告

## 1. 概览

| 语言 | 命名空间实现机制 | 是否支持 |
|------|----------------|---------|
| ArkTS | `declare namespace` + `namespace` 同名实现 | ⚠️ spec 允许，编译器拒绝 merge |
| Java | 静态内部类（嵌套类） | ✅ |
| Swift | 嵌套 enum | ✅ |

## 2. 章节对应关系

| ArkTS 14.7.1 | Java | Swift |
|-------------|------|-------|
| `declare namespace A {}` + `namespace A {}` | `class A { static class Impl {} }` | `enum A { enum Impl {} }` |
| 嵌套同名 | 多层嵌套类 | 多层嵌套 enum |
| 实现函数 | 静态方法 | 静态方法 |
| 实现变量 | 静态字段 | 静态属性 |

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 实现 ambient namespace | ❌ 编译器拒绝 merge | N/A | N/A |
| 嵌套同名实现 | ❌ 同上 | ✅ | ✅ |
| 函数签名校验 | ✅ 正确报错 | N/A | N/A |
| 嵌套名称校验 | ✅ 正确报错 | N/A | N/A |

## 4. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 同名实现 | ⚠️ D 类 | ✅ | ✅ |
| 002 | 嵌套实现 | ⚠️ D 类 | ✅ | ✅ |
| 003 | 实现函数 | ⚠️ D 类 | ✅ | ✅ |
| 004 | 实现变量 | ⚠️ D 类 | ✅ | ✅ |
| 005 | 嵌套名不匹配 | ✅ compile-fail | N/A | N/A |
| 006 | 签名不匹配 | ✅ compile-fail | N/A | N/A |
| 007 | 实现 + main | ⚠️ D 类 | ✅ | ✅ |

## 5. 关键差异详解

### declare namespace 与 namespace 无法合并

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS (spec) | `declare namespace A {}` + `namespace A {}` | ✅ 应允许同名实现 |
| ArkTS (实际) | 同上 | ❌ 编译器拒绝："Unable to merge namespaces" |
| Java | `class A { static class Impl {} }` | ✅ 支持 |
| Swift | `enum A { enum Impl {} }` | ✅ 支持 |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 实现自由度 | ⭐（编译器限制） | ⭐⭐⭐ | ⭐⭐⭐ |
| 名称校验 | ⭐⭐⭐ | N/A | N/A |
| 签名校验 | ⭐⭐⭐ | N/A | N/A |

## 7. 核心结论

ArkTS 当前不支持 `declare namespace` 与 `namespace` 的合并（编译器报错），尽管 spec 明确允许。名称不匹配和签名不匹配校验已正确实施。

## 8. ArkTS 设计建议

修复编译器，允许 `declare namespace` 与非 `declare namespace` 合并（modifier 不同的 namespace 应可合并）。
