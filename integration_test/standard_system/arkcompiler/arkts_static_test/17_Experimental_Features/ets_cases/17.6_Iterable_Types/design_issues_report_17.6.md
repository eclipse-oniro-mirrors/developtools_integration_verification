# 17.6 Iterable Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

**报告日期：** 2026-06-23
**测试用例数：** 15（compile-pass: 9, compile-fail: 3, runtime: 3）
**目的：** 通过用例执行以及 Java/Swift 对比，确认 ArkTS 行为与 spec 的一致性，并记录语言设计差异和待确认问题。

---

## 一、规范一致性确认

### 已确认实现与 Spec 一致的要点

| Spec 规则 | 验证用例 | 结果 | 结论 |
|-----------|---------|------|------|
| 类/接口实现 Iterable\<T\>，需定义 $_iterator() 返回 Iterator\<T\> 子类型 | 001, 002, 005, 008 | compile-pass | 一致 |
| 数组类型是内置可迭代类型 | 003, 013 | compile-pass + runtime | 一致 |
| 字符串类型是内置可迭代类型 | 004, 014 | compile-pass + runtime | 一致 |
| 可迭代类型的联合类型也是可迭代的 | 006 | compile-pass | 一致 |
| $_iterator 可在父类/接口中定义，子类覆盖 | 007, 009 | compile-pass | 一致 |
| $_iterator 可以在接口中抽象声明 | 005, 009 | compile-pass | 一致 |
| $_iterator 标记为 async 应产生编译时错误 | 010 | compile-fail (ESY0220) | 一致 |
| 类声明 implements Iterable 但未实现 $_iterator 应报错 | 011 | compile-fail (ESE0190) | 一致 |
| $_iterator 返回非 Iterator 子类型应报错 | 012 | compile-fail (ESE0096) | 一致 |

**结论：所有 15 个用例全部通过，ArkTS 17.6 Iterable Types 的实现与 Spec 完全一致，无 SPEC 不一致发现。**

---

## 二、符合 ArkTS spec 的语言设计差异

### 差异 A：$_iterator 命名惯例（符合 spec）

**说明：**
ArkTS 使用 `$_iterator()` 而非 TypeScript 的 `[Symbol.iterator]()` 或 Java 的 `iterator()`。`$` 前缀表明这是编译器已知签名的特殊方法（非用户自定义普通方法）。

**跨语言对比：**

| 语言 | 迭代方法名 | 设计哲学 |
|------|-----------|---------|
| ArkTS | `$_iterator()` | $ 前缀区分编译器已知方法 |
| Java | `iterator()` | 标准接口方法名 |
| Swift | `makeIterator()` | Swift API 设计准则 |
| TypeScript | `[Symbol.iterator]()` | Symbol 键方法 |

**分类：** 符合 ArkTS spec 的语言设计差异

---

### 差异 B：单方法 next() 返回 IteratorResult\<T\> vs 双方法 hasNext()/next()（符合 spec）

**说明：**
ArkTS Iterator 使用 `next(): IteratorResult<T>` 单方法模式（类似 JS/TS），其中 `IteratorResult.done` 表示迭代结束，`IteratorResult.value` 表示当前值。Java 使用 `hasNext(): boolean` + `next(): T` 双方法模式。

**跨语言对比：**

| 语言 | 迭代器模式 | 结束判定 |
|------|-----------|---------|
| ArkTS | `next(): IteratorResult<T>` (单方法) | `done: true` |
| Java | `hasNext()` + `next()` (双方法) | `hasNext() == false` |
| Swift | `next() -> T?` (单方法) | `nil` |

> 注意：ArkTS 的模式与 ECMAScript 迭代协议一致，这是有意为之的设计选择，不是缺陷。

**分类：** 符合 ArkTS spec 的语言设计差异（与 JS/TS 生态一致）

---

### 差异 C：字符串内置可迭代（符合 spec，但 Java 不支持）

**说明：**
ArkTS 的 `string` 类型是内置可迭代类型，可直接用于 for-of 语句。Java 的 `String` 类不实现 `Iterable<Character>`，需要通过 `toCharArray()` 或 `chars()` 流来遍历字符。Swift 的 String 也是 Sequence。

**跨语言对比：**

| 语言 | String 可迭代 | 遍历方式 |
|------|-------------|---------|
| ArkTS | 是 | `for (let ch of "hello") { ... }` |
| Java | 否 | `s.chars()` 或 `for (char c : s.toCharArray())` |
| Swift | 是 | `for ch in "hello" { ... }` |

**分类：** 符合 ArkTS spec 的语言设计差异（与 Swift 一致，优于 Java）

---

### 差异 D：联合可迭代类型（符合 spec，ArkTS 独有）

**说明：**
ArkTS 支持 `int[] | string` 类型的联合可迭代，这得益于 ArkTS 的原生联合类型系统。Java 和 Swift 都没有原生的联合类型，因此没有对应的联合可迭代概念。

**分类：** 符合 ArkTS spec 的语言设计差异（ArkTS 独有的类型系统能力）

---

## 三、待确认问题

无。本次测试未发现任何需要进一步确认的 spec 模糊点或实现问题。

---

## 四、编译器实现观察

### 错误信息质量

| 错误场景 | 错误码 | 错误信息 | 评价 |
|---------|--------|---------|------|
| async $_iterator | ESY0220 | The special predefined method '$_iterator' cannot be asynchronous. | 清晰准确 |
| 缺少 $_iterator | ESE0190 | not abstract and does not override abstract method $_iterator() | 明确 |
| 返回类型错误 | ESE0096 | The return type of '$_iterator' must be a type that implements Iterator interface. | 明确 |

编译器错误信息准确且具有指导性。ESY0220 明确命名了 `$_iterator` 为 "special predefined method"，有助于开发者理解 `$` 前缀的特殊性。

### 运行时行为

- for-of 遍历数组、字符串、自定义 Iterable 均表现正确
- 空集合（空数组、空字符串、空自定义范围）的 for-of 行为正确（零次迭代）
- 无运行时异常或崩溃

---

## 五、后续建议

1. **无紧急问题需修复**：所有 15 个用例 100% 通过，spec 与实现完全一致。

2. **可考虑增强的点**：
   - 文档中可显式对比 `$_iterator` 与 TypeScript `[Symbol.iterator]` 的关系
   - 可增加 `async $_iterator` 禁止的详细说明（为何设计此约束）
   - 可对 `IteratorResult<T>` 的 done/value 字段提供更详细的 API 文档

3. **跨语言对齐建议**：ArkTS 的 $ 前缀命名和单方法 next() 模式与 TypeScript/ECMAScript 生态一致，这是合理的设计选择。建议在跨语言文档中明确这一点。
