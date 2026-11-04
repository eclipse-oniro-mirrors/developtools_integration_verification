# 17.9.1 Explicit Function Overload - 测试设计思维导图

## 概述
显式函数重载使用 `overload identifier { func1, func2, ... }` 语法。所有重载函数必须在同一模块/命名空间作用域内。重载名可以与某个函数同名（该函数必须在列表中）。重载名不在重载实体列表、Function Reference 中考虑。如果导出重载，所有重载函数必须导出。不能作为带接收者的方法调用。

## 子类型覆盖

### 1. 基本函数重载声明
- 正向编译: 顶层 overload 声明，不同参数类型的函数重载
- 正向编译: overload 调用 int/string/boolean 等不同类型的重载
- 反向编译: identifier 引用不存在的函数（无 accessible function）

### 2. 参数数量重载
- 正向编译: 0参数、1参数、多参数函数在同一个 overload
- 运行时: 传不同参数数量验证调用正确函数

### 3. 参数类型重载
- 正向编译: int→string, string→int 等不同签名的重载
- 反向编译: 调用时参数类型不匹配任何重载

### 4. 重载名与函数同名
- 正向编译: overload 名与其中一个函数名相同（该函数必须在列表中）
- 反向编译: overload 名与函数名相同但该函数不在列表中

### 5. 导出 overload
- 正向编译: 导出 overload，所有重载函数也导出
- 反向编译: 导出 overload 但某个重载函数未导出

### 6. 泛型函数重载
- 正向编译: 泛型函数参与 overload
- 反向编译: 类型参数无法推断

### 7. 同模块作用域限制
- 反向编译: 引用其余模块/作用域的函数

### 8. 不能作为方法调用
- 反向编译: 尝试以 receiver.method() 方式调用 overload

### 9. 与隐式重载结合
- 正向编译: overload 中包含有默认参数的函数

## 分类说明
- **compile-pass**: 文件必须编译成功
- **compile-fail**: 文件必须产生编译时错误
- **runtime**: 文件测试运行时行为

## 文件命名规范
- `EXP2_FuncOverload_<场景>_pass.ets`
- `EXP2_FuncOverload_<场景>_fail.ets`
- `EXP2_FuncOverload_<场景>_runtime.ets`
