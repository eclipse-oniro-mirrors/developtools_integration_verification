# 18.2.1 Using Single Field Annotations - 测试设计思维导图

## 概述

参考 ArkTS Static Language Specification 第 18.2.1 节。

If annotation declaration defines only one field, it can be used with a short notation:
- `@Anno(expression)` instead of `@Anno({field: expression})`
- Short notation and object literal behave identically

## 子规则覆盖

### compile-pass
- 单字段注解简写（string）
- 单字段注解简写（int/number）
- 单字段注解简写（boolean）
- 单字段注解简写（enum）
- 单字段注解完整对象字面量形式
- 单字段数组简写
- 多个单字段注解在同一声明

### compile-fail
- 多字段注解使用简写（不允许）
- 非常量表达式

### runtime
- 单字段注解运行时行为

## 文件命名规范
- `ANN_18_02_1_YYY_{CATEGORY}_{DESCRIPTION}.ets`
