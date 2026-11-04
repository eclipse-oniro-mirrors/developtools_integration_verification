# 9.3.2 Implementing Optional Interface Properties - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.3.2 Implementing Optional Interface Properties

## 概述

spec §9.3.2：类可实现超接口的可选属性，或使用隐式定义的 accessor。可选属性 `f?: T` 类型为 `T | undefined`。

## 规则要点

1. 可选属性可不实现（使用隐式 accessor）
2. 可选属性实现为字段 → 必须是 optional 字段（`f?: T`）
3. 非可选字段实现可选属性 → compile-time error
4. 实现为 accessor → 可只实现一个（getter 或 setter）
5. 不实现 → 使用默认 accessor（getter 返回 undefined，setter 抛 runtime error）
6. 隐式 getter 返回 undefined、setter 抛 runtime error

## 测试点分类

### compile-pass（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_03_002_PASS_NO_IMPL_OPTIONAL | 不实现可选属性（使用默认 accessor） |
| 002 | CLS_09_03_002_PASS_OPTIONAL_FIELD_IMPL | optional 字段实现可选属性 |
| 003 | CLS_09_03_002_PASS_ACCESSOR_IMPL_OPTIONAL | accessor 实现可选属性 |

### compile-fail（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | CLS_09_03_002_FAIL_NON_OPTIONAL_IMPL_OPTIONAL | 非可选字段实现可选属性 |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 005 | CLS_09_03_002_RUNTIME_OPTIONAL_FIELD_ACCESS | optional 字段运行时访问 |
| 006 | CLS_09_03_002_RUNTIME_DEFAULT_ACCESSOR_UNDEFINED | 默认 accessor 返回 undefined |

## 文件命名规范
- `CLS_09_03_2_YYY_{CATEGORY}_{DESCRIPTION}.ets`
