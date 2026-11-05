# 13.7 Export Directives - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.7 Export Directives

## 概述

spec §13.7：export directive 是独立的导出语句，包括选择性导出、单名导出和运行时导出验证。

## 规则要点

1. export {d1, d2 as d3} — 选择性导出
2. export identifier — 单名导出
3. export directive 运行时行为

## 测试点分类

### compile-pass（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_07_001_PASS_EXPORT_DIRECTIVE_SELECTIVE | export指令选择性导出 |
| 002 | NSM_13_07_002_PASS_EXPORT_DIRECTIVE_SINGLE | export指令单名导出 |

### runtime（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_07_003_RUNTIME_EXPORT_DIRECTIVE | export指令运行时 |

## 文件命名规范
- `NSM_13_07_YYY_{CATEGORY}_{DESCRIPTION}.ets`
