# 9.7.8 返回this的方法 (Methods Returning this) - 测试设计思维导图

## 概述
本节定义实例方法返回类型为 `this` 的语义与约束。`this` 作为返回类型注解，表示方法返回当前类（或子类）类型的实例，是实现 **F-bounded polymorphism** 和 **fluent API / builder pattern**（方法链）的核心机制。

**核心语义：**
- `this` 是唯一可以用作类型注解 (type annotation) 的 keyword
- 返回类型 `this` 表示返回值为该方法所属的 class type
- 实例方法返回 `this` 时，只允许两种 return 表达式：
  1. 字面 `return this`
  2. 返回另一个返回类型为 `this` 的方法调用结果（链式传递）
- 子类 override 父类返回 `this` 的方法时，返回类型也必须是 `this`（协变返回类型自动适配为子类类型）
- 违反上述规则将导致 compile-time error

## 核心规则

### 1. `this` 作为返回类型声明
| 规则 | 说明 |
|------|------|
| 位置 | 实例方法的 return type annotation 处 |
| 语义 | 返回类型 = 该方法所属的 class type |
| 作用域 | 仅限实例方法，static 方法不可使用 |

### 2. 返回值的两种合法形式
```typescript
class C {
    foo(): this {
        return this           // 形式1: 字面 return this
    }
    bar(): this {
        return this.foo()     // 形式2: 返回另一个返回this的方法的结果
    }
}
```

### 3. 子类 override 约束（协变返回类型）
```typescript
class C {
    foo(): this { return this }
}

class D extends C {
    foo(): this { return this }   // 必须返回 this，不可改为 void/number 等
}

let x = new C().foo() // type of 'x' is 'C'
let y = new D().foo() // type of 'y' is 'D'（自动协变）
```

### 4. 编译期强制检查
- 声明返回 `this` 但返回 `new` 实例 → compile-time error
- 声明返回 `this` 但返回字面量（如 `0`, `"str"`）→ compile-time error
- override 返回类型不兼容（如改为 `void`）→ compile-time error

## 测试点覆盖

### 1. 非泛型类返回 this（compile-pass）
- 实例方法声明 `: this` 并字面 `return this`
- 方法链：一个返回 this 的方法调用另一个返回 this 的方法（`return this.setName(name).setCount(count)`）
- 子类 override 父类返回 this 的方法，仍返回 this
- 子类新增返回 this 的扩展方法，扩展链式调用

### 2. 泛型类返回 this（compile-pass）
- 泛型类 `class Builder<T>` 中声明返回 `: this` 的方法
- 泛型子类 override 父类返回 this 的方法
- 非泛型子类继承泛型父类后重写返回 this 的方法
- 泛型类方法链中 `super.build(data, tag).setExtra(...)` 混合调用

### 3. 反向：override 返回类型不兼容（compile-fail）
- 父类方法声明返回 `: this`，子类 override 声明返回 `: void` → 编译拒绝
- 父类方法声明返回 `: this`，子类 override 声明返回 `: number` → 编译拒绝（推断）
- 父类方法声明返回 `: this`，子类 override 声明返回其余不兼容类型

### 4. 反向：返回非 this 值（compile-fail）
- 方法声明返回 `: this`，但 `return new SomeClass()` 返回新实例 → 编译拒绝
- 方法声明返回 `: this`，但 `return 0` 返回数值字面量 → 编译拒绝
- 方法声明返回 `: this`，但 `return "hello"` 返回字符串字面量 → 编译拒绝（推断）

### 5. Runtime：非泛型方法链验证（runtime）
- 链式调用 `c.setValue(10).setLabel("hello")`，assert 验证中间值与最终对象一致性
- 子类多连链式调用 `sc.setValue(42).setLabel("world").setExtra(99)`，逐项 assert 验证
- 链式调用返回值可赋值给子类类型：`let chained: SubChain = sc.setValue(1).setLabel("x")`

### 6. Runtime：泛型方法链验证（runtime）
- 泛型类以 string/int 实例化，验证 `setLabel → setData` 链式调用后值正确
- 泛型子类 string 三连调用后 assert 验证
- 链式返回值保持泛型类型：`let chained: SubChain<string> = sc.setLabel("test").setData("data")`

### 7. Runtime：最小链式调用验证（runtime）⭐
- 最小用例 `c.setA(1).setB("x")` 链式调用输出验证

## 边界值与边缘场景

### 边界值
| 场景 | 说明 |
|------|------|
| 空链 | 单次调用返回 this 不继续链式调用 |
| 长链 | 多次连续链式调用（3+ 连）验证对象一致性 |
| 泛型嵌套链 | 泛型类 + 泛型子类 + super 调用混合链 |
| override 签名边界 | 子类 override 返回 this 时参数列表与父类完全一致 |
| 非泛型继承泛型 | `class NonGeneric extends Generic<string>` 后重写返回 this |

### 边缘场景
| 场景 | 说明 |
|------|------|
| this 作为唯一 keyword type annotation | `this` 只能用于实例方法返回类型，不能用于参数类型或字段类型 |
| 方法链中传递非 this 方法结果 | 返回 this 的方法调用返回非 this 的方法视为返回非 this → compile-time error（推断） |
| 抽象方法声明返回 this | 抽象实例方法是否可声明返回 `: this`（待验证） |
| 多重继承 / interface 涉及 this | this 返回类型与 interface 实现的交互（待验证） |

## 编号规划

基于现有用例编号（已分配 CLS_09_07 前缀）：

| 分类 | 编号范围 | 用例数 |
|------|---------|--------|
| compile-pass | 011, 016 | 2 |
| compile-fail | 013, 014, 037 | 3 |
| runtime | 012, 015, 027 | 3 |

**合计：2P + 3F + 3R = 8 total**

## 文件命名规范

```
CLS_09_07_NNN_{CATEGORY}_{DESCRIPTION}.ets
```

| 字段 | 说明 |
|------|------|
| `CLS` | 章节前缀（Classes） |
| `09_07` | 章节号 9.7（Methods），本节为 9.7.8 |
| `NNN` | 三位数字编号（011~037） |
| `CATEGORY` | `PASS` / `FAIL` / `RUNTIME` |
| `DESCRIPTION` | 简洁英文描述（蛇形命名） |

**现有用例文件：**
```
compile-pass/
  CLS_09_07_011_PASS_METHOD_RETURN_THIS.ets
  CLS_09_07_016_PASS_GENERIC_RETURN_THIS.ets
compile-fail/
  CLS_09_07_013_FAIL_OVERRIDE_WRONG_RETURN_TYPE.ets
  CLS_09_07_014_FAIL_RETURN_NON_THIS.ets
  CLS_09_07_037_FAIL_RETURN_NON_THIS.ets
runtime/
  CLS_09_07_012_RUNTIME_RETURN_THIS.ets
  CLS_09_07_015_RUNTIME_GENERIC_RETURN_THIS.ets
  CLS_09_07_027_RUNTIME_CHAIN_RETURN_THIS.ets
```
