# 3.19.3 Keyof Types - 测试设计思维导图

## 概述
keyof type 是使用 `keyof` 关键字构造的特殊 union type。`keyof` 应用于 class 或 interface type，结果是所有可访问成员名称组成的字符串字面量 union。

## 核心规则
- `keyof C` → `"field" | "method" | ...`
- 仅允许 class / interface typeReference
- 对空 class/interface，`keyof` 等价于 never
- 非法成员名赋值应编译错误

## 测试点
- compile-pass: class 成员、interface 成员、方法+字段、空类 keyof never、成员名赋值
- compile-fail: keyof 非 class/interface、无效字符串赋值、empty keyof 赋值、成员不存在
- runtime: keyof 值运行时是 string，keyof 与对象字段访问配合

## 编号规划
- compile-pass: 001~006
- compile-fail: 007~010
- runtime: 011~012

## 文件命名规范
`TYP_03_19_03_YYY_{CATEGORY}_{DESCRIPTION}.ets`