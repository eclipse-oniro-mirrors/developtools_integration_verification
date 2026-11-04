# 7.35 Lambda 表达式 - 测试设计思维导图

## 概述
匿名函数，签名+体，创建函数类型实例

## 测试分类策略

### 编译期通过（compile-pass）
- 合法运算符与合法操作数类型组合
- 类型提升/转换的正确行为
- 运算符优先级与结合性验证

### 编译期失败（compile-fail）
- 运算符与操作数类型不兼容
- bigint 与 numeric 类型禁止混合的场景
- 非法左值表达式

### 运行时（runtime）
- 运算结果正确性验证（含 assert 断言）
- IEEE 754 特殊值行为（NaN、Infinity）
- 短路求值、变量捕获等动态语义

## 文件命名规范
- 前缀：EXP_
- 格式：EXP_07_XX_YYY_{PASS|FAIL|RUNTIME}_DESCRIPTION.ets
- 编号：PASS 001~ F 接续 RUNTIME 接续

## 用例统计
| 分类 | 数量 |
|------|------|
| compile-pass | 10 |
| compile-fail | 10 |
| runtime | 10 |
| **总计** | **30** |
