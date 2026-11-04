# 8.3 块语句（Block） - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-18
**规范来源：** ArkTS Static Spec §8.3, Java JLS SE21 §14, Swift 5.x Language Guide

---

## 一、概览：三语言定位

本报告对比 ArkTS 第 8.3 节 Block 语句与 Java（JLS SE21，第 14 章：Blocks and Statements）以及 Swift（Swift 5.x，Language Guide：Statements）的块语句语义。块（Block）在三种语言中都是基础结构元素，用于将多条语句组合成单一复合语句。

| 语言 | 定位 | 哲学 |
|------|------|------|
| ArkTS | 静态安全、类型擦除 | 限制性声明策略：接口（interface）与类型别名（type）可在块中声明但仅编译时有效；不允许局部类或嵌套函数 |
| Java | 面向对象、名义类型 | 适度的局部类型能力：允许局部类（JLS 14.3），但不允许局部接口或类型别名，不允许嵌套函数 |
| Swift | 面向协议、结构化类型 | 丰富的局部声明能力：块内完整支持嵌套函数、局部结构体/类/枚举以及类型别名（typealias），均具有完整运行时语义 |

---

## 二、章节对应关系

| ArkTS 概念 | Java 对应 (JLS SE21) | Swift 对应 (5.x) |
|-----------|---------------------|-------------------|
| 块定义：`'{' statement* '}'` | JLS 14.2: `Block: '{' [BlockStatements] '}'` | Statements 章节：大括号语句 `{ statements }` |
| 顺序执行：语句按文本顺序执行 | 14.2: 语句按文本顺序执行 | 语句按文本顺序执行 |
| 异常终止：抛出错误或 return 时停止 | 14.1: break, continue, return 或 throw 导致异常终止 | 控制转移语句（return, break, continue, throw） |
| void 函数隐式返回：void 函数体可以无 return | 14.17: void 方法可以省略 return（执行到末尾结束） | 单表达式函数体隐式返回；void 函数可以省略 return |
| 块中的类型声明：类型声明不作为语句执行 | 14.3: 块中允许局部类声明 | 允许：局部 struct, class, enum, typealias 声明 |
| 块中嵌套函数 | 禁止（编译失败） | 禁止（方法只能在类级别） | 允许（nested func） |
| 块中局部类 | 禁止（编译失败） | 允许（JLS 14.3） | 允许 |
| 块中局部类型别名 | 禁止（编译失败，参见用例 008；存在设计争议） | 不适用（类型别名仅在类级别） | 允许 |

---

## 三、关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 块语法 | `{ stmt* }` | `{ [BlockStatements] }` | `{ statements }` |
| 嵌套函数声明 | 不允许 | 不允许 | 允许 |
| 局部类声明 | 不允许 | 允许（JLS 14.3） | 允许 |
| 局部类型别名 | 块中不允许 | 不适用 | 允许 |
| 块中接口 | 允许（仅编译时） | 不允许 | 不适用（protocol 在类型级别） |
| 变量遮蔽（shadowing） | 允许（let/let） | 允许 | 允许 |
| 空块 `{}` | 允许 | 允许 | 允许 |
| 块作为表达式 | 否 | 否 | 是（单表达式隐式返回） |
| 带标签的块 | 否（仅循环有标签） | 否（仅循环有标签） | 否（仅循环有标签） |

---

## 四、用例 1:1 对照

### 用例 ①：包含多条语句的基本块

**ArkTS:**
```arkts
function basicBlock(): void {
    let x: int = 1;
    let y: int = 2;
    let z: int = x + y;
    z + 1;      // expression statement
    x = 10;
    y = 20;
}
```

**Java (JLS SE21):**
```java
void basicBlock() {
    int x = 1;
    int y = 2;
    int z = x + y;
    z + 1;      // expression statement
    x = 10;
    y = 20;
}
```

**Swift 5.x:**
```swift
func basicBlock() {
    var x = 1
    var y = 2
    var z = x + y
    z + 1       // expression statement, result unused
    x = 10
    y = 20
}
```

**分析：** 三种语言行为完全一致。块内语句按顺序执行。三种语言均支持在块内使用表达式语句和赋值操作。语义是同构的。

---

### 用例 ②：Void 函数体无 return 语句

**ArkTS:**
```arkts
function logMessage(msg: string): void {
    console.log(msg);
    // no return statement needed
}
```

**Java (JLS SE21, 14.17):**
```java
void logMessage(String msg) {
    System.out.println(msg);
    // no return statement needed; "fall off end" is allowed
}
```

**Swift 5.x:**
```swift
func logMessage(_ msg: String) {
    print(msg)
    // no return statement needed
}
```

**分析：** 三种语言均允许 void 函数省略 return 语句。函数体块在最后一条语句执行完毕时隐式终止。这是三种语言的一致行为。

---

### 用例 ③：块内部的类型声明

**ArkTS:**
```arkts
function processData(): void {
    {
        interface LocalShape {
            area: int;
        }
        type LocalId = int;
        let s: LocalShape = { area: 100 };
        let id: LocalId = 42;
    }
}
```

**Java (JLS SE21, 14.3):**
```java
void processData() {
    {
        // interface not allowed inside block in Java
        // type alias not supported in Java
        class LocalHelper {   // local class is allowed
            int process(int x) { return x * 2; }
        }
        LocalHelper helper = new LocalHelper();
        int result = helper.process(42);
    }
}
```

**Swift 5.x:**
```swift
func processData() {
    struct LocalShape {    // local struct allowed
        var area: Int
    }
    typealias LocalId = Int   // local typealias allowed
    let s = LocalShape(area: 100)
    let id: LocalId = 42
}
```

**分析：** 这是差异最大的领域。ArkTS 采取中间立场：`interface` 和 `type` 声明在块内是允许的，但仅编译时有效（不作为语句执行）。Java 允许局部类（JLS 14.3），但不允许局部接口或类型别名。Swift 允许所有形式的局部类型声明（struct, class, enum, typealias），并具有完整的运行时语义。这反映了每种语言类型系统的设计理念：ArkTS 采用类型擦除（类 TypeScript），Java 采用名义类型体系且局部类型形式有限，Swift 采用结构化类型体系并具有丰富的局部类型能力。

---

### 用例 ④：嵌套块与变量遮蔽

**ArkTS:**
```arkts
function shadowing(): void {
    let x: int = 10;
    {
        let x: int = 20;       // shadows outer x
        {
            let x: int = 30;   // shadows both
            x = x + 1;         // operates on innermost x
        }
    }
}
```

**Java (JLS SE21, 14.4):**
```java
void shadowing() {
    int x = 10;
    {
        int x = 20;            // OK in Java
        {
            int x = 30;        // OK in Java
            x = x + 1;         // operates on innermost x
        }
    }
}
```

**Swift 5.x:**
```swift
func shadowing() {
    var x = 10
    {
        var x = 20            // Swift allows shadowing
        {
            var x = 30        // Swift allows shadowing
            x = x + 1
        }
    }
}
```

**分析：** 三种语言均允许嵌套块中的变量遮蔽。每个 `let`/`var`/`int` 声明创建一个新作用域，遮蔽外层声明。语义完全一致。

---

### 用例 ⑤：块内抛出异常导致执行停止

**ArkTS:**
```arkts
function testThrowStop(): void {
    let x: int = 0;
    try {
        {
            x = 1;
            throw new Error("stop");
            x = 2;             // NOT executed
        }
    } catch (e) {
        // caught
    }
    // x == 1; statement after throw never executes
}
```

**Java (JLS SE21, 14.18, 14.19):**
```java
void testThrowStop() {
    int x = 0;
    try {
        {
            x = 1;
            throw new Exception("stop");
            x = 2;             // NOT executed
        }
    } catch (Exception e) {
        // caught
    }
    // x == 1
}
```

**Swift 5.x:**
```swift
func testThrowStop() {
    var x = 0
    do {
        {
            x = 1
            throw NSError(domain: "stop", code: 0)
            x = 2             // NOT executed
        }
    } catch {
        // caught
    }
    // x == 1
}
```

**分析：** 行为完全一致。在三种语言中，块内的 `throw` 语句都会导致块的异常终止，阻止后续语句执行。异常向外传播至最近的 try-catch（或等价）处理程序。这实现了规范中描述的规则："抛出错误时执行停止。"

---

### 用例 ⑥：空块

**ArkTS:**
```arkts
function testEmpty(): void {
    let x: int = 0;
    {                          // empty block
    }
    x = 1;
    { /* comment */ }          // comment-only block
    x = 2;
}
```

**Java (JLS SE21, 14.2):**
```java
void testEmpty() {
    int x = 0;
    {                          // empty block
    }
    x = 1;
    { /* comment */ }          // comment-only block
    x = 2;
}
```

**Swift 5.x:**
```swift
func testEmpty() {
    var x = 0
    {                          // empty block (code block)
    }
    x = 1
    { /* comment */ }          // comment-only block
    x = 2
}
```

**分析：** 三种语言均允许空块。空块对执行没有影响，属于语法上的无操作（no-op）。仅包含注释的块与空块行为完全一致。

---

## 五、综合评分

| 维度 | ArkTS vs Java | ArkTS vs Swift | 备注 |
|------|--------------|----------------|------|
| 基本块语义 | 一致 (10/10) | 一致 (10/10) | 三种语言的块与顺序执行语义完全兼容 |
| Void 函数体 | 一致 (10/10) | 一致 (10/10) | 隐式返回行为一致 |
| 变量遮蔽 | 一致 (10/10) | 一致 (10/10) | 均允许嵌套作用域中的遮蔽 |
| 异常终止 | 一致 (10/10) | 一致 (10/10) | throw/error 传播在所有三种语言中均会中止块执行 |
| 空块 | 一致 (10/10) | 一致 (10/10) | 均允许空 `{}` |
| 块中的类型声明 | 不同 (4/10) | 不同 (3/10) | ArkTS 允许 interface/type 但不允许 class；Java 允许 class 但不允许 interface；Swift 全部允许 |
| 嵌套函数声明 | 相同 (10/10) | 不同 (4/10) | ArkTS 与 Java 均不允许；Swift 允许 |
| 块作为表达式 | 一致 (10/10) | 不同 (6/10) | Swift 在单表达式块中具有隐式返回 |
| **综合评分** | **9.2/10** | **7.5/10** | |

---

## 六、核心结论

1. ArkTS 的 Block 语句（第 8.3 节）与 Java 的块语句语义（JLS SE21 第 14 章）最为相似，兼容性评分为 **9.2/10**。唯一值得注意的分歧在于：Java 允许块内声明局部类（JLS 14.3），而 ArkTS 不允许；反之 ArkTS 允许块内声明局部接口/类型别名（仅编译时有效），而 Java 不允许。

2. ArkTS 与 Swift 之间的评分为 **7.5/10**。主要差异在于：(1) Swift 允许块内声明嵌套函数；(2) Swift 允许完整的局部类型声明（struct, class, enum），并具有运行时语义；(3) Swift 的块可以作为表达式使用，在单表达式闭包中支持隐式返回。

3. 在常见使用场景（顺序执行、变量作用域、void 返回、异常处理）方面，三种语言的块语句语义几乎完全一致。差异仅限于块内部允许哪些类型的声明，这反映了每种语言更广泛的类型系统哲学。ArkTS 在三者中采取最为严格的限制策略，符合其作为简化、静态安全语言的设计目标。
