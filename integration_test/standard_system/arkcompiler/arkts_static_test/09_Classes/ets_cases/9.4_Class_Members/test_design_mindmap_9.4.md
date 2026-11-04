# 9.4 Class Members - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.4 Class Members

## 概述

spec §9.4：类可含字段、方法、accessor、构造器、方法重载和静态初始化块。成员分 static 和 instance 两类。static 成员不继承。

## 规则要点

1. 类成员包括字段、方法、accessor
2. 构造器和静态块不是成员，不继承
3. static 和 instance 同名成员合法（两个 scope）
4. 同 scope 内字段/方法/重载同名 → compile-time error
5. static 成员不继承，需用类名显式访问
6. private 成员继承但不可访问
7. protected/public 成员继承且可访问

## 测试点分类

### compile-pass（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_04_001_PASS_STATIC_INSTANCE_SAME_NAME | static/instance 同名成员 |
| 002 | CLS_09_04_002_PASS_CLASS_WITH_ALL_MEMBER_TYPES | 含字段+方法+accessor |
| 003 | CLS_09_04_003_PASS_INHERIT_PUBLIC_PROTECTED | 继承 public/protected 成员 |

### compile-fail（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | CLS_09_04_004_FAIL_FIELD_METHOD_SAME_NAME | 同 scope 字段方法同名 |
| 005 | CLS_09_04_005_FAIL_FIELD_FIELD_SAME_NAME | 同 scope 两字段同名 |
| 006 | CLS_09_04_006_FAIL_METHOD_METHOD_SAME_NAME | 同 scope 同签名方法 |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 007 | CLS_09_04_007_RUNTIME_STATIC_INSTANCE_DISTINCT | static/instance 区分运行时 |
| 008 | CLS_09_04_008_RUNTIME_MEMBER_ACCESS | 成员访问运行时 |

## 文件命名规范
- `CLS_09_04_YYY_{CATEGORY}_{DESCRIPTION}.ets`
