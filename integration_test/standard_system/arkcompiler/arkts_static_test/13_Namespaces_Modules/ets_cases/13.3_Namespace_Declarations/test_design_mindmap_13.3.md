# 13.3 Namespace Declarations - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.3 Namespace Declarations

## 概述

spec §13.3：namespace 声明引入命名空间作用域，用于组织相关声明。namespace 内可包含类型声明、函数声明、变量声明、初始化器。同名 namespace 可合并（merging）。qualifiedName（A.B）用于访问 namespace 导出实体。嵌套 namespace 支持简写形式。

## 规则要点

1. namespace 声明定义命名空间作用域
2. namespace 内导出实体可通过 qualifiedName 访问
3. namespace 内无限定可直接访问导出实体
4. 同名 namespace 可合并（merging）
5. 嵌套 namespace 支持简写（A.B 为嵌入 namespace 简写）
6. 合并 namespace 只能有一个初始化器，否则 compile-time error
7. 合并 namespace 不可有多个 static block
8. namespace 导出名不可重复
9. qualifiedName 不可访问非导出实体
10. ambient namespace 的成员在函数/类/顶层都可访问

## 子类型覆盖

### 1. 基本namespace声明与访问
- 正向编译: 基本namespace、导出实体、qualifiedName访问、无限定访问、嵌套namespace、同名合并、简写、ambient访问
- 反向编译: qualifiedName访问非导出实体、导出名重复、导出与非导出同名、多个初始化器(D类)、多个static block
- 运行时: 初始化器执行、方法派发

## 测试点分类

### compile-pass（9 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_03_001_PASS_NAMESPACE_BASIC | 基本namespace声明 |
| 002 | NSM_13_03_002_PASS_NAMESPACE_EXPORT | namespace导出实体 |
| 003 | NSM_13_03_003_PASS_NAMESPACE_QUALIFIED_ACCESS | qualifiedName访问导出实体 |
| 004 | NSM_13_03_004_PASS_NAMESPACE_UNQUALIFIED_ACCESS | namespace内无限定访问 |
| 005 | NSM_13_03_005_PASS_NAMESPACE_EMBEDDED | 嵌套namespace |
| 006 | NSM_13_03_006_PASS_NAMESPACE_MERGE | 同名namespace合并 |
| 007 | NSM_13_03_007_PASS_NAMESPACE_QUALIFIED_SHORTCUT | A.B为嵌入namespace简写 |
| 015 | NSM_13_03_015_PASS_AMBIENT_NAMESPACE_ACCESS | ambient namespace跨模块可访问性 |

### compile-fail（5 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 008 | NSM_13_03_008_FAIL_NAMESPACE_QUALIFIED_NON_EXPORTED | qualifiedName访问非导出实体 |
| 009 | NSM_13_03_009_FAIL_NAMESPACE_DUPLICATE_EXPORT | 合并namespace导出名重复 |
| 010 | NSM_13_03_010_FAIL_NAMESPACE_EXPORT_NON_EXPORT_SAME_NAME | 导出与非导出同名 |
| 011 | NSM_13_03_011_FAIL_NAMESPACE_MULTIPLE_INITIALIZER | 多个初始化器(⚠️D类) |
| 012 | NSM_13_03_012_FAIL_NAMESPACE_STATIC_BLOCK_DUPLICATE | 多个static block |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 013 | NSM_13_03_013_RUNTIME_NAMESPACE_INITIALIZER | namespace初始化器执行 |
| 014 | NSM_13_03_014_RUNTIME_NAMESPACE_MERGE_DISPATCH | 合成namespace方法派发 |

## 文件命名规范
- `NSM_13_03_YYY_{CATEGORY}_{DESCRIPTION}.ets`
- 编号：001~007,015 PASS, 008~012 FAIL, 013~014 RUNTIME
