# 7.35.4 Runtime Evaluation of Lambda Expressions — ArkTS / Java / Swift 对比报告

## 1. 概览（三语言定位）

| 维度 | ArkTS | Java | Swift |
|:----:|:-----:|:----:|:-----:|
| Lambda 求值不执行体 | ✅ 表达式求值时不执行体 | ✅ 同 ArkTS | ✅ 同 ArkTS |
| 变量捕获语法 | `let` 变量可捕获并修改 | 仅 `effectively final` 或包装引用 | `var`/`let` 均可捕获，值类型可修改 |
| 捕获语义 | 引用捕获（非拷贝） | 引用捕获（需数组/Atomic 包装实现可变性） | 引用捕获（值类型闭包捕获时拷贝，修改需 var） |
| 函数作用域捕获 | 每次调用产生独立捕获 | 每次调用产生独立捕获 | 每次调用产生独立捕获 |
| 循环作用域捕获 | `let` 每迭代新绑定 | `int captured = i` 副本 | 闭包自然捕获不同迭代值 |
| 内存不足异常 | `OutOfMemoryError` | `OutOfMemoryError` | 运行时错误 |
| 函数类型实例 | `() => T` 实例 | `Supplier<T>` / `Function<T,R>` 实例 | `() -> T` 闭包实例 |

## 2. 章节对应关系（ArkTS / Java / Swift）

| ArkTS 概念 | Java | Swift |
|-----------|------|-------|
| Lambda 求值不执行体 | Lambda 创建不执行体 | Closure 创建不执行体 |
| 捕获变量（非拷贝） | Effectively final 变量或数组引用 | 闭包捕获变量引用 |
| 函数作用域捕获 | 方法返回 lambda 独立实例 | 函数返回闭包独立实例 |
| 循环作用域捕获 | for 循环内 effectively final 副本 | for-in 循环闭包自然捕获 |
| OutOfMemoryError | OutOfMemoryError | 内存不足崩溃 |

## 3. 关键差异矩阵

| 差异点 | ArkTS | Java | Swift |
|--------|:-----:|:----:|:-----:|
| 捕获变量可修改性 | ✅ 直接修改捕获的 `let` 变量 | ❌ 需用数组/Atomic 包装 | ⚠️ 值类型需 `var`，闭包内捕获拷贝 |
| 函数作用域独立性 | ✅ 每次调用独立捕获 | ✅ 每次调用独立捕获 | ✅ 每次调用独立捕获 |
| 循环作用域独立性 | ✅ `let` 每迭代新绑定 | ⚠️ 需 `int captured = i` 手动副本 | ✅ `for...in` 自然捕获不同值 |
| Lambda 体延迟执行 | ✅ 定义不执行，调用执行 | ✅ 定义不执行，调用执行 | ✅ 定义不执行，调用执行 |
| 多次调用累积状态 | ✅ 捕获变量保持状态 | ✅ 通过包装引用保持状态 | ✅ 通过 `var` 捕获保持状态 |
| 捕获语义语法简洁性 | ✅ `let y = 1; () => y++` | ⚠️ `int[] y = {1}; () -> y[0]++` | ✅ `var y = 1; { y += 1 }` |

### 关键差异详解

#### 差异 1: 捕获变量可修改性 ⭐⭐⭐

| 语言 | 代码 | 行为 |
|:----:|------|------|
| ArkTS | `let y = 1; let f = () => { y++ }` | ✅ 直接捕获并修改 |
| Java | `int y = 1; Supplier<Integer> f = () -> y++;` | ❌ compile-error（not effectively final） |
| Java 方案 | `int[] y = {1}; Supplier<Integer> f = () -> y[0]++;` | ✅ 通过数组引用间接修改 |
| Swift | `var y = 1; let f = { y += 1 }` | ✅ `var` 变量可修改捕获 |

ArkTS 和 Swift 都支持直接修改捕获的局部变量，Java 需要通过数组引用或 `AtomicInteger` 包装间接修改。

#### 差异 2: 循环捕获语法简洁性 ⭐⭐

| 语言 | 代码 | 行为 |
|:----:|------|------|
| ArkTS | `for (let i = 0; i < 5; i++) { fns.push(() => i) }` | ✅ 每迭代自然新绑定 |
| Java | `for (int i = 0; i < 5; i++) { int c = i; fns.add(() -> c); }` | ⚠️ 需 `int c = i` 手动创建最终副本 |
| Swift | `for i in 0..<5 { fns.append({ i }) }` | ✅ 每迭代自然新值 |

ArkTS 的 `let` 在 for 循环中的行为与 JavaScript 一致，自动为每轮迭代创建新的绑定。Java 需要手动创建 effectively final 的副本。Swift 的 `for...in` 自然产生不同值。

## 4. 用例 1:1 对照（关键用例的三语言代码对比）

| # | 用例 | ArkTS 代码 | Java 代码 | Swift 代码 |
|:-:|------|-----------|-----------|-----------|
| 001 | Lambda 求值不执行体 | `let f = (): int => { executed = true; return 42 }` | `Supplier<Integer> f = () -> { executed[0] = true; return 42; }` | `let f = { executed = true; return 42 }` |
| 002 | 捕获非拷贝 | `let z = 1; let x = () => { z++ }` | `int[] z = {1}; Runnable x = () -> { z[0]++; }` | `var z = 1; let x = { z += 1 }` |
| 003 | 函数作用域捕获 | `capturingFunction()` → 独立捕获 | `capturingFunction()` → 独立 AtomicInteger | `capturingFunction()` → 独立 `var v` |
| 004 | 循环作用域捕获 | `for (let i = 0;...) { storage.push(() => i) }` | `for (int i = 0;...) { int c = i; storage.add(() -> c) }` | `for i in 0..<5 { storage.append({ i }) }` |

## 5. 三环境实测结果 ⭐

| # | 用例 | ArkTS | Java | Swift |
|:-:|------|:-----:|:----:|:-----:|
| 001 | Lambda 求值不执行体 | ✅ compile-pass | ✅ | ✅ |
| 002 | 捕获非拷贝 — 语义验证 | ✅ runtime | ✅ | ✅ |
| 003 | 函数作用域捕获 — 独立性 | ✅ runtime | ✅ | ✅ |
| 004 | 循环作用域捕获 — 每迭代独立 | ✅ runtime | ✅ | ✅ |
| 005 | 多次调用累积状态 | ✅ runtime | ✅ | ✅ |

## 6. 综合评分（多维度打星）

| 维度 | ArkTS | Java | Swift |
|:----:|:-----:|:----:|:-----:|
| 捕获语义简洁性 | ⭐⭐⭐⭐⭐（直接捕获修改） | ⭐⭐⭐（需包装引用） | ⭐⭐⭐⭐⭐（var 捕获修改） |
| 函数作用域独立性 | ⭐⭐⭐⭐⭐（独立闭包实例） | ⭐⭐⭐⭐⭐（独立闭包实例） | ⭐⭐⭐⭐⭐（独立闭包实例） |
| 循环捕获自然度 | ⭐⭐⭐⭐⭐（let 自动新绑定） | ⭐⭐⭐（需手动副本） | ⭐⭐⭐⭐⭐（for-in 自然独立） |
| Lambda 体延迟执行 | ⭐⭐⭐⭐⭐（定义不执行） | ⭐⭐⭐⭐⭐（定义不执行） | ⭐⭐⭐⭐⭐（定义不执行） |
| 运行时语义正确性 | ⭐⭐⭐⭐⭐（全部通过） | ⭐⭐⭐⭐⭐（全部通过） | ⭐⭐⭐⭐⭐（全部通过） |
| 错误处理（OOM） | ⚠️ 规范定义，未实测 | ⚠️ 规范定义，未实测 | ⚠️ 规范定义，未实测 |

## 7. 核心结论

1. **三语言 Lambda 求值语义高度一致**：Lambda 表达式求值本身不执行体，产生函数类型实例，调用时体才执行。
2. **捕获语义三语言一致但语法不同**：三者都是引用捕获（非拷贝），但语法差异显著：
   - ArkTS **最简洁**：`let y = 1; () => y++`
   - Swift **同样简洁**：`var y = 1; { y += 1 }`
   - Java **需要包装**：`int[] y = {1}; () -> y[0]++`
3. **函数作用域捕获**行为一致：每次调用 capturing function 产生独立捕获变量。
4. **循环捕获**：ArkTS 与 Swift 自然支持，Java 需手动创建 effectively final 副本。
5. **全部 6 个 ETS 用例通过**，Java 和 Swift 也全部通过，无 D 类异常。

## 8. ArkTS 设计建议

1. **保持现有设计**：Lambda 运行时求值语义简洁明确，与 Swift 行为高度一致，建议维持现有设计。
2. **循环捕获语义是优势**：`let` 在 for 循环中自动每迭代新绑定，与 JavaScript 一致，对开发者友好。建议在规范中明确说明此行为。
3. **文档建议**：Spec 中的变量捕获示例已经很清晰，建议补充 "虽然 Java 要求 effectively final，但 ArkTS 允许直接修改捕获变量" 的跨语言对比说明。
4. **无改进建议**：当前设计在运行时语义方面没有明显不足，无需改动。
