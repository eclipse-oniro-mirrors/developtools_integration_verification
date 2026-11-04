# 17.1 Type char - 测试设计思维导图

## 概述
char 是 ArkTS 实验特性中的字符类型。char 是 16 位 Unicode 代码单元（U+0000 到 U+FFFF），是一个 class 类型，是 Object 的子类型。char 可以用于类名可以出现的任何地方。声明语法：`let a_char: char = c'a'`，并可以赋值给 Object 类型。

## 子规则完整枚举

### 1. char 类型基本声明与赋值
- **正向编译**: 声明 char 变量、赋 char 字面量、char 赋给 Object、char 作为函数参数/返回值类型、char 作为类字段类型
- **反向编译**: 将 int 赋值给 char（无隐式转换）、将 string 赋值给 char、将 char 赋值给 int、将 boolean 赋值给 char
- **运行时**: char 变量持有正确的值、char 赋值给 Object 后 instanceof 检查

### 2. char 作为 class 类型 / Object 子类型
- **正向编译**: char 变量赋给 Object、Object 类型变量接受 char 字面量
- **反向编译**: Object 直接当 char 用（无显式转换）
- **运行时**: 通过 Object 引用访问 char 值、类型检查

### 3. char 在复合类型中使用
- **正向编译**: char[] 数组、泛型中使用 char（如 `Array<char>`）、char 作为 class 字段
- **反向编译**: 无对应场景
- **运行时**: char 数组遍历、索引访问

### 4. 边界值场景
- **正向编译**: U+0000 到 U+FFFF 范围内的 char 声明
- **反向编译**: char 关键字被用作变量名
- **运行时**: 边界字符值验证

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | char 变量声明和初始化 | 编译通过 |
| compile-pass | char 赋值给 Object | 编译通过（子类型） |
| compile-pass | char 作为函数参数/返回类型 | 编译通过 |
| compile-pass | char 作为类字段 | 编译通过 |
| compile-pass | char 泛型参数（Array<char>） | 编译通过 |
| compile-fail | int 赋值给 char | 编译错误 |
| compile-fail | char 赋值给 int | 编译错误 |
| compile-fail | string 赋值给 char | 编译错误 |
| compile-fail | boolean 赋值给 char | 编译错误 |
| compile-fail | char 关键字作变量名 | 编译错误 |
| runtime | char 值验证`c'a'==0x61` | 运行时通过 |
| runtime | char 赋给 Object 后 instanceof | 运行时通过 |
| runtime | char 数组操作 | 运行时通过 |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_01_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS (001-005), FAIL (006-010), RUNTIME (011-013)
