# 12.1 Errors - 测试设计思维导图

## 概述
Error 是所有错误基类。可自定义 Error 子类。错误通过 throw/try-catch 处理。

## 测试点
- PASS: throw Error、自定义 Error 子类、try-catch 语法
- FAIL: throw 非 Error 类型
- RT: 数组越界被 catch、catch 中类型为 Error