# 17.2 Fixed-Size Array Types - 测试设计思维导图

## 概述
FixedArray<T> 是 ArkTS 实验特性中的固定大小数组类型（内置类型）。length 属性为非负整数，在运行时设置一次后不可更改。通过索引（0 到 length-1）常量时间访问元素。FixedArray 在类型擦除（Type Erasure）期间保留元素类型。FixedArray 没有定义任何方法。FixedArray 和 ResizableArray（T[]）互不兼容：`a = b` 双向编译时错误。声明语法：`let a: FixedArray<number> = [1, 2, 3]`。

## 子规则完整枚举

### 1. FixedArray 基本声明与数组字面量初始化
- **正向编译**: `FixedArray<int>` 声明、`FixedArray<double>` 声明、`FixedArray<string>` 声明、`FixedArray<boolean>` 声明、`FixedArray` 作为函数参数/返回值类型、`FixedArray` 作为类字段类型
- **反向编译**: FixedArray 赋值给 ResizableArray（T[]）、ResizableArray 赋值给 FixedArray
- **运行时**: length 属性值验证、元素读访问、元素写访问

### 2. FixedArray 元素访问（索引读写）
- **正向编译**: 通过索引读取元素、通过索引写入元素、索引表达式为 number 类型
- **反向编译**: 无对应场景（编译时索引检查通常不执行）
- **运行时**: 边界内读验证、边界内写验证、越界访问抛出错误

### 3. FixedArray length 属性
- **正向编译**: 读取 length 属性值、length 作为表达式使用
- **反向编译**: 对 length 赋值
- **运行时**: length 值与数组字面量长度一致、length 属性不可重新赋值验证

### 4. FixedArray 类型擦除保留
- **正向编译**: FixedArray 在泛型上下文中使用、泛型函数接受 FixedArray<T>、泛型类包含 FixedArray<T> 字段
- **反向编译**: 无对应场景
- **运行时**: 泛型函数接受 FixedArray<T> 后元素类型保留验证

### 5. FixedArray 与 ResizableArray 不兼容
- **正向编译**: 各自独立声明使用
- **反向编译**: FixedArray 赋值给 ResizableArray（双向）、FixedArray 传递给期望 ResizableArray 的函数参数、ResizableArray 传递给期望 FixedArray 的函数参数
- **运行时**: 无对应场景（编译时即报错）

### 6. FixedArray 无方法定义
- **正向编译**: 仅使用索引访问和 length 属性
- **反向编译**: 调用 push/pop/shift 等数组方法、调用任何方法
- **运行时**: 无对应场景（编译时即报错）

### 7. 边界值场景
- **正向编译**: 空 FixedArray 声明、单元素 FixedArray、大容量 FixedArray 声明
- **反向编译**: 负索引访问（编译时可能不检查）
- **运行时**: 越界访问抛出错误、空数组 length 为 0、length 不可变验证

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | FixedArray<int> 基本声明与字面量初始化 | 编译通过 |
| compile-pass | FixedArray<double> 声明与字面量初始化 | 编译通过 |
| compile-pass | FixedArray<string> 声明与字面量初始化 | 编译通过 |
| compile-pass | FixedArray 元素读写访问 | 编译通过 |
| compile-pass | FixedArray length 属性读取 | 编译通过 |
| compile-pass | FixedArray 类型擦除保留（泛型上下文） | 编译通过 |
| compile-pass | FixedArray<boolean> 声明与字面量初始化 | 编译通过 |
| compile-fail | FixedArray 赋值给 ResizableArray（number[]） | 编译错误 |
| compile-fail | ResizableArray 赋值给 FixedArray | 编译错误 |
| compile-fail | 对 FixedArray 调用方法（如 push） | 编译错误 |
| compile-fail | FixedArray 传递给期望 ResizableArray 的函数参数 | 编译错误 |
| compile-fail | ResizableArray 传递给期望 FixedArray 的函数参数 | 编译错误 |
| runtime | 验证 FixedArray length 属性值与字面量一致 | 运行时通过 |
| runtime | 验证边界内元素读访问 | 运行时通过 |
| runtime | 验证边界内元素写后读访问 | 运行时通过 |
| runtime | 验证越界访问抛出错误 | 运行时通过 |
| runtime | 验证 length 属性不可重新赋值 | 运行时通过 |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_02_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS (001-009), FAIL (010-019), RUNTIME (020-029)
