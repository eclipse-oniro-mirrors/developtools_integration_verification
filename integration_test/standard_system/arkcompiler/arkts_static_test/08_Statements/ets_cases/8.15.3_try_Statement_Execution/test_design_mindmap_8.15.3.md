# 8.15.3 try 语句执行 测试设计思维导图

## 1. 概述 (Overview)
- 章节号: 8.15.3 try_Statement_Execution
- 核心内容: try 语句的执行规则 (Execution Rules)
- 四条执行规则定义 try 语句在正常和异常情况下的完成状态
- 当前覆盖: 4P + 3F + 8R = 15 total

## 2. 执行规则细分 (Execution Rules Enumeration)

### 2.1 规则1 (Rule 1): try 块正常完成
- try 块体中的语句序列正常完成（无异常抛出）
- catch 子句不会执行
- try 语句整体正常完成
- 若存在 finally 子句，finally 在 try 完成后执行

### 2.2 规则2 (Rule 2): try 块抛出异常且 catch 捕获
- try 块体中的语句抛出了异常 x
- catch 子句被执行来捕获异常 x
- catch 块体正常完成 -> 整个 try 语句正常完成
- catch 块体异常完成（自身抛出异常）-> 整个 try 语句异常完成，catch 抛出的新异常取代原始异常向外传播

### 2.3 规则3 (Rule 3): try 块抛出异常但无 catch 子句
- try 块体抛出异常 x
- 没有 catch 子句来捕获 x
- 异常 x 传播到外围作用域或调用者（caller）作用域
- 持续传播直到找到匹配的 catch 子句
- 扩展: 异常沿多级调用链传播（两层、三层），每层均无 catch

### 2.4 规则4 (Rule 4): finally 子句异常完成
- 如果 finally 子句执行时异常完成
- 则整个 try 语句也异常完成
- 即使 catch 子句已经正常处理了原始异常，finally 中的异常会覆盖原始异常
- 扩展: try 块正常完成时 finally 异常完成同样导致整个 try 语句异常完成

## 3. 测试点分类 (Test Points)

### 3.1 编译通过 (compile-pass) — 4 files
- 001_PASS_try_block_normal_completion: 规则1 — try 块正常完成，try-finally 结构，无 catch 子句
- 002_PASS_try_catch_error_handled: 规则2 — catch 捕获异常，catch 体正常完成，try 整体正常完成
- 003_PASS_error_propagated_no_catch: 规则3 — try 块抛出异常，无 catch 子句，仅有 finally，异常将传播
- 004_PASS_finally_abrupt_completion: 规则4 — try-catch-finally 中 catch 正常处理但 finally 抛出新异常，整体异常完成

### 3.2 编译失败 (compile-fail) — 3 files
- 005_FAIL_try_no_catch_no_finally: try 块没有 catch 也没有 finally（违反语法要求，try 必须至少有一者）
- 006_FAIL_try_catch_local_class: catch 块内定义局部类（违反 ArkTS 禁止局部类的约束）
- 007_FAIL_try_finally_nested_function: finally 块内定义嵌套函数（违反 ArkTS 禁止嵌套函数的约束）

### 3.3 运行时 (runtime) — 8 files

#### 3.3.1 规则1: try 正常完成
- 008_RUNTIME_try_normal_completion: try 块正常完成（无异常），catch 不执行，finally 正常执行。验证 try 体赋值生效且 catch 未触发。

#### 3.3.2 规则2: catch 捕获异常
- 009_RUNTIME_try_catch_normal_completion: try 抛出 Error，catch 捕获后正常处理（无再抛出），try 整体正常完成。
- 014_RUNTIME_catch_body_abrupt_completion: 规则2扩展 — catch 子句体自身异常完成（抛出 Error("catch rethrow")），取代原始异常向外传播。验证三种场景: 内联嵌套 catch 重新抛出、辅助函数中 catch 抛出、catch 体执行后才抛出。

#### 3.3.3 规则3: 异常传播（无 catch）
- 010_RUNTIME_error_propagated_and_finally_abrupt: 规则3+4 组合 — try-finally（无 catch）异常传播到调用者 catch 捕获；嵌套 try 中 finally 抛出新异常覆盖原始异常。
- 011_RUNTIME_error_propagation_two_levels_no_catch: 规则3扩展 — C 层 try-finally 抛出异常（无 catch），经 B 层（无 try-catch）传播到 A 层（main）被 catch 捕获，验证消息为 "deep error"。
- 012_RUNTIME_error_propagation_three_levels_no_catch: 规则3扩展 — D 层 try-finally 抛出异常（无 catch），经 C、B 两层（均无防护）传播到 A 层 catch 捕获，验证消息为 "triple-level error"。

#### 3.3.4 规则4: finally 异常完成
- 013_RUNTIME_finally_abrupt_overrides_catch_normal_v2: 规则4扩展 — finally 异常完成覆盖 catch 正常完成。验证两种场景: 内联 try-catch-finally（catch 执行后被 finally 异常覆盖）、辅助函数调用跨函数 finally 异常传播。同时验证 catch 体确实执行过。
- 015_RUNTIME_try_normal_finally_abrupt: 规则4扩展 — try 块正常完成（无异常），finally 子句异常完成导致整个 try 语句异常完成。验证三种场景: try-finally（无 catch）try 正常 finally 抛异常、辅助函数调用的跨函数传播、try-catch-finally 中 try 正常 catch 不执行但 finally 抛异常。

## 4. 边界值与异常场景 (Boundary & Exception)

### 4.1 边界值
- try 块中抛出 Error 基类对象
- try 块中抛出自定义错误类型
- catch 块正常完成（无 return/throw）
- catch 块异常完成（包含 throw，重新抛出异常）
- finally 块正常完成（无 return/throw）
- finally 块异常完成（包含 throw 覆盖所有前置结果）
- try 块正常完成 + finally 异常完成（catch 存在但未执行）

### 4.2 异常场景
- 规则1: try 块无异常时 catch 不执行，finally 执行
- 规则2: catch 体正常完成 vs catch 体异常完成（catch 自身抛出取代原始异常）
- 规则3: 异常跨函数传播（try-finally 函数到调用者 catch）
- 规则3扩展: 异常沿两级调用链传播（C -> B -> A）
- 规则3扩展: 异常沿三级调用链传播（D -> C -> B -> A）
- 规则4: finally 中抛出新异常覆盖 catch 处理的原始异常
- 规则4扩展: try 正常完成但 finally 抛异常，导致整体异常完成（catch 未被触发）
- 规则4扩展: finally 异常完成时 catch 确实执行过的前置验证
- 多层嵌套 try 语句的异常传播

## 5. 文件命名规范 (File Naming Convention)
- 前缀: STMT_08_15_3_
- 编号: 三位数字 (001 ~ 015)
- 后缀: PASS / FAIL / RUNTIME
- 描述: 简短英文描述
- 格式: STMT_08_15_3_XXX_{PASS|FAIL|RUNTIME}_description.ets

## 6. 文件清单 (File Inventory)

### 6.1 compile-pass (4 files)
- STMT_08_15_3_001_PASS_try_block_normal_completion.ets
- STMT_08_15_3_002_PASS_try_catch_error_handled.ets
- STMT_08_15_3_003_PASS_error_propagated_no_catch.ets
- STMT_08_15_3_004_PASS_finally_abrupt_completion.ets

### 6.2 compile-fail (3 files)
- STMT_08_15_3_005_FAIL_try_no_catch_no_finally.ets
- STMT_08_15_3_006_FAIL_try_catch_local_class.ets
- STMT_08_15_3_007_FAIL_try_finally_nested_function.ets

### 6.3 runtime (8 files)
- STMT_08_15_3_008_RUNTIME_try_normal_completion.ets
- STMT_08_15_3_009_RUNTIME_try_catch_normal_completion.ets
- STMT_08_15_3_010_RUNTIME_error_propagated_and_finally_abrupt.ets
- STMT_08_15_3_011_RUNTIME_error_propagation_two_levels_no_catch.ets
- STMT_08_15_3_012_RUNTIME_error_propagation_three_levels_no_catch.ets
- STMT_08_15_3_013_RUNTIME_finally_abrupt_overrides_catch_normal_v2.ets
- STMT_08_15_3_014_RUNTIME_catch_body_abrupt_completion.ets
- STMT_08_15_3_015_RUNTIME_try_normal_finally_abrupt.ets

## 7. 覆盖矩阵 (Coverage Matrix)

| 规则 | compile-pass | compile-fail | runtime | 说明 |
|------|-------------|-------------|---------|------|
| Rule 1 (try正常完成) | 001 | - | 008 | try 无异常，catch 不执行 |
| Rule 2 (catch捕获) | 002 | - | 009, 014 | catch 正常完成 + catch 自身异常完成 |
| Rule 3 (异常传播) | 003 | - | 010, 011, 012 | 单级/两级/三级调用链传播 |
| Rule 4 (finally异常) | 004 | - | 010, 013, 015 | finally 覆盖 catch + finally 覆盖正常 try |
| 语法约束 | - | 005, 006, 007 | - | 必须有 catch/finally；禁止局部类/嵌套函数 |
