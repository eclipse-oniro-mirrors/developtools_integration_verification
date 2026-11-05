# 9.3.1 Implementing Required Interface Properties - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.3.1 Implementing Required Interface Properties

## 概述

spec §9.3.1：类必须实现所有超接口的必需属性。实现形式可以是字段、readonly 字段、getter、setter 或 getter+setter 组合。

## 规则要点

实现组合表：
| 接口属性形式 | 合法类实现 |
|-------------|----------|
| field | field, 或 getter+setter |
| readonly field | readonly field, field, getter, 或 getter+setter |
| getter only | readonly field, field, getter, 或 getter+setter |
| setter only | field, setter, 或 setter+getter |
| getter+setter | field, 或 getter+setter |

1. 字段实现接口属性 → 编译器隐式生成 getter/setter
2. 通过类实例访问 → 直接字段访问
3. 通过接口引用访问 → 调用隐式 getter/setter
4. readonly 属性可被 writeable 字段实现
5. writeable 属性不可被 readonly 字段实现 → compile-time error
6. 无实现 → compile-time error
7. getter-only 实现非 readonly 属性（缺 setter）→ compile-time error
8. setter-only 实现非 readonly 属性（缺 getter）→ compile-time error
9. 类型不匹配 → compile-time error
10. 覆盖超类字段→accessor 或 accessor→字段 → compile-time error

## 测试点分类

### compile-pass（6 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_03_001_PASS_FIELD_IMPL_INTERFACE_PROPERTY | 字段实现接口属性 |
| 002 | CLS_09_03_002_PASS_READONLY_FIELD_IMPL_READONLY | readonly 字段实现 readonly 属性 |
| 003 | CLS_09_03_003_PASS_GETTER_SETTER_IMPL_PROPERTY | getter+setter 实现属性 |
| 004 | CLS_09_03_004_PASS_FIELD_IMPL_READONLY_PROPERTY | writeable 字段实现 readonly 属性 |
| 005 | CLS_09_03_005_PASS_GETTER_IMPL_READONLY_PROPERTY | getter 实现 readonly 属性 |
| 006 | CLS_09_03_006_PASS_GETTER_IMPL_INTERFACE_GETTER | getter 实现接口 getter |

### compile-fail（5 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 007 | CLS_09_03_007_FAIL_READONLY_IMPL_WRITEABLE | readonly 字段实现 writeable 属性 |
| 008 | CLS_09_03_008_FAIL_GETTER_ONLY_IMPL_WRITEABLE | getter-only 实现 writeable 属性（缺 setter） |
| 009 | CLS_09_03_009_FAIL_SETTER_ONLY_IMPL_WRITEABLE | setter-only 实现 writeable 属性（缺 getter） |
| 010 | CLS_09_03_010_FAIL_NO_IMPL_REQUIRED_PROPERTY | 无实现必需属性 |
| 011 | CLS_09_03_011_FAIL_OVERRIDE_FIELD_BY_ACCESSOR | 覆盖超类字段→accessor |

### runtime（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 012 | CLS_09_03_012_RUNTIME_FIELD_IMPL_PROPERTY | 字段实现运行时 |
| 013 | CLS_09_03_013_RUNTIME_INTERFACE_REF_ACCESS | 接口引用访问隐式 getter |
| 014 | CLS_09_03_014_RUNTIME_READONLY_IMPL | readonly 属性实现运行时 |

## 文件命名规范
- `CLS_09_03_1_YYY_{CATEGORY}_{DESCRIPTION}.ets`
