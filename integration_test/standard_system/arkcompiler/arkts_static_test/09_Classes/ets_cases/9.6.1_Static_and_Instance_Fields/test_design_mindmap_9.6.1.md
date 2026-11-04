# 9.6.1 Static and Instance Fields - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.6.1 Static and Instance Fields

## 概述

spec §9.6.1：static 字段不属于类实例，通过类名访问。instance 字段属于每个实例。static 字段类型不得使用类泛型参数。

## 规则要点

1. static 字段通过类名访问
2. instance 字段通过实例引用访问
3. static 字段不得使用类泛型参数 → compile-time error
4. static 字段不论实例数量只有一个副本

## 测试点分类

### compile-pass（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_06_001_PASS_STATIC_FIELD_BASIC | static 字段基本 |
| 002 | CLS_09_06_001_PASS_INSTANCE_FIELD_BASIC | instance 字段基本 |
| 003 | CLS_09_06_001_PASS_STATIC_FIELD_ACCESS_BY_CLASSNAME | 通过类名访问 static |

### compile-fail（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | CLS_09_06_001_FAIL_STATIC_FIELD_GENERIC_PARAM | static 字段使用泛型参数 |
| 005 | CLS_09_06_001_FAIL_INSTANCE_ACCESS_STATIC | 实例访问 static（不继承） |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 006 | CLS_09_06_001_RUNTIME_STATIC_FIELD_SHARED | static 字段共享验证 |
| 007 | CLS_09_06_001_RUNTIME_INSTANCE_FIELD_PER_OBJ | instance 字段每个实例独立 |

## 文件命名规范
- `CLS_09_06_1_YYY_{CATEGORY}_{DESCRIPTION}.ets`
