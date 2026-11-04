# 7.10.3 Accessing SuperClass Accessors - 测试设计思维导图

## 概述

`super.identifier` 形式用于访问超类的访问器（accessor）。关键规则：`super.property` 可调用超类的 getter/setter；`super.field` 导致编译时错误（`super` 不能用于字段）。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | Getter 通过 super 调用 | `get property(): T { return super.property }` 编译通过 |
| 002 | Setter 通过 super 调用 | `set property(p: T) { super.property = val }` 编译通过 |
| 003 | 同时 Getter + Setter | 子类同时重写 getter 和 setter 并调用 super 编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 004 | super 读取字段 | `super.field` 在表达式中读取字段 → 编译时错误 |
| 005 | super 赋值字段 | `super.field = val` 给字段赋值 → 编译时错误 |

### runtime（验证实际运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 006 | Getter 运行时值 | super getter 调用后返回值正确 |
| 007 | Setter 运行时效果 | super setter 调用后值正确设置 |
| 008 | 完整 Getter+Setter 链 | 先 set 再 get 值一致 |

## 文件命名规范

`EXP_07_10_03_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
