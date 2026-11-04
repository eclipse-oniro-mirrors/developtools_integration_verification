# 13.2 Module Header - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.2 Module Header

## 概述

spec §13.2：模块头（moduleHeader）是模块声明的前缀，包含 export 或 declare 关键字和模块名（StringLiteral）。export module 表示模块可被外部导入；declare module 表示 ambient 模块声明。非 ambient 模块不可使用 declare 关键字在 moduleHeader 中。

## 规则要点

1. moduleHeader 由 `export` 或 `declare` + `module` + StringLiteral 组成
2. export module 声明 — 模块可被外部导入
3. declare module 声明 — ambient 模块声明
4. 非ambient模块使用 declare 在 moduleHeader → compile-time error
5. 模块名用 StringLiteral 指定

## 子类型覆盖

### 1. export module / declare module
- 正向编译: export module声明、declare module声明、模块名为StringLiteral（C类 — es2panda不支持module header语法）
- 反向编译: 非ambient的moduleHeader含declare

### 2. 模块头运行时
- 运行时: 模块头运行时（C类 — 编译失败）

## 测试点分类

### compile-pass（3 用例 — 全部C类）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_02_001_PASS_EXPORT_MODULE | export module声明 |
| 002 | NSM_13_02_002_PASS_DECLARE_MODULE | declare module声明 |
| 004 | NSM_13_02_004_PASS_MODULE_STRING_NAME | 模块名为StringLiteral |

### compile-fail（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_02_003_FAIL_MODULE_NO_DECLARE | moduleHeader含declare但非ambient |

### runtime（1 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 005 | NSM_13_02_005_RUNTIME_MODULE_HEADER | 模块头运行时 |

## 文件命名规范
- `NSM_13_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`
- 编号：001,002,004 PASS(C类), 003 FAIL, 005 RUNTIME(C类)
