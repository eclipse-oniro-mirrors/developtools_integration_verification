# 3.16.1 Resizable Array Types - 测试设计思维导图

## 概述

ArkTS §3.16.1 定义 Resizable Array Types：
- 包含元素，长度可通过 `length` 属性访问
- 长度是非负整数，可以在运行时设置和改变
- 通过索引访问元素，索引范围 0 到 length-1
- 索引访问是常数时间操作
- 元素类型必须可赋值给数组声明中指定的类型

**语法**：
- `T[]` 和 `Array<T>` 是相同的类型（indistinguishable types）

**收缩数组的错误情况**：
- 值是 number 或浮点类型，且小数部分不为 0
- 值小于 0
- 值大于之前的 length
- 运行时检测到的错误是 runtime error
- 编译时检测到的错误是 compile-time error

**Spec 原文关键引用（spec/types.md）：**
> "T[] and Array<T> specify identical, i.e., indistinguishable types."
> "Array length can be set and changed in runtime."

## 子规则覆盖

### 1. 数组声明语法
- 正向编译: `let arr: number[] = [1, 2, 3]`
- 正向编译: `let arr: Array<number> = [1, 2, 3]`
- 运行时: 两种语法创建的数组相同

### 2. 数组长度属性
- 正向编译: `arr.length` 返回 int
- 运行时: 长度验证

### 3. 数组索引访问
- 正向编译: `arr[0]` 访问元素
- 正向编译: `arr[0] = value` 设置元素
- 运行时: 索引访问验证

### 4. 数组长度收缩
- 正向编译: `arr.length = 3` 收缩数组
- 运行时: 收缩后元素访问

### 5. 数组收缩错误
- 反向编译/运行时: 小数部分不为 0
- 反向编译/运行时: 值小于 0
- 反向编译/运行时: 值大于之前的 length

### 6. 数组是 Object 子类型
- 正向编译: `let o: Object = arr`
- 运行时: instanceof 验证

### 7. 数组类型别名
- 正向编译: `type Matrix = number[][]`
- 运行时: 类型别名使用

### 8. 数组元素类型
- 正向编译: 基本类型数组
- 正向编译: 对象类型数组
- 反向编译: 元素类型不兼容

## 分类说明

- **compile-pass**: 验证 Resizable Array 的正确用法
- **compile-fail**: 验证 Resizable Array 的非法用法
- **runtime**: 验证 Resizable Array 的运行时行为

## 文件命名规范

- `TYP_03_16_01_XXX_PASS_<DESCRIPTION>.ets`
- `TYP_03_16_01_XXX_FAIL_<DESCRIPTION>.ets`
- `TYP_03_16_01_XXX_RUNTIME_<DESCRIPTION>.ets`
