# 7.28.3 Extended Equality with null or undefined - 测试设计思维导图

## 概述

Extended Equality with null or undefined（null/undefined 扩展等值）定义了 `==`、`!=`、`===`、`!==` 四个运算符在 null/undefined 操作数上的特殊比较行为，确保与 TypeScript 对齐。

**核心规则：**
- 若一个操作数为 `null`，另一个为 `undefined`，则 `==` 返回 `true`，`===` 返回 `false`
- 若两个操作数均为 `null`，则 `==` 和 `===` 都返回 `true`
- 若两个操作数均为 `undefined`，则 `==` 和 `===` 都返回 `true`
- `==` 运算符对 null/undefined 执行类型提升（type promotion），视为相等
- `===` 运算符严格区分 null 和 undefined，不执行类型提升

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | null == undefined | null 和 undefined 字面量等值比较，编译通过 |
| 002 | null == null | null 与 null 比较，编译通过 |
| 003 | undefined == undefined | undefined 与 undefined 比较，编译通过 |
| 004 | 可空类型参数比较 | Object|null 与 Object|null|undefined 参数比较，编译通过 |
| 005 | 变量形式 null/undefined 比较 | 变量赋值 null/undefined 再比较，编译通过 |
| 006 | null/undefined 与基本类型比较 | null == int、null == string 等全部编译通过（扩展语义） |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| （无） | 本子节无 compile-fail 用例 | ArkTS 编译器扩展等值语义允许 null/undefined 与所有类型进行 `==`/`!=`/`===`/`!==` 比较 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | null == undefined | true（扩展等值核心） |
| 032 | null === undefined | false（严格区分类型） |
| 033 | null != undefined | false |
| 034 | null !== undefined | true |
| 035 | null == null | true |
| 036 | null === null | true |
| 037 | undefined == undefined | true |
| 038 | undefined === undefined | true |
| 039 | 可空函数参数 null == undefined | true |
| 040 | 可空函数参数 null === undefined | false |
| 041 | 可空函数参数 null == null | true |
| 042 | 可空函数参数 null === null | true |

## 文件命名规范

`EXP_07_28_03_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
