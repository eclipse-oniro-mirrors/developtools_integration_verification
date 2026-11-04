# 11 Enumerations - 测试设计思维导图

## 概述
Enumeration（枚举）是一种命名一组关联 readonly 成员的用户定义类型。

## 核心规则
- 成员名唯一，值可重复
- 基类推断：int（有成员无初始化器）或 string（全是字符串初始化器）
- 显示基类：`enum E: type { ... }`
- 无初始化器的 int 基类枚举成员从 0 自动递增
- `const enum` 暂不支持 → 编译错误
- empty enum 合法（空花括号）
- 访问必须加类型名限定（`Color.Red`），初始化器例外
- 支持关系运算和相等比较
- int 基类隐式转数值，string 基类隐式转 string
- 若枚举是 exported，所有成员自动 exported

## 测试点
- compile-pass: 基本 int 枚举，string 基类，显式基类，empty enum，值重复 OK，int→number 转换，string 转换
- compile-fail: 重复成员名，混合 base type（int+string），const enum，int→string 隐式转换（对 int enum）
- runtime: values()/fromValue()/getName()，相等比较，数值转换

## 编号规划
- compile-pass: 001~008
- compile-fail: 009~014
- runtime: 015~018

## 文件命名规范
`ENM_11_YYY_{CATEGORY}_{DESCRIPTION}.ets`