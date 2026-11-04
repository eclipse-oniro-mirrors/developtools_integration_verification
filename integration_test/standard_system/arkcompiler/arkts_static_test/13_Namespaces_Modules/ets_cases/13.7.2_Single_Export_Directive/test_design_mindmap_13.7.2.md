# 13.7.2 Single Export Directive - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.7.2 Single Export Directive

## 概述

spec §13.7.2：单名导出指令包括 export identifier、export default class/function、export {A as default} 和 export default expression。多个 export default 禁止。

## 规则要点

1. export identifier — 单名导出
2. export default class/function — default导出
3. 多个 export default → compile-time error
4. export {A as default} — 别名default导出
5. export default expression — default导出表达式
6. export default new A(A未导出) — D类：Spec认为合法但编译器要求A导出

## 测试点分类

### compile-pass（4 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_07_2_001_PASS_SINGLE_EXPORT_IDENTIFIER | export identifier |
| 002 | NSM_13_07_2_002_PASS_EXPORT_DEFAULT_CLASS | export default class |
| 005 | NSM_13_07_2_005_PASS_EXPORT_AS_DEFAULT | export {A as default}语法 |
| 006 | NSM_13_07_2_006_PASS_EXPORT_DEFAULT_EXPRESSION | export default expression |

### compile-fail（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_07_2_003_FAIL_EXPORT_DEFAULT_MULTIPLE | 多个export default |
| 007 | NSM_13_07_2_007_FAIL_EXPORT_DEFAULT_EXPR_UNEXPORTED_TYPE | export default new A(A未导出) ⚠️D类 |

### runtime（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 004 | NSM_13_07_2_004_RUNTIME_SINGLE_EXPORT | 单名导出运行时 |

## 文件命名规范
- `NSM_13_07_2_YYY_{CATEGORY}_{DESCRIPTION}.ets`
