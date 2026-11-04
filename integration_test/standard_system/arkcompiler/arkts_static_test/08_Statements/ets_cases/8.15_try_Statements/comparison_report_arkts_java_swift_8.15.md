# 8.15 try 语句 - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-18
**规范来源：** ArkTS Static Spec §8.15, Java JLS SE21 §14.20, Swift 5.x Language Guide

---

## 一、概览：三语言定位

本报告对比三种语言中 **try 语句** 构造的异同：

| 语言 | 规范 | 版本 |
|----------|--------------|---------|
| **ArkTS** | ArkTS 静态语言规范 | §8.15 try 语句 |
| **Java** | Java 语言规范 (JLS) | SE 21, §14.20 The try statement |
| **Swift** | Swift 编程语言 | Swift 5.x, 错误处理 |

三种语言均提供基于 try/catch/finally 机制的结构化错误处理，但在异常类型系统、语法变体和安全保证方面存在显著差异。

---

## 二、章节对应关系

| ArkTS 概念 | Java 对应 (JLS SE21) | Swift 对应 (5.x) |
|-------|-------|-----------------|
| try 语句语法 | §8.15 | §14.20 | 不适用（使用 `do`-`catch`） |
| catch 子句 | §8.15.1 | §14.20.1 | 错误处理章节 |
| finally 子句 | §8.15.2 | §14.20.2 | `defer` 语句 |
| 执行语义 | §8.15.3 | §14.20.3 | 错误处理章节 |
| throw 语句 | §8.14 | §14.18 | `throw` 表达式 |
| try-with-resources | 不支持 | §14.20.3 | 不支持 |
| 受检异常 | 不适用 | §11.2 | 不适用 |

---

## 三、关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|-----------|-------|------|-------|
| **关键字** | `try` + `catch` + `finally` | `try` + `catch` + `finally` | `do` + `catch`（无用于捕获的 `try` 关键字） |
| **多个 catch 块** | 不支持 | 支持（自 Java 7 起支持多 catch `|` 语法） | 支持（通过模式匹配） |
| **catch/finally 是否强制** | 至少需要一个 catch 或 finally | 至少需要一个 catch 或 finally | 至少需要一个 catch；`defer` 替代 `finally` |
| **异常类型** | 仅 `Error` 基类型 | `Throwable` 层级（受检/非受检） | `Error` 协议（struct/enum） |
| **catch 参数类型** | `Error`（隐式） | 任意 `Throwable` 子类 | 任意遵循 `Error` 协议的类型 |
| **catch 过滤** | 不支持 | 按类型 + 多 catch `|` 语法 | 模式匹配 + `where` 子句 |
| **finally 等价物** | `finally` 块 | `finally` 块 | `defer` 语句（基于作用域，非块配对） |
| **try-with-resources** | 不支持 | 支持（§14.20.3.1） | 不支持 |
| **块内嵌套函数** | 禁止 | 允许 | 允许 |
| **块内局部类** | 禁止 | 允许 | 允许 |
| **块内局部类型别名** | 禁止 | 允许 | 允许 |
| **受检异常** | 无 | 强制 throws 声明 | 无（但需要 `throws` 标记） |
| **函数上的 throws 子句** | 不需要 | 受检异常需要 | 需要（`throws`） |
| **catch 中重新抛出** | 支持（显式 `throw`） | 支持（隐式或显式） | 支持（`throw`） |
| **表达式 try** | 不支持 | 不支持 | `try?`、`try!` 表达式 |

---

## 四、用例 1:1 对照

### 用例 ① 基本 try-catch（无错误执行）

**ArkTS** (STMT_08_15_010):
```typescript
function main(): void {
    let result: int = 0;
    try {
        result = 100;
    } catch (e) {
        result = -1;
    }
    // result == 100
}
```

**Java:**
```java
public class Main {
    public static void main(String[] args) {
        int result = 0;
        try {
            result = 100;
        } catch (Exception e) {
            result = -1;
        }
        // result == 100
    }
}
```

**Swift:**
```swift
func main() {
    var result = 0
    do {
        result = 100
    } catch {
        result = -1
    }
    // result == 100
}
```

**关键观察：**
- ArkTS 和 Java 使用 `try` 作为关键字；Swift 使用 `do`。
- ArkTS 和 Java 使用 `catch (e)` 语法；Swift 在不需要错误对象时使用无参数的 `catch`。
- ArkTS 使用 `int` 作为内置类型；Java 使用 `int`；Swift 从字面量推断 `Int`。
- 在无错误场景下三种语言语义一致：catch 子句均不会被执行。

---

### 用例 ② 基本 try-catch（抛出错误）

**ArkTS** (STMT_08_15_011):
```typescript
function main(): void {
    let result: int = 0;
    try {
        throw new Error("test error");
        result = 100;  // unreachable
    } catch (e) {
        result = 200;
    }
    // result == 200, catch was executed
}
```

**Java:**
```java
public class Main {
    public static void main(String[] args) {
        int result = 0;
        try {
            throw new Exception("test error");
            // result = 100; // unreachable (compile error: unreachable statement)
        } catch (Exception e) {
            result = 200;
        }
        // result == 200
    }
}
```

**Swift:**
```swift
enum TestError: Error {
    case testFailure
}

func main() {
    var result = 0
    do {
        throw TestError.testFailure
        result = 100  // warning: code after 'throw' will never be executed
    } catch {
        result = 200
    }
    // result == 200
}
```

**关键观察：**
- Java 中，`throw` 之后的代码是编译时错误（不可达语句）；在 ArkTS 和 Swift 中可以编译，但属于死代码。
- ArkTS 使用 `new Error(...)`（构造函数）；Swift 使用遵循 `Error` 协议的枚举案例；Java 使用 `new Exception(...)`（构造函数）。
- 三种语言在抛出错误时均将控制转移到 catch 块。

---

### 用例 ③ try-finally（执行保证）

**ArkTS** (STMT_08_15_012):
```typescript
function main(): void {
    let finallyExecuted: int = 0;
    try {
        finallyExecuted = 1;
    } finally {
        finallyExecuted = 2;
    }
    // finallyExecuted == 2

    finallyExecuted = 0;
    try {
        throw new Error("error");
    } catch (e) {
        // caught
    } finally {
        finallyExecuted = 3;
    }
    // finallyExecuted == 3
}
```

**Java:**
```java
public class Main {
    public static void main(String[] args) {
        int finallyExecuted = 0;
        try {
            finallyExecuted = 1;
        } finally {
            finallyExecuted = 2;
        }
        // finallyExecuted == 2

        finallyExecuted = 0;
        try {
            throw new Exception("error");
        } catch (Exception e) {
            // caught
        } finally {
            finallyExecuted = 3;
        }
        // finallyExecuted == 3
    }
}
```

**Swift（使用 defer）:**
```swift
func main() {
    var finallyExecuted = 0
    
    // defer approach (no error)
    func scope1() {
        finallyExecuted = 1
        defer { finallyExecuted = 2 }
    }
    scope1()
    // finallyExecuted == 2 (defer runs at scope exit)

    // do-catch with defer (with error)
    finallyExecuted = 0
    do {
        defer { finallyExecuted = 3 }
        throw TestError.testFailure
    } catch {
        // caught
    }
    // finallyExecuted == 3 (defer ran before scope exit, even with throw)
}
```

**关键观察：**
- ArkTS 和 Java 均有 `finally` 块，在 `try`（及可选的 `catch`）之后始终执行。
- Swift 没有 `finally`；它使用 `defer` 语句，在当前作用域退出时执行，无论退出方式如何（正常完成、错误或 return）。
- `defer` 比 `finally` 更灵活：可以在作用域中的任意位置出现多个 `defer` 块（这些 defer 块按注册的逆序执行）。`finally` 则与特定的 `try` 块绑定。
- 在 ArkTS 和 Java 中，即使 catch 块抛出异常或 try 块执行了 return，`finally` 的执行也是保证的。

---

### 用例 ④ 嵌套 try 语句

**ArkTS** (STMT_08_15_004):
```typescript
function testNestedTry(): void {
    let result: int = 0;
    try {
        try {
            result = 1;
        } catch (e) {
            result = -1;
        }
    } catch (e) {
        result = -2;
    } finally {
        result = 99;
    }
}
```

**Java:**
```java
public class Main {
    public static void main(String[] args) {
        int result = 0;
        try {
            try {
                result = 1;
            } catch (Exception e) {
                result = -1;
            }
        } catch (Exception e) {
            result = -2;
        } finally {
            result = 99;
        }
    }
}
```

**Swift:**
```swift
func testNestedDo() {
    var result = 0
    do {
        do {
            result = 1
        } catch {
            result = -1
        }
    } catch {
        result = -2
    }
    // No finally equivalent without defer
    // With defer:
    defer { result = 99 }
}
```

**关键观察：**
- 三种语言均支持 try/do-catch 构造的嵌套。
- ArkTS 和 Java 具有完全相同的嵌套语义：内层 catch 处理内层 try 中的错误；如果内层 catch 抛出错误或未捕获，外层 catch 可能会处理。
- Swift 使用 `do`-`catch` 嵌套；外层作用域中的 `defer` 在 `testNestedDo()` 退出时运行，提供类似 finally 的保证。
- 所有块执行后的最终值：内层 try 无错误成功执行，因此 `result = 1`，然后外层 `finally`/`defer` 设置 `result = 99`。

---

### 用例 ⑤ try 内部 return 与 finally 的交互

**ArkTS** (STMT_08_15_005):
```typescript
function testTryCatchReturn(): int {
    let x: int = 0;
    try {
        x = 7;
        return x;
    } catch (e) {
        return -1;
    } finally {
        x = 0;  // executes before the return
    }
}
```

**Java:**
```java
public class Main {
    public static int testTryCatchReturn() {
        int x = 0;
        try {
            x = 7;
            return x;
        } catch (Exception e) {
            return -1;
        } finally {
            x = 0;  // executes before the return, but does not change return value
        }
    }
}
```

**Swift:**
```swift
func testTryCatchReturn() -> Int {
    var x = 0
    defer { x = 0 }  // executes when scope exits, including after return
    do {
        x = 7
        return x
    } catch {
        return -1
    }
}
```

**关键观察：**
- 在三种语言中，finally/defer 块均在返回值**实际返回给调用者之前**执行。
- 在 Java 和 ArkTS 中：如果 try 块执行 `return x`（其中 `x` 为 7），`finally` 块运行，将 `x` 修改为 0，但**返回值已经计算**为 7。函数返回 7，而非 0。这是 Java 中一个众所周知的微妙之处，ArkTS 继承了这一行为。
- Swift 的 `defer` 行为相似：在函数返回之前运行，但无法改变返回值。
- 这个场景突显了一个开发者必须理解的重要语义细节：`finally` 会执行，但无法修改已经计算完成的返回值。

---

### 用例 ⑥ 编译时错误 — 仅有 try 而无 catch 或 finally

**ArkTS** (STMT_08_15_006):
```typescript
// Compile-time error: try must have at least catch or finally
function test(): void {
    let x: int = 0;
    try {
        x = 1;
    }
    // ERROR: missing catch or finally
}
```

**Java:**
```java
// Compile-time error: try must have at least catch or finally
public class Main {
    public static void main(String[] args) {
        int x = 0;
        try {
            x = 1;
        }
        // ERROR: 'try' without 'catch', 'finally' or resource declarations
    }
}
```

**Swift:**
```swift
// Swift do-catch requires at least one catch block if "try" expressions are present
func test() {
    var x = 0
    do {
        x = 1
    }
    // No error — but useless; catch is only needed if a throwing call is in the do block
}
```

**关键观察：**
- ArkTS 和 Java 执行相同的规则：`try` 块之后必须跟随至少一个 `catch` 子句或一个 `finally` 子句（或两者皆有）。
- Swift 中不含 `catch` 的 `do` 块本身不是编译错误——它仅仅是一个作用域构造。只有当 `do` 块中出现抛出调用时才需要 `catch`。
- 这种差异源于根本设计理念的不同：ArkTS 和 Java 将 `try` 视为需要处理的错误处理构造；Swift 将 `do` 视为作用域构造，`catch` 为可选的错误处理。

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|-----------|-------|------|-------|
| **语法简洁性** | 4/5（简洁，无受检异常） | 3/5（冗长，受检异常） | 5/5（do-catch 自然，defer 灵活） |
| **错误类型表达力** | 2/5（单一的 Error 基类型） | 4/5（丰富的 Throwable 层级） | 4/5（Error 协议 + 模式匹配） |
| **安全性：catch-or-finally 强制** | 5/5（编译时检查） | 5/5（编译时检查） | 3/5（无抛出调用的 do 中 catch 可选） |
| **finally/defer 灵活性** | 3/5（仅有 finally，块配对） | 3/5（仅有 finally，块配对） | 5/5（defer 可在任意位置，基于作用域） |
| **多个 catch 块** | 1/5（不支持） | 5/5（多 catch `|` 语法） | 4/5（模式匹配） |
| **资源管理** | 1/5（无 try-with-resources） | 5/5（try-with-resources） | 2/5（无内置，defer 可辅助） |
| **与生态一致性** | 4/5（符合 ArkTS 简化目标） | 5/5（成熟，广为人知） | 4/5（Swift 惯用风格） |
| **综合** | **20/35** | **30/35** | **27/35** |

---

## 六、核心结论

1. **ArkTS 在语法、语义以及 catch-or-finally 强制规则方面紧密遵循 Java 的 try-catch-finally 模型。** 文法 `try block catchClause? finallyClause?` 和运行时行为与 Java 几乎完全一致。

2. **ArkTS 相比 Java 和 Swift 进行了刻意简化：**
   - 不支持多个 catch 块（Java：支持；Swift：模式匹配）
   - 无受检异常（Java：强制；Swift：不适用）
   - 无 try-with-resources（Java：支持；Swift：不支持）
   - 单一的 `Error` 基异常类型（对比 Java 的 `Throwable` 层级和 Swift 的 `Error` 协议）
   - 块内限制局部声明（Java 和 Swift 均允许）

3. **Swift 采用了根本不同的设计思路**：使用 `do`-`catch` 替代 `try`-`catch`，使用 `defer` 替代 `finally`。`defer` 机制更灵活，但在概念上与块配对的 `finally` 截然不同。

4. **最具影响力的差异**是 ArkTS 对 try/catch/finally 块内局部声明（类、类型别名、嵌套函数）的限制。Java 或 Swift 开发者可能会预期这些声明被允许，因为两种语言都支持这些声明。这是 ArkTS 为简化而做出的刻意设计选择，而非缺陷。

5. **三种语言的运行时语义一致**：异常传播模型（try -> catch -> finally）、finally/defer 执行保证以及与 `return` 语句的交互行为均保持一致。

---

## 七、ArkTS 设计建议

- **对 try 语句本身不建议修改**：语法和语义定义清晰，与 Java 一致，测试套件已确认实现正确。
- **建议在 ArkTS 规范中明确记录 `return` 与 `finally` 的交互行为**（类似 JLS §14.20.2），因为这是一个众所周知的、会使开发者感到意外的语义细节。当前 ArkTS 规范 §8.15.3 描述了执行语义，但未明确阐述 return-finally 的交互。
- **try/catch/finally 体内局部声明的限制**是 ArkTS 全局约束，并非 §8.15 特有。无需对 try 语句本身进行特定修改。
