# 13.4.6 Several Bindings for One Import Path - 测试设计思维导图

**生成日期：** 2026-06-27
**章节：** §13.4.6 Several Bindings for One Import Path

## 概述

spec §13.4.6：同一个 import path 可以有多条绑定。多条绑定名称不可区分 → compile-time error。

## 规则要点

1. 同路径多条绑定：`import {x} from "path"; import {y} from "path"`
2. 多绑定名称不可区分 → compile-time error

## 测试点分类

### compile-pass（1 用例 — C类）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | NSM_13_04_6_001_PASS_SEVERAL_BINDINGS_ONE_IMPORT | 同路径多条绑定 |

### compile-fail（1 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 002 | NSM_13_04_6_002_FAIL_SEVERAL_BINDINGS_NAME_CONFLICT | 多绑定名称不可区分 |

## 文件命名规范
- `NSM_13_04_6_YYY_{CATEGORY}_{DESCRIPTION}.ets`
