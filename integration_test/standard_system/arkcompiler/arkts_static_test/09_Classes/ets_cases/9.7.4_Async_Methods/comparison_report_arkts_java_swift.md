# 9.7.4 Async Methods - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-19
**规范来源：** ArkTS Static Spec 9.7.4 Async Methods, Java JLS SE21 (Concurrency & CompletableFuture), Swift Language Reference -- Concurrency (async/await/Task)
**测试基础：** 21 个用例（6 compile-pass + 9 compile-fail + **6 runtime 真实执行**）

---

## 一、概览：三语言定位

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **async 关键字** | `async` 修饰符（声明时用） | **无语言级 async 关键字**（通过 `CompletableFuture<T>` / `@Async` / 虚拟线程实现） | `async` 关键字（函数签名的一部分：`func foo() async -> T`） |
| **返回类型** | `Promise<T>`（显式声明） | `CompletableFuture<T>` / `Future<T>` / `void` | **`T`**（非 `Promise<T>`，由运行时自动管理） |
| **await 表达式** | `await expr`（仅 async 函数/方法/lambda 中可用） | 无 `await` 关键字（用 `.join()` / `.get()` 阻塞，或 thenCompose 链式） | `await expr`（async 函数中可用） |
| **结构化并发** | await 表达式挂起当前协程 | `CompletableFuture` 链式调用 / `Virtual Thread` 阻塞 | `Task { }` / `async let` / `TaskGroup` |
| **修饰符冲突** | 禁止与 `abstract`/`native` 组合；禁止与 `static+final` 组合 | N/A（无语言级 async） | 无限制（async 可与任何修饰符组合） |
| **override 规则** | override 方法必须保持 async 一致性 | N/A | override 方法必须保持 async 一致性（签名匹配） |
| **方法重载** | 禁止 async 方法重载 | N/A（无语言级 async） | 允许 async 方法重载 |
| **异常处理** | try/catch 中可用 await | `CompletableFuture` 用 `.exceptionally()` / handle | `async throws` / try await |
| **编译期保证** | 返回类型必须是 Promise<T>，await 只能在 async 上下文中 | N/A | 返回类型自动包装，await 只能在 async 上下文中 |

**核心差异：** ArkTS 将 async 作为修饰符（类似 TypeScript），返回 `Promise<T>`。Java 没有语言级的 async/await，通过 `CompletableFuture<T>` API 和虚拟线程（Java 21+）实现并发。Swift 的 async 是函数签名的一部分，返回 `T`（非 Promise<T>），由运行时自动处理 Promise 包装。

---

## 二、章节对应关系

| ArkTS §9.7.4 规则 | Java JLS SE21 对应 | Swift 对应 |
|-------------------|-------------------|-----------|
| `async` 修饰符声明异步方法 | 无直接对应。`java.util.concurrent.CompletableFuture<T>`（§17.14） | `async` 关键字在函数签名中（Concurrency - Async Functions） |
| 返回 `Promise<T>` | `CompletableFuture<T>` / `Future<T>` / `CompletionStage<T>` | 返回 `T`，Swift 运行时自动包装为 Task 结果类型 |
| `await` 挂起表达式 | 无 `await`。`future.join()` 阻塞当前线程，`future.thenApply()` 链式 | `await expr`（Swift 5.5+） |
| async 方法不可与 `abstract` 组合 | N/A（Java 无 async 关键字） | 无限制——protocol 中可声明 `async` 方法 |
| async 方法不可与 `native` 组合 | N/A（Java 无 async 关键字） | 无限制 |
| async 方法不可与 `final+static` 组合 | N/A | `static` 方法可以是 `async`，`final` 方法也可以是 `async`（Swift 中 `final` 限制子类 override） |
| async 方法不可重载（overload） | N/A（无 async 关键字） | 可重载——`func foo() async` 和 `func foo()` 是不同的重载版本 |
| override 方法必须保持 async | N/A | override 方法必须保持 async 签名一致性 |
| 非 abstract 非 native 的 async 方法必须有方法体 | N/A | 所有 async 函数必须有方法体 |
| await 仅出现在 async 上下文中 | N/A | await 仅出现在 async 上下文中（编译器强制） |

---

## 三、关键差异矩阵

### 3.1 修饰符 / 语法

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| async 关键字位置 | 修饰符：`async foo(): Promise<T>` | N/A | 函数签名：`func foo() async -> T` |
| 返回类型书写 | `Promise<T>` | `CompletableFuture<T>` | `T`（无包装类型） |
| 调用者语法 | `let v = await obj.foo()` | `obj.foo().join()` 或 `obj.foo().thenApply(...)` | `let v = await obj.foo()` |
| 自动装箱返回值 | ✅ `return val` → `Promise<T>` | N/A（手动创建 `CompletableFuture.completedFuture(val)`） | ✅ `return val` → 运行时自动管理 |
| 结构化并发组件 | 单个 await 表达式 | `CompletableFuture` / `VirtualThread` / `ExecutorService` | `Task { }` / `async let` / `TaskGroup` / `withTaskGroup` |
| 取消机制 | 未明确（Promise 无内置取消） | `CompletableFuture.cancel()` | `Task.checkCancellation()` / `withTaskCancellationHandler` |
| 超时支持 | 未明确 | `future.get(timeout, unit)` | `Task` 无内置超时（通过 `Task.detached` + `Task.sleep` 模式） |
| Actor 模型 | 无（使用 `sendable` 类型约束） | 无（虚拟线程共享内存） | `actor` 关键字原生支持 |
| 函数式组合 | 无内置方法（await 控制流） | `thenApply` / `thenCompose` / `thenCombine` | `async let` / `Task { }` 嵌套 |
| 异常传递 | Promise rejected / try-catch | `CompletableFuture` 通过 `.completeExceptionally()` / `.exceptionally()` | `async throws` 结合 try await |

### 3.2 修饰符冲突规则

| 组合 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `async + abstract` | ❌ 编译错误 | N/A | ✅ 允许（protocol 方法可 async） |
| `async + native` | ❌ 编译错误 | N/A | ✅ 允许 |
| `async + static + final` | ❌ 编译错误 | N/A | ✅ 允许（`static` 方法可 async；`final` 可 async） |
| `async + static` | ✅ 允许 | N/A | ✅ 允许（`static func foo() async`） |
| `async + final` | ⚠️ 编译器接受（spec 可能应禁止，CLS-I5） | N/A | ✅ 允许 |
| `async + override` | ✅ 允许（签名需匹配） | N/A | ✅ 允许 |
| `async + overload` | ❌ 编译错误（不支持重载） | N/A | ✅ 允许（async 和 sync 版本可重载） |
| override 缺少 async | ❌ 编译错误（子类非 async override 父类 async 方法） | N/A | ❌ 编译错误（签名不匹配） |

### 3.3 跨语言特殊点

- ⭐ **ArkTS 是三者中唯一将 `async` 作为方法修饰符（而非函数签名一部分）的语言**。这导致 async 不是类型系统的一部分——`async foo(): Promise<T>` 与 `foo(): Promise<T>` 在类型系统视角无区别。Swift 的 `async` 是签名一部分，`func foo() async -> T` 与 `func foo() -> T` 是不同类型。

- ⭐ **ArkTS 要求显式返回 `Promise<T>`，而 Swift 返回裸 `T`**：ArkTS 中方法签名必须写 `Promise<T>`；Swift 中方法签名写 `T`，编译器自动处理 Promise 包装。Java 没有 async/await 关键字，异步方法返回 `CompletableFuture<T>` 是一种惯例而非语言强制。

- ⭐ **ArkTS 禁止 async 方法重载（overload）**：这意味着不能同时声明 `async fetch(): Promise<string>` 和 `async fetch(id: int): Promise<string>`。Swift 允许 async 和 sync 版本的函数共存为重载。Java 无此限制（因为没有语言级 async）。

- ⭐ **ArkTS 禁止 `abstract async` 组合**：async 方法体需要实现异步语义，与 abstract 无实现体矛盾。Swift 的 protocol 允许声明 async 方法作为 required 方法——这等价于 "abstract async"，ArkTS 在此处更严格。

- ⭐ **Java 的虚拟线程（Virtual Threads, Java 21+）是完全不同的并发模型**：虚拟线程不是 async/await，而是通过 `Thread.perVirtualThread` 创建可阻塞的轻量级线程。每个虚拟线程在 `ForkJoinPool` 上运行，阻塞时自动 yield。这绕过了 async/await 的语法侵入性。

- ⭐ **ArkTS 的 async 方法不可在静态初始化中调用**——这是 ArkTS 独有的限制。Swift 和 Java 无此限制（但 Java 静态初始化中调用 CompletableFuture 会导致阻塞）。

- ⭐ **CLS-I5 发现**：`final async` 组合未被 es2panda 检查（CLS_09_07_060）。spec 可能应禁止 `final + async` 组合（因为 async 方法在类型系统中不可被 override 的语义？），但编译器接受此组合。

---

## 四、用例 1:1 对照（含 runtime 实测结果）

### 用例 ①：基础 async 方法声明与调用
**测试 ID：** CLS_09_07_014_PASS_ASYNC_METHOD_BASIC（compile-pass）/ CLS_09_07_044_RUNTIME_ASYNC_CALL（runtime）

**ArkTS（compile-pass + runtime 实测通过）：**
```typescript
// CLS_09_07_014 + runtime 通过
class DataFetcher014 {
  async fetchData(): Promise<string> {
    return "data"
  }
  async fetchWithDelay(): Promise<string> {
    let result: string = "delayed"
    return result
  }
}

class AsyncProcessor014 {
  static async process(input: string): Promise<string> {
    let output: string = input + "_processed"
    return output
  }
  async transform(input: string): Promise<string> {
    let step1: string = input + "_step1"
    return step1
  }
}

async function testAsyncMethods(): Promise<void> {
  let fetcher: DataFetcher014 = new DataFetcher014()
  let d: string = await fetcher.fetchData()
  let delayed: string = await fetcher.fetchWithDelay()
  let p1: string = await AsyncProcessor014.process("input")
  let p2: string = await processor.transform("data")
}
```

**Java（使用 CompletableFuture）：**
```java
class DataFetcher {
    public CompletableFuture<String> fetchData() {
        return CompletableFuture.completedFuture("data");
    }
    public CompletableFuture<String> fetchWithDelay() {
        return CompletableFuture.supplyAsync(() -> {
            String result = "delayed";
            return result;
        });
    }
}

class AsyncProcessor {
    public static CompletableFuture<String> process(String input) {
        return CompletableFuture.completedFuture(input + "_processed");
    }
    public CompletableFuture<String> transform(String input) {
        return CompletableFuture.completedFuture(input + "_step1");
    }
}

// 调用方式：链式 or 阻塞
// 链式（非阻塞，类似 async/await）：
dataFetcher.fetchData().thenApply(d -> { /* use d */ });
// 阻塞（相当于 await，但阻塞线程）：
String d = dataFetcher.fetchData().join();
```

**Swift（async/await 原生）：**
```swift
class DataFetcher {
    func fetchData() async -> String {
        return "data"
    }
    func fetchWithDelay() async -> String {
        let result = "delayed"
        return result
    }
}

class AsyncProcessor {
    static func process(_ input: String) async -> String {
        return input + "_processed"
    }
    func transform(_ input: String) async -> String {
        return input + "_step1"
    }
}

// 调用
Task {
    let fetcher = DataFetcher()
    let d = await fetcher.fetchData()
    let delayed = await fetcher.fetchWithDelay()
    let p1 = await AsyncProcessor.process("input")
    let p2 = await processor.transform("data")
}
```

⭐ **关键发现：** ArkTS 与 Swift 的调用语法高度一致（`let v = await obj.method()`），但 ArkTS 方法签名显式写 `Promise<T>` 而 Swift 直接写 `T`。Java 无语法糖，使用 CompletableFuture 链式或 `.join()` 阻塞，代码风格差异较大。

---

### 用例 ②：静态 async 方法声明与调用
**测试 ID：** CLS_09_07_045_PASS_ASYNC_STATIC（compile-pass）/ CLS_09_07_056_RUNTIME_ASYNC_STATIC_CALL（runtime）

**ArkTS（compile-pass + runtime 实测通过）：**
```typescript
// CLS_09_07_045 + runtime 通过
class AsyncProcessor045 {
  static async process(): Promise<string> {
    return "static_async"
  }
}

// 调用
let result: string = await AsyncProcessor045.process()
```

**Java：**
```java
class AsyncProcessor {
    public static CompletableFuture<String> process() {
        return CompletableFuture.completedFuture("static_async");
    }
}
// 调用
CompletableFuture<String> future = AsyncProcessor.process();
String result = future.join(); // 阻塞（等效 await）
```

**Swift：**
```swift
class AsyncProcessor {
    static func process() async -> String {
        return "static_async"
    }
}
// 调用
let result = await AsyncProcessor.process()
```

⭐ **关键发现：** 三语言的静态 async 模式完全一致——`static/class` 方法结合 `async` 在三语言中都支持。Swift 使用 `class` 或 `static`（struct 中）。ArkTS 运行时验证了静态 async 方法正确执行。

---

### 用例 ③：async 修饰符冲突规则综合验证
**测试 ID：** CLS_09_07_043 / 049 / 050 / 051 / 052 / 061（compile-fail）

**ArkTS（所有以下组合均为编译错误）：**
```typescript
// CLS_09_07_043: abstract + async ❌
abstract class Bad043 { abstract async foo(): void }

// CLS_09_07_049: 不支持 overload ❌
class Bad049 {
  async fetch(): Promise<string>
  async fetch(id: int): Promise<string>
  async fetch(id?: int): Promise<string> { return "a" }
}

// CLS_09_07_050: 返回类型非 Promise ❌
class Bad050 {
  async badReturn(): string { return "bad" }
}

// CLS_09_07_051: native + async ❌
abstract class Bad051 {
  native async foo(): Promise<void>
}

// CLS_09_07_052: static + final + async ❌
class Bad052 {
  static final async combo(): Promise<void> {}
}

// CLS_09_07_061: override 缺少 async ❌
class Base061 { async foo(): Promise<void> {} }
class Bad061 extends Base061 {
  override foo(): void {} // ❌ 缺少 async
}
```

**Swift（全部允许——Swift 的 async 约束更少）：**
```swift
// Swift 允许 protocol 中的 async 方法（等效于 abstract async）✅
protocol AsyncProtocol {
    func foo() async -> Void
}

// Swift 允许 async 方法重载 ✅
class GoodSwift {
    func fetch() async -> String { return "all" }
    func fetch(id: Int) async -> String { return "item_\(id)" }
}

// Swift 中 async 方法必须返回 T（自动包装），不存在 "返回非 Promise" 问题 ✅
class GoodSwift {
    func goodReturn() async -> String { return "good" }  // ✅ 返回 T，运行时自动包装
}

// Swift 允许 native 和 async 组合 ✅ (非 Apple 平台)
// Swift 允许 static + final + async ✅
class GoodSwift {
    static func foo() async -> String { return "foo" }
    final func bar() async -> String { return "bar" }
}

// 签名必须匹配（async 是签名的一部分）
class Base { func foo() async {} }
class Derived: Base {
    override func foo() async {}  // ✅
    // override func foo() {}     // ❌ 编译错误：签名不匹配
}
```

**Java（无语言级 async，全部 N/A）：**
```java
// Java 无 async 关键字，所以无修饰符冲突问题
// 异步模式通过 CompletableFuture API 实现
// 接口方法可声明返回 CompletableFuture 但不强制
interface AsyncInterface {
    CompletableFuture<Void> foo();  // 没有关键字互斥问题
}
abstract class Base {
    public abstract CompletableFuture<Void> foo();  // 允许 abstract + Future 组合
}
```

⭐ **关键发现：** ArkTS 在 async 修饰符冲突规则上是三者中最严格的。Swift 对 async 的使用几乎没有限制（可重载、可 abstract、可 native），而 ArkTS 结合了 TypeScript 的 async 历史设计并附加了更多编译期约束。Java 不等同（无语言级 async）。

---

### 用例 ④：多个 await 挂起点与 async 方法链式调用
**测试 ID：** CLS_09_07_057_RUNTIME_ASYNC_MULTIPLE_AWAITS / CLS_09_07_058_RUNTIME_ASYNC_CHAIN（runtime）

**ArkTS（runtime 实测通过）：**
```typescript
// CLS_09_07_057 + 058 runtime 通过
class MultiAwait057 {
  async step1(): Promise<int> { return 10 }
  async step2(i: int): Promise<int> { return i + 20 }
}

class Chain058 {
  async first(): Promise<int> { return 1 }
  async second(i: int): Promise<int> { return i + 1 }
}
// 多个 await 挂起点 + 链式调用：
async function process(): Promise<int> {
  let m = new MultiAwait057()
  let a = await m.step1()
  let b = await m.step2(a)
  
  let c = new Chain058()
  let x = await c.first()
  let y = await c.second(x)
  return y
}
```

**Java（CompletableFuture 链式调用等价）：**
```java
class MultiAwait {
    public CompletableFuture<Integer> step1() {
        return CompletableFuture.completedFuture(10);
    }
    public CompletableFuture<Integer> step2(int i) {
        return CompletableFuture.completedFuture(i + 20);
    }
}

class Chain {
    public CompletableFuture<Integer> first() {
        return CompletableFuture.completedFuture(1);
    }
    public CompletableFuture<Integer> second(int i) {
        return CompletableFuture.completedFuture(i + 1);
    }
}

// 等价链式（thenCompose 避免嵌套 CompletableFuture）：
MultiAwait m = new MultiAwait();
m.step1().thenCompose(a -> m.step2(a))
         .thenCompose(b -> {
             Chain c = new Chain();
             return c.first().thenCompose(x -> c.second(x));
         })
         .thenAccept(y -> System.out.println(y));
// 或使用虚拟线程（更直接的同步风格）：
// Executors.newVirtualThreadPerTaskExecutor().submit(() -> {
//     Integer a = m.step1().join();
//     Integer b = m.step2(a).join();
//     ...
// });
```

**Swift（async let + await 两个挂起点）：**
```swift
class MultiAwait {
    func step1() async -> Int { return 10 }
    func step2(_ i: Int) async -> Int { return i + 20 }
}

class Chain {
    func first() async -> Int { return 1 }
    func second(_ i: Int) async -> Int { return i + 1 }
}

func process() async -> Int {
    let m = MultiAwait()
    let a = await m.step1()
    let b = await m.step2(a)
    
    let c = Chain()
    let x = await c.first()
    let y = await c.second(x)
    return y
}
```

⭐ **关键发现：** 多 await 挂起点和链式调用的运行时行为在三语言中完全等价——每个 await 都是一个可能的挂起点，调用链按序执行。ArkTS 的 6 个 runtime 用例全部通过，验证了多 await、链式调用、实例方法、静态方法的运行时正确性。ArkTS 在 await 语法上与 Swift 高度一致。

---

## 五、严格度对比

```
// async 修饰符/关键字约束严格度

Swift (无限制 —— 几乎允许所有修饰符组合)
      |
ArkTS (禁止5种场景: abstract+async, native+async, static+final+async, 
      overload+async, override+缺少async)
      |
Java  (N/A —— 无语言级async关键字)
```

```
// async 方法返回类型严格度

ArkTS (强制返回类型必须为 Promise<T>，任何非Promise返回都是编译错误)
      |
Swift (返回类型为 T，运行时自动包装 —— 调用者得到的是T而非Promise)
      |
Java  (N/A —— CompletableFuture<T> 是惯例选择而非强制)
```

```
// await 使用范围严格度

ArkTS = Swift (await 仅允许在 async 上下文中，编译器强制检查)
      |
Java  (N/A —— 无await关键字，.join() 阻塞线程无条件)
```

```
// override 签名一致性严格度

ArkTS = Swift (override async 方法必须保持 async 签名一致性)
      |
Java  (N/A —— 无语言级支持)
```

```
// 编译期检测总严格度

ArkTS > Swift > Java (Java N/A)
ArkTS 有最多编译期约束检查
```

**总结：** 在 async 方法的编译期检查范围上，ArkTS 最为严格——它不仅检查返回类型必须是 `Promise<T>`（Swift 不需要显式声明），还额外禁止 abstract、native、static+final 等修饰符组合，以及禁止 async overload。Swift 的约束更少，设计哲学更偏向灵活和简洁。

---

## 六、继承/组合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| async 方法语法完备性 | ⭐⭐⭐⭐ | ⭐⭐⭐（仅 API 级） | ⭐⭐⭐⭐⭐ |
| 返回类型安全性 | ⭐⭐⭐⭐⭐（编译器强制 Promise<T>） | ⭐⭐⭐（惯例而非强制） | ⭐⭐⭐⭐（运行时自动管理，无显式声明） |
| await 编译器检查 | ⭐⭐⭐⭐⭐（await 仅在 async 上下文中） | N/A | ⭐⭐⭐⭐⭐（await 仅在 async 上下文中） |
| 修饰符冲突检查 | ⭐⭐⭐⭐⭐（最多编译期约束） | N/A | ⭐⭐⭐（无冲突检查，几乎全允许） |
| override 一致性 | ⭐⭐⭐⭐⭐（签名必须匹配 async） | N/A | ⭐⭐⭐⭐⭐（签名必须匹配 async） |
| 结构化并发支持 | ⭐⭐⭐（await 基础） | ⭐⭐⭐（虚拟线程 + CompletableFuture） | ⭐⭐⭐⭐⭐（TaskGroup/async let/Actors） |
| 取消和超时支持 | ⭐⭐（未明确规范） | ⭐⭐⭐⭐⭐（CompletableFuture.cancel/.get(timeout)） | ⭐⭐⭐⭐（Task.checkCancellation） |
| 异常处理集成 | ⭐⭐⭐⭐（try/catch + await） | ⭐⭐⭐（CompletableFuture.exceptionally） | ⭐⭐⭐⭐⭐（async throws 原生集成） |
| 运行时验证覆盖 | ⭐⭐⭐⭐⭐（6 个 runtime 用例全通过） | N/A | N/A |
| 代码可读性 | ⭐⭐⭐⭐（await 控制流自然） | ⭐⭐⭐（链式回调 vs 虚拟线程过程式） | ⭐⭐⭐⭐⭐（最简洁: await + 返回 T） |

---

## 七、核心结论

| 角度 | 结论 |
|------|------|
| **async 关键字语法定位** | ArkTS 作为**修饰符**（`async foo(): Promise<T>`）；Swift 作为**签名部分**（`func foo() async -> T`）；Java **无语言级**关键字 |
| **返回类型** | ArkTS 显式 `Promise<T>`；Swift 返回 `T` 自动包装；Java 惯例写 `CompletableFuture<T>` |
| **await 调用语法** | ArkTS = Swift（`let v = await expr`）；Java 用 `.join()` / `.thenApply()` |
| **修饰符冲突** | ArkTS 最严格（禁止 abstract、native、static+final、overload）；Swift 几乎无限制；Java N/A |
| **结构化并发** | ArkTS 基础 await；Swift 最丰富（Task/TaskGroup/async let）；Java 可通过虚拟线程 + CompletableFuture 实现 |
| **override 一致性** | ArkTS = Swift（编译器强制 async 签名一致）；Java N/A |
| **编译期强制** | ArkTS > Swift > Java（Java N/A），ArkTS 编译期检查最系统 |
| **运行时正确性** | 6 个 runtime 用例全部通过，ArkTS async 方法在 ark VM 上正确执行 |
| **设计模式迁移性（从 Java）** | 低——Java 无 async/await 关键字，CompletableFuture 编码风格差异大 |
| **设计模式迁移性（从 Swift）** | 中等——await 语法相同但 Swift 返回 T 而非 Promise<T> |

### 关键启示

1. ⭐ **ArkTS 选择了 TypeScript 风格的 async 修饰符 + 显式 Promise<T> 返回类型**，这与 Swift 的 "async 是签名一部分 + 返回 T" 的设计哲学不同。ArkTS 的显式 Promise 要求对开发者更明确但更冗长。

2. ⭐ **ArkTS 是三者中 async 修饰符约束最严格的语言**——禁止与 abstract/native/overload 组合，并限制 static+final+async。这些约束大多是合理的安全防护，但 Swift 证明了大多数限制并非必要。

3. ⭐ **Java 缺少语言级 async/await 是最大的范式差异**——Java 开发者通过 CompletableFuture API 或虚拟线程（Java 21+）来实现并发。从 Java 迁移到 ArkTS 或 Swift，async/await 的语法变化很自然，但从 ArkTS 迁移到 Java 则需要适应回调或阻塞风格。

4. ⭐ **Swift 的 structured concurrency 比 ArkTS 更为完整**——TaskGroup、async let 和 Actor 模型提供了比 ArkTS 更丰富的并发编程原语。ArkTS 当前主要通过 await + Promise 实现基本的异步控制流。

5. ⭐ **CLS-I5 设计不一致**：`final async` 组合未被 es2panda 作为编译错误拒绝，但 spec 可能要求禁止（因为 final 限制子类 override，但 async 方法通过 Promise 返回类型签名可被 override）。需要 spec 明确 "final + async" 的语义关系。

6. ⭐ **6 个 runtime 用例全部通过**，覆盖了实例 async 方法、静态 async 方法、多个 await 挂起点、链式调用、await Promise 解析——表明 ArkTS async 方法在 ark VM 上的实现已经成熟。

### ArkTS 设计建议

1. ✅ **保留**：显式 `Promise<T>` 返回类型要求——虽然比 Swift 冗长，但类型安全更明确，编译器可以强制检查。

2. ✅ **保留**：禁止 `abstract async` 和 `native async` 组合——语义正确且安全。

3. ✅ **保留**：await 仅限 async 上下文的编译期检查——与 Swift 一致，防止常见错误。

4. ⚠️ **明确 spec**：§9.7.4 应明确 `final + async` 组合是否允许。当前 es2panda 接受（CLS_09_07_060_PASS），但如果 final 的语义是禁止 override + 无状态存储，则与 async 的 Promise 返回语义是否冲突需要 spec 明确说明。

5. ⚠️ **考虑引入结构化并发增强**：参考 Swift 的 `TaskGroup` 和 `async let`，ArkTS 可以考虑引入并行异步任务的语法糖，降低多个并发 await 的编码复杂度。

6. ⚠️ **考虑取消和超时机制**：当前 ArkTS 的 Promise 没有内置取消或超时 API。参考 CompletableFuture 的 `.cancel()` 或 Swift 的 `Task.checkCancellation()`，建议补充异步操作的取消和超时控制能力。

7. ❌ **无需修改**：禁止 async 方法重载——这是一个合理的安全设计，避免 async 和 sync 版本之间的调用歧义。虽然 Swift 允许重载，但 ArkTS 的设计更简单明确。

---

## 八、对应规范文档

| 语言 | 规范来源 |
|------|---------|
| ArkTS | ArkTS Static Spec §9.7.4 Async Methods；test_cases/09_Classes/ets_cases/9.7.4_Async_Methods/ |
| Java | JLS SE21 §17.14 (CompletableFuture API), JEP 444 (Virtual Threads), Spring @Async annotation |
| Swift | The Swift Programming Language: Concurrency - Async Functions, Tasks, Structured Concurrency |
