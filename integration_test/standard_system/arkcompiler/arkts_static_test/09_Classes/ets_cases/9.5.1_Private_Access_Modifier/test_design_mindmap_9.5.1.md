# 9.5.1 Private Access Modifier - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.5.1 Private Access Modifier

## 概述

spec §9.5.1：private 成员/构造器仅在声明类内可访问。子类不可访问 private 成员，但可重用相同名称（因为基类的 private 不可访问）。

## 规则要点

1. private 成员仅在声明类体内可访问
2. 子类不可访问 private 成员 → compile-time error
3. 子类可重用 private 成员的名称（基类不可访问，不算冲突）
4. 外部函数不可访问 private 成员

## 测试点分类

### compile-pass（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_05_001_PASS_PRIVATE_ACCESS_IN_CLASS | 类内访问 private |
| 002 | CLS_09_05_001_PASS_SUBCLASS_REUSE_PRIVATE_NAME | 子类重用 private 成员名 |
| 003 | CLS_09_05_001_PASS_PRIVATE_CONSTRUCTOR_IN_CLASS | 类内使用 private 构造器 |

### compile-fail（4 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | CLS_09_05_001_FAIL_PRIVATE_FIELD_OUTSIDE | 类外访问 private 字段 |
| 005 | CLS_09_05_001_FAIL_PRIVATE_METHOD_OUTSIDE | 类外访问 private 方法 |
| 006 | CLS_09_05_001_FAIL_PRIVATE_METHOD_IN_SUBCLASS | 子类访问 private 方法 |
| 007 | CLS_09_05_001_FAIL_PRIVATE_FIELD_IN_SUBCLASS | 子类访问 private 字段 |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 008 | CLS_09_05_001_RUNTIME_PRIVATE_ACCESS_IN_CLASS | 类内访问 private 运行时 |
| 009 | CLS_09_05_001_RUNTIME_SUBCLASS_REUSE_NAME | 子类重用名称运行时 |

## 文件命名规范
- `CLS_09_05_1_YYY_{CATEGORY}_{DESCRIPTION}.ets`
