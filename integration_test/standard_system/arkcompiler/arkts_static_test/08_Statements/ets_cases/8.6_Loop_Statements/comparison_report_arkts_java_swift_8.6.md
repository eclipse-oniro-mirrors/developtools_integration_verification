# 8.6 循环语句 - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-18
**规范来源：** ArkTS Static Spec §8.6, Java JLS SE21 §14.12-14.14, Swift 5.x Language Guide: Control Flow

---

## 一、概览：三语言定位

本报告对 ArkTS 规范第 8.6 节定义的循环语句结构与 Java（JLS SE21，第 14.12-14.14 节）和 Swift（Swift 5.x，Language Guide: Control Flow — For-In Loops, While Loops）中的等价特性进行对比。三种语言均提供四种基本循环形式，但在标签语义、lambda/闭包约束以及变量作用域规则方面存在差异。

| 语言 | 定位 | 设计哲学 |
|------|------|----------|
| ArkTS | 移动/嵌入式系统开发（OpenHarmony） | 强制标签必须被引用以确保代码清晰度，禁止在 lambda 中引用标签 |
| Java | 通用企业级开发 | 标签可标注任意语句，无使用要求；lambda 内禁止 break/continue 引用外部标签 |
| Swift | Apple 平台开发 | 标签仅限循环/switch；闭包内禁止标签引用；采用 `repeat` 替代 `do`-while |

---

## 二、章节对应关系

| ArkTS 概念 | Java 对应 (JLS SE21) | Swift 对应 (5.x) |
|-----------|---------------------|-------------------|
| 8.6（总述）循环语句概述 | 14.12（基本 for）、14.13（增强 for）、14.14（while/do） | Control Flow — For-In Loops, While Loops |
| 8.6.1 `while` 语句 | 14.14（The while Statement） | While Loops |
| 8.6.2 `do` 语句 | 14.14（The do Statement） | Repeat-While |
| 8.6.3 `for` 语句 | 14.12（The basic for Statement） | （无直接等价形式；优先使用 for-in） |
| 8.6.4 `for-of` 语句 | 14.13（The enhanced for Statement） | For-In Loops |
| 8.6 标签部分 循环标签 | 14.7（Labeled Statements） | labeled statements（Control Flow 中内联说明） |

---

## 三、关键差异矩阵

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 循环标签语法 | `label: loopStatement`（标签仅限循环） | `label: statement`（标签可标注**任意**语句） | `label: while/repeat/for`（标签仅限循环/switch） |
| 未引用的标签 | **编译时错误** | 静默允许 | 静默允许 |
| 标签位于 lambda/闭包内部 | **编译时错误** | 编译时错误（lambda 体是独立方法） | 编译时错误（闭包是独立上下文） |
| while 循环 | `while (expr) stmt` | `while (expr) stmt` | `while expr { }`（无需括号） |
| do / do-while 循环 | `do stmt while (expr);` | `do stmt while (expr);` | `repeat { } while expr` |
| for 循环（初始;条件;更新） | `for (init; cond; update) stmt` | `for (init; cond; update) stmt` | 无 C 风格 for 循环（Swift 3 中已移除） |
| for-of / for-in | `for (let x of iterable) stmt` | `for (Type x : iterable) stmt` | `for x in sequence { }` |
| 条件表达式类型 | 仅限 boolean | 仅限 `boolean` | 仅限 `Bool` |
| break/continue 在无标签循环 | 作用于最内层循环 | 作用于最内层循环 | 作用于最内层循环 |
| for 初始化中的变量声明 | `let`/`var`，作用域为循环体 | 类型声明，作用域为循环体 | `let`/`var` 在 for-in 中（模式绑定） |

---

## 四、用例 1:1 对照

### 用例 ①：带计数迭代的基本 while 循环

三种语言均支持语义相同的基本 while 循环模式。

**ArkTS**（源自 `STMT_08_06_001_PASS_BasicWhile.ets`）：
```arkts
function testBasicWhile(): void {
    let i: int = 0;
    while (i < 3) {
        i++;
    }
    let flag: boolean = true;
    while (flag) {
        flag = false;
    }
}
```

**Java**：
```java
void testBasicWhile() {
    int i = 0;
    while (i < 3) {
        i++;
    }
    boolean flag = true;
    while (flag) {
        flag = false;
    }
}
```

**Swift**：
```swift
func testBasicWhile() {
    var i = 0
    while i < 3 {
        i += 1
    }
    var flag = true
    while flag {
        flag = false
    }
}
```

**结论**：**等价** — 语义完全一致。仅有微小的语法差异（Swift 省略括号）。

---

### 用例 ②：带标签的循环，break 指定外层标签

**ArkTS**（源自 `STMT_08_06_005_PASS_LabeledLoopBreak.ets`）：
```arkts
function testLabeledLoopBreak(): void {
    let sum: int = 0;
    outerLoop: for (let i: int = 0; i < 5; i++) {
        if (i > 2) {
            break outerLoop;
        }
        sum += i;
    }
}
```

**Java**：
```java
void testLabeledLoopBreak() {
    int sum = 0;
    outerLoop: for (int i = 0; i < 5; i++) {
        if (i > 2) {
            break outerLoop;
        }
        sum += i;
    }
    // Java：标签可以完全不被引用，无错误
    unreferenced: for (int j = 0; j < 3; j++) {
        // 无 break/continue — 在 Java 中完全合法
    }
}
```

**Swift**：
```swift
func testLabeledLoopBreak() {
    var sum = 0
    outerLoop: for i in 0..<5 {
        if i > 2 {
            break outerLoop
        }
        sum += i
    }
    // Swift：未引用的标签同样静默允许
}
```

**结论**：**ArkTS 有差异** — ArkTS 要求标签必须在循环体内被引用。Java 和 Swift 允许悬挂（未引用）标签而不报错。这是第 8.6 节中最显著的设计差异。

---

### 用例 ③：在 lambda 内部引用标签（编译时错误）

三种语言均拒绝此模式，但实现机制各不相同。

**ArkTS**（源自 `STMT_08_06_006_FAIL_LabelInLambdaContinue.ets` — 编译失败）：
```arkts
function testLabelInLambdaContinue(): void {
    label: for (let i: int = 0; i < 10; i++) {
        const f = (): void => {
            continue label;  // ArkTS 编译时错误
        };
    }
}
```

**Java**（编译时错误）：
```java
void testLabelInLambda() {
    label: for (int i = 0; i < 10; i++) {
        Runnable r = () -> {
            continue label;  // 编译时错误：continue 不能用于 lambda
        };
    }
}
```

**Swift**（编译时错误）：
```swift
func testLabelInClosure() {
    label: for i in 0..<10 {
        let f = {
            continue label  // 编译时错误：无法从闭包中 continue
        }
    }
}
```

**结论**：**等价** — 三种语言均产生编译时错误。ArkTS 在规范规则中明确引用了 lambda 上下文；Java/Swift 则因 `break`/`continue` 在 lambda/闭包中不属于外层方法的流程控制而拒绝。行为结果完全一致。

---

### 用例 ④：for-of 循环遍历数组

**ArkTS**（源自 `STMT_08_06_004_PASS_BasicForOf.ets`）：
```arkts
function testBasicForOf(): void {
    let arr: int[] = [1, 2, 3];
    let sum: int = 0;
    for (let x of arr) {
        sum += x;
    }
}
```

**Java**：
```java
void testBasicForOf() {
    int[] arr = {1, 2, 3};
    int sum = 0;
    for (int x : arr) {
        sum += x;
    }
}
```

**Swift**：
```swift
func testBasicForOf() {
    let arr = [1, 2, 3]
    var sum = 0
    for x in arr {
        sum += x
    }
}
```

**结论**：**等价** — 三种语言均提供简洁的可迭代遍历方式。Java 使用 `:` 语法，Swift 使用 `in`，ArkTS 使用 `of`。迭代语义完全一致。

---

### 用例 ⑤：do-while 循环（循环体至少执行一次）

**ArkTS**（源自 `STMT_08_06_002_PASS_BasicDoWhile.ets`）：
```arkts
function testBasicDoWhile(): void {
    let j: int = 0;
    do {
        j++;
    } while (false);
    // j === 1 — 即使条件为 false，循环体仍执行一次
}
```

**Java**：
```java
void testBasicDoWhile() {
    int j = 0;
    do {
        j++;
    } while (false);
    // j === 1 — 即使条件为 false，循环体仍执行一次
}
```

**Swift**：
```swift
func testBasicDoWhile() {
    var j = 0
    repeat {
        j += 1
    } while false
    // j === 1 — 即使条件为 false，循环体仍执行一次
}
```

**结论**：**等价** — 语义完全一致。Swift 使用 `repeat` 而非 `do`，以避免与 `do`-`catch` 错误处理产生歧义。

---

## 五、综合评分

| 维度 | 评分 | 说明 |
|------|------|------|
| 功能完整性（4 种循环类型） | 10/10 | 三种语言均支持 while、do-while/do/repeat-while、for/增强-for 以及 for-of/in。Swift 缺少 C 风格 for 循环，但通过 `stride` 提供了等价覆盖。 |
| 标签语法一致性 | 7/10 | ArkTS 将标签限制为仅用于循环（与 Swift 相同）；Java 允许标签标注任意语句。ArkTS 的强制使用规则是唯一严格的。 |
| Lambda/闭包限制 | 10/10 | 三种语言一致 — 在匿名函数中引用标签的 `break`/`continue` 均被拒绝。 |
| 静态安全性 | 8/10 | ArkTS 最为严格（强制标签使用），可防止无用标签注解但增加了摩擦。Java/Swift 的宽松做法更为灵活。 |
| 规范清晰度 | 9/10 | ArkTS 规范第 8.6 节明确阐述了四种循环形式及标签约束规则，lambda 限制专门列出。 |
| 迁移便利性（从 Java/Swift） | 7/10 | 来自 Java/Swift 的开发者需要适应强制标签使用规则。基本循环语法几乎一致，所需改动极小。 |

---

## 六、核心结论

1. **核心循环语义高度一致**：while、do-while/do/repeat-while、for 以及 for-of/增强-for 模式在 ArkTS、Java 和 Swift 中表现相同，包括迭代行为、条件求值以及 break/continue 控制流。

2. **标签语义是主要分歧点**：ArkTS 要求标签必须被引用（未引用则编译时错误），这一规则是独有的，比 Java 和 Swift 都更为严格。这是为代码清晰度做出的有意设计选择，但也是跨语言迁移的潜在摩擦点。

3. **Lambda 限制是标准做法**：在 lambda/闭包体内禁止使用 `break`/`continue` 引用外层循环标签，三种语言完全一致，任何有经验的开发者都不会对此感到意外。

4. **ArkTS for-of vs Swift for-in vs Java 增强-for**：语法有所差异（`of` vs `in` vs `:`），但语义功能完全相同。ArkTS 与 JavaScript/TypeScript 惯例（`for...of`）最为接近。

5. **总体兼容性**：第 8.6 节设计精良，与主流语言实践广泛兼容。唯一独特的约束（强制标签使用）是一个影响微小的次要偏离。
