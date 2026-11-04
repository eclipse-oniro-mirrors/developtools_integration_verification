# 18.6 Runtime Access to Annotations - 行为差异及规范一致性报告

## 概要

本章节发现 Spec 与实现的不一致问题。

## 发现的问题

### D 类：注解作为类型访问（Spec vs 实现不一致）

**问题描述：** Spec 规定 `@Retention("RUNTIME")` 和 `@Retention("BYTECODE")` 策略的注解会隐式声明一个抽象类，可以通过该抽象类名访问注解实例。但当前编译器禁止将注解名称用作类型（ESE0159: "Annotations cannot be used as a type"）。

**复现用例：** ANN_18_06_005_FAIL_ANNOTATION_AS_TYPE

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS Spec | `let x: MyAnno = getAnnotation(...)` | ✅ 应通过 |
| ArkTS 实现 | `let x: MyAnno = getAnnotation(...)` | ❌ ESE0159 |
| Java | `MyAnno a = cls.getAnnotation(MyAnno.class)` | ✅ |

**分类：** D 类（Spec 与实现不一致）

**建议：** 
- 编译器应允许 RUNTIME/BYTECODE 策略的注解名称作为类型使用
- 或者提供标准的反射 API（如 `getAnnotation`）来获取注解实例
- 当前实现中，注解的数据以 AOT 形式存储在字节码中，但缺少反射 API 或类型访问能力
