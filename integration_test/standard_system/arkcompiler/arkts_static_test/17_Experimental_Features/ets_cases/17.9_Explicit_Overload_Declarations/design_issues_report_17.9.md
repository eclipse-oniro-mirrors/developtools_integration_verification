# 17.9 Explicit Overload Declarations - ArkTS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 73（compile-pass: 38, compile-fail: 24, runtime: 11）
**目的：** 通过用例执行（编译期 + 真实运行时）以及 Java/Swift 对比，确认 ArkTS 行为与 spec 的一致性，并记录语言设计差异和待确认问题。

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：显式 overload 声明机制（符合 spec）

**ArkTS 实测行为：**
```typescript
function processInt(a: int): string { return "int:" + a }
function processStr(a: string): string { return "str:" + a }
overload process { processInt, processStr }
```

**ArkTS spec 依据：**
§17.9 规定 `overload` 关键字声明有序重载集，编译时按声明顺序解析。

**跨语言对比：**
| 语言 | 重载声明 | 结论 |
|------|---------|------|
| ArkTS | 显式 overload 关键字 | 符合 spec |
| Java | 隐式（同名即可） | 无显式重载概念 |
| Swift | 隐式 + 参数标签 | 无显式重载概念 |

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 B：重载名与函数名可相同（符合 spec）

**用例来源：** EXP2_FuncOverload_NameSameAsFunc_pass, EXP2_NameConflict_OverloadNameSameAsMethod_pass

**ArkTS 实测行为：**
```typescript
function process(a: int): int { return a * 2 }
function processStr(a: string): string { return a + "!" }
overload process { process, processStr }  // overload 名与 process 函数同名
```

**ArkTS spec 依据：**
§17.9.4 明确规定 overload 名可以与方法名相同（该方法必须在列表中）。

**跨语言对比：**
| 语言 | 同名处理 |
|------|---------|
| ArkTS | 显式声明，函数在列表中即合法 |
| Java | 自然同名多义 |
| Swift | 自然同名多义 |

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 C：overload 名不在 Function/Method Reference 中考虑（符合 spec）

**用例来源：** EXP2_FuncOverload_AsFuncRef_fail, EXP2_NameConflict_MethodRef_pass

**ArkTS 实测行为：**
- 函数 overload 名不能作为函数引用：编译错误
- 类中 overload 方法名不能作为方法引用：编译错误（ESE0307: Overloaded method is used as value）

**ArkTS spec 依据：**
§17.9.1 和 §17.9.4 规定 overload 名不在 Function Reference / Method Reference 中考虑。

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 D：静态/实例方法隔离检查（符合 spec）

**用例来源：** EXP2_MethodOverload_StaticMismatch_fail, EXP2_MethodOverload_InstanceMismatch_fail

**ArkTS 实测行为：**
- static overload 包含实例方法 → 编译错误
- 实例 overload 包含 static 方法 → 编译错误

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 E：async 方法隔离检查（符合 spec）

**用例来源：** EXP2_MethodOverload_AsyncMismatch_fail, EXP2_MethodOverload_SyncAsyncMismatch_fail

**ArkTS 实测行为：**
- async overload 包含非 async 方法 → 编译错误
- 非 async overload 包含 async 方法 → 编译错误

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 F：访问修饰符约束（符合 spec）

**用例来源：** EXP2_MethodOverload_AccessMismatch_fail

**ArkTS 实测行为：**
- protected overload 包含 private 方法 → 编译错误

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 G：子类 overload 覆盖完整性检查（符合 spec）

**用例来源：** EXP2_MethodOverload_OverrideMissing_fail, EXP2_InterfaceOverload_OverrideMissing_fail

**ArkTS 实测行为：**
- 子类覆盖 overload 但缺少父类方法 → 编译错误
- 实现类 override 接口 overload 但缺少接口方法 → 编译错误

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 H：导出 overload 一致性检查（符合 spec）

**用例来源：** EXP2_FuncOverload_ExportNotAll_fail

**ArkTS 实测行为：**
- 导出 overload 但某重载函数未导出 → 编译错误

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 I：重载名与同名方法不在列表中（符合 spec）

**用例来源：** EXP2_FuncOverload_NameSameNotInList_fail, EXP2_MethodOverload_NameConflict_fail, EXP2_NameConflict_MethodNotInList_fail

**ArkTS 实测行为：**
- overload 名等于方法名但该方法不在列表中 → 编译错误

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 J：构造函数重载语法（符合 spec，但需注意）

**关键发现：**
构造函数重载的语法与 spec 描述有一处细微但重要的区别：

```typescript
// ❌ 错误写法（会导致 ESY0112 语法错误）
class Foo {
  constructor(a: int) { ... }
  constructor(a: string) { ... }
  overload constructor { constructor }
}

// ✅ 正确写法（命名构造函数在列表中，匿名隐式首位）
class Foo {
  constructor fromInt(a: int) { ... }
  constructor fromStr(a: string) { ... }
  overload constructor { fromInt, fromStr }
}
```

**说明：** `overload constructor { constructor }` 中重复的 `constructor` 关键字导致语法错误。匿名构造函数隐式在列表首位，overload 列表中只需列出命名构造函数。这与 spec 描述一致："Anonymous constructor implicitly placed first in list"。

**分类：** 符合 ArkTS spec 的语法设计

---

### 差异 K：多个接口同名 overload 冲突检测（符合 spec）

**用例来源：** EXP2_InterfaceOverload_DuplicateOverload_fail

**ArkTS 实测行为：**
- 实现类继承多接口有同名 overload 但未覆盖 → 编译错误

**分类：** 符合 ArkTS spec 的语言设计差异

---

## 二、规范不一致问题（SPEC INCONSISTENCY）

### 不一致 S1：空 overload 列表被允许（不应通过编译）

**用例：** EXP2_FuncOverload_Empty_fail

**ArkTS spec 描述：**
> overload identifier { func1, func2, ... } — overload 列表至少应含一个函数

**实测行为：**
```typescript
function fInt(a: int): int { return a }
overload empty { }  // ⚠️ 编译通过，无错误！
```

**分类：** 实现与 spec 不一致（MEDIUM）

**建议：** 修正 spec 允许空列表，或修复编译器拒绝空列表。

---

### 不一致 S2：空 constructor overload 列表被允许（不应通过编译）

**用例：** EXP2_CtorOverload_EmptyList_fail

**实测行为：**
```typescript
class EmptyCtor {
  private x: int = 0
  overload constructor { }  // ⚠️ 编译通过，无错误！
}
```

**分类：** 实现与 spec 不一致（MEDIUM）

---

### 不一致 S3：每类允许多个 constructor overload 声明（spec 说只能一个）

**用例：** EXP2_CtorOverload_TwoDeclarations_fail

**实测行为：**
```typescript
class DoubleCtor {
  constructor a(a: int) {}
  constructor b(a: string) {}
  overload constructor { a, b }
  overload constructor { a, b }  // ⚠️ 编译通过！spec 说只能一个
}
```

**分类：** 实现与 spec 不一致（LOW - 重复声明无实际危害）

---

## 三、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| 函数 overload 基本声明和调用 | 17.9.1 all pass | ✅ |
| 类方法 overload 基本声明 | 17.9.2 all pass | ✅ |
| 接口 overload 声明 | 17.9.3 all pass | ✅ |
| overload 名与函数同名 | 001-pass, 003-pass | ✅ |
| overload 名与方法同名 | 17.9.4 all pass | ✅ |
| 构造函数 overload 声明和调用 | 17.9.5 all pass | ✅ |
| 按参数类型/数量区分重载 | 多个 runtime | ✅ |
| 函数 overload 按声明顺序匹配 | 015-runtime | ✅ |
| 实例方法 overload 运行时分发 | 016-runtime | ✅ |
| static 方法 overload 运行时分发 | 017-runtime | ✅ |
| override 多态 overload 分发 | 018-runtime | ✅ |
| 接口 overload 运行时分发 | 010-runtime | ✅ |
| 构造函数重载运行时解析 | 011-runtime, 012-runtime | ✅ |
| overload 名与方法同名不产生歧义 | 008-runtime | ✅ |
| 泛型函数参与 overload | 005-pass | ✅ |
| 一个函数出现在多个 overload | 006-pass, 002-pass | ✅ |
| 导出 overload 所有函数必须导出 | 004-pass / 010-fail | ✅ |
| overload 中无匹配签名报错 | 011-fail, 006-fail | ✅ |
| overload 名不能作为函数引用 | 012-fail | ✅ |
| overload 引用不存在的函数报错 | 008-fail | ✅ |
| static/instance mismatch | 009-fail, 010-fail | ✅ |
| async mismatch | 011-fail, 014-fail | ✅ |
| 访问修饰符约束 | 012-fail | ✅ |
| 子类覆盖缺少方法报错 | 013-fail, 007-fail | ✅ |
| 多接口同名 overload 冲突 | 008-fail | ✅ |

---

## 四、报告分类口径

| 分类 | 条目 | 数量 |
|------|------|------|
| 符合 ArkTS spec / 当前实现的语言设计差异 | A, B, C, D, E, F, G, H, I, J, K | 11 |
| 规范不一致（SPEC INCONSISTENCY） | S1, S2, S3 | 3 |
| 已验证规范一致行为 | 见上表 | 26 项 |

---

## 五、后续建议

1. **S1 (空 overload 列表):** 建议规范与实现统一。若允许空列表（实现当前行为），更新 spec；若不允许，修复编译器。
2. **S2 (空 constructor overload):** 同上。
3. **S3 (重复 constructor overload):** spec 限制唯一性，编译器未检查。影响小但应统一。
4. **构造函数 overload 语法:** spec 应更明确说明匿名构造函数隐式在首位，overload 列表只列出命名构造函数。
5. **overload 方法作为值:** 编译器正确拒绝（ESE0307），与 spec 一致，无需修改。
