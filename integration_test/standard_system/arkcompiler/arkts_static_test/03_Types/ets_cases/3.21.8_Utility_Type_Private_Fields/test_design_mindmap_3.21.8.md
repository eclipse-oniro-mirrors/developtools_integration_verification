# 3.21.8 Utility Type Private Fields - 测试设计思维导图

## 概述
Utility types 保留初始类型的 private 字段，但不可访问。

## 核心规则
- private 字段保留但不可访问
- 对象字面量不能包含 private 字段名 → 编译错误
- 原类实例可赋给 utility 类型

## 测试点
- compile-pass: utility type 接受 new A()（含 private 字段）
- compile-fail: 对象字面量包含 private 字段名
- runtime: 赋值后通过 public 字段读取值