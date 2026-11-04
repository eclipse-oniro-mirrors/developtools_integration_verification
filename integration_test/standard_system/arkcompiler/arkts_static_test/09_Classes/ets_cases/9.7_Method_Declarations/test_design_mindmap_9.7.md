# 9.7 Method Declarations (方法声明) - 测试设计思维导图

## 概述
spec §9.7：方法声明（Method Declaration）定义了 class 或 interface 中 method 的语法结构：
- **classMethodDeclaration**: `methodModifier* identifier signature block?`
- **interfaceMethodDeclaration**: `identifier signature`
- method 可以是 instance method 或 static method
- method 可带有 modifier：`abstract`, `static`, `override`, `final`, `protected`, `public`, `private`, `async`
- 非 static abstract method 必须有 body (block)，abstract method 不能有 body
- 同一声明中 method name 不能与 field name 冲突
- 同一 method 声明中 modifier 不能重复出现
- `static` 与 `abstract` 互斥：abstract method 不能有 static modifier

## 核心规则
- method 基本语法：`modifier* identifier signature block?`
- method modifier 集合：`abstract | static | override | final | protected | public | private | async`
- method name 与 field name 互斥：同一声明中不可重复
- modifier 不可重复：同一 method 声明中 modifier 最多出现一次
- `static` 与 `abstract` 互斥：`static abstract` 为编译期错误
- `abstract` method 不能有 body；非 abstract method 必须有 body
- 子类可使用 `override` 重写父类非 `final` 方法
- 类中非静态 method 可实现 interface 声明的 method

## 测试分类

### compile-pass（正向用例 — 验证合法声明编译通过）
- **001: 基本方法声明语法**
  - 无修饰符方法声明 (noReturn)
  - 带返回类型方法 (withReturn: int)
  - void 返回方法 (noReturn: void)
  - 多参数方法 (multiParam: int + string + boolean)
  - 无参数方法 (noParams: int)
- **002: 合法修饰符组合**
  - 子类使用 `override` 重写父类普通方法
  - abstract class 父类 + concrete subclass override
- **003: 接口方法实现**
  - class 实现 interface 声明的 method
  - 非静态 method 匹配 interface signature

### compile-fail（反向用例 — 验证非法声明编译拒绝）
- **004: 方法名与字段名冲突**
  - 同一声明中 field `value` 与 method `value()` 同名
  - spec 规则：name already used for a field in the same declaration
- **005: 修饰符重复**
  - `abstract abstract` 同一 modifier 出现两次
  - spec 规则：modifier appears more than once
- **006: static + abstract 组合**
  - `static abstract` 修饰符互斥组合
  - spec 规则：abstract method cannot have static modifier

### runtime（运行时用例 — 验证方法调用语义）
- **007: 实例方法分派（Method Dispatch）**
  - 通过对象引用调用 instance method
  - `add(2, 3) == 5`、`mul(4, 5) == 20`
  - 验证方法返回值正确性
- **008: void 方法调用与副作用**
  - void method 无返回值但有副作用
  - `increment()` / `reset()` 修改全局计数器
  - 验证调用次数与副作用正确性 (gCounter == 2)

## 边界值与边缘场景

### 语法边界
- method 参数列表为空 vs 多参数（不同类型组合）
- 返回类型为 void vs 具体类型 (int/string/boolean)
- modifier 数量：0 个 vs 1 个 vs 多个合法组合
- interface method declaration（无 body、无 modifier）

### 修饰符组合边界
- 合法组合未全覆盖：`final override`、`protected override`、`public static` 等
- `abstract` 与 `override` 组合（抽象子类重写）
- `async` 与返回值类型组合
- 访问控制 modifier (`public`/`private`/`protected`) 与 `static`/`abstract` 组合

### 命名冲突边界
- method 与 field 同名（已覆盖 — 004）
- method 与 method 同名但不构成 override（同一声明重复定义）
- method 与 parent class field 同名（非冲突场景）

### 继承与接口边界
- 多重接口实现时 method 签名匹配
- 父类 method 为 `final` 时子类 `override` 拒绝
- abstract class 中 abstract method 无 body + concrete method 有 body

## 命名规范

| 元素 | 格式 | 说明 |
|------|------|------|
| 用例 ID 前缀 | `CLS_09_07_` | CLS = Classes, 09 = 章节号, 07 = 节号 |
| compile-pass 编号 | `001` ~ `003` | 正向编译通过用例 |
| compile-fail 编号 | `004` ~ `006` | 反向编译拒绝用例 |
| runtime 编号 | `007` ~ `008` | 运行时验证用例 |
| 文件命名 | `CLS_09_07_NNN_{PASS\|FAIL\|RUNTIME}_{DESC}.ets` | 完整用例文件名 |
| 截图命名 | `{id}.png` / `{id}_DIAG.png` | 编译期截图 / 诊断信息截图 |

### 当前用例清单（8 total: 3P + 3F + 2R）

| 编号 | 分类 | ID | 测试点 |
|------|------|-----|--------|
| 001 | compile-pass | CLS_09_07_001_PASS_GENERAL_METHOD_SYNTAX | 基本方法声明语法 |
| 002 | compile-pass | CLS_09_07_002_PASS_METHOD_MODIFIER_COMBO | 合法修饰符组合 (override) |
| 003 | compile-pass | CLS_09_07_003_PASS_METHOD_IMPLEMENTS_INTERFACE | 非静态方法实现接口 |
| 004 | compile-fail | CLS_09_07_004_FAIL_METHOD_FIELD_CONFLICT | 方法名与字段名冲突 |
| 005 | compile-fail | CLS_09_07_005_FAIL_DUPLICATE_MODIFIER | 修饰符重复 |
| 006 | compile-fail | CLS_09_07_006_FAIL_STATIC_ABSTRACT_COMBO | static + abstract 互斥 |
| 007 | runtime | CLS_09_07_007_RUNTIME_METHOD_DISPATCH | 实例方法分派 |
| 008 | runtime | CLS_09_07_008_RUNTIME_VOID_METHOD_CALL | void 方法调用与副作用 |

## 测试覆盖度分析

| 维度 | 已覆盖 | 未覆盖 |
|------|--------|--------|
| 基本语法 | no-modifier / with-return / void / multi-param / no-param (001) | - |
| 修饰符合法性 | override (002), implements (003) | final, protected, public, private, async 独立与组合 |
| 命名冲突 | method-field 冲突 (004) | method-method 重复声明 |
| 修饰符约束 | duplicate modifier (005), static+abstract (006) | 其余互斥组合 |
| 运行时语义 | instance dispatch (007), void side-effect (008) | static method 调用、async method 行为 |
