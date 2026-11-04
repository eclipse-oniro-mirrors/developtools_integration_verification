# 13.7.4 Re-Export Directive - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.7.4 Re-Export Directive

## 概述

spec §13.7.4：re-export directive 将其余模块的导出重新导出。包括 `export * from "path"` 和 `export {d1} from "path"`。re-export引用当前文件 → compile-time error。re-export实体不可区分 → compile-time error。

## 规则要点

1. `export * from "path"` — 重新导出所有
2. `export {d1} from "path"` — 选择性重新导出
3. re-export引用当前文件 → compile-time error
4. re-export实体不可区分 → compile-time error
5. 需要构建系统支持（C类）

## 测试点分类

### compile-pass（2 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_07_4_001_PASS_RE_EXPORT_ALL | export * from路径 |
| 002 | NSM_13_07_4_002_PASS_RE_EXPORT_SELECTIVE | export {d1} from路径 |

### compile-fail（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 003 | NSM_13_07_4_003_FAIL_RE_EXPORT_SELF | re-export引用当前文件 |
| 004 | NSM_13_07_4_004_FAIL_RE_EXPORT_NOT_DISTINGUISHABLE | re-export实体不可区分 |

## 文件命名规范
- `NSM_13_07_4_YYY_{CATEGORY}_{DESCRIPTION}.ets`
