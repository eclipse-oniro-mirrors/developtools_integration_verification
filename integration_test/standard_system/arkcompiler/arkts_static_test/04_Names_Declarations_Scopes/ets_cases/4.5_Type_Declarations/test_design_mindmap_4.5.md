# 4.5 Type Declarations - 测试设计思维导图

## 概述
Type declarations include class, interface, enum, const enum, and type alias declarations.

## 子类型覆盖
> **注意**: 4.5.1 Type Alias Declaration 已拆分至独立子目录 `4.5.1_Type_Alias_Declaration/`。

### 1. Type declaration kinds
- 正向编译: class / interface / enum 声明作为类型声明引入类型名
- 反向编译: const enum 当前实现不支持时应拒绝

### 2. Type alias for existing types
- 正向编译: 长类型名的简短别名

### 3. Recursive type alias
- 正向编译: 数组元素类型递归、泛型类型参数递归
- 反向编译: 直接自身递归、循环依赖

### 4. Generic type alias
- 正向编译: 泛型别名、类型参数依赖
- 反向编译: 无类型参数使用、参数自身循环依赖

## 文件命名规范
- NAM_04_05_YYY_{CATEGORY}_{DESCRIPTION}.ets（父级 4.5 用例）
- NAM_04_05_01_YYY_{CATEGORY}_{DESCRIPTION}.ets（4.5.1 子节用例，位于 `4.5.1_Type_Alias_Declaration/`）
