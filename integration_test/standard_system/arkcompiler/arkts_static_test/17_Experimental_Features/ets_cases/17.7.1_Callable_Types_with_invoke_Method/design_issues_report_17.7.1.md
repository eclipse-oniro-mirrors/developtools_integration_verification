# 17.7.1 Callable Types with $_invoke Method - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 14（compile-pass: 8, compile-fail: 3, runtime: 3）
**目的：** 通过用例执行（编译期 + 真实运行时）以及 Java/Swift 对比，确认 ArkTS 行为与 spec 的一致性，并记录语言设计差异。

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：类级 callable 是 ArkTS 独有特性（符合 spec）

**用例：** EXP2_17_07_01_001 ~ 008 (所有 compile-pass)

**ArkTS 实测行为：**
```typescript
class C {
    static $_invoke() { console.log("invoked") }
}
C()  // ✅ 编译通过，运行时调用 $_invoke
```

**ArkTS spec 依据：**
§17.7.1: "A type is callable if the name of the type can be used in a call expression. Only class type can be callable. To make a type callable, a static method with the name $_invoke must be defined."

**跨语言对比：**

| 语言 | 类名直接调用 | 设计方式 |
|------|------------|---------|
| ArkTS | ✅ `ClassName(args)` → `$_invoke` | 类级静态 callable |
| Java | ❌ 不支持 | 无 callable 类型概念 |
| Swift | ❌ 不支持（`ClassName()` 调用 init） | 实例级 `callAsFunction` |
| TypeScript | ❌ 不支持 | 无对应概念 |

**分类：** 符合 ArkTS spec 的语言设计差异。这是 ArkTS 的特殊优势特性。

---

### 差异 B：实例 $_invoke 不使类可调用（符合 spec）

**用例：** EXP2_17_07_01_010_FAIL_INSTANCE_INVOKE_NOT_CALLABLE

**ArkTS 实测行为：**
```typescript
class OnlyInstanceInvoke {
    $_invoke(): void { console.log("instance invoke only") }
}
OnlyInstanceInvoke()  // ❌ ESE0172: No static $_invoke method
```

**ArkTS spec 依据：**
§17.7.1: "A class can declare an instance method $_invoke but the method does not make the class callable."

**跨语言对比：**

| 语言 | 实例方法使类可调用 | 实例方法使实例可调用 |
|------|------------------|-------------------|
| ArkTS | ❌ | ❌ |
| Swift | ❌ | ✅ (`callAsFunction`) |

**分类：** 符合 ArkTS spec 的设计决策。ArkTS 选择仅静态 $_invoke 有效，与 Swift 的实例级设计不同。两种设计各有优势：ArkTS 更便利（无需实例），Swift 更灵活（实例可使用泛型参数）。

---

### 差异 C：$_invoke 与 $_instantiate 互斥（符合 spec）

**用例：** EXP2_17_07_01_009_FAIL_BOTH_INVOKE_AND_INSTANTIATE

**ArkTS 实测行为：**
```typescript
class A {
    static $_invoke(i: int): int { return i; }
    static $_instantiate(factory: () => A): A { return factory(); }
}
// ❌ ESE0221: Static $_invoke method and static $_instantiate method both exist
```

**ArkTS spec 依据：**
§17.7: "A class can define either the method $_invoke() or the method $_instantiate() but not both. Otherwise, a compile-time error occurs."

**跨语言对比：**

| 语言 | 类似互斥约束 |
|------|------------|
| ArkTS | ✅ 编译期强制 |
| Java | N/A（无此概念） |
| Swift | N/A（无此概念） |

**分类：** 符合 ArkTS spec 的设计决策。这是一个合理的安全约束，避免类名调用时的歧义。

---

### 差异 D：静态方法不能访问泛型类型参数（符合 spec）

**用例：** EXP2_17_07_01_011_FAIL_GENERIC_USE_TYPE_PARAM

**ArkTS 实测行为：**
```typescript
class G<T> {
    static $_invoke(value: T): T { return value; }
}
// ❌ ESE170021: Static members cannot reference class type parameters 'T'
```

**ArkTS spec 依据：**
§17.7: "Static methods have no access to type parameters of generic in ArkTS."

**跨语言对比：**

| 语言 | 静态方法访问类泛型参数 |
|------|---------------------|
| ArkTS | ❌ 编译期禁止 |
| Java | ❌ 编译期禁止（一致） |
| Swift | ✅ 实例方法可访问（callAsFunction 是实例方法） |

**分类：** 符合 ArkTS spec（也与 Java 行为一致）。这是 JVM 系语言的普遍约束。

---

### 差异 E：new 表达式与 $_invoke 明确区分（符合 spec）

**用例：** EXP2_17_07_01_014_RUNTIME_NEW_VS_INVOKE

**ArkTS 实测行为：**
```typescript
class Counter {
    constructor() { this.constructed = true; }
    static $_invoke(): Counter { ... this.constructed = false; ... }
}
new Counter()  // → constructed=true  (constructor)
Counter()      // → constructed=false ($_invoke)
```

**ArkTS spec 依据：**
§17.7: "Only a constructor---not the methods $_invoke or $_instantiate---is called in a new expression."

**分类：** 符合 ArkTS spec。行为明确且无歧义。

---

## 二、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| 无参 static $_invoke 使类可调用 | 001 | ✅ |
| 有参有返回 static $_invoke | 002 | ✅ |
| 多重 $_invoke 重载（不同签名） | 003 | ✅ |
| 短形式 `ClassName(args)` | 002, 012 | ✅ |
| 显式 `ClassName.$_invoke(args)` | 004, 012 | ✅ |
| void 返回的 $_invoke | 005 | ✅ |
| 复杂参数（数组等） | 006 | ✅ |
| 泛型类 $_invoke (不用类型参数) | 007 | ✅ |
| 实例 $_invoke 合法定义 | 008 | ✅ |
| $_invoke + $_instantiate 互斥 | 009 | ✅ |
| 实例 $_invoke 不使类可调用 | 010 | ✅ |
| 泛型 $_invoke 不能使用类型参数 | 011 | ✅ |
| 短形式与显式调用结果一致 | 012 | ✅ |
| 重载运行时正确选择 | 013 | ✅ |
| new 表达式 vs $_invoke 区分 | 014 | ✅ |

---

## 三、设计观察（非问题，仅供讨论）

### 观察 1：实例 $_invoke 的潜力未被利用

当前 ArkTS 仅允许静态 $_invoke 使类可调用。实例 $_invoke 可以定义但仅作为普通方法。如果允许实例 $_invoke 使实例可调用（类似 Swift `callAsFunction`），将增加灵活性并允许访问泛型类型参数。

**建议：** 考虑在未来版本中允许实例 `$_invoke` 使实例可调用（`obj(args)` → `obj.$_invoke(args)`），与静态 `$_invoke` 并存。

### 观察 2：$_invoke 命名对跨语言开发者不直观

与 Swift 的 `callAsFunction` 相比，ArkTS 的 `$_invoke` 使用 `$_` 前缀作为"魔法方法"约定，对非 ArkTS 背景的开发者不够直观。

**建议：** 可考虑提供 `callable` 关键字或更直观的命名方案作为未来语法糖。

### 观察 3：Swift 环境不可用导致对比不完整

由于系统未安装 Swift 运行时，Swift 部分对比完全基于文档推断，未经过实际编译运行验证。若后续获取 Swift 环境，应重新验证 Swift `callAsFunction` 的实际行为。

---

## 四、分类汇总

| 分类 | 条目 |
|------|------|
| 符合 ArkTS spec 的语言设计差异 | A, B, C, D, E |
| 待确认问题 | 无 |
| Spec 与实现不一致 | 无 |
| 已验证规范一致行为 | 15 项 |
| 设计观察（非问题） | 3 项 |

---

## 五、后续建议

1. 所有 14 个用例均 100% 通过，当前无异常需要处理。
2. 若后续获得 Swift 运行时环境，应补充 Swift `callAsFunction` 的实际编译运行验证。
3. 观察 1（实例 $_invoke 潜力）值得在 ArkTS 语言设计演进中考虑。
4. 本章节 issue_report.md 无需更新（无未解决异常）。
