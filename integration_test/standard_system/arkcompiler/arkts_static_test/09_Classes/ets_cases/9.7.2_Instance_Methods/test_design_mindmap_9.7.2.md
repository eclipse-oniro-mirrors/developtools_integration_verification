# 9.7.2 实例方法 (Instance Methods) - 测试设计思维导图

## 概述
本节定义 ArkTS 中类的**实例方法 (Instance Method)**：声明在 class body 中、不带 `static` 修饰符的方法。实例方法通过对象实例调用，`this` 在方法体内指向当前实例，可访问实例字段 (`this.field`)、调用其余实例方法 (`this.method()`)、实现接口方法 (`implements`)、重写超类方法 (`override`)，以及通过 `super.method()` 调用父类实现。ArkTS **不支持方法重载 (overloading)** — 同一类中不允许存在名称相同且参数类型列表相同的方法签名，即使返回类型不同也不允许。

## 实例方法核心语义

| 特性 | 说明 |
|------|------|
| 声明位置 | class body 内，无 `static` 关键字 |
| `this` 绑定 | 运行时指向调用该方法的对象实例 |
| 接口实现 | `implements` 接口后，实例方法提供接口方法的具体实现 |
| 方法重写 | 子类中使用 `override` 重写超类同签名实例方法 |
| 禁止重载 | 同签名方法重复声明 → compile-fail |
| `super` 调用 | `super.methodName()` 调用父类实现（仅 override 链中） |
| 参数遮蔽 | 参数名可与字段名相同，裸名引用参数，`this.field` 引用字段 |

## 测试点覆盖

### compile-pass (7 个)

1. **实例方法基本声明与调用** — `CLS_09_07_004_PASS_INSTANCE_METHOD_BASIC`
   - 实例方法声明（含返回类型、参数）
   - `this` 引用当前实例
   - `implements` 接口方法实现
   - 子类 `override` 重写超类方法
   - 类自身新增实例方法（非接口/非重写）

2. **实例方法通过 `this` 访问实例字段** — `CLS_09_07_015_PASS_INSTANCE_METHOD_THIS_FIELDS`
   - 读取字段 (`getValue`)
   - 写入字段 (`setValue`)
   - 复合赋值 (`increment`: `this._value = this._value + 1`)
   - 多字段组合访问 (`summary`: 拼接 `_label` 和 `_value`)
   - 条件表达式中的字段引用 (`isPositive`: `this._value > 0`)

3. **实例方法实现多接口方法** — `CLS_09_07_016_PASS_INSTANCE_METHOD_INTERFACE_IMPL`
   - 单接口方法实现 (`Shape016`: `area()`, `perimeter()`, `scale()`)
   - 多接口同时实现 (`Circle016 implements Shape016, Labeled016`)
   - 不同返回类型: `double`, `string`, `void`
   - 接口外额外实例方法 (`diameter()`)

4. **实例方法接收复杂参数类型** — `CLS_09_07_018_PASS_INSTANCE_METHOD_COMPLEX_PARAMS`
   - 数组参数 (`processNumbers(items: int[])`)
   - 联合类型参数 (`setLabel(label: string | null)`)
   - 可选参数 (`addBonus(base: int, bonus?: int)`)
   - 布尔参数控制流 (`toggleMode(active: boolean)`)
   - 多类型参数组合 (`compute(a: int, b: double, op: string)`)
   - 实例方法返回数组 (`prefixAll: int[]`)

5. **实例方法实现接口方法（精简版）** — `CLS_09_07_018_PASS_INSTANCE_OVERRIDE_INTERFACE`
   - `HelloGreeter implements Greeter`, `greet(): string` 返回 `"hello"`

6. **参数名与实例字段名相同时的类型遮蔽** — `CLS_09_07_019_PASS_INSTANCE_METHOD_PARAM_SHADOW`
   - 参数 `_value` 遮蔽字段 `this._value`（编译器正确区分参数与字段）
   - 同一方法中同时使用参数和字段 (`updateValue`: 先读 `this._value` 再赋值为 `_value`)
   - 布尔参数遮蔽布尔字段 (`setFlag(_flag)`)
   - 参数与字段比较 (`compareValue`: `this._value == _value`)
   - 多类验证 (`ShadowTest019` 和 `Calculator019`)

7. **`this` 访问实例字段最简用例** — `CLS_09_07_030_PASS_INSTANCE_ACCESS_THIS`
   - `Acc` 类: `val: int = 5; getVal(): int { return this.val }`

### compile-fail (2 个)

1. **实例方法签名冲突（重复定义）** — `CLS_09_07_020_FAIL_INSTANCE_METHOD_DUP_SIG`
   - 同名称 + 同参数类型列表 → compile-fail
   - 有参方法重复: `process(value: int): int` 两次声明
   - 无参方法重复: `getData(): int` 两次声明
   - ArkTS 不支持方法重载 (overloading) 的验证

2. **方法名冲突（不同返回类型）** — `CLS_09_07_048_FAIL_METHOD_NAME_CONFLICT`
   - `work(): void` 后又声明 `work(): int` → compile-fail
   - 证实 ArkTS 以名称 + 参数类型列表作为方法签名唯一标识

### runtime (3 个，ark VM 真实执行 + assert)

1. **实例方法调用行为验证** — `CLS_09_07_017_RUNTIME_INSTANCE_METHOD_CALLS`
   - 实例方法分派正确性（通过对象引用调用 `deposit`、`withdraw`）
   - `this` 绑定到正确对象（两个 `BankAccount017` 实例各自独立）
   - 字段状态在方法调用后正确变化（存取款场景）
   - 转账场景 (`transferTo`): 成功转账 → 双方余额正确；资金不足 → 返回 `false` 且余额不变
   - 多实例方法组合验证: `deposit` → `withdraw` → `transferTo`

2. **实例方法通过 `this` 读写字段** — `CLS_09_07_034_RUNTIME_INSTANCE_THIS_FIELD`
   - `c.setVal(77)` 后 `c.getVal()` 返回 `77`
   - 验证 `this.val` 赋值与读取的运行时正确性

3. **多级继承链实例方法重写** — `CLS_09_07_049_RUNTIME_OVERRIDE_CHAIN`
   - 三级继承: `Base049` → `Mid049` → `Derived049`
   - 每级 `override val()` 并通过 `super.val()` 调用上级实现
   - 最终 `Derived049().val()` 返回 `3` (1+1+1)
   - 验证 `super` 调用链和 `override` 运行时分派正确性

## 边界值与边缘场景

| 场景 | 覆盖状态 | 说明 |
|------|----------|------|
| 零参数实例方法 | ✅ 已覆盖 | `getVal(): int`、`getValue(): int` 等 |
| 单参数实例方法 | ✅ 已覆盖 | `setValue(v: int)`、`deposit(amount: double)` |
| 多参数实例方法 | ✅ 已覆盖 | `compute(a: int, b: double, op: string)` |
| 无返回类型 (`void`) 实例方法 | ✅ 已覆盖 | `setValue(v: int): void`、`scale(factor: double): void` |
| 有返回类型实例方法 | ✅ 已覆盖 | `getValue(): int`、`area(): double`、`greet(): string` |
| `this` 读写同一方法 | ✅ 已覆盖 | `addAndReturn(delta: int): int` 中读写 `this._value` |
| 参数名与字段名相同 | ✅ 已覆盖 | `setValue(_value)` 遮蔽 `this._value` |
| 方法签名冲突 | ✅ 已覆盖 | 同签名重复 → compile-fail |
| 方法名冲突（不同返回类型） | ✅ 已覆盖 | `work(): void` vs `work(): int` → compile-fail |
| 多接口同时实现 | ✅ 已覆盖 | `Circle016 implements Shape016, Labeled016` |
| 继承链 `super` 调用 | ✅ 已覆盖 | 三级 override 链 |
| 实例方法返回数组 | ✅ 已覆盖 | `prefixAll(items: int[], prefix: int): int[]` |
| 联合类型参数 | ✅ 已覆盖 | `setLabel(label: string \| null)` |
| 可选参数 | ✅ 已覆盖 | `addBonus(base: int, bonus?: int)` |
| 无参数签名冲突 | ✅ 已覆盖 | `getData(): int` 两次声明 |
| 转账失败场景（余额不足） | ✅ 已覆盖 | `transferTo` 返回 `false` 且余额不变 |

## 未覆盖场景（后续补充建议）

| 场景 | 优先级 | 说明 |
|------|--------|------|
| 实例方法调用另一个实例方法 (`this.otherMethod()`) | MEDIUM | 跨方法调用链 |
| 实例方法中访问超类字段 (`super.field`) | LOW | 继承字段访问 |
| 泛型类的实例方法 | MEDIUM | 与第5章泛型交叉测试 |
| 实例方法递归调用 | LOW | 自调用场景 |
| 实例方法中抛出异常 | LOW | 异常传播路径 |
| readonly 字段在实例方法中的行为 | LOW | 只读约束验证 |

## 编号规划

- compile-pass: 004, 015, 016, 018 (2个), 019, 030
- compile-fail: 020, 048
- runtime: 017, 034, 049

## 文件命名规范

`CLS_09_07_NNN_{CATEGORY}_{DESCRIPTION}.ets`

其中:
- `CLS` = Classes chapter prefix
- `09_07` = 9.7 Method Declarations
- `NNN` = three-digit sequence number
- `CATEGORY` = `PASS` / `FAIL` / `RUNTIME`
- `DESCRIPTION` = short uppercase underscore-delimited description

示例:
- `CLS_09_07_004_PASS_INSTANCE_METHOD_BASIC.ets`
- `CLS_09_07_020_FAIL_INSTANCE_METHOD_DUP_SIG.ets`
- `CLS_09_07_049_RUNTIME_OVERRIDE_CHAIN.ets`

## 覆盖统计

| 分类 | 数量 | 通过率 |
|------|------|--------|
| compile-pass | 7 | 100% |
| compile-fail | 2 | 100% |
| runtime | 3 | 100% |
| **总计** | **12** | **100%** |

## 相关章节

- 9.7 Method Declarations (父节)
- 9.7.1 Static Methods (静态方法对比)
- 9.7.3 Abstract Methods (抽象方法)
- 9.7.5 Overriding Methods (方法重写详细规则)
- 9.7.8 Methods Returning `this` (返回 this 的方法)
- 9.4 Class Members (类成员通用规则)
- 9.5 Access Modifiers (访问修饰符)
- 9.10 Inheritance (继承与 super 调用)
- 10 Interfaces (接口实现)
