# 7.28.3 Extended Equality with null or undefined — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

本子章节未发现 D 类异常。全部 12 个测试用例通过，规范与实现完全一致。

> **关于 compile-fail 的说明**：本子节有意不设立 compile-fail 用例。ArkTS 编译器允许 null/undefined 与所有类型进行等值比较（均编译通过），这符合扩展等值设计意图。

### ID-01: null/undefined 双类型系统 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | N/A（设计差异分析） |
| **实测结果** | ArkTS 同时支持 null 和 undefined 两种空值，Java/Swift 均只有单一空值概念 |
| **错误信息** | N/A |

**描述**：ArkTS 继承 TypeScript 的 null/undefined 双类型系统，同时支持 `null` 和 `undefined` 两种空值，且通过扩展等值 `==` 将这些视为相等。Java 仅有 `null`（所有引用类型的默认值），无 `undefined` 概念。Swift 仅有 `nil`（`Optional.none` 的语法糖），无 `undefined` 概念。

**跨语言对比**：

| 语言 | 空值类型 | 说明 |
|------|---------|------|
| ArkTS | `null` 和 `undefined` | 同时支持两种空值，`==` 视为相等 |
| Java | 仅有 `null` | 所有引用类型的默认值，无 `undefined` 概念 |
| Swift | 仅有 `nil` | `Optional.none` 的语法糖，无 `undefined` 概念 |

**分类**：跨语言设计差异

---

### ID-02: 严格等值 === 区分 null/undefined ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | N/A（设计差异分析） |
| **实测结果** | ArkTS 中 null === undefined 为 false |
| **错误信息** | N/A |

**描述**：ArkTS 的严格等值运算符 `===` 能够区分 `null` 和 `undefined`，`null === undefined` 返回 `false`。Java 无 `===` 运算符。Swift 的 `===` 仅适用于类实例引用比较，不与值比较。

**跨语言对比**：

| 语言 | null === undefined |
|------|:-----------------:|
| ArkTS | `false`（严格区分两种空值） |
| Java | 无 `===` 运算符 |
| Swift | `===` 仅适用于类实例引用比较，不与值比较 |

**分类**：跨语言设计差异

---

### ID-03: null/nil 的类型表达方式 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | N/A（设计差异分析） |
| **实测结果** | 三种语言对空值的类型表达方式不同 |
| **错误信息** | N/A |

**描述**：ArkTS 中 `null`/`undefined` 出现在联合类型中：`T | null`，`T | undefined`。Java 中 `null` 隐式存在于所有引用类型中，非显式类型声明。Swift 中 `nil` 必须通过 `Optional<T>`（`T?`）显式包装。

**跨语言对比**：

| 语言 | 空值类型表达方式 |
|------|----------------|
| ArkTS | `null`/`undefined` 出现在联合类型中：`T \| null`，`T \| undefined` |
| Java | `null` 隐式存在于所有引用类型中，非显式类型声明 |
| Swift | `nil` 必须通过 `Optional<T>`（`T?`）显式包装 |

**分类**：跨语言设计差异

---

## 测试结果汇总

| 分类 | 数量 | 状态 |
|:----:|:----:|:----:|
| **D 类**（Spec 与实现不一致） | **0** | 无异常 |
| **跨语言设计差异** | **3** | null/undefined 双类型、严格等值区分、类型表达方式 |
| **compile-pass** | **8/8** | 全部通过 |
| **compile-fail（预期）** | **0** | 无（扩展等值允许所有 null/undefined 比较） |
| **runtime** | **4/4** | 31 断言全部通过 |
| **Java** | **6/6** | 全部通过 |
| **Swift** | **4/4** | 全部通过 |
