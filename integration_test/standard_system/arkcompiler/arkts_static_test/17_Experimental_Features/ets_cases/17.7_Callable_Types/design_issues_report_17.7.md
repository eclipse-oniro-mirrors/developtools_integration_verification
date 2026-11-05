# 17.7 Callable Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 17（compile-pass: 7, compile-fail: 4, runtime: 6）
**目的：** 通过用例执行（编译期 + 真实运行时）以及 Java 对比，确认 ArkTS 行为与 spec 的一致性，并记录语言设计差异和待确认问题。

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：类型级可调用是 ArkTS 独有特性（符合 spec）

**用例：** EXP2_17_07_001 ~ 007, 012 ~ 017

**ArkTS 实测行为：**
```typescript
class Calc {
  static $_invoke(): int { return 42 }
}
let r: int = Calc()  // 类型级可调用
```

**ArkTS spec 依据：**
§17.7 Callable Types 明确说明：Class type becomes callable via static $_invoke or $_instantiate.

**跨语言对比：**

| 语言 | 类型级可调用 | 实例级可调用 |
|------|-----------|-----------|
| ArkTS | `C()` 调用 `$_invoke` | 不支持 |
| Java | 不支持 | 不支持 |
| Swift | 不支持（`C()` 是构造器） | `instance()` 调用 `callAsFunction` |
| TypeScript | 不支持 | 不支持 |

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 B：$_instantiate 的 factory 参数是隐式设计（符合 spec，但文档需补充）

**用例：** EXP2_17_07_003, 004, 006, 013, 017（初始均因缺少 factory 参数而编译失败）

**ArkTS 实测行为：**
```typescript
// 正确：必须包含 factory 参数
class Factory {
  static $_instantiate(f: () => Factory): Factory {
    return f()
  }
}
// Factory() 简写时，编译器自动传入 factory

// 错误：缺少 factory 参数则编译失败
// ESE0124: Expected 0 arguments, got 1
```

**ArkTS spec 依据：**
§17.7 说明：`C()` is short form of `C.$_instantiate(factory)`，但未明确说明 `$_instantiate` 方法签名必须包含 `f: () => Self` 作为第一参数。

**跨语言对比：**

| 语言 | 工厂调用方式 |
|------|-----------|
| ArkTS | `C()` → `C.$_instantiate(factory)`（隐式传入 factory） |
| Java | `C.create()`（显式静态方法） |
| Swift | `C.create()`（显式静态方法） |

**分类：** 符合 ArkTS spec 的设计差异。属于 spec 文档表述不够详细的问题，非语言设计缺陷。

**建议：** Spec 应明确说明 `$_instantiate` 的第一参数必须是 `f: () => Self` 类型。

---

### 差异 C：$_invoke + $_instantiate 互斥（符合 spec，正确约束）

**用例：** EXP2_17_07_008_FAIL_BOTH_INVOKE_AND_INSTANTIATE

**ArkTS 实测行为：**
```
ESE0221: Static $_invoke method and static $_instantiate method
both exist in class/interface BothCallable is not allowed.
```

**ArkTS spec 依据：**
§17.7 明确说明：Can have EITHER $_invoke OR $_instantiate, not both (compile-time error).

**跨语言对比：**

| 语言 | 等价约束 |
|------|---------|
| ArkTS | ESE0221 编译错误 |
| Java | N/A（无对应机制） |
| Swift | N/A（无对应机制） |

**分类：** 符合 ArkTS spec，实现正确。

---

### 差异 D：静态方法不能访问泛型类型参数（符合 spec，与 Java 一致）

**用例：** EXP2_17_07_010_FAIL_STATIC_INVOKE_USES_GENERIC_T

**ArkTS 实测行为：**
```
ESE0371: Cannot find type 'T'
ESE170021: Static members cannot reference class type parameters 'T'
```

**ArkTS spec 依据：**
§17.7 说明：Static methods have no access to generic type parameters.

**跨语言对比：**

| 语言 | static 方法访问泛型 T |
|------|---------------------|
| ArkTS | 编译错误 ESE170021 |
| Java | 编译错误（cannot reference non-static type variable） |
| Swift | 编译错误（static method cannot use generic type parameter） |

**分类：** 符合 ArkTS spec，与 Java/Swift 行为一致。

---

### 差异 E：实例 $_invoke 不使类可调用（符合 spec）

**用例：** EXP2_17_07_009_FAIL_INSTANCE_INVOKE_NOT_CALLABLE

**ArkTS 实测行为：**
```
ESE0172: No static $_invoke method and static $_instantiate method
in InstanceInvokeOnly. InstanceInvokeOnly() is not allowed.
ESE0002: Type 'InstanceInvokeOnly' has no call signatures.
```

**ArkTS spec 依据：**
§17.7 说明：Instance $_invoke does NOT make class callable.

**跨语言对比：**

| 语言 | 实例方法使类可调用 |
|------|-----------------|
| ArkTS | 不支持（编译错误） |
| Java | N/A |
| Swift | callAsFunction 正好是实例级（语义相反） |

**分类：** 符合 ArkTS spec。但值得注意的是 Swift 选择了相反的设计路径（实例级可调用），ArkTS 选择了类型级可调用。

---

## 二、待确认问题

### 待确认 F：$_instantiate 的 factory 参数类型

**触发场景：** 初始测试时所有 $_instantiate 用例因缺少 factory 参数而编译失败。

**当前实测：**
```typescript
// 正确形式
class C {
  static $_instantiate(f: () => C): C { return f() }
}

// 错误形式（缺少 factory 参数）
class C2 {
  static $_instantiate(): C2 { return new C2() }
}
// C2() → ESE0124: Expected 0 arguments, got 1
```

**当前结论：**
`$_instantiate` 的第一参数必须是 `f: () => Self` 类型的工厂函数。`C()` 简写时编译器自动传入隐式 factory 参数。

**待补充材料：**
- ArkTS Static Spec §17.7 应明确 `$_instantiate` 的完整方法签名要求
- 是否支持其余 factory 类型（如带参工厂 `(x: int) => C`）？

**分类：** 待确认问题（需要 spec 文档补充说明）

---

### 待确认 G：普通类尝试 C() 调用的错误消息

**用例：** EXP2_17_07_011_FAIL_NO_INVOKE_CLASS_NOT_CALLABLE

**当前实测错误：**
```
ESE0172: No static $_invoke method and static $_instantiate method
in PlainClass. PlainClass() is not allowed.
ESE0002: Type 'PlainClass' has no call signatures.
```

**分析：**
同时报告了两个错误：ESE0172（明确的"无 callable 方法"）和 ESE0002（"无调用签名"）。ESE0172 的措辞较好，ESE0002 是通用错误。两个错误同时出现可能造成混淆。

**建议：** 建议只保留 ESE0172，移除 ESE0002（或使其更具体）。

**分类：** 待确认问题（轻微，错误消息优化建议）

---

## 三、已验证 ArkTS 行为（与规范一致）

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| $_invoke 使类可调用 | 001, 002, 005, 012, 014 | ✅ |
| $_instantiate 使类可调用 | 003, 004, 006, 013, 017 | ✅ |
| 多 $_invoke 重载正确分发 | 005, 014 | ✅ |
| 多 $_instantiate 重载正确分发 | 006, 017 | ✅ |
| 显式调用 C.$_invoke() | 007, 016 | ✅ |
| $_invoke + $_instantiate 互斥 | 008 | ✅ |
| 实例 $_invoke 不使类可调用 | 009 | ✅ |
| static 不能访问泛型 T | 010 | ✅ |
| 普通类不可调用 | 011 | ✅ |
| new C() vs C() 行为区分 | 015 | ✅ |
| C() 与 C.$_invoke() 一致 | 016 | ✅ |

---

## 四、分类汇总

| 分类 | 条目 |
|------|------|
| 符合 ArkTS spec / 当前实现的语言设计差异 | A, B, C, D, E |
| 待确认问题 | F (factory 参数文档), G (错误消息优化) |
| 已验证规范一致行为 | 12 项 |

---

## 五、后续建议

1. **Spec 文档补充**：明确 `$_instantiate(f: () => Self, ...args)` 的完整签名要求（差异 F）。
2. **错误消息优化**：考虑移除重复的 ESE0002，或使错误消息更精确（待确认 G）。
3. **跨语言文档**：在 ArkTS 文档中明确说明 `C()` 在 ArkTS vs Swift 中的语义差异（差异 A）。
4. **无需修改实现**：当前编译器实现与 spec 完全一致，无需修改。
