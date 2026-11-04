# 13.4.1 Bind All with Qualified Access - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.4.1 Bind All with Qualified Access

## 概述

spec §13.4.1：`import * as N from "path"` 将目标模块的所有导出绑定到名称 N。通过 N.name 可访问导出实体。

## 规则要点

1. `import * as N from "path"` 绑定所有导出到名称 N
2. N.name 可访问导出实体
3. 需要构建系统支持（C类）

## 测试点分类

### compile-pass（2 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_04_1_001_PASS_IMPORT_ALL_AS | import * as 合法使用 |
| 002 | NSM_13_04_1_002_PASS_IMPORT_ALL_QUALIFIED_ACCESS | A.name访问导出实体 |

### runtime（1 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_04_1_003_RUNTIME_IMPORT_ALL_ACCESS | * as运行时访问 |

## 文件命名规范
- `NSM_13_04_1_YYY_{CATEGORY}_{DESCRIPTION}.ets`
