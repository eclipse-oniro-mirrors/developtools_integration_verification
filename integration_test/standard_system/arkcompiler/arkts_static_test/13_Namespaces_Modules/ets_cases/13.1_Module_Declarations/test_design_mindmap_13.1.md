# 13.1 Module Declarations - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.1 Module Declarations

## 概述

spec §13.1：模块声明引入新的模块作用域。ArkTS 模块是编译单元的最顶层容器，所有顶层声明和语句都在模块作用域内。模块可以有 moduleHeader（含 export/declare 关键字和模块名），也可以没有。

## 规则要点

1. 模块声明定义模块作用域（最顶层容器）
2. 若模块有至少一个顶层 ambient 声明，则所有其余声明必须是 ambient（否则 compile-time error）
3. 模块可通过 moduleHeader 指定模块名和导出修饰符
4. 模块可以没有 moduleHeader（默认内部模块）
5. 模块初始化按声明顺序执行

## 子类型覆盖

### 1. 基本模块声明
- 正向编译: 基本模块声明、含导出的模块、无moduleHeader模块
- 反向编译: ambient与非ambient声明混合
- 运行时: 模块初始化执行

### 2. 含导入的模块
- 正向编译: 含import的模块（需要构建系统支持 — C类）

## 测试点分类

### compile-pass（4 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_01_001_PASS_MODULE_BASIC | 基本模块声明 |
| 002 | NSM_13_01_002_PASS_MODULE_WITH_IMPORT | 含导入的模块 |
| 003 | NSM_13_01_003_PASS_MODULE_WITH_EXPORT | 含导出的模块 |
| 005 | NSM_13_01_005_PASS_MODULE_NO_HEADER | 无moduleHeader的模块 |

### compile-fail（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | NSM_13_01_004_FAIL_AMBIENT_MIXED | ambient与非ambient混合 |

### runtime（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 006 | NSM_13_01_006_RUNTIME_MODULE_INIT | 模块初始化执行 |

## 文件命名规范
- `NSM_13_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`
- 编号：001~003,005 PASS, 004 FAIL, 006 RUNTIME
