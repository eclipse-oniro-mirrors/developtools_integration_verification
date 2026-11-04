# 18.2 Using Annotations - 行为差异及规范一致性报告

## 概要

本章节 ArkTS 实现与 spec 一致，未发现设计问题。

## 行为差异分析

### 1. 注解在 lambda/变量上的限制（Spec 与实现一致）

ArkTS 要求 lambda 和变量上的注解必须使用 `@Retention("SOURCE")` 策略。这是设计特性而非问题。

| 语言 | 行为 |
|------|------|
| ArkTS | ✅ 支持（需 SOURCE 策略） |
| Java | ❌ 不支持 |
| Swift | N/A |

### 2. 重复注解

ArkTS 不支持重复注解（Java 默认也不支持，但可通过 `@Repeatable` 容器实现）。

| 语言 | 行为 |
|------|------|
| ArkTS | ❌ ESE0041 |
| Java | ❌ 默认禁止（需 `@Repeatable`） |

## 未发现的设计问题

所有 23 个测试用例均与 spec 一致，通过 WSL 实际验证。

## 跨语言对比

### 关键差异：lambda/变量注解 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `@Anno (): void => {}` | ✅ 需 SOURCE 策略 |
| Java | `@Anno () -> {}` | ❌ 编译错误 |
| Swift | N/A | N/A |
