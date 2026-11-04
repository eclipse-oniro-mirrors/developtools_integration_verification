# 7.27.3 String Relational Operators - 测试设计思维导图

## 概述

本子章节定义 string 类型的关系运算符（`<`、`<=`、`>`、`>=`）行为。

**核心规则：** 字符串比较基于**词典序（lexicographic order）**，按字符的 Unicode/ASCII 码值逐字符比较：
- `<` — 如果左操作数字符串值词典序小于右操作数，则返回 true，否则 false
- `<=` — 如果左操作数字符串值词典序小于或等于右操作数，则返回 true，否则 false
- `>` — 如果左操作数字符串值词典序大于右操作数，则返回 true，否则 false
- `>=` — 如果左操作数字符串值词典序大于或等于右操作数，则返回 true，否则 false

**结果类型：** 始终为 `boolean`

**操作数要求：** 两个操作数都必须为 `string` 类型。非 string 类型的操作数与 string 比较产生编译时错误。

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | 基本字符串比较 | 四个运算符（`<`、`<=`、`>`、`>=`）在简洁字符串上编译通过 |
| 002 | 空字符串比较 | 空字符串 `""` 与普通字符串及自身的比较 |
| 003 | 大小写敏感性 | 大写字母 vs 小写字母（ASCII: 'A'(65) < 'a'(97)） |
| 004 | ASCII/Unicode 字符顺序 | 数字 < 大写字母 < 小写字母（ASCII 顺序） |
| 005 | 相等字符串比较 | 相同字符串 `<`、`<=`、`>`、`>=` 编译通过 |
| 006 | 词典序细节 | 前缀关系、逐字符比较、较长字符串大于较短前缀 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | string vs int | 非 string 类型与 string 比较，编译时错误 |
| 022 | string vs boolean | 非 string 类型与 string 比较，编译时错误 |
| 023 | string vs bigint | 非 string 类型与 string 比较，编译时错误 |
| 024 | string vs double | 非 string 类型与 string 比较，编译时错误 |
| 025 | string vs Object | 非 string 类型与 string 比较，编译时错误 |
| 026 | string vs null/undefined | 非 string 类型与 string 比较，编译时错误 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | 基本字符串比较 | 四个运算符比较结果正确 |
| 032 | 空字符串比较 | `"" < "a"` → true，空字符串最小 |
| 033 | 大小写敏感性 | `"Hello" < "hello"` → true（ASCII 顺序） |
| 034 | ASCII/Unicode 字符顺序 | 数字 < 大写字母 < 小写字母比较正确 |
| 035 | 相等字符串比较 | `<=` 和 `>=` 返回 true，`<` 和 `>` 返回 false |
| 036 | 词典序前缀比较 | `"abc" < "abcd"` → true，较短字符串为较小者 |
| 037 | 字符串变量比较 | 变量赋值后的字符串比较正确 |
| 038 | 长字符串比较 | 多字符长字符串词典序正确 |

## 文件命名规范

`EXP_07_27_03_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
