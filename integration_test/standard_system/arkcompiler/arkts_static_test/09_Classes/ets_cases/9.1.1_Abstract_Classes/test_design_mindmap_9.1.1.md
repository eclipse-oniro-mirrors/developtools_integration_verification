# 9.1.1 Abstract Classes - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.1.1 Abstract Classes

## 概述

spec §9.1.1：abstract 修饰符的类不能被实例化，作为子类的蓝图。抽象类可含抽象方法和具体方法。

## 规则要点

1. abstract 类不能被实例化 → compile-time error
2. abstract 类的子类可以是抽象或非抽象的
3. 非抽象子类可被实例化
4. 只有 abstract 类才能有 abstract 方法
5. 非抽象类含 abstract 方法 → compile-time error
6. abstract 方法声明含 final 或 override → compile-time error

## 子类型覆盖

### 1. 抽象类声明与实例化
- 正向编译: abstract 类声明、abstract 类含具体方法
- 反向编译: 实例化 abstract 类
- 运行时: 通过非抽象子类实例化

### 2. 抽象类继承
- 正向编译: 非抽象子类继承抽象类、抽象子类继承抽象类
- 反向编译: 非抽象子类未实现所有抽象方法
- 运行时: 抽象类→非抽象子类的多态调用

### 3. abstract 方法修饰符约束
- 正向编译: abstract 类含 abstract 方法
- 反向编译: 非抽象类含 abstract 方法、abstract+final、abstract+override
- 运行时: N/A

## 测试点分类

### compile-pass（4 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_01_001_PASS_ABSTRACT_CLASS_DECL | abstract 类声明 |
| 002 | CLS_09_01_002_PASS_ABSTRACT_CLASS_CONCRETE_METHOD | abstract 类含具体方法 |
| 003 | CLS_09_01_003_PASS_ABSTRACT_SUBCLASS_EXTENDS_ABSTRACT | 抽象子类继承抽象类 |
| 004 | CLS_09_01_004_PASS_NON_ABSTRACT_SUBCLASS | 非抽象子类继承抽象类 |

### compile-fail（5 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 005 | CLS_09_01_005_FAIL_INSTANTIATE_ABSTRACT_CLASS | 实例化抽象类 |
| 006 | CLS_09_01_006_FAIL_NON_ABSTRACT_WITH_ABSTRACT_METHOD | 非抽象类含抽象方法 |
| 007 | CLS_09_01_007_FAIL_ABSTRACT_METHOD_FINAL | abstract+final |
| 008 | CLS_09_01_008_FAIL_ABSTRACT_METHOD_OVERRIDE | abstract+override |
| 009 | CLS_09_01_009_FAIL_NON_ABSTRACT_MISSING_IMPL | 非抽象子类未实现抽象方法 |

### runtime（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 010 | CLS_09_01_010_RUNTIME_ABSTRACT_SUBCLASS_DISPATCH | 抽象类→非抽象子类实例化 |
| 011 | CLS_09_01_011_RUNTIME_ABSTRACT_CONSTRUCTOR_EXEC | 抽象类构造器执行 |
| 012 | CLS_09_01_012_RUNTIME_MULTI_LEVEL_ABSTRACT | 多层抽象继承 |

## 文件命名规范
- `CLS_09_01_1_YYY_{CATEGORY}_{DESCRIPTION}.ets`（注意 9.1.1 使用前缀 CLS_09_01）
- 为避免编号冲突，9.1.1 子章节编号从 013 开始续接 9.1 的编号
