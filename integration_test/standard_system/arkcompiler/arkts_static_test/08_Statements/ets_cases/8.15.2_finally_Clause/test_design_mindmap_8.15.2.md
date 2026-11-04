# 8.15.2 finally 子句 测试设计思维导图

## 1. 规范定义
- **8.15.2 finally Clause**
- finallyClause: 'finally' 后跟 block
- 无论正常完成还是异常完成，finally 块始终执行
- 即使 try 或 catch 中有 return 或抛出新错误，finally 仍执行
- 适用于资源管理（关闭文件、刷新缓冲区）

## 2. 测试点分类

### 2.1 编译通过 (compile-pass) — 8 cases
- **基本 try-catch-finally 正常流程** (001)
  - try 块正常执行完成
  - catch 块不触发
  - finally 块在 try 之后执行
  - 验证 finally 确实执行
- **catch 异常后 finally 执行** (002)
  - try 块抛出异常
  - catch 块捕获处理
  - finally 块仍然执行
  - 验证 try-catch-finally 三者协作
- **return 后 finally 执行** (003)
  - try 块中包含 return 语句
  - finally 在 return 之前执行
  - 验证 return+finally 的编译正确性
- **无 catch 的 try-finally** (004)
  - 只有 try 和 finally，没有 catch
  - try 正常完成
  - finally 执行
  - 验证简化的 try-finally 语法
- **嵌套 try-catch-finally** (005)
  - 外层 try 包含内层 try-catch-finally
  - 内层 finally 执行后外层 finally 仍执行
  - 验证多层嵌套场景的编译正确性
- **finally 块内抛出异常** (012)
  - finally 块中使用 throw 语句
  - 带 catch 的 try-catch-finally 中 finally 抛出异常
  - 不带 catch 的 try-finally 中 finally 抛出异常
  - 验证 finally 中 throw 是合法语法
- **finally 块中 return 覆盖** (013)
  - finally 块中包含 return 语句
  - finally 的 return 覆盖 try 块的 return
  - finally 的 return 覆盖 catch 块的 return
  - 验证 finally 中 return 是合法语法
- **循环内 finally 与 break/continue** (014)
  - while 循环内 try-finally 配合 break 跳转
  - while 循环内 try-finally 配合 continue 跳转
  - 内层 try-finally 中使用 break 跳出外层循环
  - 验证 finally 在循环控制流中的合法语法

### 2.2 编译失败 (compile-fail) — 3 cases
- **finally 中使用保留关键字作为变量名** (006)
  - 使用 "string" 等内置关键字名
  - 违反 ArkTS 标识符约束
- **finally 块中定义局部类** (007)
  - finally 作用域内定义 class
  - 违反 ArkTS 无局部类约束
- **finally 块中嵌套函数** (008)
  - finally 作用域内使用 function 关键字定义嵌套函数
  - 违反 ArkTS 无嵌套函数约束

### 2.3 运行时验证 (runtime) — 7 cases
- **finally 始终执行验证** (009)
  - try 正常完成 -> finally 执行
  - try 异常完成 -> catch + finally 执行
  - 使用 boolean 标记验证 finally 代码路径确实运行
- **finally 在 return 之后仍执行** (010)
  - try 块中有 return 语句，finally 在返回前执行
  - catch 块中有 return 语句，finally 在返回前执行
  - 验证 finally 执行时机在方法返回之前
- **catch 抛出新错误后 finally 仍执行** (011)
  - catch 块中抛出新错误
  - finally 在新错误传播之前执行
  - 外层 catch 捕获重新抛出的错误
  - 验证异常路径下 finally 语义正确
- **finally 块中抛出异常覆盖原异常** (015)
  - finally 中 throw 覆盖 try 正常完成的结果
  - finally 中 throw 覆盖 try 中抛出的原异常
  - finally 中 throw 覆盖 catch 中抛出的异常
  - 验证 finally 新异常能正确向上传播
- **finally 中 return 覆盖 try/catch 的 return** (016)
  - finally 中 return 覆盖 try 块 return 值（100 -> 200）
  - finally 中 return 覆盖 catch 块 return 值（300 -> 400）
  - finally 修改变量后 return 覆盖 try 的 return 值
  - 验证 finally 的 return 优先语义
- **循环内 finally 在 break 时执行** (017)
  - while 循环每次迭代 finally 都执行
  - break 触发当次迭代的 finally 仍执行
  - 内层 try-finally break 时 finally 执行次数验证
  - 验证 finally 在 break 将控制权转移前保证执行
- **循环内 finally 在 continue 时执行** (018)
  - while 循环每次迭代 finally 都执行（共10次迭代验证10次）
  - continue 触发当次 finally 仍执行
  - 字符串追踪器验证执行顺序：continue 跳过后置代码但 finally 仍运行
  - 验证 finally 在 continue 转移控制权前保证执行

## 3. 边界值及异常场景
- finally 块为空（无实际操作）
- finally 块嵌套多层（多层作用域叠加）
- try 和 catch 都包含 return（finally 无 return 时返回 catch 值）
- try 不抛异常但 finally 抛出异常（覆盖正常完成）
- catch 抛新异常后 finally 再抛异常（finally 异常覆盖 catch 异常）
- finally 中使用 break/continue（需在循环内才有意义）
- finally 中 return 覆盖语义（编译器允许，运行时生效）

## 4. 文件命名规范
- STMT_08_15_2_001_PASS_basic_finally.ets — 基本 finally 使用（编译通过）
- STMT_08_15_2_002_PASS_finally_after_catch.ets — catch 后 finally 执行（编译通过）
- STMT_08_15_2_003_PASS_finally_after_return.ets — return 后 finally 执行（编译通过）
- STMT_08_15_2_004_PASS_finally_no_catch.ets — 无 catch 的 try-finally（编译通过）
- STMT_08_15_2_005_PASS_finally_nested.ets — 嵌套 finally（编译通过）
- STMT_08_15_2_006_FAIL_finally_reserved_word.ets — 保留关键字作变量名（编译失败）
- STMT_08_15_2_007_FAIL_finally_local_class.ets — 局部类（编译失败）
- STMT_08_15_2_008_FAIL_finally_nested_func.ets — 嵌套函数（编译失败）
- STMT_08_15_2_009_RUNTIME_finally_executes.ets — finally 执行验证（运行时）
- STMT_08_15_2_010_RUNTIME_finally_with_return.ets — return 时 finally 执行（运行时）
- STMT_08_15_2_011_RUNTIME_finally_with_error.ets — catch 抛新异常时 finally 执行（运行时）
- STMT_08_15_2_012_PASS_finally_throw_inside.ets — finally 块内抛异常（编译通过）
- STMT_08_15_2_013_PASS_finally_return_override.ets — finally 中 return 覆盖（编译通过）
- STMT_08_15_2_014_PASS_finally_loop_break_continue.ets — 循环内 finally + break/continue（编译通过）
- STMT_08_15_2_015_RUNTIME_finally_throw_inside.ets — finally 抛异常覆盖原异常（运行时）
- STMT_08_15_2_016_RUNTIME_finally_return_override.ets — finally return 覆盖验证（运行时）
- STMT_08_15_2_017_RUNTIME_finally_loop_break.ets — 循环内 break 时 finally 执行（运行时）
- STMT_08_15_2_018_RUNTIME_finally_loop_continue.ets — 循环内 continue 时 finally 执行（运行时）

## 5. 断言策略
- 编译通过：使用 console.log 输出，无语法错误
- 编译失败：使用保留关键字、局部类、嵌套函数等触发编译错误
- 运行时：使用 if(actual != expected) throw new Error("msg") 断言
- 每条测试用例末尾使用 console.log("verified") 标记测试通过

## 6. 覆盖率汇总
| 类别 | 用例数 | 编号范围 |
|------|--------|----------|
| compile-pass | 8 | 001-005, 012-014 |
| compile-fail | 3 | 006-008 |
| runtime | 7 | 009-011, 015-018 |
| **总计** | **18** | 001-018 |
