# 18.5.1 Retention Annotation - 测试设计思维导图

## 概述

`@Retention` 是标准 meta-annotation，单字段 `policy: string`。
三种策略："SOURCE"、"BYTECODE"（默认）、"RUNTIME"。

## 子规则覆盖

### compile-pass
- `@Retention("SOURCE")` 简写
- `@Retention("BYTECODE")` 简写
- `@Retention("RUNTIME")` 简写
- `@Retention({policy: "RUNTIME"})` 完整形式
- 多个注解分别用不同策略

### compile-fail
- `@Retention` 用于 class
- `@Retention("INVALID")` 无效策略
- `@Retention("")` 空策略

### runtime
- `@Retention("RUNTIME")` 注解运行时可用
