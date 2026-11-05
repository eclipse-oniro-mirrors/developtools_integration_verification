# 7.9 this Expression - 测试设计思维导图

## 概述

验证 this 表达式在不同上下文中的类型和引用语义：实例方法、构造器、字段初始化 lambda、对象字面量方法、接口默认方法，以及不合法的 this 使用。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 实例方法 this | 实例方法中 this.field / this.method() 编译通过 |
| 002 | 构造器 this | 构造器中 this.field = value 编译通过 |
| 003 | 字段 lambda this | 字段初始化 lambda 中 this → 类类型编译通过 |
| 004 | 对象字面量方法 this | 对象字面量方法中 this → 字面量类型编译通过 |
| 005 | 对象字面量 lambda this | 对象字面量 lambda 中 this → 包围类类型编译通过 |
| 006 | 接口默认方法 this | 接口默认方法中 this → 接口类型编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 007 | 顶层作用域 this | 顶层作用域使用 this → 编译时错误 |
| 008 | 静态方法 this | 静态方法中使用 this → 编译时错误 |

### runtime（验证实际运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 009 | 实例方法 this 引用不同对象 | this 正确引用不同实例对象 |
| 010 | 构造器 this 初始化字段 | 构造器 this 正确初始化字段值 |
| 011 | 对象字面量方法 this | 对象字面量方法内 this 指向字面量实例 |

## 文件命名规范

`EXP_07_09_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
