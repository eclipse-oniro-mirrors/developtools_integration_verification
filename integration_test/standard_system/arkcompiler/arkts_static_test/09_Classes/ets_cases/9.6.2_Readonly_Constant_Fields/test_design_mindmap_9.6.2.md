# 9.6.2 Readonly Constant Fields - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.6.2 Readonly (Constant) Fields

## 概述

spec §9.6.2：readonly 修饰的字段初始化后不可修改。static 和 non-static 字段都可以是 readonly。

## 规则要点

1. readonly 字段初始化后不可修改 → compile-time error
2. static readonly 和 instance readonly 都合法
3. readonly 字段必须在声明处或构造器中初始化

## 测试点分类

### compile-pass（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_06_002_PASS_READONLY_FIELD | readonly 字段声明 |
| 002 | CLS_09_06_002_PASS_STATIC_READONLY | static readonly |

### compile-fail（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | CLS_09_06_002_FAIL_READONLY_REASSIGN | readonly 字段重新赋值 |
| 004 | CLS_09_06_002_FAIL_STATIC_READONLY_REASSIGN | static readonly 重新赋值 |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 005 | CLS_09_06_002_RUNTIME_READONLY_ACCESS | readonly 字段访问 |
| 006 | CLS_09_06_002_RUNTIME_READONLY_INIT_IN_CTOR | 构造器初始化 readonly |

## 文件命名规范
- `CLS_09_06_2_YYY_{CATEGORY}_{DESCRIPTION}.ets`
