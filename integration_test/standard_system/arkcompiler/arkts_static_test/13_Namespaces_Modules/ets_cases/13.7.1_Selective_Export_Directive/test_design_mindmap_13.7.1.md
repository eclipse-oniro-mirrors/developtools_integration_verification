# 13.7.1 Selective Export Directive - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.7.1 Selective Export Directive

## 概述

spec §13.7.1：选择性导出指令 `export {d1, d2 as d3}` 导出指定实体。alias 后原名在同一模块内仍可使用（A类修复）。选择性导出别名不可与已导出同名。

## 规则要点

1. `export {d1, d2 as d3}` — 选择性导出
2. alias 后原名在同一模块内仍可使用（A类修复确认）
3. `export {bar as foo}` 与已导出 foo 同名 → compile-time error

## 测试点分类

### compile-pass（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_07_1_001_PASS_SELECTIVE_EXPORT | export {d1, d2 as d3} |
| 002 | NSM_13_07_1_002_PASS_SELECTIVE_EXPORT_ALIAS_LOCAL_ACCESS | alias后原名同一模块内仍可用 |

### compile-fail（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | NSM_13_07_1_004_FAIL_SELECTIVE_EXPORT_ALIAS_CLASH | export {bar as foo}与已导出foo同名 |

### runtime（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_07_1_003_RUNTIME_SELECTIVE_EXPORT | 选择性导出运行时 |

## 文件命名规范
- `NSM_13_07_1_YYY_{CATEGORY}_{DESCRIPTION}.ets`
