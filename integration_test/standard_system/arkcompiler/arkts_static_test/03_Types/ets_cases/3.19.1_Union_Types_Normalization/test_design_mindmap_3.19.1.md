# 3.19.1 Union Types Normalization - 测试设计思维导图

## 概述
Union Types Normalization 用于最小化 union 类型中的类型数量，并保持类型安全。规范化可能把 union 类型规约为更少成员的 union，也可能规约为单一非 union 类型。

## 规范化步骤

1. **嵌套 union 扁平化**
   - `(T1 | T2) | (T3 | T4)` → `T1 | T2 | T3 | T4`

2. **type alias 展开**
   - 非递归 alias 递归替换到底层类型
   - 递归 alias 保留

3. **相同类型消除**
   - `number | number` → `number`
   - readonly 优先级：`number[] | readonly number[]` → `readonly number[]`

4. **string 吸收 string literal**
   - `"1" | string | number` → `string | number`

5. **never 消除**
   - `T | never` → `T`

6. 递归重复执行，直到无法继续

## 测试点覆盖

### compile-pass
- 嵌套 union 扁平化后可赋值
- alias 展开后类型兼容
- 重复类型消除后等价
- readonly 版本优先
- string 吸收 string literal
- never 消除
- class Base | Derived 不归并（保持不变）
- 递归 alias 不展开

### compile-fail
- union 归一化后不接受外部类型
- string literal 被 string 吸收后仍不能接受 number（除非 union 有 number）
- never 消除后不能赋不兼容类型
- readonly union 归一化后禁止写入

### runtime
- union 归一化后的运行时赋值与分发
- string literal/string 归一化运行时行为
- readonly 数组引用行为

## 编号规划
- compile-pass: 001~008
- compile-fail: 009~012
- runtime: 013~015

## 文件命名规范
`TYP_03_19_01_YYY_{CATEGORY}_{DESCRIPTION}.ets`