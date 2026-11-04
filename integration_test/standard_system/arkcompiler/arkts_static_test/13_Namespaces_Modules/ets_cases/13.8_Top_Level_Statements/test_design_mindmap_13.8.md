# 13.8 Top-Level Statements - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.8 Top-Level Statements

## 概述

spec §13.8：顶层语句是在模块作用域最外层的语句。顶层语句不可含 return。变量使用在声明前 → compile-time error（D类不一致）。声明在前语句在后为合法顺序。main() 在 top-level statements 之后执行。

## 规则要点

1. 顶层语句合法使用
2. 声明在前语句在后（合法顺序）
3. 顶层语句含 return → compile-time error
4. 变量使用在声明前 → compile-time error（⚠️D类：编译通过而非报错）
5. 顶层语句执行顺序（运行时）
6. main() 在 top-level statements 之后执行

## 测试点分类

### compile-pass（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_08_001_PASS_TOP_LEVEL_STATEMENTS | 顶层语句合法使用 |
| 002 | NSM_13_08_002_PASS_TOP_LEVEL_ORDER | 声明在前语句在后 |

### compile-fail（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_08_003_FAIL_TOP_LEVEL_RETURN | 顶层语句含return |
| 004 | NSM_13_08_004_FAIL_TOP_LEVEL_USE_BEFORE_DECLARE | 变量使用在声明前 ⚠️D类 |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 005 | NSM_13_08_005_RUNTIME_TOP_LEVEL_EXEC | 顶层语句执行顺序 |
| 006 | NSM_13_08_006_RUNTIME_MAIN_AFTER_TOP_LEVEL | main()在top-level之后执行 |

## 文件命名规范
- `NSM_13_08_YYY_{CATEGORY}_{DESCRIPTION}.ets`
