# 7.10.2 Accessing Current Object Fields - 测试设计思维导图

## 概述

当访问当前对象字段时，objectReference 采用 primaryExpression 形式（即 `obj.field`）。运行时求值从 primaryExpression 求值开始。关键规则：仅使用 primaryExpression 的声明类型（而非运行时实际对象类型）确定要访问的字段。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 基本实例字段访问 | `obj.field` 读取实例字段值编译通过 |
| 002 | 非 readonly 字段赋值 | `obj.field = newVal` 修改实例字段编译通过 |
| 003 | readonly 实例字段读取 | value 语义，不可作为左值编译通过 |
| 004 | 构造器内 readonly 字段赋值 | 构造器中允许给 readonly 字段赋值编译通过 |
| 005 | 方法返回值字段访问 | `getObj().field` 链式访问编译通过 |
| 006 | Accessor getter 调用 | 非赋值位置调用 getter 编译通过 |
| 007 | Accessor setter 调用 | 赋值位置调用 setter 编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 008 | readonly 字段外部赋值 | 构造器外给 readonly 字段赋值 → 编译时错误 |
| 009 | nullish 引用字段访问 | `T \| undefined` 类型变量访问字段 → 编译时错误 |

### runtime（验证实际运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 010 | 实例字段初始值 | 运行时字段值正确 |
| 011 | 字段修改反映新值 | 修改后反映新值 |
| 012 | 字段覆写语义 | 声明类型决定字段访问而非运行时类型（Override 语义） |

## 文件命名规范

`EXP_07_10_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
