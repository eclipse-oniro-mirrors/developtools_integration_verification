# 7.11.3 Checking Modifiers - 测试设计思维导图

## 概述

在确定要调用的单个方法后（Step 2），对每种 objectReference 形式执行修饰符语义检查：typeReference 要求方法必须 static，expression 要求方法不能 static，super 要求方法不能 abstract 或 static。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | typeReference → static 方法 | `Class.staticMethod()` 方法声明为 static，修饰符检查通过 |
| 002 | expression → instance 方法 | `obj.instanceMethod()` 方法未声明 static，修饰符检查通过 |
| 003 | super → non-abstract non-static 方法 | `super.concreteMethod()` 方法非 abstract 且非 static，修饰符检查通过 |
| 004 | typeReference → static 兼容参数 | 静态方法调用参数类型兼容性检查通过 |
| 005 | expression → instance 兼容参数 | 实例方法调用参数类型兼容性检查通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 006 | typeReference → instance 方法 | 方法未声明 static → 编译时错误 |
| 007 | expression → static 方法 | 方法声明为 static → 编译时错误 |
| 008 | super → abstract 方法 | 超类方法为 abstract → 编译时错误 |
| 009 | super → static 方法 | 超类方法为 static → 编译时错误 |

### runtime（验证实际运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 010 | typeReference → static 方法运行时 | 静态方法正确执行并返回值 |
| 011 | expression → instance 方法运行时 | 实例方法正确执行并返回值 |
| 012 | super → non-abstract 方法运行时 | super 方法正确执行并返回值 |

## 文件命名规范

`EXP_07_11_03_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
