# 3.4 Named Types - 测试设计思维导图

## 概述
本节定义**命名类型 (Named Types)** 的范畴和语义。命名类型 = 通过声明引入的具有名字的类型。**关键边界**：内置数组（如 `int[]`、`Array<T>`）虽然是预定义类型，但**不属于命名类型**；array/function/union 是**匿名类型**，除非通过 type alias 命名。

## 核心规则

### 是命名类型的（5 类引入方式）
1. **Class declarations** — `class C {}`
2. **Interface declarations** — `interface I {}`
3. **Enumeration declarations** — `enum E {}`
4. **Type alias declarations** — `type A = ...`
5. **Type parameter declarations** — `<T>`、`<T extends ...>`

### 也是命名类型的（不需要声明）
6. **Predefined types**（除 built-in arrays）— `int`, `string`, `boolean`, `Object`, `Any` 等

### 不是命名类型的（匿名）
7. Built-in array types — `int[]`, `Array<T>`（虽是预定义但被排除）
8. Tuple types — `[int, string]`（除非 alias）
9. Function types — `(x: int) => int`（除非 alias）
10. Union types — `int | string`（除非 alias）

### 衍生概念
- **Generic types** = 带类型参数的命名类型（class/interface/type alias 三种）
- **Non-generic types** = 不带类型参数的命名类型
- **Type reference** 指的是通过名字引用 named type，可附带 type arguments

## 测试点覆盖

### 1. 命名类型的引入（PASS）
- 类声明引入命名类型
- 接口声明引入命名类型
- 枚举声明引入命名类型
- type alias 引入命名类型
- 类型参数引入命名类型
- 预定义类型作为命名类型直接使用

### 2. 命名类型作为类型引用（PASS）
- 用类名作类型注解
- 用接口名作类型注解
- 用枚举名作类型注解
- 用 type alias 作类型注解
- 用类型参数作类型注解（在泛型内部）
- 命名类型 + type arguments 引用（generic instantiation）

### 3. 匿名类型必须通过 alias 命名（PASS / FAIL）
- PASS：通过 alias 给 array/function/union/tuple 命名
- FAIL：试图把匿名类型注册为类型参数约束等需要命名类型的位置（验证语义）

### 4. Generic vs Non-generic 命名类型（PASS）
- 泛型类、泛型接口、泛型类型别名
- 非泛型类、接口、enum

### 5. 预定义类型 vs 命名类型边界（PASS / FAIL）
- PASS：`int`/`string`/`Object` 是命名类型可直接用
- PASS：`Array<int>` 作为预定义类型可用（但非命名类型）
- FAIL：内置数组类型本身不能作为某些只接受命名类型的位置

### 6. 类型参数（type parameter）作为命名类型（PASS / FAIL）
- PASS：泛型类内部用 T 作字段类型/方法返回值
- FAIL：泛型类外部使用未声明的类型参数

### 7. 重复名声明（FAIL）
- 同名类与接口冲突
- 同名 type alias 与 enum 冲突

### 8. Runtime 验证
- 命名类型实例化、方法调用
- 泛型实例化运行时类型擦除
- type alias 透明性（与底层匿名类型互换使用）

## 编号规划
- compile-pass: 001 ~ 010（约 10 个）
- compile-fail: 011 ~ 016（约 6 个）
- runtime: 017 ~ 020（约 4 个）

## 文件命名规范
`TYP_03_04_YYY_{CATEGORY}_{DESCRIPTION}.ets`