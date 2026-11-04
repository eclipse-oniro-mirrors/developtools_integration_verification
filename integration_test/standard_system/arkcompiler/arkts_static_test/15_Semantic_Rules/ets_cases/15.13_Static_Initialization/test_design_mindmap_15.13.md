# 15.13 Static Initialization - 测试设计思维导图

## 概述
本节定义 ArkTS 中静态初始化（Static Initialization）的语义：静态字段/方法初始化时机、触发条件、以及初始化顺序。

## 核心规则

### 1. 静态初始化触发条件
- 静态字段被访问时触发
- 静态方法被调用时触发
- 类被实例化时触发（`new`）
- 命名空间函数/成员被访问时触发

### 2. 初始化顺序
- 静态字段按声明顺序初始化
- 静态方法在调用时初始化
- 递归触发静态初始化时，已初始化的不重复初始化

### 3. 与 Java 的差异
- ArkTS 静态初始化与 Java 类似
- 但 ArkTS 无显式 `static` 块（与 Java 不同）

## 测试点覆盖

### compile-fail（0 个）
无编译期拒绝测试用例。

### compile-pass（0 个）
无编译期通过测试用例。

### runtime（10 个）
1. 静态字段访问触发初始化（SEM_15_13_00_200_RUNTIME_static_field_triggers）
2. 静态方法调用触发初始化（SEM_15_13_00_201_RUNTIME_static_method_triggers）
3. `new` 触发静态初始化（SEM_15_13_00_202_RUNTIME_new_triggers）
4. 命名空间函数触发初始化（SEM_15_13_00_204_RUNTIME_namespace_function_triggers）
5. 模块变量触发初始化（SEM_15_13_00_206_RUNTIME_module_variable_triggers）
6. 静态初始化调用 smart 函数（SEM_15_13_00_207_RUNTIME_static_init_calls_smart_function）
7. 静态方法触发（SEM_15_13_00_208_RUNTIME_static_method_trigger）
8. 命名空间成员触发（SEM_15_13_00_209_RUNTIME_namespace_member_trigger）
9. SMART_GLOBAL 模式：重载声明 base 顶层（SEM_15_13_00_210_RT_SMART_GLOBAL）
10. 一般静态初始化测试（SEM_15_13_00_211）

## 编号规划
- runtime: 001-006, 013-014, 019, 101

## 文件命名规范
`SEM_15_13_YYY_RT_{DESCRIPTION}.ets`

## 子章节链接
- 15.13.1: Static Initialization Safety
- 9.9.1: Constructor Body


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- class static field initialization before first access
- namespace initialization before member use
- module initialization before function call
- static block execution order
- recursive static initialization prevention
- concurrent initialization synchronization
- deadlock potential in circular dependencies
- initialization failure and exception handling
- static initialization of direct subclass triggers superclass initialization

