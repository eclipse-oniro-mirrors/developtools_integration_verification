# 9.6.4 Field Initialization - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.6.4 Field Initialization

## 概述

spec §9.6.4：所有字段（除 late initialization）通过默认值或初始化器初始化。static 字段可通过 static init block 初始化。instance 字段可通过构造器初始化。初始化器中使用 this/super → compile-time warning。

## 规则要点

1. 字段可通过初始化器或默认值初始化
2. static 字段 → static init block
3. instance 字段 → 构造器
4. 初始化器用 this/super → compile-time warning
5. 初始化器中 this 导致 runtime error（字段未初始化）

## 测试点分类

### compile-pass（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_06_004_PASS_FIELD_INITIALIZER_EXPR | 字段初始化器表达式 |
| 002 | CLS_09_06_004_PASS_FIELD_DEFAULT_VALUE | 字段默认值 |

### compile-fail（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | CLS_09_06_004_FAIL_FIELD_THIS_INITIALIZER_RUNTIME | this 在初始化器中（可能 warning）

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | CLS_09_06_004_RUNTIME_FIELD_INIT_ORDER | 字段初始化顺序 |
| 005 | CLS_09_06_004_RUNTIME_INITIALIZER_EVAL | 初始化器执行 |

## 文件命名规范
- `CLS_09_06_4_YYY_{CATEGORY}_{DESCRIPTION}.ets`
