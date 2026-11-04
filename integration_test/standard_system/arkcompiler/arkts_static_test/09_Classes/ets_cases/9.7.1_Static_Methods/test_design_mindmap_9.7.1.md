# 9.7.1 静态方法 (Static Methods) - 测试设计思维导图

## 概述
本节定义 ArkTS 的**静态方法 (Static Method)**：用 `static` 修饰符声明在 class 中的方法。

**核心语义（依据 spec/classes.md Static Methods）：**

- 静态方法**不依赖特定对象实例**调用，始终通过类名限定调用。
- 静态方法**不实现、不重写 (override)** 超类或超接口的方法。
- 静态方法**不被继承**：派生类中同名静态方法是独立方法，不构成重写关系。
- 静态方法可访问同一 class（或其派生类）对象的 `protected` / `private` 成员，但仅限通过**参数或局部变量**访问。

**编译期约束 (compile-time error)：**

- `static` 不可与 `abstract`、`final`、`override` 组合使用。
- 静态方法的方法头或方法体中**不可使用外围 class 的类型参数 (type parameter)**。
- 静态方法内部**不可使用 `this`** 或 `super` 关键字。
- 静态方法**不可通过实例对象调用**（必须用类名限定调用）。

## 测试分类与测试点覆盖

### 一、compile-pass（3 个用例）— 合法声明与调用

| 编号 | 用例 ID | 测试点 | 验证内容 |
|------|--------|-------|---------|
| 001 | PASS_STATIC_METHOD_BASIC | 静态方法基本声明与调用 | `static` 方法声明、`static` getter/setter、`static` 字段访问，通过类名限定调用 |
| 004 | PASS_STATIC_METHOD_ACCESS_PROTECTED_PRIVATE | 静态方法访问同类 protected/private 成员 | 通过参数或局部变量访问同类型对象的 `protected`/`private` 成员；派生类静态方法访问基类 `protected` 字段 |
| 040 | PASS_STATIC_MULTI_PARAM | 静态方法多参数声明 | 静态方法支持多参数（`sum3(a: int, b: int, c: int)`、`max(a: int, b: int)`），编译合法 |

### 二、compile-fail（10 个用例）— 违反约束的编译错误

| 编号 | 用例 ID | 测试点 | 触发规则 |
|------|--------|-------|---------|
| 002 | FAIL_STATIC_ABSTRACT_THIS | `static` + `abstract` 组合 + `this` | `static` 与 `abstract` 同时修饰导致 compile-time error；静态方法内使用 `this` 导致 compile-time error |
| 005 | FAIL_STATIC_METHOD_THIS_KEYWORD | 静态方法内 `this` 引用实例字段 | 静态方法内用 `this.x`、`this.y` 访问实例字段 → compile-time error |
| 006 | FAIL_STATIC_METHOD_SUPER_KEYWORD | 静态方法内 `super` 调用 | 静态方法内用 `super.foo()` 调用父类方法或 `super.x` 访问父类字段 → compile-time error |
| 007 | FAIL_STATIC_METHOD_TYPE_PARAMETER | 静态方法使用外围泛型参数 | 静态方法签名或方法体中使用外围 class 的类型参数 `T` 作为返回类型、参数类型或局部变量类型 → compile-time error |
| 009 | FAIL_STATIC_METHOD_OVERRIDE_MODIFIER | `static` + `override` 组合 | `static` 与 `override` 同时修饰方法 → compile-time error（静态方法不参与重写机制） |
| 010 | FAIL_STATIC_METHOD_CALLED_ON_INSTANCE | 通过实例调用静态方法 | 用实例对象 `obj.getClassName()`、`obj.compute()` 调用静态方法 → compile-time error |
| 017 | FAIL_STATIC_OVERRIDE | `static override` 简化验证 | 最小化用例：`static override foo()` → compile-time error |
| 022 | FAIL_STATIC_WITH_ABSTRACT | `abstract static` 简化验证 | 最小化用例：`abstract static foo()` → compile-time error |
| 028 | FAIL_STATIC_THIS | `static` 内 `this` 简化验证 | 最小化用例：`static foo()` 内执行 `let x = this` → compile-time error |
| 029 | FAIL_STATIC_SUPER | `static` 内 `super` 简化验证 | 最小化用例：`static foo()` 内执行 `super.toString()` → compile-time error |

### 三、runtime（5 个用例）— 运行时行为验证

| 编号 | 用例 ID | 测试点 | 验证内容 |
|------|--------|-------|---------|
| 003 | RUNTIME_STATIC_METHOD_CALL | 静态方法运行时调用 | 通过类名调用静态方法；私有静态字段递增/重置/读取；派生类通过基类名间接访问基类静态字段（3 个 assert） |
| 008 | RUNTIME_STATIC_METHOD_NOT_INHERITED | 静态方法不被继承 | `Base008.baseOnly()` 与 `Derived008.baseOnly()` 分别返回不同字符串，证明静态方法独立存在、不被继承（6 个 assert） |
| 021 | RUNTIME_STATIC_ACCESS_PROTECTED | 静态方法访问 `protected static` 字段 | `static` 方法通过 `Container.getVal()` 访问并返回 `protected static` 字段值（1 个 assert） |
| 038 | RUNTIME_STATIC_FACTORY | 静态工厂方法模式 | `private constructor` 配合 `static create()` 工厂方法返回新实例，验证单例/工厂模式可行性 |
| 041 | RUNTIME_STATIC_CALC | 静态方法阶乘计算 | `Calc041.fact(5)` 验证静态递归方法计算结果为 120（1 个 assert） |

## 边界值与边缘场景

### 修饰符组合边界
- `static` + `abstract` — 非法组合（002, 022）
- `static` + `override` — 非法组合（009, 017）
- `static` + `final` — 非法组合（spec 规定但本节未独立验证）
- `static` 单独使用 — 合法（001, 040）

### 关键字使用边界
- `this` 在 static 方法内 → compile-time error，无论 this 引用的是实例字段还是方法（005, 028）
- `super` 在 static 方法内 → compile-time error，无论 super 调用的是方法还是字段（006, 029）
- 外围 class 的 type parameter `T` 出现在 static 方法签名/体中 → compile-time error（007）

### 调用方式边界
- 类名限定调用 — 合法唯一方式（`ClassName.staticMethod()`）
- 实例对象调用 — compile-time error（010）
- 派生类通过基类名访问基类静态方法 — 合法，因为静态方法不依赖继承链

### 可见性边界
- 静态方法通过参数/局部变量访问同类 `private` 成员 — 合法（004）
- 静态方法通过参数/局部变量访问同类 `protected` 成员 — 合法（004）
- 静态方法访问 `protected static` 字段 — 合法（021）
- 静态方法访问 `private static` 字段 — 合法（003，`private static counter++`）

### 继承边界
- 静态方法不参与继承：派生类同名静态方法是独立方法，不构成 override（008）
- `Derived.bar()` 在基类定义了 `static bar()` 时 → compile-time error（不被继承）

## 编号规划

| 分类 | 编号范围 | 数量 |
|------|---------|------|
| compile-pass | 001, 004, 040 | 3 |
| compile-fail | 002, 005, 006, 007, 009, 010, 017, 022, 028, 029 | 10 |
| runtime | 003, 008, 021, 038, 041 | 5 |
| **总计** | | **18** |

## 文件命名规范

```
CLS_09_07_NNN_{CATEGORY}_{DESCRIPTION}.ets
```

- **前缀：** `CLS_09_07` — Classes 章，9.7.1 节（静态方法）
- **NNN：** 三位数字编号（如 `001`）
- **CATEGORY：** `PASS` / `FAIL` / `RUNTIME`
- **DESCRIPTION：** 测试点英文简述（下划线分隔，大写）
- **后缀：** `.ets`

**示例：**
- `CLS_09_07_001_PASS_STATIC_METHOD_BASIC.ets`
- `CLS_09_07_002_FAIL_STATIC_ABSTRACT_THIS.ets`
- `CLS_09_07_003_RUNTIME_STATIC_METHOD_CALL.ets`
