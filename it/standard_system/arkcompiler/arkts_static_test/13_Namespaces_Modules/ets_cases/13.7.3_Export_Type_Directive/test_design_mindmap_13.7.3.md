# 13.7.3 Export Type Directive - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.7.3 Export Type Directive

## 概述

spec §13.7.3：export type directive 仅导出类型声明。export type 引用非 type → compile-time error。

## 规则要点

1. `export type { T }` — 仅导出类型
2. export type 引用非 type → compile-time error
3. D类不一致：spec要求报错但编译通过

## 测试点分类

### compile-pass（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_07_3_001_PASS_EXPORT_TYPE | export type合法使用 |

### compile-fail（1 用例 — D类）
| # | ID | 测试点 |
|---|-----|--------|
| 002 | NSM_13_07_3_002_FAIL_EXPORT_TYPE_NON_TYPE | export type引用非type ⚠️D类 |

## 文件命名规范
- `NSM_13_07_3_YYY_{CATEGORY}_{DESCRIPTION}.ets`
