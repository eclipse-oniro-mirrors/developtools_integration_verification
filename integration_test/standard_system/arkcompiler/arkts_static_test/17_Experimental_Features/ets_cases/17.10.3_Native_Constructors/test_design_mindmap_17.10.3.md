# 17.10.3 Native Constructors - 测试设计思维导图

## 概述
构造函数可以用 `native` 关键字标记。`native` 构造函数声明不能有函数体（即使是空函数体 `{}` 也不允许）。native 构造函数的实现由平台提供，在 ArkTS 侧仅做声明。

约束规则：
- native 构造函数声明不能有 body（包括空 `{}`）
- 编译时错误：如果 native 构造函数有非空 body

## 子规则完整枚举

### 1. 基本 native 构造函数声明
- **正向编译**: 无参数的 native 构造函数声明 `native constructor()`
- **正向编译**: 带参数的 native 构造函数声明 `native constructor(x: int)`
- **反向编译**: native 构造函数带有非空 body `native constructor() { stmt }`
- **反向编译**: native 构造函数带有空 body `native constructor() {}`
- **运行时**: 包含 native 构造函数的类作为类型使用

### 2. native 构造函数与类继承
- **正向编译**: 子类中声明 native 构造函数
- **正向编译**: native 构造函数与普通构造函数共存（重载）
- **反向编译**: 子类 native 构造函数带 body

### 3. native 构造函数体违规
- **反向编译**: body 包含表达式语句
- **反向编译**: body 包含 return 语句
- **反向编译**: body 包含多条语句
- **反向编译**: 带参数 + 非空 body 的组合违规

### 4. 运行时行为
- **运行时**: native 构造函数类作为类型引用（不实例化）
- **运行时**: native 构造函数类包含方法
- **运行时**: native 构造函数与普通构造函数共存的类实例化（通过普通构造函数）

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 无参数 native 构造函数 | 编译通过 |
| compile-pass | 带参数 native 构造函数 | 编译通过 |
| compile-pass | 子类中 native 构造函数 | 编译通过 |
| compile-pass | native 构造函数与普通构造函数共存 | 编译通过 |
| compile-pass | native 构造函数类用作类型声明 | 编译通过 |
| compile-fail | native 构造函数带非空 body | 编译错误 ESE0084 |
| compile-fail | native 构造函数带空 body `{}` | 编译错误 ESE0084 |
| compile-fail | native 构造函数 body 含表达式 | 编译错误 ESE0084 |
| compile-fail | native 构造函数 body 含 return | 编译错误 ESE0084 |
| compile-fail | native 构造函数带参数 + body | 编译错误 ESE0084 |
| runtime | native 构造函数类作为类型引用 | 运行时通过 |
| runtime | native 构造函数类含方法（类型引用） | 运行时通过 |
| runtime | native + 普通构造函数共存类实例化 | 运行时通过 |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_10_03_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS (001-005), FAIL (006-010), RUNTIME (011-013)
