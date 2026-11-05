# 11.2 Enumeration with Explicit Base Type - 测试设计思维导图

## 概述
枚举基类可以显式指定为任意数值类型或 string 类型。

## 规则
- 显式类型必须为数值或 string，否则编译错误
- 成员初始化器必须可赋值给基类类型
- 若基类不是整数类型，成员必须有显式初始化器

## 测试点覆盖
- PASS: double/long/byte/string 显式基类
- FAIL: Object 作基类、非 int 基类缺初始化器、初始化器不兼容、string 基类 int 初始化器
- RT: 运行时值正确