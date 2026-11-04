# 14.4 Ambient Class Declarations — 测试设计思维导图

## 概述

Ambient class declarations 使用 `declare class` 声明在别处定义的类类型信息，成员不能有实现体。

**核心规则（ArkTS Static Spec ambients.md）：**
1. 支持 `class` 和 `struct` 两种声明
2. 支持泛型参数、extends、implements
3. 访问修饰符仅允许 `public` 和 `protected`
4. 字段（field）必须有显式类型注解、不能有初始化器
5. 构造器、方法、访问器不能有实现体 `{}`
6. 方法支持 `static` 修饰符
7. 字段支持 `static` 和 `readonly` 修饰符
8. 方法支持显式重载（explicit class method overload）

## 子类型覆盖

### 1. compile-pass：合法 ambient class 声明

- **空类**：`declare class A {}`
- **含字段**：多种类型的字段声明
- **静态字段**：`static` 字段
- **只读字段**：`readonly` 字段
- **构造器**：无体的构造器声明
- **方法**：无体的方法声明
- **静态方法**：`static` 方法
- **方法重载**：显式方法重载（overload）
- **extends**：继承另一个 ambient class
- **implements**：实现接口
- **访问器**：get/set 访问器
- **struct**：struct 声明
- **public/protected 修饰**：访问修饰符
- **泛型类**：含泛型参数的 class

### 2. compile-fail：非法 ambient class 声明

- **字段有初始化器**：field = value（违反无初始化器规则）
- **字段无类型注解**：`fieldName;`（缺少类型）
- **构造器有体**：`constructor() {}`
- **方法有体**：`method() {}`
- **访问器有体**：`get/set {} ` 有实现体
- **private 修饰符**：`private` 不允许在 ambient 中使用
- **静态字段有初始化器**：static 字段 + 初始化器
- **方法无返回类型**：缺少返回类型

### 3. runtime

- ambient class 声明与带 main 的正常代码共存，验证不影响编译执行

## 文件命名规范

- 前缀：`AMB_`
- 章节：`14_04`
- 编号：PASS 001~012 → FAIL 013~020 → RUNTIME 021
