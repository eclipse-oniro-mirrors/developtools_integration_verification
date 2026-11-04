# 3.16 Array Types - 测试设计思维导图

## 概述

ArkTS §3.16 定义 Array Types：
- 表示包含任意非负数量元素的数据结构
- 元素类型必须是数组声明中指定类型的子类型
- 支持两种预定义数组类型：
  - **Resizable Array Types**：推荐用于大多数情况
  - **Fixed-Size Array Types**：实验性特性，性能更好
- 都是类类型，是 Object 的子类型
- 可迭代
- Resizable arrays 和 fixed-size arrays **不能互赋值**

**Spec 原文关键引用（spec/types.md）：**
> "Array type represents a data structure intended to comprise any non-negative number of elements of types that are subtypes of the type specified in the array declaration."
> "Resizable arrays and fixed-size arrays are not assignable to each other."

## 子规则覆盖

### 1. Resizable Array Types
- 正向编译: `let arr: number[] = [1, 2, 3]`
- 正向编译: `let arr: Array<number> = [1, 2, 3]`
- 正向编译: 空数组 `[]`
- 运行时: 数组创建和访问
- 运行时: 数组长度

### 2. Fixed-Size Array Types
- 正向编译: `let arr: FixedArray<number> = [1, 2, 3]`
- 运行时: 数组创建和访问

### 3. 数组是 Object 子类型
- 正向编译: `let o: Object = arr`
- 运行时: instanceof 验证

### 4. 数组可迭代
- 正向编译: for-of 遍历
- 运行时: 迭代验证

### 5. Resizable 和 Fixed-Size 不能互赋值
- 反向编译: Resizable 赋给 Fixed-Size
- 反向编译: Fixed-Size 赋给 Resizable

### 6. 数组元素类型
- 正向编译: 基本类型数组
- 正向编译: 对象类型数组
- 正向编译: 联合类型数组
- 反向编译: 元素类型不兼容

### 7. 数组操作
- 正向编译: 索引访问
- 正向编译: length 属性
- 正向编译: push/pop 方法（Resizable）
- 运行时: 操作结果验证

### 8. 边界值与异常场景
- 运行时: 空数组操作
- 运行时: 数组越界（runtime error）

## 分类说明

- **compile-pass**: 验证数组类型的正确用法
- **compile-fail**: 验证数组类型的非法用法
- **runtime**: 验证数组类型的运行时行为

## 文件命名规范

- `TYP_03_16_XXX_PASS_<DESCRIPTION>.ets`
- `TYP_03_16_XXX_FAIL_<DESCRIPTION>.ets`
- `TYP_03_16_XXX_RUNTIME_<DESCRIPTION>.ets`
