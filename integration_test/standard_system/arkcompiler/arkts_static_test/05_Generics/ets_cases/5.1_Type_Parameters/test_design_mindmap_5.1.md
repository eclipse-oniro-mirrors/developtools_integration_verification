# 5.1 Type Parameters - 测试设计思维导图

## 概述
Type parameters are declared in type parameter sections, used as ordinary types inside generics. Each can have constraint, default type, and variance modifier (in/out).

## 子类型覆盖
### 1. Basic type parameter declaration (5.1)
- 正向编译: 泛型类/接口/函数/类型别名声明的类型参数
- 运行时: 泛型实例化正确

### 2. Type Parameter Constraint (5.1.1)
- 正向编译: extends 约束（单个类型、联合类型、字面量联合、keyof）
- 反向编译: 类型参数不满足约束
- 运行时: 约束满足时的运行时行为

### 3. Dependent type parameters (5.1.1)
- 正向编译: 类型参数依赖前面的类型参数
- 反向编译: 不满足依赖约束

### 4. Circular dependency detection (5.1.1)
- 反向编译: 自依赖、循环依赖

### 5. Type Parameter Default (5.1.2)
- 正向编译: 有默认值省略类型参数、多参数部分默认
- 反向编译: 无默认参数跟在有默认参数后、默认引用后文参数

## 文件命名规范
- GEN_05_01_YYY_{CATEGORY}_{DESCRIPTION}.ets
