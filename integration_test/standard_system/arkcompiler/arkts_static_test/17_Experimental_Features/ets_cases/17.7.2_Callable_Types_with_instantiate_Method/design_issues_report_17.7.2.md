# 17.7.2 Callable Types with $_instantiate - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 14（compile-pass: 6, compile-fail: 4, runtime: 4）
**目的：** 通过用例执行（编译期 + 真实运行时）以及 Java/Swift 对比，确认 ArkTS 行为与 spec 的一致性，并记录语言设计差异和待确认问题。

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：$_instantiate 是 ArkTS 独有特性

**用例：** EXP2_17_07_02_001 ~ 014

**说明：**
Java 和 Swift 均无 `$_instantiate` 或 `C()` callable type 语法。ArkTS 通过特殊方法名 `$_instantiate` 将类型提升为一等可调用实体：

```typescript
// ArkTS - 原生 callable type
class C {
  constructor() {}
  static $_instantiate(__factory: () => C): C {
    return __factory()
  }
}
let obj: C = C()  // 编译器隐式提供工厂
```

**跨语言对比：**

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `C()` | 编译器自动生成 `() => new C()` 并调用 `$_instantiate` |
| Java | `C.create(() -> new C())` | 必须显式传递 `Supplier<T>`，语法冗长 |
| Swift | `C.create(factory: { C() })` | 必须显式传递闭包，语法冗长 |

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 B：隐式工厂要求无参构造函数

**用例：** EXP2_17_07_02_008_FAIL_NO_PARAMETERLESS_CONSTRUCTOR

**ArkTS 实测行为：**
```typescript
class D {
  constructor(x: int) { ... }
  static $_instantiate(__factory: () => D): D { ... }
}
let obj: D = D()  // ESE0124: Expected 1 arguments, got 0
```

**说明：**
短格式 `C()` 依赖编译器生成隐式工厂 `() => new C()`。若类无无参构造函数，编译器无法生成该工厂，导致编译错误。这是 ArkTS 的显式设计约束，确保短格式调用的类型安全。

**跨语言对比：**

| 语言 | 无参构造函数要求 | 原因 |
|------|----------------|------|
| ArkTS | ✅ 强制（短格式） | 编译器需生成隐式工厂 |
| Java | N/A | 工厂始终显式，无此约束 |
| Swift | N/A | 工厂始终显式，无此约束 |

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 C：静态方法不能访问泛型类类型参数

**用例：** EXP2_17_07_02_010_FAIL_GENERIC_TYPE_PARAM_ACCESS

**ArkTS 实测行为：**
```typescript
class Box<T> {
  static $_instantiate(__factory: () => Box<T>): Box<T> { ... }
  // ESE170021: Static members cannot reference class type parameters 'T'
}
```

**跨语言对比：**

| 语言 | 静态方法访问类泛型参数 | 行为 |
|------|---------------------|------|
| ArkTS | ❌ | 编译错误 ESE170021 |
| Java | ❌ | 编译错误（JLS §8.4.3.2） |
| Swift | ✅（具体化上下文） | 静态方法可有独立泛型参数 |

**分类：** 符合 ArkTS spec 的语言设计差异（与 Java 一致）

---

### 差异 D：同参数不同返回类型的方法冲突

**用例：** EXP2_17_07_02_009_FAIL_SAME_PARAMS_DIFF_RETURN

**ArkTS 实测行为：**
```typescript
class C {
  static $_instantiate(__factory: () => C): C { ... }
  static $_instantiate(__factory: () => C): int { ... }
  // ESE0130: Function $_instantiate is already declared
}
```

**跨语言对比：**

| 语言 | 同参异返 | 行为 |
|------|---------|------|
| ArkTS | ❌ | 编译错误 ESE0130 |
| Java | ❌ | 编译错误（JLS §8.4.2） |
| Swift | ❌ | 编译错误 |

**分类：** 已确认实现与规范一致的 ArkTS 行为

---

## 二、待确认问题

### 待确认 A：$_instantiate 声明期 vs 调用期工厂类型检查

**用例：** EXP2_17_07_02_007_FAIL_NO_FACTORY_PARAM

**现象：**
仅声明 `static $_instantiate(x: int): T`（第一参数非工厂类型）时编译器不报错。只有在实际使用短格式 `C()` 调用时才报 ESE0127。

```typescript
// 仅声明 -> 编译通过（无报错）
class MyClass {
  static $_instantiate(x: int): MyClass { ... }
}

// 增加调用 -> 编译失败
let obj = MyClass()  // ESE0127: No matching call signature
```

**分析：**
当前编译器将 `$_instantiate` 的工厂参数类型检查推迟到调用点（call site），而非声明点（declaration site）。这可能是设计选择——允许类声明非标准 $_instantiate（不作为可调用类型使用），也可以解释为检查不够严格。

**建议：**
确认 spec 意图。如果 spec 要求第一参数必须是工厂类型，建议在声明期即报告编译错误，提供更早的反馈。

**跨语言对比：**

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `static $_instantiate(x: int)` | 声明通过，调用失败 |
| Java | N/A | N/A |
| Swift | N/A | N/A |

**分类：** 待确认问题（需明确 spec 意图）

---

## 三、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| $_instantiate 基本声明与 C() 调用 | 001, 011 | ✅ |
| 额外参数自动传递 | 002, 012 | ✅ |
| 显式 C.$_instantiate 调用 | 003, 013 | ✅ |
| 多个 $_instantiate 重载分发 | 004, 014 | ✅ |
| void 返回型 $_instantiate | 005 | ✅ |
| 泛型类中 $_instantiate（具体类型签名） | 006 | ✅ |
| 同参数不同返回类型报错 | 009 | ✅ |
| 无无参构造函数短格式报错 | 008 | ✅ |
| 静态方法引用泛型类参数报错 | 010 | ✅ |
| 运行时实例创建正确性 | 011 | ✅ |
| 运行时额外参数传递 | 012 | ✅ |
| 运行时自定义工厂行为 | 013 | ✅ |
| 运行时重载正确分发 | 014 | ✅ |

---

## 四、分类汇总

| 分类 | 条目 |
|------|------|
| 符合 ArkTS spec / 当前实现的语言设计差异 | A, B, C, D |
| 待确认问题 | 待确认 A（声明期 vs 调用期检查） |
| 已验证规范一致行为 | 13 项 |

---

## 五、后续建议

1. 对待确认 A：确认 spec 对 $_instantiate 第一参数工厂类型的检查应在声明期还是调用期执行
2. 考虑在 spec 中补充 $_instantiate 的完整语义描述（隐式工厂生成规则、无参构造函数约束的正式定义）
3. 本子章节 14 个用例全部通过，无未解决异常
