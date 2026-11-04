# 17.9.5 Explicit Constructor Overload - 测试设计思维导图

## 概述
显式构造函数重载使用 `overload constructor { ctor1, ctor2, ... }` 语法。每个类只能有一个显式构造函数重载声明。与命名构造函数一起用于 new 表达式。匿名构造函数隐式放在列表首位。`new BigFloat(1)` 会按顺序解析到第一个匹配的构造函数。

## 子类型覆盖

### 1. 基本构造函数重载
- 正向编译: overload constructor 声明
- 运行时: new 表达式调用验证正确构造函数

### 2. 匿名构造函数隐式优先
- 运行时: 验证匿名构造函数隐式在列表首位

### 3. 命名构造函数重载
- 正向编译: overload constructor 包含命名构造函数
- 运行时: new 表达式调用命名构造函数

### 4. 参数类型/数量重载
- 正向编译: 多个构造函数按参数类型/数量区分
- 运行时: 不同参数匹配不同构造函数

### 5. 只有一个 overload constructor
- 反向编译: 同一个类中声明两个 overload constructor

### 6. 重载解析顺序
- 运行时: 验证第一个匹配的构造函数被调用

### 7. 泛型类构造函数重载
- 正向编译: 泛型类中的 overload constructor

### 8. 构造函数重载与继承
- 正向编译: 子类继承父类，子类自身的 overload constructor

## 分类说明
- **compile-pass**: 文件必须编译成功
- **compile-fail**: 文件必须产生编译时错误
- **runtime**: 文件测试运行时行为

## 文件命名规范
- `EXP2_CtorOverload_<场景>_pass.ets`
- `EXP2_CtorOverload_<场景>_fail.ets`
- `EXP2_CtorOverload_<场景>_runtime.ets`
