# 13.10 Standard Library Usage - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.10 Standard Library Usage

## 概述

spec §13.10：标准库名不可在模块作用域被重定义为程序员定义的实体名称。使用标准库功能（如 console.log）合法。

## 规则要点

1. console.log 标准库使用合法
2. 重新定义标准库名 → compile-time error（⚠️D类：编译通过而非报错）
3. 标准库运行时访问

## 测试点分类

### compile-pass（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_10_001_PASS_STDLIB_CONSOLE | console.log标准库使用 |

### compile-fail（1 用例 — D类）
| # | ID | 测试点 |
|---|-----|--------|
| 002 | NSM_13_10_002_FAIL_STDLIB_NAME_REUSE | 重新定义标准库名 ⚠️D类 |

### runtime（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_10_003_RUNTIME_STDLIB_ACCESS | 标准库运行时访问 |

## 文件命名规范
- `NSM_13_10_YYY_{CATEGORY}_{DESCRIPTION}.ets`
