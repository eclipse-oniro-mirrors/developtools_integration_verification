# 17.7.2 Callable Types with $_instantiate Method - 测试设计思维导图

## 概述
ArkTS 17.7.2 节定义可通过声明静态特殊方法 `$_instantiate` 使类变为可调用类型。当类声明 `static $_instantiate` 方法后，可通过 `C(...)` 语法（短格式）或 `C.$_instantiate(factory, ...)`（显式调用）来调用该类。

**核心规则：**
- `$_instantiate` 的第一个参数必须是工厂函数：`() => ClassType`（参数名为 `__factory`）
- 短格式 `C("arg")` 调用时，编译器隐式提供工厂函数
- 如果类没有无参数构造函数，短格式会因编译器无法生成隐式工厂而产生编译时错误
- `$_instantiate` 是静态方法，不能访问泛型类型参数
- 同一类中多个 `$_instantiate` 签名相同但返回类型不同 -> 编译时错误
- 同一类中多个 `$_instantiate` 签名不同（参数不同） -> 通过重载合法
- `$_instantiate` 可以显式调用：`C.$_instantiate(factory, "arg")`

## 子规则枚举

### 1. 基本 $_instantiate 定义（含工厂参数）
- **规则**: 类声明 `static $_instantiate(__factory: () => ClassType)`，第一参数为工厂函数
- **正向编译**: 类声明 $_instantiate，使用 `C()` 短格式调用
- **反向编译**: 第一参数不是工厂函数类型
- **运行时**: 验证 C() 返回正确实例，$_instantiate 正确执行

### 2. 短格式调用 `C()` （隐式工厂）
- **规则**: 当类有无参数构造函数时，`C()` 编译器隐式传递工厂
- **正向编译**: 带有无参构造函数的类 + $_instantiate，使用 `C()` 调用
- **反向编译**: 类没有无参数构造函数但有 $_instantiate，使用 `C()` 调用应失败
- **运行时**: 验证 C() 和显式 C.$_instantiate 结果一致

### 3. $_instantiate 带额外参数
- **规则**: $_instantiate 可以有额外参数（第二、第三...参数），短格式 `C("arg1", "arg2")` 自动传递
- **正向编译**: $_instantiate(factory, arg1: Type1, arg2: Type2)，短格式 `C(arg1, arg2)`
- **反向编译**: 参数数量不匹配
- **运行时**: 验证额外参数正确传递和处理

### 4. 显式调用 $_instantiate
- **规则**: `C.$_instantiate(factory, ...)` 显式传递工厂和参数
- **正向编译**: 显式传递自定义工厂函数给 $_instantiate
- **反向编译**: 显式调用时工厂类型不匹配
- **运行时**: 显式调用与短格式调用行为对比

### 5. 无参数构造函数的类（隐式工厂来源）
- **规则**: 短格式依赖无参数构造函数来生成隐式工厂
- **正向编译**: 有多个构造函数的类（含无参），$_instantiate 短格式合法
- **反向编译**: 没有无参构造函数的类声明 $_instantiate，短格式编译失败
- **运行时**: 验证不同构造函数下的行为

### 6. 多个 $_instantiate 声明
- **规则**: 同参数不同返回类型 -> 编译错误；不同参数 -> 合法重载
- **正向编译**: 多个 $_instantiate 用不同参数列表（重载）
- **反向编译**: 多个 $_instantiate 相同参数不同返回类型 -> 编译失败
- **运行时**: 验证重载正确的版本被调用

### 7. $_instantiate 返回 void
- **规则**: $_instantiate 返回类型可以是 void
- **正向编译**: `static $_instantiate(__factory: () => T, ...): void`
- **反向编译**: 将 void 返回的 C() 赋值给变量
- **运行时**: 验证 void 返回型 $_instantiate 的调用执行

### 8. 泛型类中的 $_instantiate
- **规则**: $_instantiate 是静态方法，泛型类的 $_instantiate 不能访问类泛型类型参数
- **正向编译**: 泛型类声明 $_instantiate，在签名中使用具体类型
- **反向编译**: $_instantiate 在签名中引用类泛型类型参数 -> 编译失败
- **运行时**: 泛型类短格式调用验证

## 分类说明
- **compile-pass** (.ets 文件必须编译成功)
- **compile-fail** (.ets 文件必须产生编译时错误)
- **runtime** (.ets 文件编译并运行，含 main() + assert 断言)

## 文件命名规范
- 前缀: `EXP2_`（第 17 章 Experimental Features）
- 格式: `EXP2_17_07_02_YYY_{PASS|FAIL|RUNTIME}_{DESCRIPTION}.ets`
- 编号: PASS 001~, FAIL 接续, RUNTIME 接续
- 示例: `EXP2_17_07_02_001_PASS_BASIC_INSTANTIATE.ets`

## 边界值/异常场景
- $_instantiate 参数列表完全为空（无 factory 参数）-> 编译失败
- $_instantiate 工厂参数返回不兼容类型
- $_instantiate 声明的返回类型与类的实际类型不一致
- 继承关系中的 $_instantiate：子类是否继承父类的 $_instantiate
- 短格式调用嵌套 C()(C()()) 
- $_instantiate 与 $_invoke 同时存在时的行为
