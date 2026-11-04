# 7.27.4 Boolean Relational Operators - 测试设计思维导图

## 概述

Boolean Relational Operators（布尔关系运算符）定义了 `<`、`<=`、`>`、`>=` 四个运算符在 boolean 类型上的比较行为。

**核心规则：**
- `false < true` = true，其余 `<` 结果为 false
- `true <= true` / `false <= any` = true，`true <= false` = false
- `true > false` = true，其余 `>` 结果为 false
- `false >= false` / `true >= any` = true，`false >= true` = false

**等价于数值模型：** false=0, true=1 的比较语义。

**类型约束：**
- 两个操作数必须都是 `boolean` 类型
- 非 boolean 类型操作数 → 编译时错误
- 结果类型为 `boolean`

## 三级测试点设计

### compile-pass（验证编译通过 + 语义正确）

| # | 测试点 | 说明 |
|---|--------|------|
| 001 | PASS_BOOL_BASIC | 四个关系运算符在 `true`/`false` 文字量上编译通过 |
| 002 | PASS_BOOL_VARIABLES | `let` boolean 变量之间编译通过 |
| 003 | PASS_BOOL_CONST | `const` boolean 常量编译通过 |
| 004 | PASS_BOOL_EXPRESSION | boolean 逻辑表达式作为操作数编译通过 |
| 005 | PASS_BOOL_RETURN | 函数返回 boolean 值作为操作数编译通过 |

### compile-fail

| # | 测试点 | 说明 |
|---|--------|------|
| 021 | FAIL_BOOL_INT | `boolean < int` → 编译时错误 |
| 022 | FAIL_BOOL_STRING | `boolean < string` → 编译时错误 |
| 023 | FAIL_BOOL_BIGINT | `boolean < bigint` → 编译时错误 |
| 024 | FAIL_BOOL_DOUBLE | `boolean < double` → 编译时错误 |
| 025 | FAIL_BOOL_OBJECT | `boolean < Object` → 编译时错误 |
| 026 | FAIL_BOOL_FLOAT | `boolean < float` → 编译时错误 |

### runtime（验证实际计算值符合优先级规则）

| # | 测试点 | 预期值 |
|---|--------|--------|
| 031 | RUNTIME_BASIC（16 断言） | 完整真值表 4 运算符 × 4 组合，文字量操作数 |
| 032 | RUNTIME_VARIABLES（12 断言） | `let`/`const` 变量全部组合运行时验证 |
| 033 | RUNTIME_EXPRESSIONS（8 断言） | boolean 表达式（比较结果、逻辑运算结果）作为操作数 |
| 034 | RUNTIME_EDGE（8 断言） | 函数返回值、条件表达式结果、! 取反结果 |

## 文件命名规范

`EXP_07_27_04_YYY_{CATEGORY}_{DESCRIPTION}.ets`

- YYY: 001 起连续编号
- CATEGORY: PASS / FAIL / RUNTIME
- DESCRIPTION: 大写+下划线描述

## 注释模板要求

每个文件必须包含 5 个 JSDoc tag：@id, @expect, @section, @design, @note
