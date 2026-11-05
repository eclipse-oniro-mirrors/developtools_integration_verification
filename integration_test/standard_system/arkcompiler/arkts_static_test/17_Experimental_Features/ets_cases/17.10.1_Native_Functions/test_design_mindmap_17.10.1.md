# 17.10.1 Native Functions - 测试设计思维导图

## 概述
`native` 关键字用于声明原生函数（Native Function）。原生函数没有函数体（body），其实现由平台相关代码（如 C 语言）提供。在编译期，原生函数必须有显式返回类型，且不能有函数体。

核心规则：
- 原生函数使用 `native function` 声明，无函数体
- 编译期错误：原生函数有函数体（block body）
- 编译期错误：原生函数有表达式体（expression body）
- 编译期错误：原生函数无显式返回类型
- 编译期错误：`native` + `async` 组合使用

## 子规则完整枚举

### 1. 基本原生函数声明
- **正向编译**: 声明基本 native function（无函数体）、带参数和返回类型的 native function、声明多个 native function（不同签名）
- **反向编译**: native function 带有函数体（{}）、native function 无显式返回类型
- **运行时**: 声明 native function 并运行（不实际调用），验证编译通过的 native function 可正常执行

### 2. 原生函数与泛型
- **正向编译**: native function 使用泛型类型参数 `native function foo<T>(a: T): T`
- **反向编译**: 无对应场景
- **运行时**: 无对应场景

### 3. 原生函数与导出
- **正向编译**: `export native function` 编译通过
- **反向编译**: 无对应场景
- **运行时**: 无对应场景

### 4. 原生函数修饰符组合
- **正向编译**: 单独的 `native` 修饰符
- **反向编译**: `native async` 组合（语法错误 "native flags must be used for functions only at top-level"）
- **运行时**: 无对应场景

### 5. 原生函数体形式
- **正向编译**: 无函数体（分号或直接结束）
- **反向编译**: block body `{ ... }`（ESE0083: "Native, Abstract and Declare methods cannot have body"）、expression body `= expr`（语法错误）
- **运行时**: 无对应场景

### 6. 原生函数的类型检查
- **正向编译**: 正确类型匹配使用
- **反向编译**: 返回类型与赋值目标类型不匹配（ESE0318: type mismatch）
- **运行时**: 调用未实现的 native function 触发 LinkerUnresolvedMethodError

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 基本 native function 声明 | 编译通过 |
| compile-pass | native function 带参数和返回类型 | 编译通过 |
| compile-pass | 多个 native function 不同签名 | 编译通过 |
| compile-pass | native function 泛型参数 | 编译通过 |
| compile-pass | export native function | 编译通过 |
| compile-fail | native function 带 block body | 编译错误 ESE0083 |
| compile-fail | native function 带 expression body | 编译错误（语法） |
| compile-fail | native + async 组合 | 编译错误 ESY0203 |
| compile-fail | native function 无显式返回类型 | 编译错误 ESE0018 |
| compile-fail | native function 返回类型不匹配 | 编译错误 ESE0318 |
| runtime | 声明 native function 正常运行 | 退出码 0 |
| runtime | 调用 native function 触发 LinkerUnresolvedMethodError | 运行时报错 |
| runtime | native function 与普通 function 共存 | 退出码 0 |

## 文件命名规范
- 前缀：`EXP2_`
- 格式：`EXP2_17_10_01_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS (001-005), FAIL (006-010), RUNTIME (011-013)
