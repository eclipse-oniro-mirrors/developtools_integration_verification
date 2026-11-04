# 9.3 Class Implementation Clause - 测试设计思维导图

**生成日期：** 2026-06-22
**章节：** §9.3 Class Implementation Clause

## 概述

spec §9.3：类可实现一个或多个接口。implements 子句列出直接超接口。非抽象类必须实现所有超接口的方法和属性。

## 规则要点

1. implements 列出直接超接口
2. typeReference 不可指向不可访问的接口 → compile-time error
3. 同一接口重复出现 → 被忽略（不报错）
4. 类不能实现同一泛型接口的不同实例化 → compile-time error
5. 类字段与继承的方法同名（除 static/非 static 区别外）→ compile-time error
6. 非抽象类必须实现超接口所有方法和必需属性
7. 可选属性可不实现或隐式使用默认

## 子类型覆盖

### 1. implements 基本语法
- 正向编译: 单接口实现、多接口实现
- 反向编译: implements 不可访问接口、implements 两个同一泛型接口的不同实例化
- 运行时: 接口方法调用

### 2. 非抽象类实现接口
- 正向编译: 实现所有接口方法和属性
- 反向编译: 未实现必需方法/属性
- 运行时: 接口类型引用调用

### 3. 接口重复与冲突
- 正向编译: 重复接口被忽略
- 反向编译: 字段与接口方法同名冲突
- 运行时: N/A

## 测试点分类

### compile-pass（4 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 001 | CLS_09_03_001_PASS_IMPLEMENTS_SINGLE_INTERFACE | 单接口实现 |
| 002 | CLS_09_03_002_PASS_IMPLEMENTS_MULTI_INTERFACE | 多接口实现 |
| 003 | CLS_09_03_003_PASS_IMPLEMENTS_ALL_METHODS | 实现所有接口方法 |
| 004 | CLS_09_03_004_PASS_REPEATED_INTERFACE_IGNORED | 重复接口被忽略 |

### compile-fail（4 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 005 | CLS_09_03_005_FAIL_INACCESSIBLE_INTERFACE | 不可访问接口 |
| 006 | CLS_09_03_006_FAIL_SAME_GENERIC_DIFF_INSTANTIATION | 同一泛型接口不同实例化 |
| 007 | CLS_09_03_007_FAIL_FIELD_METHOD_NAME_CONFLICT | 字段与方法同名冲突 |
| 008 | CLS_09_03_008_FAIL_NOT_IMPLEMENTED_INTERFACE_METHOD | 未实现接口方法 |

### runtime（2 用例）
| # | ID | 测试点 |
|---|-----|--------|
| 009 | CLS_09_03_009_RUNTIME_INTERFACE_DISPATCH | 接口方法调用派发 |
| 010 | CLS_09_03_010_RUNTIME_MULTI_INTERFACE_CALL | 多接口调用 |

## 文件命名规范
- `CLS_09_03_YYY_{CATEGORY}_{DESCRIPTION}.ets`
