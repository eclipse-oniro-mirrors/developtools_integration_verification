# 14.5 Ambient Interface Declarations — 跨语言对比报告

## 1. 概览

| 语言 | 接口声明机制 |
|------|-------------|
| ArkTS | ✅ `declare interface` ambient 接口 |
| Java | ✅ `interface` 关键字 |
| Swift | ✅ `protocol` 关键字 |

## 2. 章节对应关系

| ArkTS 14.5 | Java | Swift |
|-----------|------|-------|
| `declare interface I { prop: int }` | `interface I { int prop; }` | `protocol I { var prop: Int }` |
| `declare interface I { foo(): void }` | `interface I { void foo(); }` | `protocol I { func foo() -> Void }` |
| `default foo(): void` | `default void foo() {}` | `extension I { func foo() {} }` |
| `interface A extends B` | `interface A extends B` | `protocol A: B` |
| 泛型 interface | 泛型 interface | 关联类型 protocol |

## 3. 关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 抽象方法 | ✅ | ✅ | ✅ |
| default 方法 | ✅ default 关键字 | ✅ default 关键字 | ✅ extension 实现 |
| 属性声明 | ✅ | ✅ | ✅ |
| extends | ✅ | ✅ | ✅ (:) |
| 泛型 | ✅ | ✅ | ✅ associatedtype |
| indexer | ✅ ambient 支持 | ❌ 不支持 | ✅ subscript |
| iterable | ✅ | ✅ Iterable | ✅ Sequence |

## 4. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 空接口 | ✅ compile-pass | ✅ | ✅ |
| 002 | 属性 | ✅ compile-pass | ✅ | ✅ |
| 003 | 方法 | ✅ compile-pass | ✅ | ✅ |
| 004 | default 方法 | ✅ compile-pass | ✅ | ✅ |
| 005 | extends | ✅ compile-pass | ✅ | ✅ |
| 006 | 泛型 | ✅ compile-pass | ✅ | ✅ |
| 007 | indexer | ✅ compile-pass | N/A | ✅ |
| 008 | iterable | ✅ compile-pass | ✅ | ✅ |
| 009 | 方法有体 | ✅ compile-fail | N/A | N/A |
| 010 | 无返回类型 | ✅ compile-fail | N/A | N/A |
| 011 | 两个 indexer | ✅ compile-fail | N/A | N/A |
| 012 | runtime | ✅ runtime | N/A | N/A |

## 5. 关键差异详解

### default 方法

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `default foo(): void` | ✅ ambient default 方法，编译通过 |
| Java | `default void foo() {}` | ✅ 需提供实现体 |
| Swift | `extension I { func foo() {} }` | ⚠️ 通过 extension 提供默认实现 |

### indexer 在接口中

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `declare interface I { [index: number]: string }` | ✅ 编译通过 |
| Java | 无 | ❌ 不支持 |
| Swift | `protocol I { subscript(Int) -> String }` | ✅ 支持 |

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 接口声明灵活度 | ⭐⭐⭐（indexer/iterable） | ⭐⭐ | ⭐⭐⭐（subscript） |
| default 方法 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐（需 extension） |
| 编译器校验 | ⭐⭐⭐（所有规则正确） | N/A | N/A |

## 7. 核心结论

1. Ambient interface 编译器实施质量高 — 所有 3 个 compile-fail 规则均正确校验
2. default 方法在 ambient 和 Java 间概念一致
3. indexer/iterable 在 interface 中的支持与 class 规则相同

## 8. ArkTS 设计建议

保持当前实现 — 所有编译器校验均已正确实施，无待解决问题。
