# 13.5 Top-Level Declarations - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.5 Top-Level Declarations

## 概述

spec §13.5：顶层声明是在模块作用域最外层的声明，包括 class、function、variable 等。顶层声明的执行顺序按文本位置确定。

## 规则要点

1. 顶层class声明合法
2. 顶层function声明合法
3. 顶层let/const变量声明合法
4. 顶层声明按文本位置顺序执行（运行时）

## 测试点分类

### compile-pass（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_05_001_PASS_TOP_DECL_CLASS | 顶层class声明 |
| 002 | NSM_13_05_002_PASS_TOP_DECL_FUNCTION | 顶层function声明 |
| 003 | NSM_13_05_003_PASS_TOP_DECL_VARIABLE | 顶层变量声明 |

### runtime（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | NSM_13_05_004_RUNTIME_TOP_DECL_ORDER | 顶层声明执行顺序 |

## 文件命名规范
- `NSM_13_05_YYY_{CATEGORY}_{DESCRIPTION}.ets`
