# 17.4.1 Runtime Evaluation of Array Creation Expressions - 测试设计思维导图

## 概述
17.4.1 定义了数组创建表达式（array creation expression）的运行时求值顺序：
1. 维度表达式（dimension expression）首先被求值。如果求值异常终止，则数组创建表达式也异常终止。
2. 维度表达式的值被检查。如果值小于零，则抛出 `NegativeArraySizeError`。
3. 为新数组分配空间。如果可用空间不足，则抛出 `OutOfMemoryError`，数组创建表达式异常终止。
4. 然后创建一维数组，每个元素初始化为传入的值或通过 lambda 调用生成的值。

语法：`new arrayElementType[dimensionExpression] (arrayElement)`

编译期约束：
- 维度表达式类型必须可赋值给 `int` 类型，否则 compile-time error
- 如果维度表达式是能求值到负整数的常量表达式，则 compile-time error
- arrayElement 类型必须可赋值给 arrayElementType，否则 compile-time error

## 子规则完整枚举

### 1. 维度表达式求值（Dimension Expression Evaluation）
- **正向编译**: 使用字面量 int 维度、使用变量维度、维度表达式为运算表达式
- **反向编译**: 常量负维度表达式、float 类型维度表达式
- **运行时**: 变量负维度触发 NegativeArraySizeError、维度表达式仅求值一次（副作用测试）、维度在元素前求值

### 2. 正常数组创建（Normal Array Creation）
- **正向编译**: 基本类型数组创建、type alias 类型数组创建、零维度数组
- **反向编译**: 无对应场景（零维度编译后可能运行时通过）
- **运行时**: 正维度数组长度和元素验证、零维度空数组创建、大维度数组验证

### 3. 异常场景（Error Scenarios）
- **编译期**: 常量负维度 → compile-time error
- **编译期**: float 维度 → compile-time error（类型不匹配 int）
- **运行时**: 变量负维度 → NegativeArraySizeError

### 4. 边界场景（Edge Cases）
- **运行时**: 维度表达式带计算（如 2+3）、维度表达式仅求值一次

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 基本 int 数组创建 new int[5\](42) | 编译通过 |
| compile-pass | 变量维度数组创建 | 编译通过 |
| compile-pass | type alias 类型数组创建 | 编译通过 |
| compile-fail | 常量负维度 new int[-3\](0) | 编译错误 |
| compile-fail | float 维度 new int[3.14\](0) | 编译错误 |
| runtime | 正维度：验证 length 和所有元素值 | 运行时通过 |
| runtime | 零维度：验证空数组创建 | 运行时通过 |
| runtime | 变量负维度：验证 NegativeArraySizeError 抛出 | 运行时通过 |
| runtime | 维度表达式副作用：验证仅求值一次 | 运行时通过 |
| runtime | 大维度：new int[1000\](0) 验证 length | 运行时通过 |
| runtime | 维度表达式带计算：new int[2+3\](1) 验证 length=5 | 运行时通过 |
| runtime | 求值顺序：验证维度在元素前求值 | 运行时通过 |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_04_01_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS (001-003), FAIL (010-011), RUNTIME (020-026)
