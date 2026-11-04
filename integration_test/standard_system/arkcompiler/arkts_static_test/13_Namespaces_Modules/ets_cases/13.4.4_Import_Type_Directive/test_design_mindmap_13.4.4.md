# 13.4.4 Import Type Directive - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.4.4 Import Type Directive

## 概述

spec §13.4.4：import type directive 仅导入类型声明，不导入值绑定。import type 与 binding type 冲突 → compile-time error。

## 规则要点

1. `import type { T } from "path"` — 仅导入类型
2. 混合导入：`import { T, type Foo } from "path"`
3. import type + binding type 同名冲突 → compile-time error

## 测试点分类

### compile-pass（2 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_04_4_001_PASS_IMPORT_TYPE | import type合法使用 |
| 002 | NSM_13_04_4_002_PASS_IMPORT_TYPE_MIXED | 混合导入 |

### compile-fail（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_04_4_003_FAIL_IMPORT_TYPE_BINDING_TYPE | import type + binding type冲突 |

## 文件命名规范
- `NSM_13_04_4_YYY_{CATEGORY}_{DESCRIPTION}.ets`
