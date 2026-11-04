# 17.7 Callable Types - 测试设计思维导图

## 概述
ArkTS 17.7 节定义可调用类型（Callable Types），允许类通过声明静态方法 `$_invoke` 或 `$_instantiate` 使类类型变为可调用。当类 C 包含静态 `$_invoke` 时，`C()` 等价于 `C.$_invoke()`；当类 C 包含静态 `$_instantiate` 时，`C()` 等价于 `C.$_instantiate()`（工厂模式）。一个类只能拥有 `$_invoke` 或 `$_instantiate` 其中之一，不能同时拥有两者（编译时错误）。可拥有多个不同签名的实现（重载）。

## 子规则完整枚举

### 1. 静态 $_invoke — 类变为可调用（函数风格）
- **规则**: 类声明 `static $_invoke(...): ReturnType` 后，类名可直接作为函数调用 `C(args)`
- **正向编译**: 声明 static $_invoke 无参返回基本类型、带参返回基本类型
- **反向编译**: 无（此规则是使能规则）
- **运行时**: `C()` 调用实际执行 $_invoke 方法体，验证返回值正确

### 2. 静态 $_instantiate — 类变为可调用（工厂风格）
- **规则**: 类声明 `static $_instantiate(...): C` 后，`C(args)` 等价于工厂方法调用
- **正向编译**: 声明 static $_instantiate 无参返回类实例、带参返回类实例
- **反向编译**: 无
- **运行时**: `C()` 调用返回类实例，验证 instanceof

### 3. $_invoke 与 $_instantiate 互斥
- **规则**: 一个类不能同时拥有 `$_invoke` 和 `$_instantiate`（编译时错误）
- **正向编译**: N/A（不应编译通过）
- **反向编译**: 同一类中同时声明 static $_invoke 和 static $_instantiate
- **运行时**: N/A

### 4. 实例 $_invoke 不使类变为可调用
- **规则**: 只有 `static $_invoke` 使类可调用；实例 `$_invoke` 不产生此效果
- **正向编译**: N/A（类不可调用是默认行为）
- **反向编译**: 类只有实例 $_invoke（非 static），尝试 `C()` 调用应失败
- **运行时**: N/A

### 5. 多签名重载（Multiple Signatures）
- **规则**: 可拥有多个不同签名的 `$_invoke` 或 `$_instantiate` 实现
- **正向编译**: 多个 $_invoke 重载（不同参数类型/数量）、多个 $_instantiate 重载
- **反向编译**: 重载签名冲突（相同的参数签名）
- **运行时**: 根据参数类型/数量正确分发到对应重载

### 6. new 表达式调用构造函数（非 $_invoke/$_instantiate）
- **规则**: `new C(args)` 始终调用构造函数，而非 $_invoke/$_instantiate
- **正向编译**: 类同时有构造函数和 $_invoke，new 表达式调用构造函数
- **反向编译**: N/A（这是语义规则，通过 runtime 验证行为差异）
- **运行时**: 验证 `new C(args)` 调用构造函数而非 $_invoke

### 7. 显式调用形式
- **规则**: `C.$_invoke(args)` 和 `C.$_instantiate(args)` 是显式调用形式
- **正向编译**: 直接调用 `C.$_invoke()`、`C.$_instantiate()`
- **反向编译**: 无
- **运行时**: 验证显式调用与 `C()` 简写行为一致

### 8. 静态方法不能访问泛型类型参数
- **规则**: 静态 $_invoke/$_instantiate 不能使用类的泛型类型参数
- **正向编译**: 非泛型类中的 $_invoke
- **反向编译**: 泛型类 `C<T>` 中的 `static $_invoke(): T`（静态方法引用 T）
- **运行时**: N/A

## 测试点汇总

| 分类 | 测试点 | 期望结果 |
|------|--------|---------|
| compile-pass | 静态 $_invoke 无参，类可调用 | 编译通过 |
| compile-pass | 静态 $_invoke 带参，类可调用 | 编译通过 |
| compile-pass | 静态 $_instantiate 无参，类可调用 | 编译通过 |
| compile-pass | 静态 $_instantiate 带参，类可调用 | 编译通过 |
| compile-pass | 多个 $_invoke 重载（不同签名） | 编译通过 |
| compile-pass | 多个 $_instantiate 重载（不同签名） | 编译通过 |
| compile-pass | 显式调用 C.$_invoke() | 编译通过 |
| compile-pass | 显式调用 C.$_instantiate() | 编译通过 |
| compile-fail | 同时声明 $_invoke 和 $_instantiate | 编译错误 |
| compile-fail | 仅实例 $_invoke（非 static），尝试 C() | 编译错误 |
| compile-fail | 泛型类中 static $_invoke 引用类型参数 T | 编译错误 |
| compile-fail | 无 $_invoke/$_instantiate 的类尝试 C() | 编译错误 |
| runtime | $_invoke 简写 C() 返回正确值 | 运行时通过 |
| runtime | $_instantiate 简写 C() 返回实例 | 运行时通过 |
| runtime | $_invoke 重载分发正确 | 运行时通过 |
| runtime | new 表达式调用构造函数而非 $_invoke | 运行时通过 |
| runtime | 显式 C.$_invoke() 与 C() 行为一致 | 运行时通过 |

## 分类说明
- **compile-pass** (.ets 文件必须编译成功)
- **compile-fail** (.ets 文件必须产生编译时错误)
- **runtime** (.ets 文件编译并运行，含 main() + assert 断言)

## 文件命名规范
- 前缀: `EXP2_`（第 17 章 Experimental Features）
- 格式: `EXP2_17_07_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号: PASS 001~，FAIL 接续，RUNTIME 接续
- 示例: `EXP2_17_07_001_PASS_BASIC_INVOKE.ets`

## 边界值/异常场景
- $_invoke 返回 void
- $_invoke 参数类型与调用实参不匹配
- 嵌套调用 `C()()`
- 类有构造函数也有 $_invoke，验证 new 的行为差异
- 空参数列表的 $_invoke/$_instantiate
