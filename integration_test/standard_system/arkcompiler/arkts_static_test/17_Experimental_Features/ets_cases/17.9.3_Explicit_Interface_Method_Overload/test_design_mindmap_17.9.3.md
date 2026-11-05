# 17.9.3 Explicit Interface Method Overload - 测试设计思维导图

## 概述
接口中声明 `overload identifier { method1, method2, ... }`。可在实现类中 override。Override 必须包含接口中的所有方法。如果实现类不 override，则继承接口的 overload。多个继承的 overload 同名时必须 override。

## 子类型覆盖

### 1. 接口 overload 声明
- 正向编译: 接口中 overload 声明
- 反向编译: 语法错误（无效方法引用等）

### 2. 实现类 override
- 正向编译: 实现类 override overload，包含所有接口方法
- 反向编译: override 但缺少接口中的方法

### 3. 不 override（继承）
- 正向编译: 实现类不 override，继承接口 overload

### 4. 实现类添加方法到 overload
- 正向编译: override 时添加新方法

### 5. 多接口继承同名 overload
- 反向编译: 多接口继承同名 overload 但未 override

### 6. 接口 overload 运行时
- 运行时: 通过接口类型调用 overload 验证正确分发

### 7. 抽象类继承接口 overload
- 正向编译: 抽象类不实现 overload，由子类实现

## 分类说明
- **compile-pass**: 文件必须编译成功
- **compile-fail**: 文件必须产生编译时错误
- **runtime**: 文件测试运行时行为

## 文件命名规范
- `EXP2_InterfaceOverload_<场景>_pass.ets`
- `EXP2_InterfaceOverload_<场景>_fail.ets`
- `EXP2_InterfaceOverload_<场景>_runtime.ets`
