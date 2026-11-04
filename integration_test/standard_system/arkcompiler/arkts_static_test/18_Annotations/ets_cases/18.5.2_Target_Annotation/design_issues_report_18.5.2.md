# 18.5.2 Target Annotation - 行为差异及规范一致性报告

## 概要

所有 9 个用例与 spec 一致。

## 编译器实现差异

Spec 中 `@Target` 短格式为 `@Target(["CLASS", "METHOD"])`（字符串字面量数组），但当前编译器实现要求枚举形式 `@Target({targets: [AnnotationTargets.CLASS]})`。

## 关键诊断
- `ESE495032: Annotation cannot be used on X. It is only allowed on: Y`
- `ESE263981: Annotation target is duplicated`
