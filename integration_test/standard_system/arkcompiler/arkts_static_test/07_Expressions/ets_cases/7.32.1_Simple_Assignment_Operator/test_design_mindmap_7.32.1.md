# 7.32.1 Simple Assignment Operator - 测试设计思维导图

## 概述

验证 ArkTS 中 `=`（Simple Assignment）运算符的正确性，包括变量赋值、字段访问赋值、数组索引赋值、记录索引赋值、类型兼容性、只读数组/元组保护和运行时语义（求值顺序、越界检查）。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 简洁变量赋值 | int/long/float/double/string/boolean 六种类型变量赋值 |
| 002 | 字段访问赋值 | obj.f = value（int/string/boolean 字段） |
| 003 | 数组索引赋值 | arr[idx] = value（字面量索引 + 变量索引） |
| 004 | 记录索引赋值 | rec[key] = value（Record 类型 string literal key） |
| 005 | 隐式扩宽赋值 | byte→int→long→float→double 隐式转换 |
| 006 | 规范示例验证 | 字段访问/数组索引/记录索引/简洁赋值 4 个示例 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 007 | 类型不匹配 | 窄化赋值（long=int、double=float、int=float）和跨类型赋值（string=int、int=string 等） |
| 008 | readonly array 保护 | readonly int[] 不可被赋值为 non-readonly int[] |
| 009 | readonly tuple 保护 | readonly tuple 不可被赋值为 non-readonly tuple |

### runtime（验证实际计算值符合赋值语义）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 010 | 运行时语义验证 | 17 断言：六种类型赋值(6) + 字段访问(3) + 数组索引(3) + 记录索引(2) + 链式赋值(3) |
| 011 | 负索引越界 RangeError | arr[negOne()] = 99 → RangeError |
| 012 | 超长索引越界 RangeError | arr[5] = 99（len=3）→ RangeError |

## 文件命名规范

`EXP_07_32_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
