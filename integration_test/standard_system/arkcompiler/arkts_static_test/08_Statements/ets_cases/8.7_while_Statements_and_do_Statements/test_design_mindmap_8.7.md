# 8.7 while 语句和 do 语句 测试设计思维导图

## 一、规范定义 (Section 8.7)
- `whileStatement`: `'while' '(' expression ')' statement`
- `doStatement`: `'do' statement 'while' '(' expression ')' ';'`
- while 语义: 先判断条件表达式, 条件为 true 时执行循环体, 再重复判断; 条件为 false 时循环体一次也不执行
- do 语义: 先执行循环体, 再判断条件表达式, 条件为 true 则重复执行; 即使条件为 false 循环体也至少执行一次
- 条件表达式类型: 必须为 boolean 或 Extended Conditional Expressions 类型 (number, string, bigint, enum), 否则编译时报错
- 循环体 statement: 可以是 block `{}`、空语句 `;`、if/break/continue/try-catch 等任意合法语句
- `break` 仅跳出最内层循环; `continue` 跳转到下一次条件判断

## 二、测试分类

### 1. 编译通过测试 (compile-pass) — 15 个

#### 1.1 基本 while 循环 (STMT_08_07_001_PASS_basic_while)
- 测试点: while 循环基本语法, 布尔变量条件和比较表达式条件
- 覆盖: `while (condition)` 合法声明; `while (j < 10)` 比较表达式; `while (flag)` 布尔变量
- 验证: 三个独立 while 循环通过编译 (布尔变量控制、计数循环、false 条件)

#### 1.2 while 空循环体 (STMT_08_07_002_PASS_while_empty_body)
- 测试点: while 循环体为空语句和空块
- 覆盖: `while (x < 0) {}` 空块体; `while (y > 10);` 空语句体
- 验证: 两种空循环体语法均合法

#### 1.3 基本 do-while 循环 (STMT_08_07_003_PASS_basic_do_while)
- 测试点: do-while 循环基本语法, 布尔变量条件和比较表达式条件
- 覆盖: `do { ... } while (i < 5)` 计数循环; `do { ... } while (flag)` 布尔变量控制
- 验证: do-while 先执行后判断语义、条件为 boolean 类型

#### 1.4 do-while 空循环体 (STMT_08_07_004_PASS_do_while_empty_body)
- 测试点: do-while 循环体为空语句和空块
- 覆盖: `do {} while (x < 0)` 空块体; `do ; while (y > 10)` 空语句体
- 验证: do-while 两种空循环体语法均合法

#### 1.5 嵌套循环 (STMT_08_07_005_PASS_nested_loops)
- 测试点: while 和 do-while 互相嵌套
- 覆盖: while 内嵌 while; do-while 内嵌 do-while; do-while 内嵌 while
- 验证: 多种嵌套组合通过编译, 内层变量作用域与外层隔离

#### 1.6 while 条件为 number 字面量 (STMT_08_07_006_PASS_while_condition_number_extended)
- 测试点: while 条件使用 number 字面量 (Extended Conditional Expression)
- 覆盖: `while (1)` — number 属于 Extended Conditional Expressions, 非零为 truthy
- 验证: number 字面量作为 while 条件合法通过编译
- 注: 原设计期望为编译报错, 但因 ArkTS 支持 Extended Conditional Expressions 类型, 实际合法

#### 1.7 do-while 条件为 string 字面量 (STMT_08_07_007_PASS_do_while_condition_string_extended)
- 测试点: do-while 条件使用 string 字面量 (Extended Conditional Expression)
- 覆盖: `do { ... } while ("abc")` — string 属于 Extended Conditional Expressions, 非空字符串为 truthy
- 验证: string 字面量作为 do-while 条件合法通过编译
- 注: 原设计期望为编译报错, 但因 ArkTS 支持 Extended Conditional Expressions 类型, 实际合法

#### 1.8 while 条件为 number 变量 (STMT_08_07_008_PASS_while_condition_non_bool_extended)
- 测试点: while 条件使用 number 类型变量 (Extended Conditional Expression)
- 覆盖: `while (x)` 其中 `x: number = 5.0` — number 变量作为条件
- 验证: number 类型变量作为 while 条件合法通过编译
- 注: 原设计期望为编译报错, 但因 ArkTS 支持 Extended Conditional Expressions 类型, 实际合法

#### 1.9 while 内嵌 if 中使用 break (STMT_08_07_009_PASS_while_with_break_in_nested_if)
- 测试点: while 循环体内嵌套 if 语句中使用 break
- 覆盖: `if (i == 5) { break; }` 条件 break; `if (count >= 3) { break; }` 无限循环中 break
- 验证: if 内 break 可提前退出 while 循环

#### 1.10 do-while 使用 continue (STMT_08_07_010_PASS_do_while_with_continue)
- 测试点: do-while 循环体中使用 continue 和 break
- 覆盖: `if (i % 2 == 0) { continue; }` 跳过偶数; `if (j < 3) { continue; } else { break; }` continue 与 break 组合
- 验证: do-while 体内 continue 合法, 跳转到条件检查处

#### 1.11 while 循环体包含 try-catch (STMT_08_07_011_PASS_while_body_try_catch)
- 测试点: while 循环体内包含 try-catch 异常处理
- 覆盖: 循环体内 `throw new Error` + `catch` 捕获; 循环体内 try-catch 修改循环控制变量
- 验证: while 的 statement 可以是 try-catch 语句

#### 1.12 do-while 循环体包含 try-catch (STMT_08_07_012_PASS_do_while_body_try_catch)
- 测试点: do-while 循环体内包含 try-catch 异常处理
- 覆盖: do 体内 throw 和 catch; do 体内 try-catch 修改循环控制变量
- 验证: do 的 statement 可以是 try-catch 语句

#### 1.13 while 复杂逻辑条件 (STMT_08_07_013_PASS_while_complex_logical_condition)
- 测试点: while 条件使用复合逻辑表达式
- 覆盖: `&&` 与条件 `a < 5 && b > 5`; `||` 或条件 `a < 2 || flag`; `!` 非条件 `!flag`; 括号嵌套 `(a < 10 && b > 0) || !flag`
- 验证: 任意返回 boolean 的复合逻辑表达式均可作为 while 条件

#### 1.14 while 条件为 bigint 类型 (STMT_08_07_014_PASS_while_condition_bigint_extended)
- 测试点: while 条件使用 bigint 类型 (Extended Conditional Expression)
- 覆盖: `while (b)` 其中 `b: bigint = 42n` (非零 bigint, truthy); `while (zero)` 其中 `zero: bigint = 0n` (零 bigint, falsy)
- 验证: bigint 属于 Extended Conditional Expressions 类型, 合法通过编译

#### 1.15 while 条件为 enum 类型 (STMT_08_07_015_PASS_while_condition_enum_extended)
- 测试点: while 条件使用 enum 类型 (Extended Conditional Expression)
- 覆盖: `while (c)` 其中 `c: Color = Color.Green` (非零枚举值, truthy); `while (defaultColor)` 其中值为 `Color.Red` (零值, falsy)
- 验证: enum 属于 Extended Conditional Expressions 类型, 合法通过编译

### 2. 编译失败测试 (compile-fail) — 2 个

#### 2.1 while 缺少括号 (STMT_08_07_009_FAIL_while_missing_parentheses)
- 测试点: while 关键字后缺少括号导致语法错误
- 错误: `while true { break }` — 缺少 `(` 和 `)`
- 预期错误: Syntax error (ESY0230 Expected '(')
- 规范依据: `whileStatement` 要求 `'while' '(' expression ')'`

#### 2.2 do-while 缺少 while 关键字 (STMT_08_07_010_FAIL_do_while_missing_while)
- 测试点: do 语句块后缺少 `while` 关键字导致语法错误
- 错误: `do { let x: int = 1 }` — 缺少 `while (...)` 部分
- 预期错误: 语法错误
- 规范依据: `doStatement` 要求 `'do' statement 'while' '(' expression ')' ';'`

### 3. 运行时测试 (runtime) — 7 个

#### 3.1 while(false) 循环体不执行 (STMT_08_07_009_RUNTIME_while_not_executed)
- 测试点: while 条件初始为 false 时循环体一次也不执行
- 验证: `while (false)` 后 count 仍为 0; `while (x > 0)` 且 x=0 时 x 未被修改
- 断言: `if (count != 0)` 和 `if (x != 0)` 抛出错误

#### 3.2 do-while(false) 至少执行一次 (STMT_08_07_010_RUNTIME_do_while_executed_once)
- 测试点: do-while 条件为 false 时循环体仍执行一次
- 验证: `do { count++; } while (false)` 后 count == 1
- 附加验证: `do { ... } while (x > 0)` 累加求和, sum 应为 15 (5+4+3+2+1)
- 断言: `if (count != 1)` 和 `if (sum != 15)` 抛出错误

#### 3.3 while 与 do-while 行为对比 (STMT_08_07_011_RUNTIME_while_vs_do_while)
- 测试点: 相同初始条件下 while 和 do-while 执行次数差异
- 验证: 条件初始 false 时 while 执行 0 次 vs do-while 执行 1 次
- 附加验证: 条件满足时 (i<3) 两者均执行 3 次
- 断言: `if (whileCount != 0)`, `if (doWhileCount != 1)`, 以及正常迭代次数断言

#### 3.4 do-while 中 continue 跳转到条件检查 (STMT_08_07_012_RUNTIME_do_while_continue_to_condition)
- 测试点: do-while 体内 continue 使执行流跳转到 while 条件表达式
- 验证1: `continue` 在 i<10 时跳过 break, 最终 i==10
- 验证2: 循环 5 次, 前 4 次执行 continue (skipCount==4), 第 5 次执行到 endCount==1
- 断言: `if (skipCount != 4)`, `if (endCount != 1)`, `if (j != 5)`

#### 3.5 while 内嵌 if 使用 break 提前退出 (STMT_08_07_013_RUNTIME_while_break_in_nested_if)
- 测试点: break 仅退出最内层循环, 外部变量保留中间值
- 验证1: `while (i < 10)` 内 `if (i == 7) break`, sum 累加至 6 的和 (=21), i 停在 7
- 验证2: 嵌套循环中内层 break 仅退出内层, 外层继续执行 (outer 从 0 到 3, inner 每次 break 在 2)
- 断言: `if (i != 7)`, `if (sum != 21)`, `if (inner != 2)`, `if (outer != 3)`

#### 3.6 do-while 体内 break 至少执行一次循环体 (STMT_08_07_016_RUNTIME_do_while_break_at_least_once)
- 测试点: do-while 保证循环体至少执行一次, 即使第一次迭代有 break
- 验证1: `do { count++; break; } while (false)` — count == 1 (条件 false + break, 仍执行一次)
- 验证2: `do { visits++; break; } while (true)` — visits == 1 (break 在第一次迭代)
- 验证3: `do { sum += i; i++; if (i >= 5) break; } while (i < 10)` — sum == 10 (0+1+2+3+4), i == 5
- 验证4: `do { iter++; if (iter == 3) break; } while (true)` — iter == 3
- 断言: 4 组独立断言, 充分验证 at-least-once 语义

#### 3.7 while 零次迭代全方位验证 (STMT_08_07_017_RUNTIME_while_zero_iterations)
- 测试点: while 条件为 false 时循环体执行 0 次, 外部变量不受影响
- 验证1: `while (false)` — executed 仍为 0
- 验证2: `while (x < 5)` 且 x=10 — counter 仍为 0, x 未被修改
- 验证3: `while (flag)` 且 flag=false — bodyExec 仍为 0
- 验证4: 三个连续 `while (false)` — hits 仍为 0
- 验证5: `while (false)` 之后的代码正常执行 — after 被设为 42
- 断言: 5 组独立断言, 充分验证零次迭代语义

## 三、边界值与异常场景

### 边界值
- 条件为 `true` 字面量 — 无限循环 (需 break 退出)
- 条件为 `false` 字面量 — while 跳过循环体; do-while 仍执行一次
- 条件为布尔变量 `let flag: boolean = true; while (flag)`
- 条件为比较表达式: `i < 10`, `i !== 0`, `i >= 5`, `x > 0`
- 条件为逻辑表达式: `a && b`, `a || b`, `!done`, `(a < 10 && b > 0) || !flag`
- 条件为 Extended Conditional Expressions: number 字面量 (1)、string 字面量 ("abc")、number 变量、bigint (42n/0n)、enum (非零/零值)
- 空循环体: `while (cond);` 空语句 / `while (cond) {}` 空块
- 循环体内含 `try-catch` 异常处理
- `break` 跳出当前最内层循环
- `continue` 跳过当前迭代后续语句, 跳转到条件判断
- 嵌套循环中 `break` 只跳出最内层

### 编译错误场景
- while 关键字后缺少括号: `while true { ... }` -> 语法错误 (Expected '(')
- do 语句块后缺少 while 关键字: `do { ... }` (无 while 部分) -> 语法错误

### 运行时行为 (无错误但有明确定义)
- while(false) 循环体 0 次执行, 之后代码正常执行
- do-while(false) 循环体至少 1 次执行
- 循环体执行次数: while 先判断后执行, do-while 先执行后判断
- do-while 内 continue 跳转到条件检查而非循环体开头
- break 在嵌套循环中仅退出最内层

## 四、命名约定
- 目录: `8.7_while_Statements_and_do_Statements/`
  - `compile-pass/` — 编译通过测试 (15 个)
  - `compile-fail/` — 编译失败测试 (2 个)
  - `runtime/` — 运行时测试 (7 个)
- 文件名: `STMT_08_07_<编号>_<类别>_<描述>.ets`
- 编号: 各分类独立编号, 跨分类允许重复
  - compile-pass: 001–015
  - compile-fail: 009–010
  - runtime: 009–013, 016–017 (部分编号跳过)

## 五、注释格式
```arkts
/**
 * @id STMT_08_07_<编号>_<类别>_<描述>
 * @expect compile-pass | compile-fail | runtime
 * @section 8.7
 * @design <中文测试设计说明>
 * @note <测试要点注释>
 */
```

## 六、关键约束
- 所有函数必须为顶层函数, 不可嵌套
- 编译通过测试: `function testXxx(): void { ... }`
- 编译失败测试: `function testXxx(): void { ... }`
- 运行时测试: `function main(): void { ... }`, 使用 `if + throw new Error` 断言
- 运行时测试结尾: `console.log("verified")`
- 不可使用局部类、局部类型别名
- int/number/string/boolean/bigint/enum 为类型关键字
- while/do 条件可为 boolean 或 Extended Conditional Expressions 类型 (number, string, bigint, enum)
