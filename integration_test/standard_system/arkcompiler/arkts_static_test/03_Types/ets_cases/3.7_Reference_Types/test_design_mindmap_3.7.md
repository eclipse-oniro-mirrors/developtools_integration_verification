# 3.7 Reference Types - 测试设计思维导图

## 概述
spec §3.7 列出 ArkTS 所有引用类型种类，并定义 Object 引用语义（共享状态）。

## 引用类型种类
1. Class types
2. Interface types
3. Array Types
4. Fixed-Size Array Types
5. Tuple Types
6. Function Types
7. Union Types
8. Literal Types
9. Type Any
10. Type string
11. Type bigint
12. Type never
13. Type null
14. Type void/undefined
15. Type Parameters

## 核心语义
- Object 是任意引用类型实例的统称
- **多引用同一对象**可能
- 对象有状态：class 字段、array/tuple 元素
- **共享引用 → 共享修改可见**（核心引用语义）

## 测试点

### compile-pass
- 列举所有 14 种引用类型的声明用例

### runtime
- 引用共享：同一对象多变量持有，修改可见
- 引用语义 vs 值语义对比

## 编号规划
- compile-pass: 001 ~ 008
- runtime: 009 ~ 011