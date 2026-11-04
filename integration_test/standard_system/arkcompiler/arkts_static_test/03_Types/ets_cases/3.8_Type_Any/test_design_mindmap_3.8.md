# 3.8 Type Any - 测试设计思维导图

## 概述
spec §3.8：Any 是预定义类型，是所有类型的 supertype，是 nullish-type（包含 void/undefined 和 null）。**Any 没有方法和字段。**

## 核心规则
- Any 是顶类型（所有类型的超类型）
- Any 是 nullish 类型：是 void/undefined 和 null 的超类
- Any 没有 method 和 field

## 测试点

### compile-pass
- Any 接受 int/long/double/string/boolean
- Any 接受 class/interface/array/tuple
- Any 接受 null/undefined（nullish）
- Any 接受 bigint
- Array<Any> 多种值

### compile-fail
- Any 上调用方法（如 .length, .toString）
- Any 上访问字段
- Any 直接 narrowing 到具体类型（无 cast）

### runtime
- Any 持有不同类型，instanceof 检查
- Any 持有 null/undefined 检查
- Any 通过 cast 转回具体类型

## 编号
- compile-pass: 001 ~ 005
- compile-fail: 006 ~ 008
- runtime: 009 ~ 011