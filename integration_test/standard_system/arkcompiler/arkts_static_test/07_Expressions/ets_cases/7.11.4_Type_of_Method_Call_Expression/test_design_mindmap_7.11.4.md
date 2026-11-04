# 7.11.4 Type of Method Call Expression - 测试设计思维导图

## 概述

方法调用表达式的类型是方法的返回类型。如返回类型为 void，则表达式类型也为 void，void 不能用作类型注解。调用 void 方法作为表达式语句是允许的，但赋值给变量是编译时错误。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | static void 方法作为语句 | `A.method()` 直接调用 void 静态方法编译通过 |
| 002 | instance void 方法作为语句 | `new A().method()` 直接调用 void 实例方法编译通过 |
| 003 | static 非 void 方法返回值赋值 | 静态方法返回 `int` 赋值给 `int` 变量编译通过 |
| 004 | instance 非 void 方法返回值赋值 | 实例方法返回 `string` 赋值给 `string` 变量编译通过 |
| 005 | 方法返回值类型推导 | `let x = obj.getValue()` 类型推导编译通过 |
| 006 | 方法返回值在表达式中使用 | `let sum = a.getX() + b.getY()` 编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 007 | static void 方法结果赋值 | static void 方法结果赋值给变量 → 编译时错误（⚠️ SPEC 不一致） |
| 008 | instance void 方法结果赋值 | instance void 方法结果赋值给变量 → 编译时错误（⚠️ SPEC 不一致） |

### runtime（验证实际运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 009 | static 返回 int 运行时 | 静态方法返回 int 值运行时正确 |
| 010 | instance 返回 string 运行时 | 实例方法返回 string 值运行时正确 |
| 011 | void 方法副作用运行时 | void 方法作为语句执行副作用生效 |
| 012 | 链式调用返回值运行时 | 链式调用非 void 方法返回值正确传播 |

## 文件命名规范

`EXP_07_11_04_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
