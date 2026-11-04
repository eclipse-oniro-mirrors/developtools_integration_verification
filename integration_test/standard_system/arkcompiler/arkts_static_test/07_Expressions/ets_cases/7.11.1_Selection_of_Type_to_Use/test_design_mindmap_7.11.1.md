# 7.11.1 Selection of Type to Use - 测试设计思维导图

## 概述

方法调用的第一步：根据 objectReference 的形式确定搜索方法的类型。三种形式：typeReference（必须指向类）、super（指向超类）、expression of type T（类/接口/union/类型参数）。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | typeReference 静态方法 | `MyClass.staticMethod()` 通过类名调用编译通过 |
| 002 | super 方法调用 | `super.method()` 调用超类方法编译通过 |
| 003 | 类实例方法调用 | `obj.method()` 类实例调用实例方法编译通过 |
| 004 | 接口引用方法调用 | `iface.method()` 接口引用调用方法编译通过 |
| 005 | Union 类型方法调用 | `u.method()` union 类型调用共有方法编译通过 |
| 006 | 泛型类型参数方法调用 | `T.method()` 类型参数约束方法编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 007 | 接口 typeReference | 接口名.静态方法 → 编译时错误 |
| 008 | null 表达式调用方法 | `null.toString()` → 编译时错误 |

### runtime（验证实际运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 009 | 静态方法运行时调用 | typeReference 形式实际执行正确 |
| 010 | super 方法运行时 | super 形式实际执行正确 |
| 011 | 接口方法运行时多态 | interface 形式实际执行正确 |
| 012 | 泛型方法运行时 | type parameter 形式实际执行正确 |

## 文件命名规范

`EXP_07_11_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
