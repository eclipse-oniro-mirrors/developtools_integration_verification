# 9.7.3 抽象方法 (Abstract Methods) -- 测试设计思维导图

## 概述
本节定义 **abstract method (抽象方法)** 的声明规则与语义约束。

**核心语义：**
- abstract method 由 `abstract` 修饰符声明，仅引入签名而无实现体（body）
- 只有 abstract class 可以包含 abstract method；非 abstract class 包含 abstract method 是 compile-time error
- abstract class 不可实例化 (`new`)，但可定义 constructor 供子类通过 `super` 调用
- 非 abstract 子类必须实现所有继承的 abstract method（override-compatible signature）
- abstract method 不可与 `private`/`static`/`final`/`native`/`async` 修饰符同时使用
- abstract method 的 body 必须为空（block body 是 compile-time error）
- abstract method 可 override 另一 abstract method，也可 override 基类/接口的非 abstract method

## 核心规则

### abstract method 声明的合法上下文
| 上下文 | 示例 |
|--------|------|
| abstract class 内声明 abstract method | `abstract class A { abstract foo(): void }` |
| abstract 子类 override 基类 abstract method | `abstract class B extends A { abstract override foo(): void }` |
| abstract 子类将基类具体方法重新声明为 abstract | `abstract class M extends Base { abstract override greet(): void }` |
| abstract 子类将接口 default 实现重新声明为 abstract | `abstract class X implements I { abstract foo(): void }` |

### abstract 与五大修饰符互斥关系
| 组合 | 语义冲突 | 用例 |
|------|---------|------|
| `abstract + private` | private 方法不可被子类访问/覆盖 | 006 |
| `abstract + static` | static 方法属于类而非实例，无多态分派 | 015, 019 |
| `abstract + final` | final 禁止覆盖，abstract 要求覆盖 | 016 |
| `abstract + native` | native 有原生实现体，abstract 无实现体 | 017, 039 |
| `abstract + async` | async 隐式返回 Promise，abstract 无实现体 | 018 |

### 继承与实现约束
- 非 abstract 子类必须实现所有继承的 abstract method（否则 compile-time error）
- override 的签名必须与基类方法 override-compatible
- abstract method body 必须是空（分号），block body 导致 compile-time error

## 测试点覆盖

### 1. abstract method 基本声明与实现 (compile-pass)
- abstract class 声明 abstract method，非 abstract 子类提供实现
- 多级 abstract 继承链（abstract class extends abstract class，最终具体子类实现）
- abstract 子类以 abstract method 覆盖基类 abstract method，同时新增 abstract method
- abstract 子类以 abstract method 覆盖基类非 abstract 具体方法（re-abstraction）
- abstract 子类以 abstract method 覆盖接口 default 实现（implements + abstract）

### 2. abstract method 互斥修饰符验证 (compile-fail)
- 非 abstract class 包含 abstract method（编译拒绝）
- abstract method 声明为 private（编译拒绝）
- abstract 与 static 同时使用（编译拒绝）
- abstract 与 final 同时使用（编译拒绝）
- abstract 与 native 同时使用（编译拒绝）
- abstract 与 async 同时使用（编译拒绝）
- 非 abstract 子类未实现所有继承的 abstract method（编译拒绝）

### 3. abstract method 运行时多态分派 (runtime)
- 基类引用指向不同子类实例，多态分派到正确的 abstract method 实现
- 基类引用分派 + 非 abstract 方法（describe）正常调用
- 三级抽象继承链（Layer1 -> Layer2 -> ConcreteLeaf）正确分派到叶子类实现
- 子类 override 基类非抽象方法，基类引用分派到子类实现
- 多个子类（如 Square/Rect）分别实现抽象方法，验证各自返回值独立

## 边界值与边缘场景

- abstract class 仅有 abstract method，无具体 method 和 field
- abstract class 同时包含 abstract method 和具体 method
- abstract class 同时 extends 基类且 implements 接口，接口方法被声明为 abstract
- abstract 子类不 override 任何方法（仅继承 abstract method），验证是否可编译
- abstract method 无参数 vs. 多参数 vs. variadic 参数
- abstract method 返回 void / primitive type / reference type / generic type
- abstract class 包含 constructor，验证子类 super() 调用链
- 深度继承链（>=3 层）中抽象方法逐渐收敛到具体实现

## 编号规划
- compile-pass: CLS_09_07_005 ~ CLS_09_07_022 (4 cases)
- compile-fail: CLS_09_07_006 ~ CLS_09_07_039 (8 cases)
- runtime: CLS_09_07_020 ~ CLS_09_07_035 (5 cases)

## 文件命名规范
`CLS_09_07_NNN_{CATEGORY}_{DESCRIPTION}.ets`

其中：
- `CLS` = Classes 章节前缀
- `09_07` = 9.7 Method Declarations
- `NNN` = 三位数字序号
- `{CATEGORY}` = `PASS` (compile-pass) / `FAIL` (compile-fail) / `RUNTIME` (runtime)
- `{DESCRIPTION}` = 测试场景简短描述（大写下划线）

## 现有用例清单

### compile-pass (4)
| 序号 | 用例 ID | 测试内容 |
|------|---------|---------|
| 001 | CLS_09_07_005_PASS_ABSTRACT_METHOD_IMPL | abstract 类声明 abstract method，非 abstract 子类提供实现，多级 abstract 继承链 |
| 002 | CLS_09_07_020_PASS_ABSTRACT_OVERRIDE_NONABSTRACT | abstract 子类以 abstract method 覆盖基类非 abstract 具体方法 |
| 003 | CLS_09_07_021_PASS_ABSTRACT_OVERRIDE_INTERFACE | abstract 子类以 abstract method 覆盖接口默认实现 |
| 004 | CLS_09_07_022_PASS_ABSTRACT_OVERRIDE_ABSTRACT | abstract 子类覆盖基类 abstract method 并新增 abstract method |

### compile-fail (8)
| 序号 | 用例 ID | 测试内容 |
|------|---------|---------|
| 005 | CLS_09_07_006_FAIL_ABSTRACT_PRIVATE_NONABSTRACT | 非 abstract 类包含 abstract method / abstract method 声明为 private |
| 006 | CLS_09_07_015_FAIL_ABSTRACT_STATIC | abstract 与 static 同时使用 |
| 007 | CLS_09_07_016_FAIL_ABSTRACT_FINAL | abstract 与 final 同时使用 |
| 008 | CLS_09_07_017_FAIL_ABSTRACT_NATIVE | abstract 与 native 同时使用 |
| 009 | CLS_09_07_018_FAIL_ABSTRACT_ASYNC | abstract 与 async 同时使用 |
| 010 | CLS_09_07_019_FAIL_ABSTRACT_NOT_IMPLEMENTED | 非 abstract 子类未实现所有继承的 abstract method |
| 011 | CLS_09_07_019_FAIL_ABSTRACT_STATIC | abstract 不能与 static 组合（重复验证） |
| 012 | CLS_09_07_039_FAIL_ABSTRACT_NATIVE | abstract 不能与 native 组合（重复验证） |

### runtime (5)
| 序号 | 用例 ID | 验证内容 |
|------|---------|---------|
| 013 | CLS_09_07_020_RUNTIME_ABSTRACT_DISPATCH | 基类引用指向 Dog/Cat 子类，多态分派到正确 speak() 实现 |
| 014 | CLS_09_07_023_RUNTIME_ABSTRACT_DISPATCH | 基类 Calculator 引用分派到 Adder/Multiplier，验证非抽象方法 describe() 可正常调用 |
| 015 | CLS_09_07_024_RUNTIME_ABSTRACT_MULTILEVEL | 三级抽象继承链（Layer1 -> Layer2 -> ConcreteLeaf），基类引用正确调用叶子实现 |
| 016 | CLS_09_07_026_RUNTIME_ABSTRACT_OVERRIDE_NONABSTRACT | 子类 override 基类非抽象方法，基类引用分派到子类实现 |
| 017 | CLS_09_07_035_RUNTIME_ABSTRACT_MULTI_IMPL | Square 和 Rect 两个子类分别实现 Shape 抽象方法，验证各自返回值正确 |

## 扩展测试建议（未覆盖场景）

- abstract method 与 accessor（getter/setter）组合 —— abstract accessor 是否被允许
- abstract method 返回泛型类型参数 `T`
- abstract method 参数含默认值，子类 override 时的默认值一致性验证
- abstract class 嵌套在其余类内部时的 abstract method 声明
- abstract method 被标记为 `override` 但 overridden 基类方法签名不兼容
- 多个接口提供同名 default method，abstract class 以 abstract method 覆盖时的歧义处理
