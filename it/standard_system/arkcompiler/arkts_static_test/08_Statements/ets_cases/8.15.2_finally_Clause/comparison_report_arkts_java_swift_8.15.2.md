# 8.15.2 finally 子句 - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-18
**规范来源：** ArkTS Static Spec §8.15.2, Java JLS SE21 §14, Swift 5.x Language Guide

---

## 一、概览：三语言定位

ArkTS §8.15.2 定义了 finally 子句：

- **语法：** `finally` 后跟一个代码块
- **语义：** finally 块**始终**执行，无论 try 块是正常完成还是异常完成
- **保证：** 即使在 try/catch 块中遇到 `return` 语句或新的 `throw`，finally 也会执行
- **用途：** 资源管理（关闭文件、刷新缓冲区、释放锁）

| 语言 | 定位 | 设计哲学 |
|------|------|----------|
| ArkTS | `finally` 块，结构上依附于 try | 手动清理，Java 语义的忠实复刻，受约束环境下的简洁设计 |
| Java | `finally` 块 + `try-with-resources`（JLS 14.20.3） | 成熟的资源管理生态，编译器强制自动清理 `AutoCloseable` |
| Swift | `defer` 语句，自由放置在作用域内任意位置 | 通用作用域退出钩子，灵活但需要程序员自律，LIFO 执行顺序 |

---

## 二、章节对应关系

| ArkTS 概念 | Java 对应 (JLS SE21) | Swift 对应 (5.x) |
|-----------------------------|--------------------------------------|-----------------------------------|
| Finally 关键字 | `finally` | `defer`（不同机制） |
| 结构位置 | 在 try/catch 块之后 | 在 try/catch 块之后 | 作用域内任意位置 |
| 执行保证 | 总是（正常 + 异常） | 总是（正常 + 异常） | 总是在作用域退出时 |
| return 之后执行 | 是（方法返回之前） | 是（方法返回之前） | 是（defer 在作用域退出时运行） |
| throw 之后执行 | 是（错误传播之前） | 是（异常传播之前） | 是（错误传播之前） |
| try-with-resources | 不支持 | 支持（JLS 14.20.3） | 不直接支持（defer 覆盖此场景） |
| 嵌套 finally | 支持 | 支持 | 支持（多个 defer，LIFO） |
| 手动清理 | 必需 | 必需（或用 try-with-resources） | defer 常用于此 |

---

## 三、关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|----------------------------------|----------------------------------|---------------------------------------------|----------------------------------|
| **清理机制** | `finally` 块 | `finally` 块 / `try-with-resources` | `defer` 语句 |
| **自动资源管理** | 不支持 | `try-with-resources`（JLS 14.20.3） | `defer` 惯用法 |
| **结构依附性** | 绑定于 try | 绑定于 try | 作用域内自由放置 |
| **执行顺序** | try/catch 后单个 finally | try/catch 后单个 finally | 多个 defer：LIFO 顺序 |
| **返回值交互** | 返回值在 finally 运行前保存 | 返回值在 finally 运行前保存 | 相同（defer 运行，值已捕获） |
| **finally 中 throw** | 允许（覆盖先前的异常） | 允许（抑制先前的异常） | 允许（defer 可以 throw） |
| **编译时约束** | 与普通块相同：无局部类、无嵌套函数 | 约束较少 | 约束较少 |

---

## 四、用例 1:1 对照

### 用例 ① 基本 try-catch-finally（finally 始终执行）

**ArkTS:**
```typescript
// STMT_08_15_2_001_PASS_basic_finally / STMT_08_15_2_009_RUNTIME_finally_executes
function testBasicFinally(): void {
    let result: number = 0;
    try {
        result = 1;
    } catch (e: Error) {
        result = 2;
    } finally {
        result = 3;
    }
    // result == 3 -- finally executed after try
}
```

**Java (JLS SE21 14.20.2):**
```java
void testBasicFinally() {
    int result = 0;
    try {
        result = 1;
    } catch (Exception e) {
        result = 2;
    } finally {
        result = 3;
    }
    // result == 3 -- finally executed after try
}
```

**Swift (5.x):**
```swift
func testBasicFinally() {
    var result = 0
    do {
        result = 1
    } catch {
        result = 2
    }
    defer { result = 3 }  // runs at scope exit
    // result == 3 -- defer executed at scope exit
}
```

**关键差异：**
- ArkTS 和 Java 在结构上完全一致：`finally` 语法上依附于 `try`，保证在 try/catch 块完成后执行。
- Swift 的 `defer` **不在结构上依附**于 `try`。它可以放置在作用域的任何位置，并在作用域退出时运行。这更灵活，但导致阅读顺序与执行顺序不一致（defer 写在底部，但在概念上注册了在作用域退出时运行的清理逻辑）。
- **ArkTS == Java** 在 finally 语义上完全一致。**Swift 不同**（defer 不是 try 语句的组成部分）。

---

### 用例 ② finally 在 return 之后执行

**ArkTS:**
```typescript
// STMT_08_15_2_003_PASS_finally_after_return / STMT_08_15_2_010_RUNTIME_finally_with_return
function testReturnInTry(): number {
    let localFlag: number = 0;
    try {
        localFlag = 1;
        return localFlag;  // saves value 1
    } finally {
        localFlag = 2;     // runs, but does not change the saved return value
    }
}

// The function returns 1, not 2.
// localFlag is 2 after finally executes, but the return value was saved before.
```

**Java (JLS SE21 14.20.2):**
```java
int testReturnInTry() {
    int localFlag = 0;
    try {
        localFlag = 1;
        return localFlag;  // saves value 1
    } finally {
        localFlag = 2;     // runs, return value already saved
    }
}
// Returns 1, same behavior as ArkTS
```

**Swift (5.x):**
```swift
func testReturnInTry() -> Int {
    var localFlag = 0
    defer { localFlag = 2 }  // runs at scope exit
    localFlag = 1
    return localFlag  // returns 1
}
// Returns 1, same behavior
```

**关键差异：**
- 三种语言都保留 try 块中的返回值；finally/defer 修改的是局部变量，但实际返回的是已经保存的返回值。
- 在 ArkTS 和 Java 中，`finally` 块**在语法上位于 return 语句之后**——try 中的 return 在实际返回之前将控制权"转移"给 finally。
- 在 Swift 中，`defer` 可以写在 return 语句**之前**（或任何位置），阅读者必须进行心理重排序才能理解其执行时机。
- **ArkTS == Java == Swift**（都返回在清理运行之前保存的值）。然而，ArkTS 和 Java 使执行顺序显式化；Swift 将其隐藏在 defer 机制背后。

---

### 用例 ③ finally 在 catch 中重新抛出错误时执行

**ArkTS:**
```typescript
// STMT_08_15_2_011_RUNTIME_finally_with_error
function main(): void {
    let finallyExecuted: boolean = false;
    let caughtOuter: boolean = false;
    try {
        try {
            throw new Error("inner error");
        } catch (e: Error) {
            throw new Error("new error from catch");  // re-throw
        } finally {
            finallyExecuted = true;  // executes before the new error propagates
        }
    } catch (e: Error) {
        caughtOuter = true;          // catches the re-thrown error
    }
    // finallyExecuted == true, caughtOuter == true
}
```

**Java (JLS SE21 14.20.2):**
```java
void main() {
    boolean finallyExecuted = false;
    boolean caughtOuter = false;
    try {
        try {
            throw new Exception("inner error");
        } catch (Exception e) {
            throw new Exception("new error from catch");
        } finally {
            finallyExecuted = true;  // executes before propagation
        }
    } catch (Exception e) {
        caughtOuter = true;
    }
    // finallyExecuted == true, caughtOuter == true
}
```

**Swift (5.x):**
```swift
func main() {
    var finallyExecuted = false
    var caughtOuter = false
    do {
        do {
            throw NSError(domain: "test", code: 1,
                          userInfo: [NSLocalizedDescriptionKey: "inner error"])
        } catch {
            throw NSError(domain: "test", code: 2,
                          userInfo: [NSLocalizedDescriptionKey: "new error from catch"])
        }
        defer { finallyExecuted = true }  // must be placed before catch's throw to run
    } catch {
        caughtOuter = true
    }
}
```

**关键差异：**
- ArkTS 和 Java：内层 `finally` 在 catch 中抛出的新错误传播到外层 `catch` **之前**执行。这是标准的 try-catch-finally 语义。
- Swift：由于 `defer` 在结构上不依附于 `do-catch`，程序员必须将 `defer` 放在 `catch` 块的 `throw` **之前**才能确保其运行。如果 `defer` 放在 throw 之后，则始终不执行。
- **ArkTS == Java**（finally 保证在结构上强制执行）。**Swift 需要仔细放置** defer，这是一个潜在的 bug 来源。
- **ArkTS 优势：** 不存在此类放置风险——finally 始终运行。

---

### 用例 ④ try-finally 无 catch（资源管理模式）

**ArkTS:**
```typescript
// STMT_08_15_2_004_PASS_finally_no_catch
function testFinallyNoCatch(): void {
    let idx: number = 0;
    try {
        idx = 10;
    } finally {
        idx = idx + 1;  // cleanup: always runs
    }
    // idx == 11
}
```

**Java (JLS SE21 14.20.2):**
```java
void testFinallyNoCatch() {
    int idx = 0;
    try {
        idx = 10;
    } finally {
        idx = idx + 1;
    }
    // idx == 11
}
```

**Swift (5.x):**
```swift
func testFinallyNoCatch() {
    var idx = 0
    defer { idx = idx + 1 }  // runs at scope exit
    idx = 10
    // idx == 11 after defer runs
}
```

**关键差异：**
- `try-finally`（无 catch）模式用于操作可能抛出异常但无论结果如何都必须执行清理的场景。ArkTS 和 Java 使用此惯用法的方式完全相同。
- 在 Java 中，此模式已大量被 `try-with-resources`（JLS 14.20.3）取代，用于 `AutoCloseable` 资源。
- Swift 偏好使用 `defer` 处理所有清理，使 try-finally-less 模式更加自然。
- **ArkTS：** 不存在等效的 try-with-resources 机制，因此手动 try-finally 清理是惯用做法，如规范所推荐。

---

### 用例 ⑤ 嵌套 finally 块

**ArkTS:**
```typescript
// STMT_08_15_2_005_PASS_finally_nested
function testNestedFinally(): void {
    let outerResult: number = 0;
    let innerResult: number = 0;
    try {
        try {
            innerResult = 1;
        } catch (e: Error) {
            innerResult = 2;
        } finally {
            innerResult = 3;   // inner finally: innerResult == 3
        }
        outerResult = 10;
    } finally {
        outerResult = outerResult + innerResult;  // outerResult = 10 + 3 = 13
    }
    // innerResult == 3, outerResult == 13
}
```

**Java (JLS SE21 14.20.2):**
```java
void testNestedFinally() {
    int outerResult = 0;
    int innerResult = 0;
    try {
        try {
            innerResult = 1;
        } catch (Exception e) {
            innerResult = 2;
        } finally {
            innerResult = 3;
        }
        outerResult = 10;
    } finally {
        outerResult = outerResult + innerResult;  // 10 + 3 = 13
    }
}
```

**Swift (5.x):**
```swift
func testNestedFinally() {
    var outerResult = 0
    var innerResult = 0
    defer { outerResult = outerResult + innerResult }
    do {
        defer { innerResult = 3 }
        innerResult = 1
        outerResult = 10
    } catch {
        innerResult = 2
    }
    // innerResult == 3, outerResult == 13
}
```

**关键差异：**
- ArkTS 和 Java 使用结构上嵌套的 try-finally，使执行顺序显式化：内层 finally 先运行，然后是外层 finally。
- Swift 使用多个 `defer` 语句。同一作用域内的多个 defer 按 **LIFO 顺序**执行（最后注册的最先运行）。然而，不同作用域（内层 do 与外层函数）中的 defer 自然遵循作用域退出顺序——内层作用域的 defer 先于外层作用域的 defer 运行。
- **ArkTS == Java**（嵌套 try-finally 清晰且显式）。**Swift** 达到相同的结果，但执行顺序取决于作用域嵌套和 defer 放置，阅读者可能不太容易理解。

---

### 用例 ⑥ 编译失败测试——finally 块中的受限构造

**ArkTS (compile-fail):**
```typescript
// STMT_08_15_2_006_FAIL_finally_reserved_word
function testFinallyReservedWord(): void {
    try {
        let x: number = 1;
    } finally {
        let string: number = 0;  // Error: reserved word used as identifier
    }
}

// STMT_08_15_2_007_FAIL_finally_local_class
function testFinallyLocalClass(): void {
    try {
        let x: number = 1;
    } finally {
        class LocalData {          // Error: no local class in ArkTS
            value: number = 0;
        }
    }
}

// STMT_08_15_2_008_FAIL_finally_nested_func
function testFinallyNestedFunc(): void {
    try {
        let x: number = 1;
    } finally {
        function helper(): void {   // Error: no nested function in ArkTS
            console.log("nested");
        }
    }
}
```

**Java (JLS SE21 14.20.2) -- 全部合法:**
```java
void testFinallyRestrictions() {
    try {
        int x = 1;
    } finally {
        int string = 0;              // OK: 'string' is not reserved in Java
        class LocalData {            // OK: local class is allowed in Java
            int value = 0;
        }
        // Nested method not possible in Java (methods only at class level)
    }
}
```

**Swift (5.x) -- 全部合法:**
```swift
func testFinallyRestrictions() {
    defer {
        let string = 0               // OK: 'string' is not reserved
        class LocalData {}           // OK: Swift allows nested types
        func helper() { print("nested") }  // OK: Swift allows nested functions
    }
}
```

**关键差异：**
- ArkTS 对 finally 块（以及所有块）中的代码施加**额外的编译时限制**：禁止使用保留关键字作为标识符，禁止局部类，禁止嵌套函数。这些是 ArkTS 的全局约束，并非 finally 特有。
- Java 和 Swift 在 finally/defer 块中允许所有这些构造。
- **ArkTS 限制更严格。** 这是有意为之的设计：ArkTS 通过在所有位置（无论是 finally 块还是其余块）消除嵌套类和嵌套函数来简化语言。

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|----------------------------------|-------|------|-------|
| 语义清晰度 | 5/5 | 5/5 | 4/5（defer 放置可能引起混淆） |
| 执行保证 | 5/5 | 5/5 | 4/5（defer 必须正确放置） |
| 资源管理便利性 | 3/5 | 5/5（try-with-resources） | 4/5（defer 模式） |
| 返回值交互 | 5/5 | 5/5 | 5/5 |
| 错误传播交互 | 5/5 | 5/5 | 4/5（defer 排序） |
| 编译时安全性 | 4/5 | 4/5 | 3/5（无结构保证） |
| 可读性（清理位置） | 5/5 | 5/5 | 3/5（defer 阅读顺序不等于执行顺序） |
| **总计** | **32/35** | **34/35** | **27/35** |

---

## 六、核心结论

| 视角 | 结论 |
|---------------------------------|------------------------------------------------------------------|
| **finally 语义** | ArkTS == Java（行为完全一致） |
| **defer vs finally** | ArkTS = Java > Swift（finally 更可预测） |
| **资源管理** | Java > Swift > ArkTS（try-with-resources 是黄金标准） |
| **编译时限制** | ArkTS 最严格（有意为之——无局部类/函数） |
| **return + finally 交互** | ArkTS == Java == Swift（都保留已保存的返回值） |

### 关键要点

1. **ArkTS 的 finally 是对 Java finally 语义的忠实复刻。** 在行为上没有任何偏差。这是有意为之且执行良好的设计。来自 Java（或 C++、C# 等）的开发者不会有任何意外。

2. **Swift 的 `defer` 本质上是不同的。** 它是一种通用的作用域退出钩子，而非 try 语句的组成部分。虽然它可以复现所有的 finally 用例，但需要程序员更多的自律（正确放置、理解 LIFO 排序）。Swift 的方法提供了更多灵活性，但牺牲了结构清晰度。

3. **ArkTS 的主要局限是缺少自动资源管理。** Java 的 `try-with-resources`（JLS 14.20.3）为 `AutoCloseable` 类型提供了编译器强制资源清理，比手动 finally 清理更安全、更简洁。ArkTS 面向的是受约束环境，此类机制可能并非优先考虑。

4. **编译时限制**（finally 中无局部类、无嵌套函数）并非 finally 特有，而是 ArkTS 的全局简化约束。这些限制不影响核心的 finally 语义。

5. **未发现设计问题。** finally 子句的实现与规范完全一致，行为符合开发者的预期。

### ArkTS finally 设计建议

1. **保持当前设计。** Finally 是一个广为人知且稳定的特性，无需修改。
2. **如果资源管理模式复杂度增加，** 考虑引入轻量级资源管理构造（如 `using` 关键字或类似 `AutoCloseable` 的接口）以减少样板代码。
3. **明确文档化 return+finally 交互行为**（规范已经这样做）——新开发者常常对"返回值在 finally 运行前保存"的行为感到意外。
4. **不要采用 Swift 的 defer。** finally 对 try 的结构性依附更清晰、更安全。

---

## 七、对应规范文档

| 语言 | 规范来源 |
|------|----------|
| ArkTS | ArkTS Static Spec 第 8.15.2 节 finally 子句 |
| Java | JLS SE21 第 14.20.2 节 try-finally 和 try-catch-finally 的执行 |
| Swift | The Swift Programming Language: Defer Statement（Swift 5.x） |
