# 3.1 Predefined Types - 测试设计思维导图

## 概述
预定义类型是 ArkTS 的内置类型，包括值类型（Value Types）、引用类型和特殊类型。

## 子类型覆盖

### 1. 值类型（Value Types）
- **整数类型**: byte, short, int, long
  - 正向编译: 声明、赋值、算术运算、边界值
  - 反向编译: 类型不匹配、溢出赋值、无强制转换的窄化
  - 运行时: 除零错误、溢出行为
- **浮点类型**: float, double/number
  - 正向编译: 声明、IEEE 754 运算、混合类型算术
  - 反向编译: 非法窄化转换、不兼容类型赋值
  - 运行时: NaN 传播、无穷大、上溢/下溢
- **布尔类型 boolean**
  - 正向编译: 逻辑运算、相等性比较、控制流条件
  - 反向编译: 数值与布尔转换、非法运算符
  - 运行时: 短路求值
- **字符类型 char**（实验特性）
  - 正向编译: 字符字面量、赋值
  - 反向编译: 非法字符字面量、溢出
  - 运行时: 比较、toString

### 2. Type Any
- 正向编译: Any 变量接受任意值（数值、字符串、Object、null、undefined）
- 反向编译: 对 Any 类型调用方法/字段、将 Any 赋值给类型变量而不做强制转换
- 运行时: 使用 instanceof 检查 Any

### 3. Type Object
- 正向编译: Object 变量接受类实例、数值类型通过装箱
- 反向编译: Object 变量不能接受 null/undefined、对 Object 做原始类型运算
- 运行时: instanceof 类型区分

### 4. Type never
- 正向编译: never 作为抛出函数的返回类型、穷举条件分支
- 反向编译: 将任何值赋给 never、从 never 函数返回
- 运行时: 不可达代码验证

### 5. Type void / undefined
- 正向编译: 函数返回 void/undefined、可选参数
- 反向编译: 使用 void 作为变量类型、将 undefined 赋给非空类型
- 运行时: undefined 作为默认值

### 6. Type null
- 正向编译: null 在联合类型中使用、将 null 赋给 T|null
- 反向编译: 将 null 赋给非空类型、没有联合类型的 null 字面量
- 运行时: null 检查

### 7. Type string
- 正向编译: 字符串字面量、拼接、模板字符串
- 反向编译: 非法字符串运算
- 运行时: 空字符串、字符串比较

### 8. Type bigint
- 正向编译: bigint 字面量（123n）、算术运算、asIntN/asUintN
- 反向编译: bigint 与 number 混用、隐式转换
- 运行时: 大整数精度

### 9. 数组类型（Array Types）
- **可变数组（Resizable Array: Array<T> / T[]）**
  - 正向编译: 数组字面量、索引访问、length、push/pop
  - 反向编译: 编译期常量越界、类型不匹配
  - 运行时: 动态边界、迭代
- **固定长度数组（FixedArray<T>）**
  - 正向编译: 固定大小字面量、类型化访问
  - 反向编译: FixedArray 与 T[] 交叉赋值
  - 运行时: 固定长度强制

### 10. 函数类型（Type Function）
- 正向编译: 函数类型变量、lambda 赋值、回调
- 反向编译: 签名不匹配的赋值
- 运行时: 通过函数类型变量调用函数

## 分类说明
- **compile-pass**（.ets 文件必须编译成功）
- **compile-fail**（.ets 文件必须产生编译时错误）
- **runtime**（.ets 文件测试运行时行为）

## 文件命名规范
- `<分类>_<子类型>_<场景>.ets`
- 示例: `ValueTypes_Int_BasicDeclare_pass.ets`
- 示例: `ValueTypes_Byte_Overflow_fail.ets`