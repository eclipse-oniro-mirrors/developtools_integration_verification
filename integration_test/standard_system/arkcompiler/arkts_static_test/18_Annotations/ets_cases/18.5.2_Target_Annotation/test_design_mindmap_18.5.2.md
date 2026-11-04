# 18.5.2 Target Annotation - 测试设计思维导图

## 概述

`@Target` 是标准 meta-annotation，单字段 `targets: AnnotationTargets[]`。
限制注解的使用上下文。无 @Target 时无限制。

## 子规则覆盖

### compile-pass
- `@Target({targets: [AnnotationTargets.CLASS]})` 单目标
- `@Target({targets: [AnnotationTargets.CLASS, AnnotationTargets.INTERFACE]})` 多目标
- 注解在限制上下文中正确使用
- 无 @Target 时任意上下文可用

### compile-fail
- `@Target` 用于非注解声明
- 注解在限制上下文之外使用
- 重复目标值

### runtime
- @Target 注解运行时编译执行
