# 9.5.2 Protected Access Modifier - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.5.2 Protected Access Modifier

## 概述

spec §9.5.2：protected 成员仅在声明类及派生类内可访问。外部函数不可访问 protected 成员。

## 规则要点

1. protected 成员在声明类和派生类内可访问
2. 外部函数不可访问 → compile-time error
3. 派生类可访问 protected 成员（this 访问）

## 测试点分类

### compile-pass（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_05_002_PASS_PROTECTED_ACCESS_IN_CLASS | 类内访问 protected |
| 002 | CLS_09_05_002_PASS_PROTECTED_ACCESS_IN_SUBCLASS | 子类访问 protected |

### compile-fail（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | CLS_09_05_002_FAIL_PROTECTED_ACCESS_OUTSIDE | 外部函数访问 protected |
| 004 | CLS_09_05_002_FAIL_PROTECTED_FIELD_OUTSIDE | 外部访问 protected 字段 |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 005 | CLS_09_05_002_RUNTIME_PROTECTED_IN_SUBCLASS | 子类访问 protected 运行时 |
| 006 | CLS_09_05_002_RUNTIME_PROTECTED_METHOD_DISPATCH | protected 方法派发 |

## 文件命名规范
- `CLS_09_05_2_YYY_{CATEGORY}_{DESCRIPTION}.ets`
