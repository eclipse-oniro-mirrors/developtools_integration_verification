# 17.4 Resizable Array Creation Expressions - 测试设计思维导图

## 概述
Resizable Array Creation Expressions 是 ArkTS 实验特性，用于创建可调整大小的数组实例。语法：`new arrayElementType[dimensionExpression](arrayElement)`。编译时检查维度表达式类型（必须可赋值给 int）、维度常量值（不能为负）、元素类型（不能是类型参数）、元素表达式类型（必须可赋值给数组元素类型）。运行时维度为负则抛出 `NegativeArraySizeError`。

## 子规则完整枚举

### 1. 基本数组创建语法
- **正向编译**: `new number[3](7)` 创建 number 数组、`new int[5](0)` 创建 int 数组、`new string[3]("hello")` 创建 string 数组、`new double[4](3.14)` 创建 double 数组、`new boolean[2](true)` 创建 boolean 数组
- **反向编译**: 维度为负常量（`new number[-3](0)`）、维度为浮点常量（`new number[3.14](0)`）、维度为字符串（`new number["hello"](0)`）、维度为布尔（`new number[true](0)`）、维度为 null（`new number[null](0)`）
- **运行时**: 数组长度验证、元素初始化验证

### 2. 维度表达式类型约束
- **正向编译**: 维度为 int 类型变量、维度为可计算为正的表达式（如 `2 + 3`）
- **反向编译**: 维度类型不可赋值给 int（string、boolean、null、double 字面量）
- **运行时**: 维度为运行时负值抛出 `NegativeArraySizeError`

### 3. 数组元素类型约束
- **正向编译**: number、int、string、double、boolean、联合类型 `(Object|undefined)`、函数类型（通过 type alias）、数组类型（通过 type alias）
- **反向编译**: 元素类型为类型参数（`new T[2](element)`）、元素表达式不可赋值给数组元素类型（`new int[3]("string")`）
- **运行时**: 联合类型数组运行时行为、函数类型数组运行时行为

### 4. 联合类型与函数类型数组
- **正向编译**: `new (Object|undefined)[5](undefined)`、type Functor = () => void; `new Functor[3]((): void => {})`
- **反向编译**: 暂无额外反向用例
- **运行时**: 联合类型数组元素类型验证、函数类型数组元素可调用验证

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | new number[3](7) 基本创建 | 编译通过 |
| compile-pass | new int[5](0) 创建 int 数组 | 编译通过 |
| compile-pass | new string[3]("hello") 创建 string 数组 | 编译通过 |
| compile-pass | new double[4](3.14) 创建 double 数组 | 编译通过 |
| compile-pass | new boolean[2](true) 创建 boolean 数组 | 编译通过 |
| compile-pass | new (Object\|undefined)[5](undefined) 联合类型 | 编译通过 |
| compile-pass | type Functor = () => void; new Functor[3](lambda) | 编译通过 |
| compile-pass | 维度为 int 变量 | 编译通过 |
| compile-pass | 维度为表达式计算（正数） | 编译通过 |
| compile-fail | new number[-3](0) 负常量维度 | 编译错误 |
| compile-fail | new number[3.14](0) 浮点维度 | 编译错误 |
| compile-fail | new T[2](element) 类型参数 | 编译错误 |
| compile-fail | new int[3]("string") 元素类型不匹配 | 编译错误 |
| compile-fail | new number["hello"](0) 字符串维度 | 编译错误 |
| compile-fail | new number[true](0) 布尔维度 | 编译错误 |
| compile-fail | new number[null](0) null 维度 | 编译错误 |
| runtime | 数组长度验证 | 运行时通过 |
| runtime | 元素初始化验证 | 运行时通过 |
| runtime | 联合类型数组运行时 | 运行时通过 |
| runtime | 函数类型数组运行时 | 运行时通过 |
| runtime | 运行时负维度抛出 NegativeArraySizeError | 运行时通过 |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_04_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS (001-009), FAIL (010-016), RUNTIME (020-024)
