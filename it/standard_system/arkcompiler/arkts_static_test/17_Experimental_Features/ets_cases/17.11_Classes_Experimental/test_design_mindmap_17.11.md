# 17.11 Classes (Experimental) - 测试设计思维导图

## 概述
本章涵盖 ArkTS 类的实验性特性，包括 final 类（防止继承）、final 方法（防止重写）和命名构造函数。这些特性增强了类的封装性和 API 稳定性。

- 17.11.1 Final Classes：final 类不可被继承
- 17.11.2 Final Methods：final 方法不可在子类中被重写
- 17.11.3 Named Constructors：构造函数可以有名称，通过名称调用

## 子类型覆盖

### 17.11.1 Final Classes
final 类声明后无法被任何其余类继承（extends）。final 类的方法自然不可被重写。final 类表达式表示只有该类的对象可以是其值。

- **正向编译**: 声明 final 类、实例化 final 类、final 类有方法和字段
- **反向编译**: extends final 类、final 类作为父类、class extends 表达式引用 final 类
- **运行时**: 实例化 final 类并调用其方法

### 17.11.2 Final Methods
final 方法在声明后不可在任何子类中被重写。final 关键字用于实例方法，不能与 abstract 或 static 组合。

- **正向编译**: 声明 final 方法、在子类中定义非重写的 final 方法、调用 final 方法
- **反向编译**: abstract + final 组合、static + final 组合、在子类中重写 final 方法
- **运行时**: 多态调用验证 final 方法不可被重写的行为

### 17.11.3 Named Constructors
构造函数可以有名称（identifier），通过 `new ClassName.ConstructorName(args)` 调用。如果类的所有构造函数都有名称，则不能使用无名称的 `new ClassName()` 调用。同一个构造函数名称不能在同一类中出现两次。

- **正向编译**: 声明命名构造函数、通过名称调用构造函数、多个命名构造函数共存、命名构造函数与无名称构造函数共存
- **反向编译**: 重复的构造函数名称、所有构造函数都有名称时使用 new X()、构造函数名称作为命名引用
- **运行时**: 通过不同命名构造函数创建对象并验证状态

## 测试点汇总

### 17.11.1 Final Classes
| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 基本 final 类声明 | 编译通过 |
| compile-pass | final 类实例化 | 编译通过 |
| compile-pass | final 类有方法和字段 | 编译通过 |
| compile-pass | final 类作为字段类型 | 编译通过 |
| compile-fail | extends final 类 | 编译错误 |
| compile-fail | final 类作为父类 | 编译错误 |
| compile-fail | 重写 final 类中的方法 | 编译错误 |
| runtime | 实例化 final 类并调用方法 | 运行时通过 |

### 17.11.2 Final Methods
| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 基本 final 方法声明 | 编译通过 |
| compile-pass | 非重写的 final 方法在子类中 | 编译通过 |
| compile-pass | 调用 final 方法 | 编译通过 |
| compile-fail | abstract + final 组合 | 编译错误 |
| compile-fail | static + final 组合 | 编译错误 |
| compile-fail | 在子类中重写 final 方法 | 编译错误 |
| runtime | 多态调用验证 final 方法行为 | 运行时通过 |

### 17.11.3 Named Constructors
| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 基本命名构造函数声明 | 编译通过 |
| compile-pass | 通过名称调用构造函数 | 编译通过 |
| compile-pass | 多个命名构造函数共存 | 编译通过 |
| compile-pass | 命名构造函数与无名称构造函数共存 | 编译通过 |
| compile-fail | 重复构造函数名称 | 编译错误 |
| compile-fail | 全命名构造函数的类使用 new X() | 编译错误 |
| compile-fail | 构造函数名称作为命名引用 | 编译错误 |
| runtime | 通过命名构造函数创建对象并验证状态 | 运行时通过 |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_11_XX_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS 从 001 起，FAIL 接续，RUNTIME 接续
