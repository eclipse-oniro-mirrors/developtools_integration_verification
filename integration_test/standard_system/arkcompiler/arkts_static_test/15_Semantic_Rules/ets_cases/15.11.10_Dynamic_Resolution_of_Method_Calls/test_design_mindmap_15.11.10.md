# 15.11.10 Dynamic Resolution of Method Calls - 测试设计思维导图

## 概述
本节定义方法调用的动态解析规则：通过父类引用指向子类对象时，运行时动态绑定并调用子类覆写的方法（多态派发）。

## 核心规则

### 1. 动态解析规则
- 通过父类引用指向子类对象
- 运行时动态绑定到实际对象类型
- 调用实际对象类型的覆写方法

### 2. 动态解析时机
- 编译时静态类型检查
- 运行时动态绑定
- 基于虚方法表（vtable）实现

### 3. 动态解析拒绝规则
- 参数类型不匹配时编译报错
- 静态类型检查确保类型安全

## 测试点覆盖

### compile-pass
1. 多态派发正确工作
2. 父类引用指向子类对象
3. 运行时调用子类覆写方法

### compile-fail
1. 参数类型不匹配拒绝
2. 静态类型检查拒绝

### runtime
1. 动态解析运行时正确调用
2. 多态派发运行时验证

## 编号规划
- compile-pass: 001 ~ 010
- compile-fail: 011 ~ 020
- runtime: 021 ~ 030

## 文件命名规范
`SEM_15_11_10_YYY_{CATEGORY}_{DESCRIPTION}.ets`


## 最新设计要点

从章节思维导图同步的最新测试设计点：

- static method call (no overriding, use statically determined method)
- super call (no overriding, use superclass method)
- instance method call (use actual objectReference type T)
- method resolution with T = C (result is M)
- method resolution with T has superclass (search superclass hierarchy)
- multiple overriding methods in subclass (exactly one matches)
- multiple overriding methods error (more than one matches)
- superinterface default method search
- superinterface method resolution (no default method)
- superinterface method resolution (multiple default methods error)
- closest superclass definition priority
- closest superinterface definition priority
- method resolution failure (runtime error)
- static type vs runtime type interaction
- overload resolution followed by dynamic dispatch
- overriding with contravariant parameters and covariant return
- bridge method generation for generic overriding
- resolution with generic type erasure
- resolution safety for programs compiled without source updates

