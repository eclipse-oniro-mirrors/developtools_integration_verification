# 8.15.1 catch 子句 - 测试设计思维导图

## 概述
本节定义 ArkTS 的 **catch 子句 (catch Clause)**。catch 子句由两部分组成：catch 标识符 + 处理程序块。catch 块内标识符类型固定为 **Error**，提供对抛出的 Error 对象的访问。在运行时，catch 块处理所有错误；使用 `instanceof` 可在块内区分特定错误子类型。

## 核心约束
- catch 参数类型 **必须是 Error**，禁止类型注解为非 Error 类型（string / number / boolean / object 等）
- catch 变量作用域 **仅限于 catch 块内**
- 通过 `instanceof` 对 Error 子类型（RangeError、TypeError、SyntaxError 等）进行**类型收窄**
- Error 标准属性：`message: string`、`name: string`、`stack: string | undefined`

## 测试点覆盖

### compile-pass
1. 基本 try-catch 结构：try 块 + catch (e) 块，标识符 e 类型为 Error
2. catch 块内访问 Error 对象基本属性：`e.message`、`e.name`、`e.stack`，并赋值给正确类型的变量
3. try-catch-finally 完整三部分结构：catch 捕获 Error 后 finally 确保执行清理
4. catch 块内使用 `instanceof` 对两个 Error 子类型（RangeError / TypeError）进行类型收窄，各分支访问 e.message
5. catch 块内使用 `instanceof` 对三个以上 Error 子类型（RangeError / TypeError / SyntaxError）进行类型收窄
6. catch 块内条件检查后重新抛出捕获的 Error 对象（throw e）
7. catch 块根据 `instanceof` 判断原始错误类型后，构造并抛出新的不同 Error 类型（错误转换，如 RangeError --> TypeError）

### compile-fail
1. catch 参数类型注解为 string 产生编译错误
2. catch 参数类型注解为 number 产生编译错误
3. catch 参数类型注解为 boolean 产生编译错误
4. catch 参数类型注解为 object 产生编译错误

### runtime
1. 基本异常捕获：throw new Error("msg") 后 catch 块执行，验证 `e.message` 值与抛出值一致
2. instanceof 类型区分：依次抛出 RangeError / TypeError，catch 内 instanceof 正确分流并验证分支标识
3. catch 块内重新抛出：内层 catch 条件满足后 throw inner，外层 catch 正确捕获并验证 message 一致
4. 错误转换：内层抛出 RangeError，catch 转换为新 TypeError(newMessage)，外层 catch 捕获 TypeError 并验证转换后消息
5. 多个 Error 子类 instanceof：依次抛出 RangeError / TypeError / Error，各 catch 内 instanceof 独立验证分支命中
6. catch 根据 instanceof 类型收窄返回不同值：自定义 ZeroDivisor 子类返回 -1，其余 Error 返回 0，正常路径返回计算结果

## 边界值和异常场景
- **try 块未抛出异常时**：catch 块不执行，程序继续正常执行
- **catch 变量作用域**：catch 标识符 e 仅在 catch 块内有效，块外不可访问
- **空 catch 块**：catch 后仅有块体不处理，语法合法但在真实场景中不推荐
- **catch 不重新抛出**：错误被处理，程序继续正常执行（不传播到外层）
- **嵌套错误转换**：内层 catch 重新抛出的不同 Error 类型被外层 catch 通过 instanceof 正确识别
- **finally 执行保证**：无论 catch 是否执行，finally 块均执行（在 003 中覆盖）
- **自定义 Error 子类**：通过 extends Error 创建自定义错误类型，instanceof 可正确识别

## 编号规划
- compile-pass: 001 ~ 007（共 7 个）
- compile-fail: 008 ~ 011（共 4 个）
- runtime: 012 ~ 017（共 6 个）
- **总计**: 7P + 4F + 6R = 17

## 文件命名规范
`STMT_08_15_1_{NNN}_{CATEGORY}_{DESCRIPTION}.ets`
- {NNN}: 三位编号，从 001 开始跨分类连续编号（部分编号有跳跃以预留扩展空间）
- {CATEGORY}: PASS（编译通过）| FAIL（编译失败）| RUNTIME（运行时）
- {DESCRIPTION}: 蛇形命名的测试场景简述

## 文件清单

### 编译通过 (PASS)
| 编号 | 文件名 | 测试点描述 |
|------|--------|-----------|
| 001 | STMT_08_15_1_001_PASS_basic_catch.ets | 基本 try-catch 语法结构，catch (e) 捕获 Error |
| 002 | STMT_08_15_1_002_PASS_catch_instanceof.ets | catch 内 instanceof 对 RangeError / TypeError 类型收窄 |
| 003 | STMT_08_15_1_003_PASS_catch_finally.ets | try-catch-finally 完整三部分结构 |
| 004 | STMT_08_15_1_004_PASS_catch_rethrow.ets | catch 内条件检查后重新抛出（throw e） |
| 005 | STMT_08_15_1_005_PASS_catch_error_properties.ets | catch 内访问 Error 属性 message / name / stack |
| 015 | STMT_08_15_1_015_PASS_catch_multiple_subclasses.ets | instanceof 区分 3+ 个 Error 子类型（RangeError / TypeError / SyntaxError） |
| 016 | STMT_08_15_1_016_PASS_catch_throw_translated_error.ets | catch 捕获后转换抛出新的 Error 类型（RangeError --> TypeError） |

### 编译失败 (FAIL)
| 编号 | 文件名 | 测试点描述 |
|------|--------|-----------|
| 006 | STMT_08_15_1_006_FAIL_catch_wrong_type_string.ets | catch 参数类型注解为 string，编译失败 |
| 007 | STMT_08_15_1_007_FAIL_catch_type_annotation_number.ets | catch 参数类型注解为 number，编译失败 |
| 008 | STMT_08_15_1_008_FAIL_catch_type_annotation_boolean.ets | catch 参数类型注解为 boolean，编译失败 |
| 017 | STMT_08_15_1_017_FAIL_catch_type_annotation_object.ets | catch 参数类型注解为 object，编译失败 |

### 运行时 (RUNTIME)
| 编号 | 文件名 | 测试点描述 |
|------|--------|-----------|
| 009 | STMT_08_15_1_009_RUNTIME_basic_catch.ets | 基本捕获验证：catch 块执行并校验 e.message 正确 |
| 010 | STMT_08_15_1_010_RUNTIME_instanceof.ets | instanceof 类型区分：RangeError / TypeError 分流验证 |
| 011 | STMT_08_15_1_011_RUNTIME_rethrow.ets | 内层 catch 抛出，外层 catch 捕获并校验 message |
| 012 | STMT_08_15_1_012_RUNTIME_error_translation.ets | 错误转换：RangeError 转为 TypeError，外层捕获并校验转换后消息 |
| 013 | STMT_08_15_1_013_RUNTIME_multiple_instanceof_subclasses.ets | 多子类 instanceof：依次抛出 RangeError / TypeError / Error 独立验证 |
| 014 | STMT_08_15_1_014_RUNTIME_catch_return_value.ets | catch 按 instanceof 类型收窄返回不同值（ZeroDivisor -> -1, other -> 0） |
