# 18.2 Using Annotations - 测试设计思维导图

## 概述

参考 ArkTS Static Language Specification 第 18.2 节。

使用注解的语法：
```
annotationUsage:
  AnnotationUsageNoParentheses | annotationUsageWithParentheses
;
annotationUsageNoParentheses: '@' qualifiedName
;
annotationUsageWithParentheses: '@' qualifiedName annotationValues
;
annotationValues: '(' (objectLiteral | constantExpression)? ')'
;
```

关键规则：
- 注解字段值必须是常量表达式或数组字面量
- 可应用的声明目标：Top-Level, 类成员(除override字段), 接口成员, 类型使用, 参数, lambda, 常量/变量
- 不可重复（同一注解在同一实体上只能使用一次）
- 字段顺序无关
- 所有无默认值的字段必须列出
- 数组字段使用数组字面量语法
- 无属性时括号可省略

## 子规则覆盖

### 1. 注解使用语法（compile-pass）
- 无括号形式 `@Anno`
- 空括号形式 `@Anno()`
- 对象字面量形式 `@Anno({field: value})`
- 单字段简写形式（18.2.1）
- 字段顺序无关

### 2. 注解字段值约束（compile-pass）
- 常量表达式赋值
- 数组字面量赋值
- 默认值生效
- 多维数组字面量

### 3. 应用目标（compile-pass）
- 类声明
- 类方法
- 类字段
- 接口方法
- 参数
- lambda 表达式
- 变量声明

### 4. 错误场景（compile-fail）
- 重复注解
- 缺少必填字段
- 非常量表达式
- 错误目标（函数声明）
- override 字段
- @和名称之间有空格

## 分类说明
- compile-pass: 验证合法用法
- compile-fail: 验证编译时错误
- runtime: 验证运行时行为

## 文件命名规范
- `ANN_18_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`
