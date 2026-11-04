# 13.4.2 Default Import Binding - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.4.2 Default Import Binding

## 概述

spec §13.4.2：default import binding 用于导入模块的 default export。支持单标识符导入和 `{default as Name}` 语法。

## 规则要点

1. 单标识符 default import：`import d from "path"`
2. `{default as Name}` 语法：`import { default as MyDefault } from "path"`
3. 非 default 形式不可导入 default export → compile-time error

## 测试点分类

### compile-pass（2 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_04_2_001_PASS_DEFAULT_IMPORT | 单标识符default导入 |
| 002 | NSM_13_04_2_002_PASS_DEFAULT_IMPORT_SELECTIVE | {default as Name}导入 |

### compile-fail（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_04_2_003_FAIL_DEFAULT_IMPORT_WRONG_FORM | 非default形式导入default导出 |

## 文件命名规范
- `NSM_13_04_2_YYY_{CATEGORY}_{DESCRIPTION}.ets`
