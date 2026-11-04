# 8.9 for-of 语句 - 测试设计思维导图

## 概述
本节定义 ArkTS 的 **for-of 语句**，语法为 `forOfStatement: 'for' '(' forVariable 'of' expression ')' statement`。核心约束：`expression` 必须是可迭代类型（iterable type），否则编译时错误。

## 可迭代类型集合

| 类型 | 元素类型推断 | 说明 |
|------|-------------|------|
| Array\<T\> | T | 标准数组 |
| ResizableArray\<T\>（T[] 语法） | T | 可变长数组 |
| FixedArray\<T\> | T | 定长数组 |
| string | string | 字符串遍历单个字符 |
| 实现 Iterable\<T\> 接口的类/接口 | T | 自定义可迭代类型 |

## forVariable 声明规则

### 循环内声明（let / const）
- `let`: 可在循环体内修改 forVariable
- `const`: 禁止在循环体内对 forVariable 赋值，否则编译时错误
- 类型推断规则：由 expression 的元素类型决定
- 显式类型注解（实验特性）：允许 `for (let x: int of arr)` 或 `for (const x: int of arr)`，类型注解必须与推断类型一致

### 外部声明变量
- 变量在循环外声明，for-of 中直接引用
- 迭代元素类型必须可赋值给变量类型，否则编译时错误

## 测试点覆盖

### compile-pass（10 个）

| 编号 | 测试点 | 说明 |
|------|--------|------|
| 001 | Array\<T\> for-of 基本迭代 | 遍历 Array\<int\>，元素类型推断为 int，循环体内求和 |
| 002 | string for-of | 遍历 string，元素类型推断为 string（单字符），循环体内拼接 |
| 003 | let 修饰符可修改 | let 声明 forVariable，循环体内可重新赋值（每次迭代重置为当前元素） |
| 004 | 外部声明变量 | 变量在循环外声明（类型 int），遍历 Array\<int\>，元素类型可赋值给变量类型 |
| 005 | FixedArray\<T\> for-of | 遍历 FixedArray\<int\>，元素类型推断为 int，FixedArray 属于可迭代数组类型 |
| 013 | const + 显式类型注解 | const 声明 forVariable 附加类型注解（`: int`），const 禁止赋值但可只读访问 |
| 014 | let + 显式类型注解 | let 声明 forVariable 附加类型注解（`: int`），循环体内可修改，类型注解与推断类型一致 |
| 015 | 嵌套 for-of | 外层遍历 Array\<Array\<int\>\>，外层元素类型推断为 Array\<int\>，内层元素类型推断为 int |
| 020 | const 无类型注解 | const 声明 forVariable（无类型注解），禁止在循环体内赋值，只读访问元素值，类型正确推断 |
| 021 | ResizableArray\<T\> for-of | 遍历 `int[]`（ResizableArray\<int\>），元素类型推断为 int，ResizableArray 属于可迭代数组类型 |

### compile-fail（6 个）

| 编号 | 测试点 | 预期错误 |
|------|--------|----------|
| 006 | 非可迭代类型 int 字面量 | int 类型不可迭代，编译时错误 |
| 007 | 外部变量类型不匹配（string→int） | 遍历 string 时元素类型 string 不能赋值给 int 变量 |
| 008 | const 变量赋值 | const 声明的 forVariable 在循环体内赋值，编译时错误 |
| 009 | 未实现 Iterable 的自定义类 | NonIterable 类未实现 Iterable 接口，不可迭代，编译时错误 |
| 019 | 外部变量 int 与 Array\<string\> 不匹配 | Array\<string\> 元素类型 string 不能赋值给外部变量类型 int |
| 023 | 外部变量 string 与 Array\<int\> 不匹配 | Array\<int\> 元素类型 int 不能赋值给外部变量类型 string |

### runtime（7 个）

| 编号 | 测试点 | 验证内容 |
|------|--------|----------|
| 010 | Array\<int\> 迭代 | 元素求和正确（sum=60），迭代次数正确（count=3） |
| 011 | string 迭代 | 字符拼接正确（result="abc"），迭代次数正确（count=3） |
| 012 | 外部变量迭代 | 外部变量正确接收每个元素值，求和正确（sum=15），末元素值正确（elem=5） |
| 016 | break / continue 控制流 | break 在第3个元素提前退出（sumBreak=3, countBreak=3）；continue 跳过偶数（sumContinue=9, countContinue=5） |
| 017 | FixedArray\<int\> 迭代 | 求和正确（sum=60），迭代次数正确（count=3），FixedArray 可被 for-of 正确遍历 |
| 018 | 迭代中修改数组元素值 | 迭代过程中修改 arr[0]=99，迭代次数不变（5次），求和基于原始 snapshot（sum=15），修改后 arr[0]=99 |
| 022 | 空数组迭代 | 空数组 for-of 循环体执行 0 次（count=0），不抛异常 |

## 边界与异常场景

- **空数组/空字符串迭代**: 循环体不执行，迭代次数为 0（覆盖 022）
- **const 变量赋值**: 循环体内对 const forVariable 赋值，编译时错误（覆盖 008）
- **非可迭代对象**: int、未实现 Iterable 的自定义类，使用 for-of 编译时错误（覆盖 006, 009）
- **类型不匹配**: 外部变量类型与迭代元素类型不一致，编译时错误（覆盖 007, 019, 023）
- **嵌套迭代**: 多层 for-of 嵌套，类型推断链正确（覆盖 015）
- **控制流中断**: break 提前退出循环，continue 跳过当前迭代（覆盖 016）
- **迭代中修改数组**: 修改元素值（非增删）不影响迭代次数和当前迭代 snapshot（覆盖 018）
- **类型注解**: 允许显式类型注解（let/const 均可），类型注解必须与推断类型一致（覆盖 013, 014）

## 编号规划

- compile-pass: 001, 002, 003, 004, 005, 013, 014, 015, 020, 021
- compile-fail: 006, 007, 008, 009, 019, 023
- runtime: 010, 011, 012, 016, 017, 018, 022

## 文件命名规范

- 前缀: `STMT_08_09_`
- compile-pass: `STMT_08_09_NNN_PASS_描述.ets`
- compile-fail: `STMT_08_09_NNN_FAIL_描述.ets`
- runtime: `STMT_08_09_NNN_RUNTIME_描述.ets`
- 全局编号统一递增（001~023），不按类别分组
