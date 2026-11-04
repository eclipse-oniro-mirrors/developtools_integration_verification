# 17.11.2 Final Methods - 测试设计思维导图

## 概述
`final` 方法是 ArkTS 实验特性中的类方法修饰符。声明为 `final` 的方法不能被任何子类重写（override）。`final` 只能用于实例方法，不能与 `abstract` 或 `static` 修饰符组合使用。

## 子规则完整枚举

### 1. final 方法基本声明
- **正向编译**: 类中声明 final 实例方法，方法有返回值/无返回值，有参数/无参数
- **反向编译**: 无对应场景
- **运行时**: 调用 final 方法验证正确行为

### 2. final 方法禁止重写
- **正向编译**: 子类继承父类，不重写 final 方法（合法继承）
- **反向编译**: 子类重写父类的 final 方法
- **运行时**: 验证子类不重写时，调用继承的 final 方法

### 3. final 修饰符兼容性
- **正向编译**: final 实例方法声明
- **反向编译**: final + abstract 组合，final + static 组合
- **运行时**: 无额外场景

### 4. final 方法在继承层次中
- **正向编译**: 多层继承中 final 方法的传递，final 方法被子类继承但不重写
- **反向编译**: 多层继承中，中间类不重写，底层类尝试重写 final 方法
- **运行时**: 验证多层继承中 final 方法的行为

### 5. final 方法与接口
- **正向编译**: 类实现接口，类中的方法声明为 final
- **反向编译**: 接口中声明 final 方法（接口方法默认不是 final）
- **运行时**: 验证实现类中 final 方法的行为

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | final 实例方法基本声明 | 编译通过 |
| compile-pass | 子类不重写 final 方法 | 编译通过 |
| compile-pass | final 方法有参数和返回值 | 编译通过 |
| compile-pass | 多个 final 方法共存 | 编译通过 |
| compile-pass | 多层继承中继承 final 方法 | 编译通过 |
| compile-fail | 子类重写 final 方法 | 编译错误 ESE1324203 |
| compile-fail | abstract + final 组合 | 编译错误 ESE0047 |
| compile-fail | static + final 组合 | 编译错误 ESE0048/ESE0077 |
| compile-fail | 多层继承中底层类重写 final | 编译错误 ESE1324203 |
| compile-fail | 接口中声明 final 方法 | 编译错误 |
| runtime | 调用 final 方法验证行为 | 运行时通过 |
| runtime | 子类继承 final 方法调用 | 运行时通过 |
| runtime | 多层继承中 final 方法调用 | 运行时通过 |
| runtime | final 方法修改实例状态 | 运行时通过 |

## 文件命名规范
- 前缀：`EXP2_`（17_Experimental_Features）
- 格式：`EXP2_17_11_2_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号：PASS (001-005), FAIL (006-010), RUNTIME (011-014)
