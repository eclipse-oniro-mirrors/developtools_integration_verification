# 18.6 Runtime Access to Annotations - 测试设计思维导图

## 概述

参考 ArkTS Static Language Specification 第 18.6 节。

For annotations with BYTECODE or RUNTIME retention policy, an abstract class with the annotation name is implicitly declared. The abstract class has readonly fields. The reflection library provides runtime access.

## 子规则覆盖

### compile-pass
- @Retention("RUNTIME") annotation with string field
- @Retention("RUNTIME") annotation with number field
- @Retention("RUNTIME") annotation with array field
- @Retention("BYTECODE") annotation (abstract class also declared)

### compile-fail
- Annotation cannot be directly used as a type (ESE0159)
- @Retention("SOURCE") annotation - no abstract class at runtime

### runtime
- RUNTIME retention annotation compiles and runs
