# 13.6 Exported Declarations - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.6 Exported Declarations

## 概述

spec §13.6：导出声明（exported declarations）使顶层声明可被外部模块访问。export 关键字修饰 class、function、variable 等。导出实体必须有显式类型标注。导出不可使用未导出类型。多个 default export 禁止。

## 规则要点

1. export class/function/let/const/default — 导出声明
2. 导出实体必须有显式类型标注 → 否则 compile-time error
3. 导出函数必须有返回类型 → 否则 compile-time error
4. 导出不可使用未导出类型 → compile-time error
5. 导出名与另一导出名重复 → compile-time error
6. 多个 default export → compile-time error
7. export class extends 未导出类 → compile-time error
8. export 泛型约束未导出类型 → compile-time error
9. export type alias 引用未导出类型 → compile-time error
10. export overload 含未导出实体 → compile-time error
11. export class public field 使用未导出类型 → compile-time error

## 测试点分类

### compile-pass（4 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_06_001_PASS_EXPORT_CLASS | export class |
| 002 | NSM_13_06_002_PASS_EXPORT_FUNCTION | export function |
| 003 | NSM_13_06_003_PASS_EXPORT_VARIABLE | export let/const |
| 004 | NSM_13_06_004_PASS_EXPORT_DEFAULT | export default声明 |

### compile-fail（10 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 005 | NSM_13_06_005_FAIL_EXPORT_NO_EXPLICIT_TYPE | 导出无显式类型 |
| 006 | NSM_13_06_006_FAIL_EXPORT_NO_RETURN_TYPE | 导出函数无返回类型 |
| 007 | NSM_13_06_007_FAIL_EXPORT_UNEXPORTED_TYPE | 导出使用未导出类型 |
| 008 | NSM_13_06_008_FAIL_EXPORT_NAME_DUPLICATE | 导出名重复 |
| 009 | NSM_13_06_009_FAIL_EXPORT_DEFAULT_DUPLICATE | 多个default export |
| 010 | NSM_13_06_010_FAIL_EXPORT_UNEXPORTED_EXTENDS | extends未导出类 |
| 011 | NSM_13_06_011_FAIL_EXPORT_UNEXPORTED_GENERIC | 泛型约束未导出类型 |
| 013 | NSM_13_06_013_FAIL_EXPORT_TYPE_ALIAS_UNEXPORTED | export type alias引用未导出类型 |
| 015 | NSM_13_06_015_FAIL_EXPORT_OVERLOAD_UNEXPORTED | export overload含未导出实体 |
| 016 | NSM_13_06_016_FAIL_EXPORT_CLASS_PUBLIC_FIELD_UNEXPORTED | export class public field使用未导出类型 |

### runtime（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 012 | NSM_13_06_012_RUNTIME_EXPORT_ACCESS | 导出实体运行时访问 |

## 文件命名规范
- `NSM_13_06_YYY_{CATEGORY}_{DESCRIPTION}.ets`
