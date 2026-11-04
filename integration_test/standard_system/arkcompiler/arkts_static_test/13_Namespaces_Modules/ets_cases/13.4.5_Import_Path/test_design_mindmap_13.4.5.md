# 13.4.5 Import Path - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.4.5 Import Path

## 概述

spec §13.4.5：import path 指定模块路径（StringLiteral）。相对路径和absolute路径均可使用。编译器无法定位模块 → compile-time error。

## 规则要点

1. import path 为 StringLiteral（相对/absolute路径）
2. 编译器无法定位模块 → compile-time error
3. 运行时导入路径验证（C类）

## 测试点分类

### compile-pass（1 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_04_5_001_PASS_IMPORT_RELATIVE_PATH | 相对路径导入 |

### compile-fail（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 002 | NSM_13_04_5_002_FAIL_IMPORT_CANNOT_LOCATE | 编译器无法定位模块 |

### runtime（1 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_04_5_003_RUNTIME_IMPORT_PATH | 导入路径运行时 |

## 文件命名规范
- `NSM_13_04_5_YYY_{CATEGORY}_{DESCRIPTION}.ets`
