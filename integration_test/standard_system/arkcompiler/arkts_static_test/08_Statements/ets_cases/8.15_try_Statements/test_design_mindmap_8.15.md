# 8.15 try 语句 测试设计思维导图

## 1. 概述 (Overview)

本节定义 **try 语句 (tryStatement)** 的语法和行为语义：

- **语法规则**: `tryStatement: 'try' block catchClause? finallyClause?`
- **约束**: try 块后可选 catch 子句, 可选 finally 子句, 但**必须包含至少一个** (catch 或 finally 或两者)
- **语义**:
  - try 块正常完成 -> catch 子句不执行 (如果存在), control 继续到 finally (如果存在)
  - try 块抛出错误 -> 控制权转移到 catch 子句 (如果存在), 最后执行 finally (如果存在)
  - finally 子句**始终执行**, 无论 try 块是否抛出异常
  - catch 子句捕获异常后可重新抛出
  - catch 子句中声明的 error 标识符作用域**严格限定于 catch 块内部**
- **ArkTS 约束**: try/catch/finally 块内**禁止**定义局部类、局部类型别名、嵌套函数

## 2. 核心规则 (Core Rules)

### 2.1 子类型枚举 (Sub-type Enumeration)

| 结构 | 组成 | 说明 |
|------|------|------|
| try-catch | `try { } catch(e) { }` | 基础异常捕获结构 |
| try-finally | `try { } finally { }` | 无 catch，仅资源清理 |
| try-catch-finally | `try { } catch(e) { } finally { }` | 完整的三元结构 |
| 嵌套 try | 任意块内嵌套 try 语句 | try/catch/finally 块内均可嵌套 |

### 2.2 catch 标识符作用域规则

- `catch(e)` 中的 `e` 作用域**仅限于 catch 块内部**
- catch 块外部引用 `e` (读取/赋值) 均为编译时错误
- 不同 try 语句的 catch 块各自拥有独立的作用域, 互不影响

### 2.3 ArkTS 块内禁止声明约束

- **禁止**在 try/catch/finally 块内定义局部类 (class)
- **禁止**在 try/catch/finally 块内定义类型别名 (type)
- **禁止**在 try/catch/finally 块内定义嵌套函数 (function)

## 3. 测试点分类 (Test Points)

### 3.1 编译通过 (compile-pass) —— 7 个测试点

| 编号 | 测试点 | 描述 |
|------|--------|------|
| 001 | try-catch 基本结构 | try 块后跟 catch 子句, 符合语法要求 |
| 002 | try-finally 基本结构 | try 块后跟 finally 子句, 符合语法要求 |
| 003 | try-catch-finally 完整结构 | try 块后同时包含 catch 子句和 finally 子句 |
| 004 | 嵌套 try 语句 | try 块内嵌套 try-catch, 外层含 catch + finally |
| 005 | try-catch 中包含 return 语句 | try/catch/finally 块中包含 return, 编译通过 |
| 006 | try 语句在 if 语句体内组合 | try-catch 和 try-finally 分别置于 if/else 分支, 验证与其它控制流结构组合 |
| 017 | 仅含 finally (无 catch) | 显式验证 try-finally-only 结构合法性, finally 在控制流离开前执行 |

### 3.2 编译失败 (compile-fail) —— 6 个测试点

| 编号 | 测试点 | 描述 |
|------|--------|------|
| 006 | try 块没有 catch 也没有 finally | 违反 MUST contain catch or finally 约束 |
| 007 | try 块内定义局部类 | 违反 ArkTS 禁止在函数内定义局部类的约束 |
| 008 | finally 块内定义局部类型别名 | 违反 ArkTS 禁止在函数内定义类型别名的约束 |
| 009 | catch 块内定义嵌套函数 | 违反 ArkTS 禁止在函数内定义嵌套函数的约束 |
| 010 | catch 变量在块外部不可访问 | catch(e) 的 e 作用域限定于 catch 块内, 外部读取 e 编译错误 |
| 018 | catch 标识符在块外部赋值/使用 | catch(e) 的 e 在 finally 块或 try 语句之后赋值/使用均编译错误 |

### 3.3 运行时 (runtime) —— 9 个测试点

| 编号 | 测试点 | 描述 |
|------|--------|------|
| 010 | try-catch 不抛异常 -> catch 不执行 | try 块正常完成, catch 不被触发, 结果值为 try 块赋值 |
| 011 | try-catch 抛异常 -> catch 捕获处理 | try 块 throw Error, 控制权转移到 catch, catch 被正确执行 |
| 012 | finally 始终执行 | 分别验证无异常抛出和有异常抛出两种情况下 finally 均被执行 |
| 013 | try-finally 错误传播 | 无 catch 时 try 抛错, finally 在错误传播前执行, 调用方捕获传播的错误 |
| 014 | try-finally 正常完成 | 无 catch 时 try 正常完成, finally 仍执行, 执行顺序为 try 后 finally |
| 015 | 连续多个 try-catch(无 finally) | 两个独立 try-catch 分别验证无错误(不触发 catch)和有错误(触发 catch) |
| 016 | try-catch-finally 抛错完整执行 | try 抛错后 catch 执行, finally 始终执行, try 之后代码正常继续 |
| 019 | try-catch-finally 正常完成后继续 | 无异常时 catch 不执行, finally 执行, try 语句之后的代码按序正常执行 |
| 020 | 嵌套 try 内层 catch 阻止外层 catch | 内层 try 抛错被内层 catch 捕获, 错误不向外传播, 外层 catch 不触发, 外层 finally 仍执行 |

## 4. 边界值与异常场景 (Boundary & Exception)

### 4.1 边界值
- catch 子句捕获 Error 基类
- catch 子句捕获自定义错误类型
- 空 try 块
- 空 catch 块
- 空 finally 块
- try 语句作为控制流语句 (if/while/for) 的子语句
- 单 try 语句后仅跟 finally 不跟 catch

### 4.2 异常场景
- try 块中抛出多种不同类型的错误
- finally 块中抛出错误 (覆盖 try 块异常)
- catch 块中抛出错误后 finally 是否执行
- return 与 finally 的交互 (finally 在 return 前执行)
- try-finally 错误向上传播至调用方
- 嵌套 try 中内层 catch 捕获后外层 catch 不被触发

### 4.3 作用域场景
- catch 标识符在 catch 块外部读取
- catch 标识符在 catch 块外部赋值
- catch 标识符在 finally 块中引用

## 5. 编号规划 (Numbering Plan)

| 类别 | 编号范围 | 数量 |
|------|----------|------|
| compile-pass | 001 ~ 017 | 7 (001, 002, 003, 004, 005, 006, 017) |
| compile-fail | 006 ~ 018 | 6 (006, 007, 008, 009, 010, 018) |
| runtime | 010 ~ 020 | 9 (010, 011, 012, 013, 014, 015, 016, 019, 020) |

> **汇总**: 7P + 6F + 9R = 22 total

## 6. 文件命名规范 (File Naming Convention)

- **前缀**: `STMT_08_15_`
- **编号**: 三位数字 (001, 002, ...)
- **后缀**: `PASS` / `FAIL` / `RUNTIME`
- **描述**: 简短英文描述 (snake_case)
- **格式**: `STMT_08_15_{NNN}_{PASS|FAIL|RUNTIME}_{description}.ets`

## 7. 文件清单 (File Inventory)

### compile-pass
| 文件名 | 编号 | 说明 |
|--------|------|------|
| `STMT_08_15_001_PASS_try_catch.ets` | 001 | try-catch 基本结构 |
| `STMT_08_15_002_PASS_try_finally.ets` | 002 | try-finally 基本结构 |
| `STMT_08_15_003_PASS_try_catch_finally.ets` | 003 | try-catch-finally 完整结构 |
| `STMT_08_15_004_PASS_try_nested.ets` | 004 | 嵌套 try 语句 |
| `STMT_08_15_005_PASS_try_catch_return.ets` | 005 | try-catch 中包含 return |
| `STMT_08_15_006_PASS_try_in_if_statement.ets` | 006 | try 语句在 if 体内组合 |
| `STMT_08_15_017_PASS_try_finally_only.ets` | 017 | 仅含 finally (无 catch) |

### compile-fail
| 文件名 | 编号 | 说明 |
|--------|------|------|
| `STMT_08_15_006_FAIL_try_no_catch_no_finally.ets` | 006 | try 无 catch 且无 finally |
| `STMT_08_15_007_FAIL_try_catch_local_class.ets` | 007 | try 块内定义局部类 |
| `STMT_08_15_008_FAIL_try_finally_local_type_alias.ets` | 008 | finally 块内定义局部类型别名 |
| `STMT_08_15_009_FAIL_try_catch_nested_function.ets` | 009 | catch 块内定义嵌套函数 |
| `STMT_08_15_010_FAIL_catch_variable_out_of_scope.ets` | 010 | catch 变量在块外部不可访问 |
| `STMT_08_15_018_FAIL_catch_identifier_outside_block.ets` | 018 | catch 标识符在块外部赋值/使用 |

### runtime
| 文件名 | 编号 | 说明 |
|--------|------|------|
| `STMT_08_15_010_RUNTIME_try_catch_no_error.ets` | 010 | try-catch 不抛异常 catch 不执行 |
| `STMT_08_15_011_RUNTIME_try_catch_error.ets` | 011 | try-catch 抛异常 catch 捕获 |
| `STMT_08_15_012_RUNTIME_try_finally_always.ets` | 012 | finally 始终执行 |
| `STMT_08_15_013_RUNTIME_try_finally_error_propagation.ets` | 013 | try-finally 错误向上传播 |
| `STMT_08_15_014_RUNTIME_try_finally_normal.ets` | 014 | try-finally 正常完成 finally 执行 |
| `STMT_08_15_015_RUNTIME_try_catch_only_sequential.ets` | 015 | 连续多个 try-catch(无 finally) |
| `STMT_08_15_016_RUNTIME_try_catch_finally_error.ets` | 016 | try-catch-finally 抛错完整执行 |
| `STMT_08_15_019_RUNTIME_try_normal_completion_after.ets` | 019 | try-catch-finally 正常完成后继续 |
| `STMT_08_15_020_RUNTIME_try_nested_inner_catch.ets` | 020 | 嵌套 try 内层 catch 阻止外层 catch |
