# 7.10.1 Accessing Static Fields - 测试设计思维导图

## 概述

当访问静态字段时，objectReference 采用 typeReference 形式（即 `ClassName.staticField`）。静态字段访问表达式的结果：非 readonly 字段为 variable（可修改），readonly 字段为 value（只读，除非在 static initializer block 中）。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 基本静态字段访问 | `MyClass.count` 通过类名访问静态字段编译通过 |
| 002 | 非 readonly 静态字段赋值 | `MyClass.count = 10` 修改静态字段值编译通过 |
| 003 | Readonly 静态字段读取 | `MyClass.MAX_SIZE` 读取只读静态字段编译通过 |
| 004 | 静态字段在表达式中 | 在算术、字符串拼接等表达式中使用静态字段编译通过 |
| 005 | 多类静态字段 | 不同类的静态字段独立访问编译通过 |
| 006 | Readonly 静态字段初始化 | static initializer 内可修改 readonly 字段编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 007 | 实例引用访问静态字段 | `instance.staticField` 通过实例引用 → 编译时错误 |
| 008 | 修改 readonly 静态字段 | `MyClass.READONLY_FIELD = newValue` 编译时错误 |

### runtime（验证实际运行时行为）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 009 | 静态字段跨实例一致性 | 不同实例共享同一个静态字段，值一致 |
| 010 | 静态字段赋值全局可见 | 修改后所有读取都反映新值 |
| 011 | Readonly 静态字段值验证 | readonly 静态字段不可变，值正确 |

## 文件命名规范

`EXP_07_10_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
