# 9.9.2 显式构造器调用 (Explicit Constructor Call) - 测试设计思维导图

## 概述
spec §9.9.2：显式构造器调用（Explicit Constructor Call）是在 constructor body 中通过 `super(args)` 或 `this(args)` 显式调用父类构造器或委托同类构造器的语法。该调用必须是 constructor body 的第一条语句。

## 核心规则
- **`super(args)`**：派生类构造器中调用直接父类的 primary constructor
- **`this(args)`**：同一类中次级构造器委托 primary constructor
- **`super.name(args)` / `this.name(args)`**：命名构造器调用与委托（实验特性，当前编译器不支持）
- **参数约束**：显式构造器调用的 arguments 中禁止引用 `this`、`super` 或调用 instance method
- **表达式约束**：显式构造器调用不可用作表达式（不能赋值、不能作为函数实参等）
- **顺序约束**：显式构造器调用必须是 constructor body 中的第一条语句

## 测试分类

### compile-pass（2P）
测试合法的显式构造器调用形式，编译器应正常通过：

1. **`super(args)` 调用父类有参构造器** — `CLS_09_09_006_PASS_SUPER_CALL`
   - 派生类 constructor 通过 `super(n)` 调用父类带参数的主构造器
   - 验证编译器正确处理 `super(args)` 形式的跨类构造器调用链

2. **`this(args)` 委托同类主构造器** — `CLS_09_09_008_PASS_THIS_CALL`
   - 同类中次级构造器通过 `this(0, 0)` 委托给 primary constructor
   - 验证编译器正确处理 `this(args)` 形式的同类构造器委托

### compile-fail（6F）
测试违反 spec 约束的非法写法，编译器应拒绝编译：

3. **`super(this.x)` — 参数中引用 `this`** — `CLS_09_09_007_FAIL_SUPER_ARG_THIS`
   - 显式构造器调用的参数中直接引用 `this`，违反 "arguments cannot refer to `this` or `super`" 规则

4. **`super.init(x)` — 调用父类命名构造器** — `CLS_09_09_009_FAIL_SUPER_NAMED_CALL`
   - 通过 `super.name(args)` 形式尝试调用父类命名构造器
   - 当前为实验特性，编译器尚不支持，预期编译失败

5. **`this.init(0, 0)` — 委托同类命名构造器** — `CLS_09_09_010_FAIL_THIS_NAMED_CALL`
   - 通过 `this.name(args)` 形式尝试委托同类命名构造器
   - 同为实验特性，预期编译失败

6. **`let v = super(x)` — 用作表达式** — `CLS_09_09_011_FAIL_CALL_AS_EXPRESSION`
   - 将 `super(x)` 调用结果赋值给变量，违反 "explicit constructor call is used as expression" 规则

7. **`super(this.getValue())` — 参数中调用 instance method** — `CLS_09_09_012_FAIL_ARG_INSTANCE_METHOD`
   - 构造器调用参数中引用实例方法 `getValue()`，违反 "arguments cannot refer to instance method" 规则

8. **`super(this.getVal())` — 参数中调用 instance method（变体）** — `CLS_09_09_024_FAIL_SUPER_ARG_INSTANCE_METHOD`
   - 与用例 012 等价，使用不同方法名 `getVal()` 验证拦截一致性

### runtime（1R）
测试构造器调用链在 ark VM 上的真实执行行为：

9. **继承链中 `super()` 调用及字段初始化** — `CLS_09_09_047_RUNTIME_SUPER_CALL_CHAIN`
   - 基类 `B047`（字段 `val`，构造器 `constructor(v: int)`）
   - 派生类 `D047`（字段 `extra`，构造器通过 `super(v)` 调用基类构造器后初始化 `this.extra`）
   - `main()` 中 assert 校验 `d.val` 和 `d.extra` 值正确传递

## 边界值与边缘场景

| 场景 | 描述 | 覆盖状态 |
|------|------|----------|
| 空参数 `super()` | 调用父类无参构造器 | 待补充 |
| 多级继承链 | 三层以上继承链中构造器传递 | 待补充 |
| 多参数 `super(a, b, c)` | 父类构造器接收多个不同类型参数 | 待补充 |
| 同类型多层委托 | `this(args)` → `this(args2)` 链式委托 | 待补充 |
| 构造器参数类型不匹配 | `super("str")` 但父类构造器期望 `int` | 待补充 |
| 父类无 primary constructor | 父类只有次级构造器时 `super()` 行为 | 待补充 |
| 抽象类构造器调用 | 抽象父类中 `super()` 调用 | 待补充 |

## 文件命名规范
`CLS_09_09_NNN_{CATEGORY}_{DESCRIPTION}.ets`

- **CLS**：章节前缀（Classes）
- **09_09**：子章节编号 9.9.2（取前两级 9.9）
- **NNN**：三位数字编号，全局唯一
- **CATEGORY**：`PASS` / `FAIL` / `RUNTIME`
- **DESCRIPTION**：简洁英文描述（大写下划线分隔）

示例：
- `CLS_09_09_006_PASS_SUPER_CALL.ets`
- `CLS_09_09_007_FAIL_SUPER_ARG_THIS.ets`
- `CLS_09_09_047_RUNTIME_SUPER_CALL_CHAIN.ets`

## 编号总览

| 分类 | 编号范围 | 数量 |
|------|----------|------|
| compile-pass | 006, 008 | 2 |
| compile-fail | 007, 009, 010, 011, 012, 024 | 6 |
| runtime | 047 | 1 |
| **合计** | | **9** |

## 已知设计问题

| ID | 严重性 | 描述 |
|----|--------|------|
| I3 | LOW | 命名构造器（`super.name(args)` / `this.name(args)`）为实验特性，当前 es2panda 编译器不支持声明与调用。spec 描述了命名构造器语义但实现尚未跟进，存在阶段性 spec-implementation gap。后续若稳定化，009/010 用例应从 compile-fail 转为 compile-pass。 |
