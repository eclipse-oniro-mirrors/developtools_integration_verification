# 18.1 Declaring Annotations - 行为差异及规范一致性报告

## 概要

本章节（18.1 Declaring Annotations）的 ArkTS 实现与 spec 一致，未发现设计问题或规范不一致。

## 行为差异分析

### 1. 注解不能用作字段类型（差异化设计）

| 语言 | 行为 |
|------|------|
| ArkTS | ❌ 禁止：`Annotations cannot be used as a type` |
| Java | ✅ 允许：`@interface Outer { Inner inner(); }` 编译通过 |
| Swift | N/A（无原生注解） |

**评估**: 符合 ArkTS spec 的语言设计差异。ArkTS 选择更严格的类型约束。

### 2. 注解名冲突诊断

| 语言 | 行为 |
|------|------|
| ArkTS | ESE0370 + ESE0351：不支持合并声明 |
| Java | 编译错误：`duplicate class/interface` |
| Swift | N/A |

**评估**: 符合 ArkTS spec，行为与 Java 一致。

## 未发现的设计问题

本次测试未发现以下类型的设计问题：
- ❌ Spec 与实现不一致（D 类）
- ❌ 编译器实现 bug（C 类）
- ❌ ArkTS 设计问题（B 类）

所有 14 个测试用例均与 spec 一致，并通过 WSL 实际验证。

## 跨语言对比表

### 关键差异用例：注解作为字段类型 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `@interface Outer { inner: Inner }` | Compile error: "Annotations cannot be used as a type" |
| Java | `@interface Outer { Inner inner(); }` | Compile pass |
| Swift | N/A | N/A |

ArkTS 禁止注解作为其余注解字段的类型，而 Java 允许。这是 ArkTS 的刻意设计选择（受限于 18.1.1 Types of Annotation Fields）。
