# 13.4 Import Directives - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.4 Import Directives

## 概述

spec §13.4：import 指令用于从外部模块导入声明。import 必须位于模块顶部（在所有其余声明之前）。import 可以导入默认导出、选择性导入、导入所有导出（* as）等。模块不可导入自身。

## 规则要点

1. import 指令必须位于模块顶部（在所有其余声明之前）
2. 模块不可导入自身（import from 当前模块路径）
3. import type + binding type 冲突 → compile-time error
4. import 触发模块初始化（运行时行为）
5. 基本import声明需构建系统支持（C类）

## 子类型覆盖

### 1. import声明语法与约束
- 正向编译: 基本import声明（C类）
- 反向编译: import非前置、模块导入自身、import type+binding type冲突
- 运行时: import触发模块初始化（C类）

## 测试点分类

### compile-pass（1 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_04_001_PASS_IMPORT_BASIC | 基本import声明 |

### compile-fail（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 002 | NSM_13_04_002_FAIL_IMPORT_AFTER_DECLARATION | import非前置 |
| 003 | NSM_13_04_003_FAIL_IMPORT_SELF | 模块导入自身 |
| 004 | NSM_13_04_004_FAIL_IMPORT_TYPE_BINDING_TYPE | import type + binding type冲突 |

### runtime（1 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 005 | NSM_13_04_005_RUNTIME_IMPORT_INIT | import触发模块初始化 |

## 文件命名规范
- `NSM_13_04_YYY_{CATEGORY}_{DESCRIPTION}.ets`
- 编号：001 PASS(C类), 002~004 FAIL, 005 RUNTIME(C类)
