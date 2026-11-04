# 9.7.5 重写方法 (Overriding Methods) - 测试设计思维导图

## 概述
本节定义 **方法重写 (Method Overriding)** 的语义与约束：
1. `override` 修饰符标识实例方法重写超类或超接口中的方法
2. 重写方法签名必须满足 **override-compatible** 规则
3. 重写是运行时多态 (runtime polymorphism) 的基础

**核心语义 (来自 spec/classes.md, spec/semantics.md)：**
- `override` 修饰符可选但强烈推荐（使重写显式化）
- 只有可访问 (accessible) 的方法才受重写规则约束
- 重写方法的参数类型满足 **逆变性 (contravariance)**，返回类型满足 **协变性 (covariance)**
- 重写方法必须保持与超类方法**相同的默认参数值**
- `static` 方法与 `override` 修饰符不可组合使用
- 重写不适用于构造函数 (constructors)

**override-compatible 签名条件 (spec/semantics.md Override-Compatible Signatures)：**
| 条件 | 规则 |
|------|------|
| 参数数量 | 必须相同 (n = m) |
| 参数类型 | 子类参数类型 T_i 是超类参数类型 U_i 的超类型（逆变） |
| 返回类型 (非 this) | 子类返回类型是超类返回类型的子类型（协变） |
| 返回类型 (this) | 超类返回类型必须是 this 或其超类型 |
| 泛型参数数量 | 必须相同 (k = j) |
| 泛型约束 | 子类约束对超类约束逆变 |

## 核心规则 (Core Rules)

### 1. override 修饰符合法用法
| 用法 | 示例 | 要求 |
|------|------|------|
| 基本 override | `override start(): string {}` | 超类存在同名实例方法 |
| 保留相同默认参数值 | `override start(immediate: boolean = false)` | 默认值与超类完全一致 |
| 省略 override 关键字 | `getType(): string {}` | 可选，签名 override-compatible 即隐式重写 |
| 协变返回类型 | `override getAnimal(): Dog018` | 返回类型是超类返回类型的子类型 |
| 重写接口默认实现 | `override draw(): string` | 通过基类实现的接口方法 |

### 2. override 编译期错误 (Compile-time Errors)
| 错误场景 | 触发条件 |
|---------|---------|
| `override` 未重写任何方法 | 子类用 override 修饰的方法在超类中不存在 |
| `static` + `override` 组合 | 静态方法不能使用 override 修饰符 |
| 默认参数值不一致 | 重写方法的默认参数值与超类方法不同 |
| 签名非 override-compatible | 参数数量不同，或类型不满足逆变/协变规则 |
| 访问修饰符降级 | 将 protected 改为 private（不可访问超类 private 方法） |
| override 不可访问方法 | 尝试 override 超类的 private 方法 |

### 3. 重写与继承链
```
         Base(超类)
           |
    Derived(子类)
           |
   SubDerived(孙类)
```
- 重写方法在运行时通过**动态分派 (dynamic dispatch)** 确定调用目标
- 基类引用指向子类对象时，调用的是子类重写的方法
- 多层继承链中，每层重写独立生效
- 通过接口→基类→子类继承链中 override 同样合法

## 测试点覆盖 (Test Points Coverage)

### 1. compile-pass 测试点（4 个）

#### P1: override 基本用法 -- 实例方法重写 + 相同默认参数值
- 用例编号：CLS_09_07_007
- 测试场景：
  - 子类使用 `override` 关键字重写超类实例方法 `start()`、`stop()`
  - 重写方法保持与超类相同的默认参数值 (`immediate: boolean = false`)
  - 省略 `override` 关键字的隐式重写 (`getType()`) 仍合法
  - 继承链：Vehicle007 → Car007 / Truck007

#### P2: override 重写接口默认实现的方法
- 用例编号：CLS_09_07_017
- 测试场景：
  - 接口定义方法签名，基类实现接口方法，子类 override 重写该方法
  - 继承链：Drawable017(接口) → Shape017(基类) → Circle017 / Rectangle017(子类)
  - 验证通过接口→基类→子类继承链中 override 的合法性

#### P3: 协变返回类型 (Covariant Return Type)
- 用例编号：CLS_09_07_018
- 测试场景：
  - 子类 override 方法的返回类型为超类返回类型的子类型
  - 继承链：Animal018 → Dog018 / Cat018；Shelter018 → DogShelter018 / CatShelter018
  - `override getAnimal(): Dog018` 返回类型从 Animal018 协变为 Dog018
  - 通过基类引用 (Shelter018) 调用协变重写方法时类型安全

#### P4: 重写方法使用不同默认参数值 (Spec-Implementation Gap)
- 用例编号：CLS_09_07_015
- 测试场景：
  - 子类 override 方法修改默认参数值 (如 `"Hello"` → `"World"`)
  - spec 规定必须保持相同默认参数值，编译期应报错
  - **实测**：ArkTS 编译器当前允许不同默认参数值（编译通过）
  - 状态：已知设计问题 CLS-I2（spec 与实现不一致）

### 2. compile-fail 测试点（2 个）

#### F1: override 未重写任何超类方法 + static+override 组合错误
- 用例编号：CLS_09_07_008
- 测试场景：
  - `override bar()` 试图重写不存在的超类方法 -- 编译器拒绝
  - `static override foo()` 组合 static 和 override 修饰符 -- 编译器拒绝
  - 验证两种违规声明均被正确捕获

#### F2: static 与 override 修饰符组合
- 用例编号：CLS_09_07_016
- 测试场景：
  - 子类声明 `static override process()` 和 `static override handle()`
  - 违反 static 方法不能使用 override 修饰符的规则
  - 编译器拒绝所有 static+override 组合声明

### 3. runtime 测试点（3 个）

#### R1: 基类引用多态分派 (Base Reference Polymorphic Dispatch)
- 用例编号：CLS_09_07_019
- 验证目标：
  - `let v1: Vehicle019 = new Car019()` 基类引用指向子类对象
  - `v1.getType()` 动态分派到 Car019 重写方法，返回 `"Car"`
  - `v1.maxSpeed()` 返回各自正确的速度值
  - assert 验证字符串/数值精确匹配

#### R2: 三层继承链多态分派 (Multi-Level Inherit Chain)
- 用例编号：CLS_09_07_020
- 验证目标：
  - Logger020 → FileLogger020 → TimestampFileLogger020 三层重写链
  - 每层 `log()`、`getLevel()`、`format()` 方法正确分发到对应层级
  - 基类引用 (Logger020) 指向 TimestampFileLogger020 实例，验证完整分派链
  - 中间层引用 (FileLogger020) 指向 TimestampFileLogger020 实例，验证中层分派
  - assert 验证字符串精确匹配每一层输出

#### R3: 运行时默认参数和动态分派
- 用例编号：CLS_09_07_036
- 验证目标：
  - Base36 → Child36 继承，子类 override `greet(name: string)`
  - `let b: Base36 = new Child36()` 基类引用指向子类对象
  - `b.greet("x")` 动态分派到子类重写方法，返回 `"hello x"`
  - 验证运行时参数传递和动态分派正确性

## 边界值与边缘场景 (Boundary Values & Edge Cases)

### 签名 override-compatible 边界
| 场景 | 预期行为 |
|------|---------|
| 参数数量不同 | compile-time error（非 override-compatible） |
| 参数类型不满足逆变 | compile-time error（如 `override method_2(p: string)` 而超类为 `(p: number)`） |
| 返回类型非协变 | compile-time error（返回类型不是超类返回类型的子类型） |
| 参数类型完全相同（trivial 逆变） | compile-pass（自身是自身的超类型） |
| 泛型参数数量不同 | compile-time error |
| 泛型约束不满足逆变 | compile-time error |

### 访问修饰符边界
| 场景 | 预期行为 |
|------|---------|
| public → public 重写 | compile-pass |
| public → protected 重写 | compile-time error（访问降级） |
| protected → public 重写 | compile-pass（访问升级允许） |
| protected → protected 重写 | compile-pass |
| private 方法"重写" | 不视为重写（private 方法不可被子类访问），视为独立声明 |
| override 超类 private 方法 | compile-time error（不可访问，无方法可重写） |

### 默认参数边界
| 场景 | 预期行为 |
|------|---------|
| 默认值完全相同 | compile-pass |
| 默认值不同 | spec规定 compile-time error（实测 compile-pass，设计问题 CLS-I2） |
| 超类无默认值，子类有默认值 | 签名不匹配，非 override-compatible |
| 超类有默认值，子类无默认值 | 签名不匹配，非 override-compatible |
| 部分默认参数值不同（多参数） | spec规定 compile-time error |

### 修饰符组合边界
| 场景 | 预期行为 |
|------|---------|
| override + static | compile-time error |
| override + final | 待验证（final 方法不可被重写） |
| override + abstract | 合法（抽象方法可重写非抽象/抽象方法） |
| override + async | 合法（异步方法可被重写） |

### 继承边界
| 场景 | 预期行为 |
|------|---------|
| override 无超类方法的独立方法 | compile-time error |
| 不写 override 关键字但签名匹配 | compile-pass（隐式重写） |
| 多层继承链中 override | compile-pass，每层独立检查 |
| 同时重写超类和超接口的同名方法 | compile-pass（一个方法可重写多个来源） |
| override 构造函数 | N/A（override 不适用于构造函数） |

### 运行时边界
| 场景 | 预期行为 |
|------|---------|
| 基类引用 -> 子类对象 | 动态分派到子类重写方法 |
| 基类引用 -> 基类对象 | 调用基类自身方法 |
| 基类引用 -> null (实际无此场景) | N/A |
| 多层重写链 (3层+) | 每层重写独立生效，动态分派到最派生类 |

## 测试覆盖缺口 (Coverage Gaps)

当前 9 个用例已覆盖：

| 已覆盖 | 缺口 |
|--------|------|
| ✅ override 基本用法 (007) | ❌ 参数数量不匹配导致 compile-fail |
| ✅ override 接口默认实现 (017) | ❌ 参数类型不满足逆变导致 compile-fail |
| ✅ 协变返回类型 (018) | ❌ 返回类型非协变导致 compile-fail |
| ✅ 覆盖无方法错误 (008) | ❌ 泛型参数数量/约束不匹配 compile-fail |
| ✅ static+override 错误 (008, 016) | ❌ 访问修饰符降级 (protected→private) compile-fail |
| ✅ 运行时分派-基类引用 (019) | ❌ override 超类 private 方法 compile-fail |
| ✅ 运行时分派-三层链 (020) | ❌ override+final 冲突 compile-fail |
| ✅ 运行时分派-默认参数 (036) | ❌ 不同默认参数值 compile-fail (spec要求但未实现) |
| ✅ Spec-Impl 差异记录 (015) | ❌ 更多 runtime 场景（如同步/异步重写混合、重写与 this 返回类型） |

## 编号规划 (Numbering Plan)

| 分类 | 编号范围 |
|------|---------|
| compile-pass | 001 ~ 019 (已用: 007, 015, 017, 018) |
| compile-fail | 020 ~ 039 (已用: 008, 016) |
| runtime | 040 ~ 059 (已用: 019, 020, 036) |

## 文件命名规范
```
CLS_09_07_NNN_{CATEGORY}_{DESCRIPTION}.ets
```

**命名格式说明：**
- `CLS` -- 章节前缀 (Classes)
- `09_07` -- 子节编号 (9.7 Method Declarations)
- `NNN` -- 三位数字编号，全局唯一
  - compile-pass: 001~019
  - compile-fail: 020~039
  - runtime: 040~059
- `CATEGORY` -- `PASS` / `FAIL` / `RUNTIME`
- `DESCRIPTION` -- 简短英文描述 (如 `OVERRIDE_METHOD`, `COVARIANT_RETURN`)

**示例：**
- `CLS_09_07_007_PASS_OVERRIDE_METHOD.ets` -- 正向：基本 override
- `CLS_09_07_008_FAIL_OVERRIDE_NOTHING_STATIC.ets` -- 反向：override 无方法 + static 冲突
- `CLS_09_07_015_PASS_OVERRIDE_DIFFERENT_DEFAULT.ets` -- 特殊：不同默认值（spec-impl gap）
- `CLS_09_07_019_RUNTIME_OVERRIDE_BASE_REF.ets` -- 运行时：基类引用多态
