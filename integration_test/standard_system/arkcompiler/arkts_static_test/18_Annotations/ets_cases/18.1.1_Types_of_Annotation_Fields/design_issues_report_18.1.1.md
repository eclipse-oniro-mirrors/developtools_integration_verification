# 18.1.1 Types of Annotation Fields - 行为差异及规范一致性报告

## 概要

本章节（18.1.1 Types of Annotation Fields）的 ArkTS 实现与 spec 完全一致。编译器诊断消息清晰明确（ESE0042 / ESE0159）。

## 行为差异分析

### 1. 注解字段类型限制（ArkTS vs Java）

| 语言 | 允许的注解字段类型 |
|------|-------------------|
| ArkTS | Numeric, boolean, string, enum, arrays of these |
| Java | 所有可在编译时常量中使用的类型（基本类型、String、Class、enum、Annotation、以及这些的数组）|
| Swift | N/A（无原生注解） |

**核心差异**: Java 允许注解本身作为注解字段的类型以及 Class 类型，而 ArkTS 禁止这两者。

### 2. 诊断消息对比

| 场景 | ArkTS 错误消息 | Java 错误消息 |
|------|---------------|--------------|
| 类类型 | `ESE0042: Invalid annotation field type...` | `annotation field type must be one of: primitive, String, Class, enum, annotation, or array of one of these` |
| 注解类型 | `ESE0159: Annotations cannot be used as a type` | 同上（Java 允许） |

## 未发现的设计问题

本次测试未发现以下类型的设计问题：
- ❌ Spec 与实现不一致（D 类）
- ❌ 编译器实现 bug（C 类）
- ❌ ArkTS 设计问题（B 类）

所有 26 个测试用例均与 spec 一致，并通过 WSL 实际验证。

## 跨语言对比表

### 关键差异用例：注解作为字段类型 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `@interface A { inner: Inner }` | ❌ ESE0159 |
| Java | `@interface A { Inner inner(); }` | ✅ 编译通过 |
| Swift | N/A | N/A |

### 关键差异用例：类作为字段类型 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `@interface A { obj: MyClass }` | ❌ ESE0042 |
| Java | `@interface A { Class<?> clazz(); }` | ✅ 编译通过（Class 类型） |
| Swift | N/A | N/A |
