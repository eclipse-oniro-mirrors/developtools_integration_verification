# 8.1 正常与突然语句执行 (Normal and Abrupt Statement Execution) - 测试设计思维导图

## 概述

本节定义语句执行的两种完成模式：
1. **正常完成 (Normal Completion)**：语句执行其预期动作，没有抛出错误，控制流按顺序传递给下一条语句
2. **突然完成 (Abrupt Completion)**：语句执行导致错误被抛出，或由跳转语句 (break/continue/return/throw) 导致控制流非顺序转移

**核心语义：**
- 大多数语句默认以正常完成执行（赋值、表达式、块、条件、循环）
- 跳转语句（break/continue/return/throw）导致突然完成
- throw 只能抛出 `Error` 或其子类（ArkTS 编译时常量约束）
- break/continue 必须在循环或 switch 作用域内
- try-catch 捕获突然完成后，执行流恢复正常完成
- finally 块在正常完成和突然完成两种路径下均保证执行

## 测试点覆盖

### 1. compile-pass 测试 (6 个文件)

| 序号 | 用例ID | 测试点 | 详细验证项 |
|------|--------|--------|------------|
| 001 | STMT_08_01_001_PASS_normal_completion | 各类语句正常完成编译通过 | 赋值语句, 表达式语句, 块语句, if-else, for循环, while循环, do-while循环, 空语句(;), 空块({}) |
| 002 | STMT_08_01_002_PASS_abrupt_in_try_catch | try-catch 处理突然完成编译通过 | throw 在 try 中触发突然完成被 catch 捕获; try-catch-finally 中 finally 定义 |
| 003 | STMT_08_01_003_PASS_break_continue_return | 跳转语句正常完成语义编译通过 | break 在 for 循环内; continue 跳过迭代; break 在 switch 中; return 结束函数 |
| 004 | STMT_08_01_004_PASS_nested_control_flow | 嵌套控制流混合完成编译通过 | 循环内嵌 try-catch（内层突然完成，外层恢复正常）; labeled break outer / continue outer; if 内嵌 try 内嵌 if |
| 012 | STMT_08_01_012_PASS_multiple_abrupt_sources | 多突然完成源共存编译通过 | return/throw 在 if-else 分支共存; break/continue/return/throw 在同一循环体内基于不同条件共存; 多个 throw 在顺序 if 中; 嵌套循环内 continue/break |
| 013 | STMT_08_01_013_PASS_return_abrupt_nested | return 在嵌套结构中触发突然完成编译通过 | if-else 内 return; 循环内嵌套 if 内 return; try 块内嵌套 if 内 return; catch 块内 return; 深层嵌套 if (3层) 内 return; switch case 块内 return |

### 2. compile-fail 测试 (3 个文件)

| 序号 | 用例ID | 测试点 | 期望错误 |
|------|--------|--------|----------|
| 005 | STMT_08_01_005_FAIL_throw_non_error | 抛出非 Error 类型的值 | `throw 42` — ArkTS 要求 throw 后必须是 Error 或其子类 |
| 006 | STMT_08_01_006_FAIL_break_outside_loop | break 在循环/switch 外部使用 | `break` 在普通 if 块内 — break 必须位于 for/while/do-while/switch 体内 |
| 007 | STMT_08_01_007_FAIL_continue_outside_loop | continue 在循环外部使用 | `continue` 在普通 if 块内 — continue 必须位于 for/while/do-while 循环体内 |

### 3. runtime 测试 (5 个文件)

| 序号 | 用例ID | 测试点 | 详细验证项 |
|------|--------|--------|------------|
| 008 | STMT_08_01_008_RUNTIME_normal_completion_flow | 正常完成语句按序执行并产生预期结果 | 顺序赋值 (a=1→+2→*3=9); if-else true分支; for 累加 (0+1+2+3+4=10); while 计数 (3次); 空语句/空块后继续执行 |
| 009 | STMT_08_01_009_RUNTIME_abrupt_completion_try_catch | throw 触发突然完成被 try-catch 捕获 | throw 后 catch 执行、catch 后代码恢复执行; 嵌套 try-catch (内层catch后外层try继续); finally 在 try-finally(无catch) 中执行且异常正确传播 |
| 010 | STMT_08_01_010_RUNTIME_return_abrupt_completion | return 触发突然完成 | if-else 中 return 各自正确退出并返回对应值; 循环内 return 退出整个函数(非仅循环); try 块中 return 在 finally 隐式执行前完成退出 |
| 011 | STMT_08_01_011_RUNTIME_finally_always_executes | finally 在所有完成路径下均执行 | throw后无catch时finally执行且异常传播; catch中re-throw后finally仍执行; try正常完成时finally执行; try-catch-finally正常路径; try-catch-finally突然路径 |
| 014 | STMT_08_01_014_RUNTIME_multiple_abrupt_paths | 多突然完成路径共存时第一条命中路径决定行为 | 多个return路径(selector选择); throw-vs-return(负值throw,零return); break-vs-return在循环中(return退出函数,break仅退出循环然后正常return); 正常无突然完成路径 |

## 边界值与边缘场景

### 边界值
- 空块 `{ }` — 正常完成，无任何副作用
- 空语句 `;` — 正常完成，无任何副作用
- 深层嵌套 if (3层) 中各层 return — 每一层 return 均正确退出函数
- 循环 0 次迭代 — while 条件初始为 false，循环体不执行，外部控制流继续
- 循环仅 1 次迭代后 break — 循环内 break 退出，后续循环体不执行
- switch 中每个 case 含 break — 防止贯穿，各分支正常完成

### 异常场景
- `throw 42`（非 Error 字面量）→ 编译时错误
- `break` 在普通 if 块内（非循环/switch）→ 编译时错误
- `continue` 在普通 if 块内（非循环）→ 编译时错误
- try-finally（无 catch）中 throw → finally 执行后异常向外部传播
- catch 块中再次 throw → finally 仍然执行，新异常向外部传播
- 多个 throw 在不同 if 分支 → 每个分支独立触发突然完成

### 设计约束（ArkTS 特有的编译时限制）
- throw 表达式必须求值为 `Error` 或其子类——不同于 Java（允许任意 Throwable）或 Swift（遵循 Error 协议的类型）
- ArkTS 无受检异常 (checked exception) 概念
- 跳转语句的作用域检查在编译期完成

## 编号规划

- compile-pass: 001 ~ 004, 012 ~ 013
- compile-fail: 005 ~ 007
- runtime: 008 ~ 011, 014

**总计：** 6P + 3F + 5R = 14 个测试用例

## 文件命名规范

```
STMT_08_01_{YYY}_{CATEGORY}_{DESCRIPTION}.ets
```

- 前缀: `STMT_08_01`（Statements 第 8.1 节）
- 序号: `001` ~ `999`（三位数，零填充）
- 分类标识: `PASS` / `FAIL` / `RUNTIME`
- 描述: 简短英文描述，用下划线分隔
- 示例: `STMT_08_01_001_PASS_normal_completion.ets`
