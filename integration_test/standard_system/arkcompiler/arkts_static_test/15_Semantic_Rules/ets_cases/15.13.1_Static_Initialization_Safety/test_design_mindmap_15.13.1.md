# 15.13.1 Static Initialization Safety - 测试设计思维导图

## 概述
本节定义 ArkTS 中静态初始化安全性（Static Initialization Safety）的语义：防止不安全的静态初始化模式，如前向引用、循环依赖等。

## 核心规则

### 1. 前向引用拒绝
- 静态字段在使用前必须初始化
- 前向引用（forward reference）导致编译错误
- 这与 Java 一致

### 2. 初始化顺序安全
- 静态字段按声明顺序初始化
- 递归初始化可能导致问题，需要检测

### 3. 与 15.13 的关系
- 15.13 定义基本静态初始化规则
- 15.13.1 定义安全性检查和限制

## 测试点覆盖

### compile-fail（1 个）
1. 静态初始化前向引用拒绝（SEM_15_13_01_100_FAIL_STATIC_FORWARD_REF）

### compile-pass（1 个）
1. 静态初始化安全性验证（SEM_15_13_01_001_PASS_STATIC_INIT）

### runtime（1 个）
1. 静态初始化运行时顺序（SEM_15_13_01_200_RUNTIME_STATIC_INIT）

## 编号规划
- compile-fail: 010
- compile-pass: 001
- runtime: 002

## 文件命名规范
`SEM_15_13_YYY_{CATEGORY}_{DESCRIPTION}.ets`

## 子章节链接
- 15.13: Static Initialization
- 9.9.1: Constructor Body


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- access to not yet initialized variable (compile-error)
- access to not yet initialized static field (compile-error)
- default value for uninitialized entity with default type
- NullPointerError for uninitialized entity without default value
- safe access to fully initialized entities
- concurrent access to static initialization guard

