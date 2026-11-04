# 17.15 Accessor Declarations - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 15（compile-pass: 6, compile-fail: 5, runtime: 4）
**目的：** 通过用例执行（编译期 + 真实运行时）以及 Java/Swift 对比，确认 ArkTS 行为与 spec 的一致性，并记录语言设计差异和待确认问题。

---

## 报告分类口径

| 分类 | 说明 | 处理方式 |
|------|------|---------|
| A 类 | ArkTS 合理设计 | 修改用例适配 |
| B 类 | ArkTS 设计问题 | 修改用例 + 记入本报告 |
| C 类 | 编译器实现 bug | 临时绕过 + 记录 |
| D 类 | Spec 与实现不一致 | 保留原始 FAIL 用例（标注⚠️SPEC不一致）+ 记入本报告 |

| 分类 | 数量 | 用例 |
|------|------|------|
| A 类 | 0 | - |
| B 类 | 0 | - |
| C 类 | 0 | - |
| D 类 | 2 | EXP2_17_15_012, EXP2_17_15_013 |

---

## 一、符合 ArkTS spec 的语言设计差异

### 差异 A：顶层 getter/setter 是 ArkTS 独有特性（符合 spec 17.15）

**ArkTS 实测行为：**
顶层 getter/setter 编译和运行完全正确，语法和使用方式与 spec 一致。

**跨语言对比：**
| 语言 | 顶层 getter/setter |
|------|-------------------|
| ArkTS | ✅ 支持 |
| Java | ❌ 不支持（仅类级 getXxx()/setXxx() 方法约定） |
| Swift | ✅ 支持（computed property，但语法和概念有差异） |

**分类：** 符合 ArkTS spec 的语言设计差异，ArkTS 在此维度超越了 Java

---

### 差异 B：Setter 不能声明返回类型（符合 spec 17.15）

**ArkTS 实测行为：**
```typescript
set myValue(v: int): void { ... }
// ESY0241: Setter must not have return type even if it is void
```

**跨语言对比：**
| 语言 | Setter 返回类型 |
|------|---------------|
| ArkTS | ❌ 不能声明（包括 void） |
| Java | ✅ 可以声明 void（这是方法调用） |
| Swift | ✅ 隐式无返回 |

**分类：** 符合 ArkTS spec 的语言设计差异，ArkTS 将 setter 作为属性访问而非方法调用处理

---

### 差异 C：变量式访问语法（符合 spec 17.15）

**ArkTS 实测行为：**
Getter/setter 像变量一样使用：`value = 42`（调用 setter），`let x = value`（调用 getter）。

**跨语言对比：**
| 语言 | 访问语法 |
|------|---------|
| ArkTS | `value = 42` / `let x = value` |
| Java | `setValue(42)` / `int x = getValue()` |
| Swift | `value = 42` / `let x = value` |

**分类：** 符合 ArkTS spec 的语言设计差异，ArkTS 与 Swift 一致的变量式访问语法

---

### 差异 D：Native 访问器（符合 spec 17.15）

**用例：** EXP2_17_15_010_FAIL_NATIVE_GETTER_BODY

**ArkTS 实测行为：**
```typescript
native get nativeValue(): int { return 42 }
// ESE0083: Native, Abstract and Declare methods cannot have body
```

Non-native 必须要有 body，native 不能有 body — 与 spec 完全一致。

**跨语言对比：**
| 语言 | Native 访问器支持 |
|------|------------------|
| ArkTS | ✅ `native get/set` |
| Java | ✅ `native` 修饰符（方法） |
| Swift | ❌ 无直接 native 概念 |

**分类：** 符合 ArkTS spec 的语言设计差异

---

## 二、Spec 与实现不一致

### 问题 D-17.15-01：Getter 缺少返回类型编译通过

**类别：** D 类（Spec 与实现不一致）
**复现用例：** EXP2_17_15_012_FAIL_GETTER_NO_RETURN_TYPE

**Spec 规则：** Getter 声明必须显式指定返回类型或可从 getter 体中推断，缺少返回类型应产生编译时错误。

**实测行为：** `get val() { return 1 }` — 编译器未拒绝缺少返回类型的 getter 声明，编译通过。

**建议：** 编译器应增加 getter 返回类型的检查。

### 问题 D-17.15-02：Getter 名称与外部变量冲突编译通过

**类别：** D 类（Spec 与实现不一致）
**复现用例：** EXP2_17_15_013_FAIL_NAME_CONFLICT_WITH_VAR

**Spec 规则：** 同一作用域内 getter/setter 名称不可与变量名重复。

**实测行为：**
```typescript
let name: int = 1
class C {
  get name(): int { return 1 }  // 预期编译错误，实际通过
}
```

**建议：** 编译器应检查 getter 名与同一作用域内变量名的冲突。

---

## 三、总结

| 类别 | 数量 |
|------|------|
| 符合 spec 的设计差异 | 4 |
| D 类 SPEC 不一致 | 2 |
| 编译器实现问题 | 0 |
| 待确认问题 | 0 |

**整体评估：** 17.15 Accessor Declarations 的核心功能实现完整，但存在 2 处 Spec 与实现不一致：getter 缺少返回类型和名称冲突的编译时检查缺失。需确认 spec 意图或修复编译器。
