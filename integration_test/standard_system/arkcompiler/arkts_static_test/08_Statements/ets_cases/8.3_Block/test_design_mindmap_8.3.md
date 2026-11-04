# 8.3 块语句 测试设计思维导图

## 1. 规格定义
- Block 是由 {} 包裹的语句序列
- 语法规则: block: '{' statement* '}'
- 语句按照文本顺序依次执行
- 执行遇到 throw error 或 return 时停止
- 若 block 为 void 函数/方法体，可不含 return 语句（隐式返回）
- 块内的类型声明不作为语句执行
- 块内声明的 let/const 变量作用域限定在块内，块结束后不可见（块作用域）

## 2. 测试点分类

### 2.1 编译通过 (compile-pass) — 6P

- **基本块语句** - 多个语句按顺序执行
  - 赋值语句
  - 表达式语句
  - 变量声明
  - 函数调用
  - if/for/while 等控制流语句

- **嵌套块语句** - 块中嵌套块
  - 两层嵌套
  - 多层嵌套
  - 空块嵌套

- **void 函数体隐式返回**
  - void 函数无 return 语句
  - void 函数仅有 return; 无返回值

- **块中包含类型声明**
  - 块内 interface 声明（编译时不执行）
  - 块内 type alias 声明

- **空块**
  - {}
  - 块内仅有注释

- **块作用域变量生命周期**
  - 块内声明的 let 变量在块结束后不可见
  - 块结束后可在同一作用域重新声明同名变量
  - 多个顺序块可声明同名变量，互不干扰
  - 块内变量可独立于外层作用域变量

### 2.2 编译失败 (compile-fail) — 4F

- **块内嵌套函数声明**
  - function foo() { function bar() {} } 不应通过

- **块内声明类**
  - { class Foo {} } 不应通过

- **块内声明类型别名**
  - { type MyType = int } 不应通过

- **块外访问块内变量**
  - 块内声明的 let 变量在块外引用应产生编译错误
  - 嵌套块内层变量在外层引用应产生编译错误
  - 块内变量在块外表达式中使用应产生编译错误

### 2.3 运行时 (runtime) — 5R

- **块语句执行顺序**
  - 多个赋值语句按文本顺序执行
  - 前后变量值可验证

- **抛出异常时停止执行**
  - 块中 throw 后语句不执行
  - try-catch 包装验证

- **多层嵌套变量遮蔽与恢复**
  - 4 层级嵌套块中声明同名变量，验证每层的遮蔽效果
  - 块退出后外层变量恢复为进入前的值（不变）
  - 块内对遮蔽变量的修改不影响外层同名变量

- **throw 从嵌套块中间位置退出**
  - throw 后同一块内后续语句不执行
  - throw 跳出所有嵌套块，后续外层块语句不执行
  - 控制权转移到最近的 try-catch
  - catch 处理后，同层级的后续语句正常恢复执行

- **return 从嵌套块提前退出函数**
  - void 函数中深层嵌套块内的 return 终止整个函数执行
  - return 之后同一块、外层块、函数体后续语句均不执行
  - return 位于嵌套块内的 if 条件分支中
  - 验证 return 不触发时（条件不满足）正常执行完整路径

## 3. 边界值和异常场景
- 空块 `{}`
- 块中仅有注释 `{ /* comment */ }`
- 块中仅有类型声明（不作为语句执行）
- 深层嵌套块（>3层）
- 块中混合多种语句类型
- 块中 return 提前终止
- 块中 throw 提前终止
- 块作用域变量生命周期：块内声明后，块外不可见，同名变量可重新声明
- 多层变量遮蔽：同名 let 变量在嵌套块中逐层遮蔽，退出后逐层恢复
- throw 从深层嵌套退出：验证 throw 跨越多个块边界，后续代码均不执行
- return 从深层嵌套退出：验证 return 跨越多个块边界终止函数，未触发时正常执行
- 块内 throw 被同层 catch 捕获后，同一块内后续语句恢复执行

## 4. 文件命名规范
- 前缀: STMT_08_03_
- 编译通过: STMT_08_03_001_PASS_xxx.ets ~ STMT_08_03_011_PASS_xxx.ets
- 编译失败: STMT_08_03_006_FAIL_xxx.ets ~ STMT_08_03_012_FAIL_xxx.ets
- 运行时:   STMT_08_03_009_RUNTIME_xxx.ets ~ STMT_08_03_015_RUNTIME_xxx.ets
- 文件路径:
  - compile-pass/: /home/nnd/projects/arkts/ARKTS_STATIC_TEST/08_Statements/ets_cases/8.3_Block/compile-pass/
  - compile-fail/: /home/nnd/projects/arkts/ARKTS_STATIC_TEST/08_Statements/ets_cases/8.3_Block/compile-fail/
  - runtime/:   /home/nnd/projects/arkts/ARKTS_STATIC_TEST/08_Statements/ets_cases/8.3_Block/runtime/

## 5. 用例列表

| 编号 | 文件名 | 分类 | 测试内容 |
|------|--------|------|----------|
| 001 | STMT_08_03_001_PASS_basic_block.ets | compile-pass | 基本块语句，多语句按顺序执行 |
| 002 | STMT_08_03_002_PASS_nested_blocks.ets | compile-pass | 嵌套块语句 |
| 003 | STMT_08_03_003_PASS_void_function_body.ets | compile-pass | void 函数体隐式返回 |
| 004 | STMT_08_03_004_PASS_block_type_declarations.ets | compile-pass | 块内包含类型声明 |
| 005 | STMT_08_03_005_PASS_empty_block.ets | compile-pass | 空块/注释块 |
| 006 | STMT_08_03_006_FAIL_nested_function_in_block.ets | compile-fail | 块内声明嵌套函数 |
| 007 | STMT_08_03_007_FAIL_local_class_in_block.ets | compile-fail | 块内声明局部类 |
| 008 | STMT_08_03_008_FAIL_local_type_alias_in_block.ets | compile-fail | 块内声明类型别名 |
| 009 | STMT_08_03_009_RUNTIME_block_execution_order.ets | runtime | 块语句执行顺序验证 |
| 010 | STMT_08_03_010_RUNTIME_block_throw_error.ets | runtime | 块中抛出异常停止执行 |
| 011 | STMT_08_03_011_PASS_redeclare_var_after_block.ets | compile-pass | 块作用域变量生命周期：块结束后同名变量可重新声明 |
| 012 | STMT_08_03_012_FAIL_access_block_var_outside.ets | compile-fail | 块外访问块内声明的变量，违反块作用域 |
| 013 | STMT_08_03_013_RUNTIME_multi_level_shadowing.ets | runtime | 多层嵌套块变量遮蔽与逐层恢复（4层） |
| 014 | STMT_08_03_014_RUNTIME_throw_exit_nested_block.ets | runtime | throw 从嵌套块中间退出，跨块边界传播到 catch |
| 015 | STMT_08_03_015_RUNTIME_return_from_nested_block.ets | runtime | void 函数中深层嵌套块内 return 提前终止函数 |
