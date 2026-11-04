# 8.8 for 语句 测试设计思维导图

## 1. 规格定义
- forStatement: `'for' '(' forInit? ';' forContinue? ';' forUpdate? ')' statement`
- forInit / forContinue / forUpdate 均为可选（均可省略）
- forInit 可以是 variableDeclarationList 或 expressionSequence（逗号表达式）
- forInit 中声明的变量具有循环作用域（loop scope），作用域覆盖 forContinue 表达式、forUpdate 表达式和循环体
- forInit 声明的变量在循环结束后不可访问（编译期错误）
- forContinue 表达式类型必须为 boolean（或扩展条件表达式，未来版本将废弃）
- forUpdate 可以是 expressionSequence（逗号表达式）以同时更新多个变量
- 循环体支持 labeled statement，break labelName 可跳出指定标签的循环
- 非 boolean 条件（严格模式）产生编译期错误
- 缺少分号产生语法错误

## 2. 测试分类

### 2.1 compile-pass（编译通过）
| 编号 | 文件 | 测试点 |
|------|------|--------|
| 001 | STMT_08_08_001_PASS_BASIC_FOR | 基础 for 循环，forInit 声明新变量，显式类型 `int` |
| 002 | STMT_08_08_002_PASS_FOR_TYPE_INFERENCE | forInit 类型推导 `let i = 0`，自动推导为 int |
| 003 | STMT_08_08_003_PASS_FOR_EXISTING_VAR | 使用已存在变量作为循环索引（forInit 为空） |
| 004 | STMT_08_08_004_PASS_FOR_EMPTY_INIT | forInit 和 forUpdate 均为空，仅保留条件表达式 |
| 005 | STMT_08_08_005_PASS_FOR_EMPTY_CONTINUE | forContinue 为空（无终止条件），靠内部 break 退出 |
| 006 | STMT_08_08_006_PASS_NON_BOOLEAN_CONDITION_EXTENDED | 扩展条件表达式：forContinue 为 int 类型（非 boolean），当前版本编译通过 |
| 009 | STMT_08_08_009_PASS_for_empty_all_parts | for 三个部分全部为空 `for(;;)`，无限循环靠 break 退出 |
| 012 | STMT_08_08_012_PASS_for_init_expression_sequence | forInit 使用 expressionSequence（逗号表达式）初始化多个已存在变量 |
| 013 | STMT_08_08_013_PASS_for_update_expression_sequence | forUpdate 使用 expressionSequence（逗号表达式）同时更新多个变量 |
| 014 | STMT_08_08_014_PASS_for_labeled_body | for 循环体使用 labeled statement，`break outer` 跳出外层循环 |
| 015 | STMT_08_08_015_PASS_for_init_var_accessible | forInit 声明的循环变量在 forContinue、forUpdate 和循环体中均可访问 |
| 016 | STMT_08_08_016_PASS_for_empty_update | forUpdate 为空，循环变量在循环体内手动更新 |
| 018 | STMT_08_08_018_PASS_for_labeled_break | 单层 for 循环使用 labeled break 提前退出循环体 |

### 2.2 compile-fail（编译失败）
| 编号 | 文件 | 测试点 |
|------|------|--------|
| 007 | STMT_08_08_007_FAIL_VAR_OUT_OF_SCOPE | forInit 声明的变量具有循环作用域，循环外不能访问 |
| 010 | STMT_08_08_010_FAIL_for_missing_semicolons | for 括号内缺少分号产生语法错误 |
| 019 | STMT_08_08_019_FAIL_forInit_var_outside_body | 第一个 forInit 声明的变量在第二个 for 的 forContinue 中引用，作用域越界 |

### 2.3 runtime（运行时）
| 编号 | 文件 | 测试点 |
|------|------|--------|
| 008 | STMT_08_08_008_RUNTIME_FOR_BASIC | 基础 for 循环求和 `i=0..4`，验证 sum == 10 |
| 009 | STMT_08_08_009_RUNTIME_FOR_EXISTING_VAR | 使用已存在变量索引，循环结束后验证 idx == 5 |
| 011 | STMT_08_08_011_RUNTIME_for_empty_all_parts | `for(;;)` 空所有部分，break 正确退出，验证迭代次数 |
| 017 | STMT_08_08_017_RUNTIME_for_expression_sequence | 运行时验证 expressionSequence 求值顺序和正确执行行为 |
| 020 | STMT_08_08_020_RUNTIME_for_countdown | for 循环递减计数 `i--`，验证 sum(5+4+3+2+1) == 15 |
| 021 | STMT_08_08_021_RUNTIME_for_complex_condition | 复合条件 `&&` 正确控制循环终止，验证 count == 5 |

## 3. 边界值与异常场景
- forInit 可省略（空语句）
- forContinue 可省略（默认 true，无限循环需 break 退出）
- forUpdate 可省略（循环体内手动更新）
- 三者同时省略 `for(;;)` 合法（无限循环）
- forInit 可声明带有初始化的新变量，也可使用 expressionSequence 初始化已有变量
- forUpdate 可以是 expressionSequence 同时更新多个变量
- 空条件（forContinue 缺失）相当于 true
- 非 boolean 条件：扩展条件表达式下编译通过（未来版本将废弃），严格模式下编译失败
- forInit 变量作用域仅限 forContinue、forUpdate 和循环体；循环结束后不可访问
- 缺少分号 `for (let i = 0 i < 10 i++)` 产生语法错误
- 第一个 for 的 forInit 变量不能在第二个不同 for 的 forContinue 中引用
- 递减循环 `i--` 属于合法的 forUpdate 表达式
- 复合条件 `&&` / `||` 作为 forContinue 表达式合法
- labeled statement 支持 `break label` 跳出指定层级循环

## 4. 文件命名规范
- 前缀：`STMT_08_08_`
- 编号：3 位数字，全局递增（按文件创建顺序）
- 后缀：`_PASS_xxx.ets` / `_FAIL_xxx.ets` / `_RUNTIME_xxx.ets`
- 注释块包含 `@id`、`@expect`、`@section`、`@design`、`@note`

## 5. 统计
- compile-pass: 13 个
- compile-fail: 3 个
- runtime: 6 个
- 总计: 22 个
