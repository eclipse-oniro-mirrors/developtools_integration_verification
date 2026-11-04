# 9.6 Field Declarations - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.6 Field Declarations

## 概述

spec §9.6：字段声明是类实例或静态数据成员。字段修饰符不得重复。同 scope 字段与方法同名 → compile-time error。同 scope 两字段同名 → compile-time error。实现超接口属性时字段类型必须一致。

## 规则要点

1. 字段声明语法：`fieldModifier* identifier '?'? ':' type initializer?`
2. 修饰符重复 → compile-time error
3. 同 scope 字段与方法同名 → compile-time error
4. 同 scope 两字段同名 → compile-time error
5. 实现超接口属性时类型不一致 → compile-time error
6. static 字段通过类名访问，instance 字段通过对象引用访问

## 测试点分类

### compile-pass（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_06_001_PASS_FIELD_BASIC | 基本字段声明 |
| 002 | CLS_09_06_002_PASS_FIELD_INITIALIZER | 字段初始化器 |
| 003 | CLS_09_06_003_PASS_STATIC_INSTANCE_FIELD | static/instance 字段 |

### compile-fail（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | CLS_09_06_004_FAIL_DUPLICATE_FIELD_MODIFIER | 重复字段修饰符 |
| 005 | CLS_09_06_005_FAIL_FIELD_METHOD_SAME_NAME | 字段与方法同名 |
| 006 | CLS_09_06_006_FAIL_FIELD_IMPL_TYPE_MISMATCH | 接口属性类型不一致 |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 007 | CLS_09_06_007_RUNTIME_FIELD_ACCESS | 字段访问运行时 |
| 008 | CLS_09_06_008_RUNTIME_FIELD_INITIALIZER_EXEC | 字段初始化器执行 |

## 文件命名规范
- `CLS_09_06_YYY_{CATEGORY}_{DESCRIPTION}.ets`
