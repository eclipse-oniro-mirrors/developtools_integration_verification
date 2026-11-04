# 3.17.1 Readonly Tuple Types - 测试设计思维导图

## 概述

ArkTS §3.17.1 定义 Readonly Tuple Types：
- 使用 readonly 前缀声明只读元组
- 元素不能被修改（包括通过函数或方法调用）
- 违反会触发编译时错误

**语法**：
- `readonly [type1, type2, ...]`

**Spec 原文关键引用（spec/types.md）：**
> "If an tuple type has the prefix readonly, then its elements cannot be modified after the initial assignment directly or through a function or method call."

## 子规则覆盖

### 1. Readonly 元组声明语法
- 正向编译: `let t: readonly [number, string] = [1, "abc"]`
- 运行时: 只读访问

### 2. Readonly 元组元素不可修改
- 反向编译: `t[0] = 42` 编译错误
- 反向编译: 通过函数修改编译错误

### 3. Readonly 元组只读访问
- 正向编译: `t[0]` 读取元素
- 正向编译: `t.length` 获取长度

### 4. Readonly 元组是 Tuple 子类型
- 正向编译: `let t: Tuple = readonly_tuple`

## 分类说明

- **compile-pass**: 验证 Readonly Tuple 的正确用法（只读访问）
- **compile-fail**: 验证 Readonly Tuple 的非法用法（修改操作）
- **runtime**: 验证 Readonly Tuple 的运行时行为

## 文件命名规范

- `TYP_03_17_01_XXX_PASS_<DESCRIPTION>.ets`
- `TYP_03_17_01_XXX_FAIL_<DESCRIPTION>.ets`
- `TYP_03_17_01_XXX_RUNTIME_<DESCRIPTION>.ets`
