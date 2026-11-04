# 9.6.5 Fields with Late Initialization - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.6.5 Fields with Late Initialization

## 概述

spec §9.6.5：`f!: T` 为 late initialization 字段，类型为 `T | undefined` 但行为如 `T`。必须为 instance 字段。不得为 nullish 类型、不得 readonly/optional、不得含初始化器。

## 规则要点

1. `f!: T` → 类型 T | undefined，行为如 T
2. 必须为 instance 字段 → static late init → compile-time error
3. 不得为 nullish 类型 → compile-time error
4. 不得 readonly → compile-time error
5. 不得 optional → compile-time error
6. 不得含初始化器 → compile-time error
7. 未初始化时读取 → runtime/compile-time error
8. 初始化后读取 → OK

## 测试点分类

### compile-pass（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_06_005_PASS_LATE_INIT_FIELD | late init 字段声明 |
| 002 | CLS_09_06_005_PASS_LATE_INIT_ASSIGN_THEN_READ | 初始化后读取 |

### compile-fail（4 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | CLS_09_06_005_FAIL_LATE_INIT_STATIC | static late init 字段 |
| 004 | CLS_09_06_005_FAIL_LATE_INIT_READONLY | readonly late init |
| 005 | CLS_09_06_005_FAIL_LATE_INIT_OPTIONAL | optional late init |
| 006 | CLS_09_06_005_FAIL_LATE_INIT_WITH_INITIALIZER | late init 含初始化器 |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 007 | CLS_09_06_005_RUNTIME_LATE_INIT_ASSIGN_READ | 初始化后读取运行时 |
| 008 | CLS_09_06_005_RUNTIME_LATE_INIT_UNINIT_ERROR | 未初始化读取（runtime error） |

## 文件命名规范
- `CLS_09_06_5_YYY_{CATEGORY}_{DESCRIPTION}.ets`
