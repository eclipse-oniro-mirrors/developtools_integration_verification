# 3.19.2 Access to Common Union Members - 测试设计思维导图

## 概述
当变量 `u` 的类型为联合类型 `T1 | ... | TN` 时，ArkTS 允许访问公共成员 `u.m`，但必须满足严格条件。

## 访问条件

### 成员访问合法条件
1. 每个 `Ti` 必须是 interface 或 class 类型
2. 每个 `Ti` 都有同名非静态成员 `m`
3. 每个 `m` 必须满足其一：
   - 方法或 accessor 且签名相等
   - 字段且字段类型相同

### 编译错误场景
- 某个成员不存在
- 同名字段类型不同
- 同名方法签名不同
- 访问静态成员
- 任一 `Ti` 中 `m` 是 overload 声明

## 测试点覆盖

### compile-pass
- class union 访问同名同类型字段
- class union 调用同名同签名方法
- interface union 访问共同方法
- overload 类中不同普通方法 `foo2` 可访问

### compile-fail
- 同名字段类型不同
- 同名方法签名不同
- 静态方法不可通过 union type alias 访问
- overload 方法不可作为 common member 访问
- 某个 class 缺少成员

### runtime
- class union common field/method 分发
- interface union common method 分发

## 编号规划
- compile-pass: 001~004
- compile-fail: 005~009
- runtime: 010~011

## 文件命名规范
`TYP_03_19_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`