# 3.16.2 Readonly Array Types - 测试设计思维导图

## 概述

ArkTS §3.16.2 定义 Readonly Array Types：
- 长度不可改变
- 元素不能被修改（包括通过函数或方法调用）
- 违反会触发编译时错误

**语法**：
- `readonly T[]` 和 `ReadonlyArray<T>` 是相同的类型

**特殊规则**：
- 在数组的数组中，所有数组都是 readonly

**Spec 原文关键引用（spec/types.md）：**
> "Length of a variable of a readonly array type cannot be changed"
> "Elements of a readonly array type cannot be modified after the initial assignment directly nor through a function or method call."
> "In arrays of arrays, all arrays are readonly."

## 子规则覆盖

### 1. Readonly 数组声明语法
- 正向编译: `let arr: readonly number[] = [1, 2, 3]`
- 正向编译: `let arr: ReadonlyArray<number> = [1, 2, 3]`
- 运行时: 两种语法创建的数组相同

### 2. Readonly 数组长度不可变
- 反向编译: `arr.length = 3` 编译错误
- 反向编译: `arr.push(4)` 编译错误

### 3. Readonly 数组元素不可修改
- 反向编译: `arr[0] = 42` 编译错误
- 反向编译: 通过函数修改编译错误

### 4. 数组的数组中所有数组 readonly
- 正向编译: `let arr: readonly (readonly number[])[]`
- 反向编译: 内层数组修改编译错误

### 5. Readonly 数组是 Object 子类型
- 正向编译: `let o: Object = arr`
- 运行时: instanceof 验证

### 6. Readonly 数组只读访问
- 正向编译: `arr[0]` 读取元素
- 正向编译: `arr.length` 获取长度

## 分类说明

- **compile-pass**: 验证 Readonly Array 的正确用法（只读访问）
- **compile-fail**: 验证 Readonly Array 的非法用法（修改操作）
- **runtime**: 验证 Readonly Array 的运行时行为

## 文件命名规范

- `TYP_03_16_02_XXX_PASS_<DESCRIPTION>.ets`
- `TYP_03_16_02_XXX_FAIL_<DESCRIPTION>.ets`
- `TYP_03_16_02_XXX_RUNTIME_<DESCRIPTION>.ets`
