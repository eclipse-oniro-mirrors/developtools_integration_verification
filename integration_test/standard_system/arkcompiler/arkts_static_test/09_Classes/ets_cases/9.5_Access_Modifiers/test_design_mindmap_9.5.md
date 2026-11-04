# 9.5 Access Modifiers - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.5 Access Modifiers

## 概述

spec §9.5：访问修饰符定义类成员/构造器的可访问性：private、protected、public。无显式修饰符默认 public。

## 规则要点

1. private → 仅声明类内可访问
2. protected → 声明类及派生类内可访问
3. public → 所处可访问（前提：所属类型也可访问）
4. 无修饰符 → 默认 public

## 测试点分类

### compile-pass（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_05_001_PASS_DEFAULT_PUBLIC | 无修饰符默认 public |
| 002 | CLS_09_05_002_PASS_ALL_MODIFIER_COMBOS | private/protected/public 修饰成员 |

### compile-fail（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | CLS_09_05_003_FAIL_PRIVATE_ACCESS_OUTSIDE | 类外访问 private 成员 |

### runtime（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | CLS_09_05_004_RUNTIME_PUBLIC_ACCESS | public 成员访问运行时 |

## 文件命名规范
- `CLS_09_05_YYY_{CATEGORY}_{DESCRIPTION}.ets`
