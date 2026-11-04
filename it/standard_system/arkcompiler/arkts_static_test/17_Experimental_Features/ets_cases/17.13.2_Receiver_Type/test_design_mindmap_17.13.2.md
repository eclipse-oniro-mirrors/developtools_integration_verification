# 17.13.2 Receiver Type - 测试设计思维导图

## 概述
接收者类型（Receiver Type）指函数/函数类型/lambda 中接收者参数的类型。接收者类型必须是接口类型、类类型或数组类型，否则产生编译时错误。

## 子类型覆盖

### 1. 合法接收者类型
- **类类型**: class 作为接收者类型
- **接口类型**: interface 作为接收者类型
- **数组类型**: T[] 作为接收者类型
- **泛型类**: 泛型类作为接收者类型
- **泛型接口**: 带类型参数的接口作为接收者类型

### 2. 非法接收者类型
- **原始类型**: int, string, number, boolean 等不能作为接收者类型
- **联合类型**: T1|T2 不能作为接收者类型
- **函数类型**: (params) => ReturnType 不能作为接收者类型
- **枚举类型**: enum 不能作为接收者类型

### 3. 数组接收者
- **正向编译**: number[] 作为接收者，操作数组元素
- **运行时**: 验证数组接收者函数正确执行

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 类类型作为接收者 | 编译通过 |
| compile-pass | 接口类型作为接收者 | 编译通过 |
| compile-pass | 数组类型作为接收者 (number[]) | 编译通过 |
| compile-pass | 数组接收者进行操作 | 编译通过 |
| compile-pass | 泛型类作为接收者类型 | 编译通过 |
| compile-pass | 泛型接口作为接收者类型 | 编译通过 |
| compile-fail | 原始类型作为接收者 (int) | 编译错误 |
| compile-fail | 原始类型作为接收者 (string) | 编译错误 |
| compile-fail | 联合类型作为接收者 | 编译错误 |
| compile-fail | 函数类型作为接收者 | 编译错误 |
| compile-fail | 枚举类型作为接收者 | 编译错误 |
| runtime | 数组接收者函数运行时验证 | 断言通过 |
| runtime | 类接收者函数运行时验证 | 断言通过 |
| runtime | 接口接收者函数运行时验证 | 断言通过 |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_13_2_NNN_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS 从 001 起，FAIL 接续，RUNTIME 接续
