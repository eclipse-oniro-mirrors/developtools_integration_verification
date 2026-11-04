# 9.6.6 Override Fields - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.6.6 Override Fields

## 概述

spec §9.6.6：子类可 override 超类同类型 instance 字段。override 字段必须显式初始化。类型不同 → compile-time error。访问修饰符不同 → compile-time error。static+override → compile-time error。

## 规则要点

1. instance 字段可被 override（同类型同名称）
2. override 字段必须显式初始化（初始化器或构造器）
3. 类型不一致 → compile-time error
4. 访问修饰符不一致 → compile-time error
5. static+override → compile-time error
6. override 标注不存在的字段 → compile-time error
7. override 关键字不强制（但推荐）

## 测试点分类

### compile-pass（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_06_006_PASS_OVERRIDE_SAME_TYPE_FIELD | override 同类型字段 |
| 002 | CLS_09_06_006_PASS_OVERRIDE_FIELD_INITIALIZER | override 字段初始化器 |
| 003 | CLS_09_06_006_PASS_OVERRIDE_FIELD_IN_CTOR | 构造器中初始化 override 字段 |

### compile-fail（4 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | CLS_09_06_006_FAIL_OVERRIDE_FIELD_TYPE_MISMATCH | 类型不一致 |
| 005 | CLS_09_06_006_FAIL_OVERRIDE_FIELD_ACCESS_MISMATCH | 访问修饰符不一致 |
| 006 | CLS_09_06_006_FAIL_OVERRIDE_STATIC_FIELD | static+override |
| 007 | CLS_09_06_006_FAIL_OVERRIDE_NO_BASE_FIELD | override 不存在的字段 |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 008 | CLS_09_06_006_RUNTIME_OVERRIDE_FIELD_VALUE | override 字段值运行时 |
| 009 | CLS_09_06_006_RUNTIME_OVERRIDE_FIELD_INIT_ORDER | override 字段初始化顺序 |

## 文件命名规范
- `CLS_09_06_6_YYY_{CATEGORY}_{DESCRIPTION}.ets`
