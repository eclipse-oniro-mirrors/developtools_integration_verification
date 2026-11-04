# 3.18.1 Type Function - 测试设计思维导图

## 概述

Type Function 是所有函数类型的直接超接口。关键规则：
- `Function` 类型值不能直接调用，必须使用 `unsafeCall` 方法
- `unsafeCall` 检查参数数量和类型，合法时调用底层函数
- `unsafeCall` 参数不匹配时抛出 runtime error
- `Function.name` 属性返回关联的函数名

## 子类型覆盖

### 1. Function 类型赋值
- 正向编译: 函数赋给 Function ✅ (001)
- 正向编译: 静态方法赋给 Function ✅ (001)
- 正向编译: 实例方法赋给 Function ✅ (001)
- 正向编译: lambda 赋给 Function ✅ (001)

### 2. Function.name 属性
- 正向编译: 函数名 → "函数名" ✅ (002)
- 正向编译: 静态方法名 → "方法名" ✅ (002)
- 正向编译: 实例方法名 → "方法名" ✅ (002)
- 正向编译: lambda 赋给变量 → "变量名" ✅ (002)
- 正向编译: 匿名 lambda → "" ✅ (002)

### 3. Function 直接调用禁止
- 反向编译: `f(1)` 直接调用 → compile-time error ⚠️ SPEC 不一致 (003)

### 4. unsafeCall 方法
- 运行时: `f.unsafeCall(args)` 正确调用 ✅ (004)
- 运行时: `f.unsafeCall()` 参数数量不匹配 → runtime error (005 新增)

## 分类说明

- compile-pass: 001, 002
- compile-fail: 003 (⚠️ SPEC 不一致 — D 类)
- runtime: 004, 005 (新增)

## 文件命名规范

- TYP_03_18_01_YYY_{CATEGORY}_{DESCRIPTION}.ets