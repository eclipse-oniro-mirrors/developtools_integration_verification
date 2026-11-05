# 3.17 Tuple Types - 测试设计思维导图

## 概述

ArkTS §3.17 定义 Tuple Types：
- 元组类型是引用类型
- 由一组固定类型组成，每个元素有自己的类型
- 使用 `[]` 运算符访问元素，第一个元素索引是 0
- 使用 `length` 属性获取元素数量
- 任何元组类型都是 Tuple 类型的子类型

**语法**：
- `[type1, type2, type3]`

**Spec 原文关键引用（spec/types.md）：**
> "Tuple type is a reference type created as a fixed set of other types."
> "Each element of a tuple has its own type."
> "The operator '[]' is used to access the elements of a tuple."
> "Any tuple type is subtype of type Tuple."

## 子规则覆盖

### 1. 元组声明语法
- 正向编译: `let t: [number, string] = [1, "hello"]`
- 正向编译: `let t: [number, number, string, boolean] = [1, 2, "abc", true]`

### 2. 元组元素访问
- 正向编译: `t[0]` 访问第一个元素
- 正向编译: `t[0] = 42` 修改元素
- 运行时: 索引访问验证

### 3. 元组长度属性
- 正向编译: `t.length` 获取长度
- 运行时: 长度验证

### 4. 元组元素类型
- 正向编译: 不同类型的元素
- 反向编译: 类型不匹配

### 5. 元组是 Tuple 子类型
- 正向编译: `let t: Tuple = [1, "hello"]`

### 6. 元组索引常量表达式
- 正向编译: 常量索引
- 反向编译: 非常量索引

## 分类说明

- **compile-pass**: 验证 Tuple 的正确用法
- **compile-fail**: 验证 Tuple 的非法用法
- **runtime**: 验证 Tuple 的运行时行为

## 文件命名规范

- `TYP_03_17_XXX_PASS_<DESCRIPTION>.ets`
- `TYP_03_17_XXX_FAIL_<DESCRIPTION>.ets`
- `TYP_03_17_XXX_RUNTIME_<DESCRIPTION>.ets`
