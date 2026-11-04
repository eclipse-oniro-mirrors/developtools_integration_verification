# 17.11.1 Final Classes - 测试设计思维导图

## 概述
声明为 `final` 的类阻止扩展（不能有子类）。final 类的方法不能被重写（因为 final 类本身不能被继承，所以其方法天然不可重写）。编译时错误：如果 extends 子句中包含 final 类。

约束规则：
- `final class` 声明阻止该类被继承
- 编译时错误：extends 子句中使用 final 类 `ESE0178`
- final 类可以实现接口
- final 类可以被实例化、用作类型注解

## 子规则完整枚举

### 1. 基本 final 类声明与使用
- **正向编译**: 基本 final 类声明 `final class C {}`
- **正向编译**: final 类实例化 `new C()`
- **正向编译**: final 类作为类型注解 `let x: C`
- **正向编译**: final 类包含属性和方法
- **正向编译**: final 类实现接口
- **运行时**: final 类实例化、方法调用

### 2. 继承限制（反向编译）
- **反向编译**: 普通类 extends final 类
- **反向编译**: final 类 extends 另一个 final 类
- **反向编译**: final 类作为中间父类（深层继承链包含 final）
- **反向编译**: 使用 final 类作为 super 类型

### 3. 方法重写限制
- **正向编译**: final 类中定义方法（编译通过，因为类不可继承故方法天然不可重写）
- **反向编译**: （仅适用于非 final 类）非 final 类中 final 方法被重写
- **运行时**: final 类方法调度验证

### 4. final 类与接口
- **正向编译**: final 类实现多个接口
- **正向编译**: final 类被接口引用
- **运行时**: final 类通过接口引用调用方法

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 基本 final 类声明 | 编译通过 |
| compile-pass | final 类实例化 | 编译通过 |
| compile-pass | final 类作为类型注解 | 编译通过 |
| compile-pass | final 类包含属性和方法 | 编译通过 |
| compile-pass | final 类实现接口 | 编译通过 |
| compile-fail | extends final 类 | 编译错误 ESE0178 |
| compile-fail | final 类 extends 另一个 final 类 | 编译错误 ESE0178 |
| compile-fail | 深层继承链含 final 类 | 编译错误 ESE0178 |
| compile-fail | final 类用作 super 类型 | 编译错误 ESE0178 |
| compile-fail | 非 final 类中 final 方法被重写 | 编译错误 ESE1324203 |
| runtime | final 类实例化与属性访问 | 运行时通过 |
| runtime | final 类通过接口调用 | 运行时通过 |
| runtime | final 类方法调度 | 运行时通过 |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_11_01_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS (001-005), FAIL (006-010), RUNTIME (011-013)
