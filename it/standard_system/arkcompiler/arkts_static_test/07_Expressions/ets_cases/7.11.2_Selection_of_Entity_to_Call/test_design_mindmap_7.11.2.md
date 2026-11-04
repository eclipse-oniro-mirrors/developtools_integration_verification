# 7.11.2 Selection of Entity to Call - 测试设计思维导图

## 概述

在确定使用的类型后（Step 1），根据 objectReference 的形式、使用的类型和标识符确定候选调用实体集合。三种形式：typeReference 对应类静态方法，super 对应超类实例方法，expression 对应实例方法及带接收者的函数。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | typeReference → 静态方法 | `Class.staticMethod()` 候选集合非空编译通过 |
| 002 | super → 实例方法 | `super.method()` 超类实例方法编译通过 |
| 003 | 类表达式 → 实例方法 | `obj.method()` 类实例方法编译通过 |
| 004 | Union 类型公共方法 | `u.method()` union 公共实例方法编译通过 |
| 005 | 重载解析 | 多候选实体时参数类型匹配编译通过 |
| 006 | 接口表达式 → 实例方法 | `iface.method()` 接口实例方法编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 007 | typeReference 不存在方法 | typeReference 集合为空（无此静态方法名）→ 编译时错误 |
| 008 | Union 无公共方法 | Union 各成员类型无公共方法名 → 编译时错误 |

### runtime（验证实际运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 009 | 动态分发 | 子类覆盖父类方法，基类引用调用时动态分发到子类 |
| 010 | 重载解析运行时 | 多候选重载解析后正确调用对应方法 |
| 011 | super 方法运行时 | super 形式调用超类实例方法运行时正确 |
| 012 | Union 公共方法运行时 | union 类型各实际类型的公共方法调用正确 |

## 文件命名规范

`EXP_07_11_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
