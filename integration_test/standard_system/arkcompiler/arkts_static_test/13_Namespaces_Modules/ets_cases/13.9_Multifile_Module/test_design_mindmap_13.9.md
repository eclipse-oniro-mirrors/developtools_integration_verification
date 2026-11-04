# 13.9 Multifile Module - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.9 Multifile Module

## 概述

spec §13.9：多文件模块由多个具有相同 moduleHeader 的文件组成。不同文件不可有不同的 export 修饰符。顶层语句不可出现在多个文件中。

## 规则要点

1. 同 moduleHeader 多文件合法（C类 — es2panda不支持module header语法）
2. 不同 export 修饰符 → compile-time error
3. 顶层语句在多个文件 → compile-time error

## 测试点分类

### compile-pass（1 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_09_001_PASS_MULTIFILE_SAME_HEADER | 同moduleHeader多文件 |

### compile-fail（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 002 | NSM_13_09_002_FAIL_MULTIFILE_DIFF_EXPORT | 不同export修饰符 |
| 003 | NSM_13_09_003_FAIL_MULTIFILE_TOP_LEVEL_IN_SEVERAL | 顶层语句在多个文件 |

## 文件命名规范
- `NSM_13_09_YYY_{CATEGORY}_{DESCRIPTION}.ets`
