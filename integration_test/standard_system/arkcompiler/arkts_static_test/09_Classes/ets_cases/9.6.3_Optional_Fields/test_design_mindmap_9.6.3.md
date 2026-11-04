# 9.6.3 Optional Fields - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.6.3 Optional Fields

## 概述

spec §9.6.3：optional 字段 `f?: T = expr` 的实际类型为 `T | undefined`。无初始化器时默认 undefined。

## 规则要点

1. `f?: T` 等价于 `g: T | undefined = undefined`
2. 无初始化器 → 默认值 undefined
3. optional 字段类型为 T | undefined

## 测试点分类

### compile-pass（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_06_003_PASS_OPTIONAL_FIELD_NO_INIT | optional 字段无初始化器 |
| 002 | CLS_09_06_003_PASS_OPTIONAL_FIELD_WITH_INIT | optional 字段含初始化器 |

### compile-fail（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | CLS_09_06_003_FAIL_OPTIONAL_ASSIGN_TO_NONNULLISH | optional 字段赋值给 non-nullish |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | CLS_09_06_003_RUNTIME_OPTIONAL_DEFAULT_UNDEFINED | optional 默认值 undefined |
| 005 | CLS_09_06_003_RUNTIME_OPTIONAL_WITH_VALUE | optional 字段赋值后访问 |

## 文件命名规范
- `CLS_09_06_3_YYY_{CATEGORY}_{DESCRIPTION}.ets`
