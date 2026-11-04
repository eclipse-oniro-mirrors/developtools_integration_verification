# 9.1 Class Declarations - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.1 Class Declarations

## 概述

spec §9.1：类声明引入新的引用类型。类声明定义了类类型，包含类名（identifier）、可选类型参数、可选 extends/implements 子句和类体。

## 规则要点

1. 类声明定义新的 class type（引用类型）
2. 类名由 identifier 指定
3. 若有 typeParameters，则为泛型类
4. final 修饰符是实验特性（见 Experimental Features）
5. 语法：`classModifier? 'class' identifier typeParameters? classExtendsClause? implementsClause? classMembers`

## 子类型覆盖

### 1. 基本类声明语法
- 正向编译: 空类声明、含字段/方法的类、泛型类
- 反向编译: 类名与已有类型名冲突
- 运行时: 创建类实例并验证字段

### 2. 类声明修饰符
- 正向编译: 无修饰符（默认）、abstract 类声明
- 反向编译: final 类声明（实验特性，部分编译器可能不支持）、多个 classModifier 重复
- 运行时: N/A

### 3. 泛型类声明
- 正向编译: 单类型参数、多类型参数泛型类
- 反向编译: 泛型参数约束无效
- 运行时: 泛型实例化验证

## 测试点分类

### compile-pass（5 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_01_001_PASS_EMPTY_CLASS | 空类声明 |
| 002 | CLS_09_01_002_PASS_CLASS_WITH_FIELDS | 含字段的类 |
| 003 | CLS_09_01_003_PASS_CLASS_WITH_METHODS | 含方法的类 |
| 004 | CLS_09_01_004_PASS_GENERIC_CLASS | 泛型类声明 |
| 005 | CLS_09_01_005_PASS_CLASS_WITH_CONSTRUCTOR | 含构造器的类 |

### compile-fail（4 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 006 | CLS_09_01_006_FAIL_DUPLICATE_CLASS_MODIFIER | 重复类修饰符 |
| 007 | CLS_09_01_007_FAIL_CLASS_EXTENDS_ITSELF | extends 自身（循环） |
| 008 | CLS_09_01_008_FAIL_CLASS_NAME_KEYWORD | 类名为关键字 |
| 009 | CLS_09_01_009_FAIL_CLASS_EXTENDS_INTERFACE | extends 接口类型 |

### runtime（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 010 | CLS_09_01_010_RUNTIME_CLASS_INSTANCE | 创建实例 + 字段访问 |
| 011 | CLS_09_01_011_RUNTIME_GENERIC_CLASS_INSTANCE | 泛型实例化 |
| 012 | CLS_09_01_012_RUNTIME_CLASS_METHOD_CALL | 方法调用验证 |

## 文件命名规范
- `CLS_09_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`
- 编号：001~005 PASS, 006~009 FAIL, 010~012 RUNTIME
