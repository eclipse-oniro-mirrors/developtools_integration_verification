# 18.5 Standard Annotations - 测试设计思维导图

## 概述

参考 ArkTS Static Language Specification 第 18.5 节。

Standard annotation = 标准库定义或编译器内置的注解。Meta-annotation = 注解另一个注解的注解。

## 子规则覆盖

### compile-pass
- `@Retention` 作为 meta-annotation 使用
- `@Target` 作为 meta-annotation 使用

### compile-fail
- `@Retention` 用于非注解声明
- `@Target` 用于非注解声明

### runtime
- meta-annotation 运行时编译执行
