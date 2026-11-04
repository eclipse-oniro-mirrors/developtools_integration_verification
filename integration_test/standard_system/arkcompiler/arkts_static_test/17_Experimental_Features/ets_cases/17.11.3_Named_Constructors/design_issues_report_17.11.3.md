# 17.11.3 Named Constructors - 设计问题报告

**报告日期:** 2026-06-23
**测试用例数:** 15 (compile-pass: 5, compile-fail: 5, runtime: 5)
**通过率:** 100%

---

## 一、CRITICAL: Spec 与实现不一致

### D-1 (高严重性): `new Class.Name()` 调用语法不支持

**Spec 描述**: "Called as: `new Temperature.Celsius(0)`"

**实际编译器行为**: `ESE0070: 'Celsius' type does not exist` — 编译器将 `Temperature.Celsius` 解析为类型引用而非构造函数调用。

**影响**: 这是命名构造函数最核心的使用方式。没有此语法，命名构造函数的"命名"优势大幅削弱——用户无法通过名称表达构造意图，只能依赖参数类型隐式区分。构造函数名称退化为 overload 集合中的内部标识符。

**当前 Workaround**: 通过 `new ClassName(args)` + overload 解析间接调用，参数类型决定匹配哪个命名构造函数。

**建议**: P0 优先级 — 实现 `new Class.ConstructorName()` 调用语法。

### D-2 (高严重性): 全命名构造函数仍可通过 `new X(args)` 调用

**Spec 描述**: "If ALL constructors are named --> `new X(1)` is compile-time error (must use names)"

**实际编译器行为**: `new X(args)` 编译通过（只要参数类型匹配重载集中的某个命名构造函数），exit 0。

**验证**: 
- 用例 009 测试了全命名 + 参数不匹配场景 -> ESE0124/ESE0127 (通过)
- 但全命名 + 参数匹配场景 -> 编译通过 (与 spec 冲突)

**影响**: Spec 意图是通过"必须使用名称"强制调用者明确构造函数选择意图。当前行为允许无名称隐式调用，削弱了此约束。

**建议**: P0 优先级 — 实现全命名构造函数禁止无名称调用的规则，或更新 Spec。

### D-3 (中严重性): 重复命名构造函数约束不一致

**Spec 描述**: "Compile-time error: same constructor name used twice (no implicit overloading of named constructors)"

**实际编译器行为**:
- 同名同参: ESE0130 编译错误 + W2323 警告 (exit 1) — 符合 spec
- 同名不同参: 仅 W2323 警告 (exit 0，编译通过) — 不符合 spec

**验证**: `constructor Dup(n: int)` + `constructor Dup(n: int)` -> ESE0130 error
但 `constructor Dup(n: int)` + `constructor Dup(s: string)` -> W2323 warning only, compiles OK

**建议**: P1 优先级 — 将命名构造函数名称唯一性检查升级为编译错误（无论参数是否不同），与 spec 保持一致。

---

## 二、设计语义问题

### 2.1 命名构造函数 vs 重载构造函数的概念混淆

ArkTS spec 描述命名构造函数为独立概念（类似 Dart），可通过名称直接调用。但当前实现将命名构造函数与 overload 机制耦合——名称仅作为 overload 集合中的标识符，调用时依赖参数类型解析而非名称。

**对比**:
| | Spec 意图 | 当前实现 |
|---|----------|---------|
| 声明 | `constructor Celsius(n: double)` | 同左 |
| 调用 | `new Temperature.Celsius(100)` | `new Temperature(100.0)` (overload解析) |
| 名称作用 | 调用点区分构造函数 | overload 块内部标识 |
| 构造意图表达 | 通过名称 | 通过参数类型 |

### 2.2 overload constructor 块语法

`overload constructor { Name1, Name2 }` 语法将构造函数名作为裸标识符列出，在 `{ }` 内无类型上下文。用户可能混淆这些名称是类型引用还是变量引用。

### 2.3 匿名构造函数在 overload 中的隐式位置

匿名构造函数隐式位于 overload 列表首位，但此行为在 spec 中描述不够明确。当匿名 + 命名构造函数共存时，`new ClassName()` 匹配匿名构造函数。

---

## 三、编译器错误信息问题

### 3.1 overload 块重复声明的错误信息不精确

```
ESE0351: Variable 'constructor' has already been declared.
```

"Variable 'constructor'" 的措辞不准确 — overload constructor 块不是变量声明。

**建议**: 改为 "overload constructor block has already been declared"。

### 3.2 无匹配构造函数时的冗余错误

```  
ESE0127: No matching construct signature for Foo(Boolean)
ESE0046: Type 'Boolean' is not compatible with type 'String' at index 1
```

ESE0046 描述了编译器内部尝试匹配的过程，对用户价值有限。

**建议**: 仅报告 ESE0127，ESE0046 细节移到 verbose 模式。

### 3.3 W2323 警告在构造函数上下文中的适用性

```
W2323: The order of entities in an overload set implies that the overloaded entity 
with the signature '(n: Int) => undefined' will never be selected for a call
```

在构造函数 overload 场景中，Broad/Narrow 的顺序是用户明确指定的优先级，W2323 在此上下文中可能误导（用例 015 验证 Broad 正确被选中）。

**建议**: 构造函数 overload 场景下 W2323 降级为 info 或移除。

---

## 四、跨语言对比总结

| 维度 | ArkTS (spec) | ArkTS (实现) | Java | Dart | Swift |
|------|-------------|-------------|------|------|-------|
| 命名构造函数声明 | `constructor Name(params)` | 同左 | N/A (静态工厂) | `ClassName.Name(params)` | N/A (convenience init) |
| 调用语法 | `new Class.Name(args)` | `new Class(args)` (overload) | `Class.of(args)` | `new Class.Name(args)` | `Class(args)` (标签) |
| 名称唯一性 | 编译错误 | ESE0130+W2323 | 方法重载规则 | 编译错误 | N/A |

**Java 验证通过**: 
- `NamedConstructorEquivalent.java` — 静态工厂方法模式, 编译+运行通过
- `BuilderPattern.java` — Builder 模式, 编译+运行通过

---

## 五、改进建议汇总

| 优先级 | 类别 | 建议 |
|--------|------|------|
| P0 | Spec一致性 | 实现 `new Class.ConstructorName()` 调用语法 |
| P0 | Spec一致性 | 实现"全命名构造函数禁止 new X()"规则, 或更新 Spec |
| P1 | Spec一致性 | 将命名构造函数名称重复升级为编译错误 |
| P1 | 错误信息 | overload 块重复声明改用精确错误描述 |
| P2 | 错误信息 | 无匹配构造函数时仅报主错误 ESE0127 |
| P2 | 设计澄清 | 文档化命名构造函数与 overload 解析的关系 |
| P3 | 警告优化 | 构造函数 overload 场景的 W2323 降级为 info |

**核心结论:** ArkTS 17.11.3 Named Constructors 的声明语法已支持，但调用语法 `new Class.Name()` 尚未实现（3个 D 类异常）。当前命名构造函数的"名称"实际作为 overload 标识符工作。15 个测试用例全部通过，但 3 个关键 spec 不一致需要在后续版本解决。
