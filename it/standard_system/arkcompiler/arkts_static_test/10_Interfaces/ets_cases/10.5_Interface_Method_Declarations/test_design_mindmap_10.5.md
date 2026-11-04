# 10.5 Interface Method Declarations - 测试设计思维导图

## 概述
Interface method declaration specifies method name and signature (abstract). 默认可访问性为 public。Default method body is experimental.

## 子类型覆盖
### 1. Abstract method declaration
- 正向编译: 无方法体的抽象方法

### 2. Multiple parameters
- 正向编译: 带参数的方法

### 3. Return type
- 正向编译: 有返回值的方法
- 正向编译: void 返回值方法

### 4. Class implements interface
- 正向编译: implements 接口的类
- 运行时: 实现接口的方法运行时正确
