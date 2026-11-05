# 17.10.2 Native Methods - 测试设计思维导图

## 概述
`native` 关键字用于声明原生方法（Native Method）。原生方法是类或接口中的方法，使用 `native` 关键字标记，其实现由平台相关代码（如 C 语言）提供。

核心规则：
- 原生方法使用 `native` 关键字声明，方法体必须为空（分号或直接结束）
- 编译期错误：native 方法有 block body（{ }）
- 编译期错误：native 与 abstract 组合使用（ESE0047: "an abstract method can't have ... native modifier"）
- 编译期错误：interface 中不能使用 native 方法（语法错误）
- 编译期错误：native 方法无显式返回类型

## 子规则完整枚举

### 1. 基本原生方法声明
- **正向编译**: class 中声明 native method、多个 native methods、native method 带参数和返回类型、使用分号作为方法体
- **反向编译**: native method 带 block body（ESE0083）、native method 无显式返回类型（ESE0018）
- **运行时**: 包含 native method 的 class 正常运行、实例化 class 后调用非 native 方法

### 2. 原生方法修饰符组合
- **正向编译**: `static native` 方法、`private native` 方法
- **反向编译**: `native abstract` 组合（ESE0047）、interface 中使用 native（语法错误 ESY0224）
- **运行时**: static native 方法通过类名访问（不调用）

### 3. 原生方法与继承
- **正向编译**: 子类 override 父类的 native method 为普通方法
- **反向编译**: 无对应场景
- **运行时**: override 后的方法正常调用

### 4. 原生方法与泛型
- **正向编译**: native method 使用泛型类型参数 `native foo<T>(a: T): T`
- **反向编译**: 无对应场景
- **运行时**: 无对应场景

### 5. 原生方法类型检查
- **正向编译**: 正确的类型匹配
- **反向编译**: 原生方法返回类型不匹配赋值目标（ESE0318）
- **运行时**: 调用未实现的 native method 触发 LinkerUnresolvedMethodError

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | class 中基本 native method 声明 | 编译通过 |
| compile-pass | native method 带参数和返回类型 | 编译通过 |
| compile-pass | static native method | 编译通过 |
| compile-pass | private native method | 编译通过 |
| compile-pass | 多个 native methods 共存 | 编译通过 |
| compile-pass | native method 泛型参数 | 编译通过 |
| compile-pass | native method 分号体 | 编译通过 |
| compile-pass | override native method | 编译通过 |
| compile-fail | native method 带 block body | 编译错误 ESE0083 |
| compile-fail | native + abstract 组合 | 编译错误 ESE0047 |
| compile-fail | interface 中 native method | 语法错误 ESY0224 |
| compile-fail | native method 无显式返回类型 | 编译错误 ESE0018 |
| compile-fail | native method 返回类型不匹配 | 编译错误 ESE0318 |
| runtime | 包含 native method 的 class 正常运行 | 退出码 0 |
| runtime | 调用 native method 触发 LinkerUnresolvedMethodError | 运行时报错 |
| runtime | override native method 后正常调用 | 退出码 0 |

## 文件命名规范
- 前缀：`EXP2_`
- 格式：`EXP2_17_10_02_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS (001-008), FAIL (009-013), RUNTIME (014-016)
