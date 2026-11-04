# 17.8 Statements - 测试设计思维导图

## 概述
17.8 是一个上下文章节，不引入新的语句类型。它作为 §17.8.1（For-of with explicit type annotation）的上下文存在。测试范围覆盖 ArkTS 中标准语句形式的编译通过性、编译失败边界条件，以及运行时行为验证。

根据 ArkTS Static Language Specification，ArkTS 支持以下标准语句类型：
- **条件语句**: if / if-else
- **循环语句**: while, do-while, for, for-of, for-in
- **分支语句**: switch (含 break/fall-through)
- **跳转语句**: break, continue, return
- **异常处理**: throw, try-catch-finally

## 子规则完整枚举

### 1. 条件语句（if / if-else）
- **正向编译**: if 单分支、if-else 双分支、if-else if-else 多分支、嵌套 if
- **反向编译**: 无对应场景（if 语句是基础能力，无 spec 限制）
- **运行时**: 条件分支正确执行、布尔表达式短路求值

### 2. 循环语句（while / do-while）
- **正向编译**: while 循环、do-while 循环、循环中的布尔条件
- **反向编译**: 无对应场景
- **运行时**: while 循环正确迭代、do-while 至少执行一次

### 3. 标准 for 循环
- **正向编译**: for(init; cond; update) 标准形式、空初始化和更新子句
- **反向编译**: 无对应场景
- **运行时**: for 循环正确迭代指定次数

### 4. for-of 循环（数组和字符串迭代）
- **正向编译**: for-of 遍历数组、for-of 遍历字符串、与 17.6 Iterable Types 的衔接
- **反向编译**: 无对应场景
- **运行时**: 数组元素按顺序迭代、字符串字符按顺序迭代

### 5. switch 语句
- **正向编译**: switch 整数匹配、switch 字符串匹配、含 default 分支、含 break 阻断
- **反向编译**: 无对应场景
- **运行时**: switch 正确匹配分支、break 正确阻断 fall-through

### 6. 跳转语句（break / continue）
- **正向编译**: break 跳出循环、continue 跳过当前迭代、在 while/for 中使用
- **反向编译**: break 在循环外使用、continue 在循环外使用
- **运行时**: break 正确跳出循环、continue 正确跳过迭代

### 7. return 语句
- **正向编译**: void 函数 return（无值）、有返回值函数 return 表达式
- **反向编译**: void 函数 return 值、有返回值函数 return 时无表达式
- **运行时**: return 正确的值、void 函数正常返回

### 8. 异常处理（throw / try-catch-finally）
- **正向编译**: throw 抛出异常、try-catch 捕获、try-finally 清理、try-catch-finally
- **反向编译**: 无对应场景（基础能力）
- **运行时**: 异常正确抛出和捕获、finally 必定执行

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | if-else 多分支语句 | 编译通过 |
| compile-pass | while 循环 | 编译通过 |
| compile-pass | do-while 循环 | 编译通过 |
| compile-pass | 标准 for 循环 | 编译通过 |
| compile-pass | for-of 遍历数组 | 编译通过 |
| compile-pass | for-of 遍历字符串 | 编译通过 |
| compile-pass | switch 语句（整数/字符串） | 编译通过 |
| compile-pass | break/continue 在循环中 | 编译通过 |
| compile-pass | return 语句 | 编译通过 |
| compile-pass | try-catch-finally | 编译通过 |
| compile-fail | break 在循环外使用 | 编译错误 |
| compile-fail | continue 在循环外使用 | 编译错误 |
| runtime | 循环执行计数验证 | 运行时通过 |
| runtime | for-of 数组迭代验证 | 运行时通过 |
| runtime | switch 分支匹配验证 | 运行时通过 |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_08_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS (001-010), FAIL (011-012), RUNTIME (013-015)
