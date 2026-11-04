# 17.10 Native Functions and Methods - 测试设计思维导图

## 概述
`native` 关键字用于标记函数、方法或构造函数的实现位于平台相关代码（如 C）中，而非 ArkTS 代码中。native 实体没有 ArkTS 实现体（body）。本章涵盖三个子章节：
- 17.10.1 native 函数（顶层函数）
- 17.10.2 native 方法（类方法）
- 17.10.3 native 构造函数

## 子类型覆盖

### 17.10.1 Native Functions
native 函数是没有 ArkTS 实现体的顶层函数，用分号代替函数体。

- **正向编译**: 声明 native 函数（分号 body）、带参数/返回值的 native 函数、多个 native 函数声明
- **反向编译**: native 函数有 block body、native 函数有 expression body
- **运行时**: （native 函数由于没有 ArkTS 实现体，无法在纯 ArkTS 环境中运行时验证其功能调用）

### 17.10.2 Native Methods
native 方法是类中标记为 native 的方法，没有 ArkTS 实现体。

- **正向编译**: 声明 native 方法（分号 body）、native 方法在类中、带参数的 native 方法
- **反向编译**: abstract + native 组合、native 方法有 block body、native 方法在接口中
- **运行时**: （类似 native 函数，纯 ArkTS 运行时无法验证实际调用）

### 17.10.3 Native Constructors
native 构造函数是没有 ArkTS 实现体的类构造函数。

- **正向编译**: 声明 native 构造函数（分号 body）
- **反向编译**: native 构造函数有非空 body、native 构造函数有 block body
- **运行时**: （类似上述限制）

## 测试点汇总

### 17.10.1 Native Functions
| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 基本 native 函数声明（分号 body） | 编译通过 |
| compile-pass | native 函数带参数和返回类型 | 编译通过 |
| compile-pass | 多个 native 函数声明 | 编译通过 |
| compile-pass | native 函数返回 void | 编译通过 |
| compile-fail | native 函数有 block body {} | 编译错误 |
| compile-fail | native 函数有 expression body | 编译错误 |
| compile-fail | native 函数有 arrow body => | 编译错误 |
| runtime | （受限于平台实现，runtime 仅验证编译） | N/A |

### 17.10.2 Native Methods
| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 基本 native 方法声明 | 编译通过 |
| compile-pass | native 方法带参数 | 编译通过 |
| compile-pass | native 方法返回 void | 编译通过 |
| compile-fail | abstract + native 组合 | 编译错误 |
| compile-fail | native 方法有 block body | 编译错误 |
| compile-fail | native 方法有 expression body | 编译错误 |
| runtime | （受限于平台实现） | N/A |

### 17.10.3 Native Constructors
| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 基本 native 构造函数声明（分号） | 编译通过 |
| compile-fail | native 构造函数有非空 body | 编译错误 |
| compile-fail | native 构造函数有 block body | 编译错误 |
| runtime | （受限于平台实现） | N/A |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_10_XX_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS 从 001 起，FAIL 接续，RUNTIME 接续
