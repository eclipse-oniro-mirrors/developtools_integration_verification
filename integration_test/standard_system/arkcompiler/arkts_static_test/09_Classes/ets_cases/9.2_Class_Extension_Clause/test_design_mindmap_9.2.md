# 9.2 Class Extension Clause - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.2 Class Extension Clause

## 概述

spec §9.2：所有类（除 Object）都可含 extends 子句指定直接超类。Object 无 extends 子句。未指定 extends 的类默认 extends Object。

## 规则要点

1. extends 指定直接超类（direct superclass）
2. Object 无 extends 子句 → 编译错误
3. typeReference 不得指向接口/枚举/联合/函数/FixedArray 等
4. typeReference 不可指向不可访问的类
5. extends 图不得有循环
6. 子类继承超类所有成员（private 继承但不可访问）

## 子类型覆盖

### 1. extends 基本语法
- 正向编译: extends 合法类、多层 extends
- 反向编译: extends 接口、extends 枚举、extends 自身/循环
- 运行时: 继承链实例化

### 2. 默认超类 Object
- 正向编译: 无 extends 的类默认 extends Object
- 反向编译: N/A
- 运行时: instanceof Object 验证

### 3. 继承成员
- 正向编译: 继承 public/protected 成员
- 反向编译: 访问 private 继承成员
- 运行时: 继承方法调用

## 测试点分类

### compile-pass（4 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_02_001_PASS_EXTENDS_CLASS | extends 合法类 |
| 002 | CLS_09_02_002_PASS_MULTI_LEVEL_EXTENDS | 多层继承 |
| 003 | CLS_09_02_003_PASS_NO_EXTENDS_IMPLICIT_OBJECT | 无 extends 默认 Object |
| 004 | CLS_09_02_004_PASS_EXTENDS_ACCESSIBLE_CLASS | 继承可访问类 |

### compile-fail（5 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 005 | CLS_09_02_005_FAIL_EXTENDS_INTERFACE | extends 接口 |
| 006 | CLS_09_02_006_FAIL_EXTENDS_ENUM | extends 枚举 |
| 007 | CLS_09_02_007_FAIL_EXTENDS_CYCLE | extends 循环 |
| 008 | CLS_09_02_008_FAIL_EXTENDS_INACCESSIBLE | extends 不可访问类 |
| 009 | CLS_09_02_009_FAIL_EXTENDS_OBJECT_EXPLICIT | Object 类显式 extends |

### runtime（3 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 010 | CLS_09_02_010_RUNTIME_INHERIT_CHAIN | 继承链实例化 |
| 011 | CLS_09_02_011_RUNTIME_INSTANCEOF_OBJECT | instanceof Object |
| 012 | CLS_09_02_012_RUNTIME_INHERIT_METHOD_CALL | 继承方法调用 |

## 文件命名规范
- `CLS_09_02_YYY_{CATEGORY}_{DESCRIPTION}.ets`
