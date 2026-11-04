# 7.13.3 Record Indexing Expression - 测试设计思维导图

## 概述

Record 索引表达式用于通过索引访问 Record 类型中的元素。ArkTS 的 Record 索引分为两种 Case：
- **Case 1**：Key 为纯字面量联合类型（如 `'key1' | 'key2' | 'key3'`），编译时检查索引合法性，结果类型为 `Value`（非可选）。
- **Case 2**：Key 为非字面量联合类型（如 `number`、`string`），运行时动态检查，结果类型为 `Value | undefined`。

评估顺序（Spec 规定）：
1. 对象引用表达式先求值
2. 若异常完成，则索引不评估
3. 若正常完成，索引表达式求值
4. 若记录包含该键 → 返回值
5. 否则 → 返回 undefined

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | Case1 字面量联合 Key 合法读取 | 合法字面量 Key 读取 `x['key1']`, `x['key2']`, `x['key3']` |
| 002 | Case1 字面量联合 Key 合法写入 | 合法字面量 Key 写入 `x['key2'] = 8` |
| 003 | Case1 字段访问符号 | `x.key2` 等价于 `x['key2']` ⚠️ D类（编译器不支持） |
| 004 | Case2 直接字面量索引 | 直接数字字面量索引 `x[1]` |
| 005 | Case2 number 键变量索引 | number 变量索引 `x[n]` |
| 006 | Case2 string 键变量索引 | string 变量索引 `x[k]` |
| 007 | Case2 undefined 检查 | 结果类型 `Value | undefined`，可检查和收窄 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 008 | Case1 无效字面量读取 | 读取 `x['key4']` → 编译时错误 |
| 009 | Case1 无效字面量写入 | 写入 `x['another key'] = 5` → 编译时错误 |
| 010 | Case1 变量索引 | `let k = 'key1'; x[k]` → 编译时错误 ⚠️ D类（编译器允许） |
| 011 | Case1 数值不在联合中 | `x[4]` 不在 `1|2|3` 中 → 编译时错误 |
| 012 | Case1 无效字段访问 | 字段访问 `x.key4` → 编译时错误 |

### runtime（验证实际运行行为）

| # | 测试点 | 预期行为 |
|---|--------|---------|
| 013 | Case1 有效键值验证 | 各键对应的值正确，写入后读取一致性 |
| 014 | Case2 缺失键返回 undefined | 存在键返回正确值，不存在键返回 undefined |
| 015 | Case2 undefined 收窄 | undefined 检查后使用 as 断言 |
| 016 | Case1 方括号索引运行时 | 读写值正确性 |

## 文件命名规范

`EXP_07_13_03_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
