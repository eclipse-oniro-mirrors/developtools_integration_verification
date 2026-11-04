# 17.6 Iterable Types - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-23
**规范来源：** ArkTS Static Spec §17.6, Java JLS SE21 §14.14.2 + java.lang.Iterable, Swift Language Reference (Sequence / IteratorProtocol)
**测试基础：** 15 个用例（9 compile-pass + 3 compile-fail + 3 runtime 真实执行）
**实测环境：** ArkTS (es2panda + ark), Java (Java 21), Swift (N/A - 未安装)

---

## 一、概览：三语言定位

| 语言 | 可迭代类型系统定位 | 设计哲学 |
|------|-----------------|---------|
| **ArkTS** | 实验特性，类/接口实现 `Iterable<T>`，`$_iterator()` 返回 `Iterator<T>` | 编译器已知签名的普通方法，禁止 async |
| **Java** | 核心特性，`java.lang.Iterable<T>`，`iterator()` 返回 `Iterator<T>` | 传统 OOP 模式，hasNext/next 两方法协议 |
| **Swift** | 核心特性，`Sequence` 协议，`makeIterator()` 返回 `IteratorProtocol` 子类型 | 面向协议，next() 返回 Optional（nil=结束） |

---

## 二、章节对应关系

| ArkTS §17.6 概念 | Java | Swift | 备注 |
|-------------------|------|-------|------|
| `Iterable<T>` 接口 | `java.lang.Iterable<T>` | `Sequence` 协议 | 完全对应 |
| `$_iterator()` 方法 | `iterator()` | `makeIterator()` | ArkTS 使用 $ 前缀命名 |
| `Iterator<T>` 接口 | `java.util.Iterator<T>` | `IteratorProtocol` 协议 | 完全对应 |
| `next(): IteratorResult<T>` | `hasNext() + next(): T` | `next() -> T?` | ArkTS 用结果对象，Swift 用 Optional |
| `IteratorResult<T>` (done/value) | N/A (hasNext 分离) | N/A (nil 表示结束) | ArkTS 独有模式 |
| 数组内置可迭代 | 增强型 for 循环支持 | Array 遵从 Sequence | 三语言都支持 |
| **字符串内置可迭代** | **不支持** | String 遵从 Sequence | ArkTS/Swift 支持，Java 不支持 |
| **联合可迭代 T[]\|string** | **无对应** | **无对应** | ArkTS 独有 |
| async $_iterator 禁止 | N/A | AsyncSequence 独立协议 | ArkTS 编译时错误 |

---

## 三、关键差异矩阵

### 3.1 迭代协议设计

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 迭代方法名 | `$_iterator()` | `iterator()` | `makeIterator()` |
| 迭代器判定方法 | `next(): IteratorResult<T>` | `hasNext(): boolean` | `next() -> T?` |
| 迭代器取值方法 | 同上（done=false 时 value 有效）| `next(): T` | 同上（非 nil 时有效）|
| 结束表示 | `done: true` | `hasNext() == false` | `nil` |
| 方法命名风格 | $ 前缀（编译器已知） | 标准驼峰 | Swift API 设计准则 |

> **核心差异**：ArkTS 的 Iterator 采用单方法 `next()` 返回结果对象模式（类似 JS/TS），而 Java 采用两方法 `hasNext()`/`next()` 分离模式。ArkTS 的 `$_iterator` 带 `$` 前缀，是编译器已知签名的特殊方法。

### 3.2 内置可迭代类型

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 数组可迭代 | 是（T[], Array\<T\>, FixedArray\<T\>）| 是（T[] 增强 for） | 是（Array\<T\>）|
| **字符串可迭代** | **是（string）** | **否** | 是（String） |
| 可迭代联合 | 是（T[] \| string） | 否 | 否 |

> **关键发现**：ArkTS 的 `string` 内置可迭代是一个与 Swift 一致、但强于 Java 的设计选择。Java String 需要 `charAt()` 或 `chars()` stream 才能遍历字符。

### 3.3 编译器约束

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| async 方法禁止 | **是（编译错误 ESY0220）** | N/A | 独立 AsyncSequence |
| 缺少 $_iterator 错误 | ESE0190（抽象方法未覆写） | 编译错误 | 编译错误 |
| 返回类型不匹配错误 | ESE0096（必须实现 Iterator） | 编译错误 | 编译错误 |
| 类实现约束 | 必须具体类提供 $_iterator | 同上 | 必须提供 makeIterator() |

### 3.4 语言表达力

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 泛型 Iterable | Iterable\<T\> | Iterable\<T\> | Sequence (关联类型) |
| 接口继承 Iterable | 是（extends Iterable） | 是 | 是（协议继承）|
| 子类覆盖 $_iterator | 是 | 是 | 是（协议方法可覆写）|
| 抽象 $_iterator | 是（接口中声明） | 是 | 是（协议中声明）|
| 联合可迭代类型 | **是** | 否 | 否 |

---

## 四、用例 1:1 对照（关键用例的三语言代码对比）

### 用例 001：自定义 Range 可迭代类

| 语言 | 代码 | 
|------|------|
| ArkTS | `class Range implements Iterable<int>` + `$_iterator(): Iterator<int>` |
| Java | `class Range implements Iterable<Integer>` + `iterator(): Iterator<Integer>` |
| Swift | `struct RangeSequence: Sequence` + `makeIterator() -> RangeIterator` |

### 用例 013：数组 for-of/for-each/for-in

| 语言 | 代码 | 
|------|------|
| ArkTS | `for (let x of arr) { sum = sum + x }` |
| Java | `for (int x : arr) { sum += x; }` |
| Swift | `for x in arr { sum += x }` |

### 用例 014：字符串迭代

| 语言 | 代码 | 
|------|------|
| ArkTS | `for (let ch of "ArkTS") { result = result + ch }` |
| Java | N/A（`String` 不可迭代，需 `for (char c : s.toCharArray())` 或 `s.chars()`）|
| Swift | `for ch in "ArkTS" { result.append(ch) }` |

### 用例 010：async $_iterator 禁止

| 语言 | 行为 |
|------|------|
| ArkTS | **编译错误** ESY0220 |
| Java | N/A（iterator() 不能标记为某种异步约束） |
| Swift | N/A（使用独立 AsyncSequence 协议处理异步迭代） |

---

## 五、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 类实现 Iterable 基本可迭代 | compile-pass | compile-pass | N/A |
| 002 | for-of 自定义 Iterable | compile-pass | compile-pass | N/A |
| 003 | for-of 数组内置可迭代 | compile-pass | compile-pass | N/A |
| 004 | for-of 字符串内置可迭代 | compile-pass | N/A（String 不可迭代） | N/A |
| 005 | 接口扩展 Iterable | compile-pass | compile-pass | N/A |
| 006 | 联合可迭代类型 | compile-pass | N/A（无联合类型） | N/A |
| 007 | 覆盖 $_iterator | compile-pass | compile-pass | N/A |
| 008 | 泛型 Iterable\<T\> | compile-pass | compile-pass | N/A |
| 009 | 抽象 $_iterator 在接口中 | compile-pass | compile-pass | N/A |
| 010 | async $_iterator 禁止 | compile-fail | N/A | N/A |
| 011 | 缺少 $_iterator | compile-fail | compile-fail | N/A |
| 012 | $_iterator 返回类型错误 | compile-fail | compile-fail | N/A |
| 013 | 数组 for-of 运行时验证 | runtime (exit 0) | verified | N/A |
| 014 | 字符串 for-of 运行时验证 | runtime (exit 0) | N/A | N/A |
| 015 | 自定义 Iterable 运行时验证 | runtime (exit 0) | verified | N/A |

### 关键差异详解

#### 用例 004: 字符串作为可迭代类型

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `for (let ch of "ArkTS") { ... }` | 字符串是内置 Iterable，for-of 遍历每个字符 |
| Java | `for (char c : "ArkTS".toCharArray()) { ... }` | String 不是 Iterable\<Character\>，需转换 |
| Swift | `for ch in "ArkTS" { ... }` | String 遵从 Sequence 协议，for-in 遍历字符 |

#### 用例 010: async $_iterator 禁止

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `async $_iterator(): Iterator<T>` | ESY0220: $_iterator cannot be asynchronous |
| Java | N/A | Java 无 async 方法概念 |
| Swift | N/A | Swift 使用 AsyncSequence 独立协议 |

#### 用例 006: 联合可迭代类型

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let data: int[] \| string = ...; for (let x of data) { ... }` | 联合可迭代编译通过 |
| Java | N/A | 无原生联合类型 |
| Swift | N/A | 无原生联合类型 |

---

## 六、综合评分

| 维度 | ArkTS | Java | Swift | 评价 |
|------|-------|------|-------|------|
| 迭代协议简洁性 | 3.5 | 4 | 4.5 | Swift 的 Optional 模式最简洁；ArkTS 需 IteratorResult 对象 |
| 内置迭代覆盖率 | 4.5 | 3.5 | 4.5 | ArkTS/Swift 字符串内置迭代优于 Java |
| 编译器安全性 | 5 | 4 | 5 | ArkTS 禁止 async $_iterator 是额外安全约束 |
| 泛型支持 | 5 | 5 | 5 | 三种语言泛型支持都完善 |
| 类型表达力（联合迭代）| 5 | 2 | 2 | ArkTS 联合可迭代是独有优势 |
| 协议/接口灵活性 | 4 | 4.5 | 5 | Swift 面向协议最灵活 |

---

## 七、核心结论

1. **ArkTS Iterable 设计与 TS/JS 一脉相承**：使用 `next()` 返回 `IteratorResult<T>` 的单方法模式，$ 前缀命名风格表明其编译器已知方法的定位。

2. **ArkTS 的独有优势**：
   - 字符串是可迭代类型（与 Swift 一致，强于 Java）
   - 联合可迭代类型（ArkTS 独有，得益于联合类型系统）
   - 编译期禁止 async $_iterator（主动安全约束）

3. **ArkTS 与 Java 的主要差异**：
   - 方法名：`$_iterator()` vs `iterator()`
   - 迭代模式：单方法结果对象 vs 双方法 hasNext/next
   - 字符串可迭代：支持 vs 不支持

4. **ArkTS 与 Swift 的一致性**：
   - 字符串都是内置可迭代
   - 数组都是内置可迭代
   - 都支持泛型可迭代
   - 都不允许在常规 iterator 上标记 async（Swift 使用独立协议）

---

## 八、ArkTS 设计建议

1. **保持 $_iterator 命名惯例**：$ 前缀明确区分编译器已知方法与用户方法，避免命名冲突。

2. **字符串可迭代是良好设计**：与 Swift 一致，建议保持此特性。

3. **联合可迭代是差异化优势**：ArkTS 的联合类型系统使此特性成为可能，建议在文档中强调。

4. **考虑 Iterator 协议的简化**：Java 的 hasNext/next 两方法模式在部分场景更直观（可提前判断是否有下一个元素），ArkTS 的单方法结果对象模式则更简洁。可根据实际场景评估。
