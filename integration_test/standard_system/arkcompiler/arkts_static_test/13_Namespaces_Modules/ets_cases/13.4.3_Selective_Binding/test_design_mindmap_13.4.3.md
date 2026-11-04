# 13.4.3 Selective Binding - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.4.3 Selective Binding

## 概述

spec §13.4.3：选择性导入绑定通过 `{identifier}` 或 `{identifier as alias}` 语法从外部模块导入指定导出实体。alias 后原名不可访问。

## 规则要点

1. `{identifier}` 选择性导入
2. `{identifier as alias}` 别名导入
3. alias 后原名不可访问 → compile-time error

## 测试点分类

### compile-pass（2 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_04_3_001_PASS_SELECTIVE_IMPORT | {identifier}选择性导入 |
| 002 | NSM_13_04_3_002_PASS_SELECTIVE_IMPORT_ALIAS | {identifier as alias}别名导入 |

### compile-fail（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_04_3_003_FAIL_ALIAS_ORIGINAL_NOT_ACCESSIBLE | alias后原名不可访问 |

## 文件命名规范
- `NSM_13_04_3_YYY_{CATEGORY}_{DESCRIPTION}.ets`
