# 8.7 while 语句与 do 语句 - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-18
**规范来源：** ArkTS Static Spec §8.7, Java JLS SE21 §14, Swift 5.x Language Guide

---

## 一、概览：三语言定位

本报告比较 ArkTS、Java 和 Swift 三种语言中的 `while` 循环和 `do`-`while`（Java）/ `repeat`-`while`（Swift）循环语句。三种语言均提供前测循环（先判断条件再执行循环体）和后测循环（先执行一次循环体再判断条件）。核心语法和语义一致，仅存在细微的语法差异。

| 语言 | 定位 | 哲学 |
|------|------|------|
| ArkTS | 前测循环：`while (expr) stmt`；后测循环：`do stmt while (expr) ;` | 与 Java 语法完全对齐，条件必须为 `boolean` 或扩展条件表达式类型 |
| Java | 前测循环：`while (expr) stmt`；后测循环：`do stmt while (expr) ;` | 经典 C 族语法，条件必须为 `boolean` 类型 |
| Swift | 前测循环：`while expr { stmts }`；后测循环：`repeat { stmts } while expr` | 括号可选但大括号必须，条件必须为 `Bool`，`repeat` 关键字避免与错误处理的 `do` 歧义 |

## 二、章节对应关系

| ArkTS 概念 | Java 对应 (JLS SE21) | Swift 对应 (5.x) |
|-----------|---------------------|-------------------|
| 章节编号 | SS 8.7 | JLS 14.12 (while), 14.13 (do-while) | TSPL: Control Flow |
| 前测循环 | `while (expr) stmt` | `while (expr) stmt` | `while expr { stmts }` |
| 后测循环 | `do stmt while (expr) ;` | `do stmt while (expr) ;` | `repeat { stmts } while expr` |
| 条件类型 | `boolean` 或扩展条件表达式类型 | `boolean` | `Bool` |
| 空循环体 | 允许 `{}` 或 `;` | 允许 `{}` 或 `;` | 仅允许 `{}`（Swift 强制要求大括号） |
| 循环标签 | 支持（有限制） | 支持 | 支持 |
| break/continue | 支持 | 支持 | 支持 |

## 三、关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **后测循环关键字** | `do ... while` | `do ... while` | `repeat ... while` |
| **条件括号** | 必须：`while (expr)` | 必须：`while (expr)` | 可选：`while expr` |
| **循环体大括号** | 可选（任意语句） | 可选（任意语句） | 必须（大括号强制） |
| **条件类型** | `boolean` 或扩展条件表达式 | 仅 `boolean` | 仅 `Bool` |
| **空语句作循环体** | 允许 `;` | 允许 `;` | 不适用（大括号强制） |
| **非布尔条件** | ❌ 编译期错误 | ❌ 编译期错误 | ❌ 编译期错误 |
| **标签限制** | 无法引用 lambda 内部的标签 | 可引用 lambda 内部的标签 | N/A（Swift 闭包捕获机制不同） |

## 四、用例 1:1 对照

### 用例 ①：基本 while 循环（前测，循环体可能永不执行）

**ArkTS (SS 8.7)**
```typescript
let i: int = 0;
while (i < 5) {
    i = i + 1;
}
```

**Java (JLS 14.12)**
```java
int i = 0;
while (i < 5) {
    i = i + 1;
}
```

**Swift 5.x**
```swift
var i = 0
while i < 5 {
    i += 1
}
```

**分析：**
- 三种语言语法几乎完全一致。
- ArkTS 使用 `int` 类型关键字；Java 同样使用 `int`；Swift 推断为 `Int`。
- ArkTS 和 Java 要求条件必须括在括号中；Swift 不需要。
- 三种语言均在执行循环体之前先判断条件。

### 用例 ②：do-while / repeat-while 循环（后测，循环体至少执行一次）

**ArkTS (SS 8.7)**
```typescript
let count: int = 0;
do {
    count = count + 1;
} while (false);
// count == 1
```

**Java (JLS 14.13)**
```java
int count = 0;
do {
    count = count + 1;
} while (false);
// count == 1
```

**Swift 5.x**
```swift
var count = 0
repeat {
    count += 1
} while false
// count == 1
```

**分析：**
- ArkTS 和 Java 使用完全相同的 `do ... while (expr) ;` 语法（分号在 while 条件后必须写）。
- Swift 使用 `repeat ... while expr`（不需要分号，也不需要括号）。关键字 `repeat` 避免了与 Swift 错误处理中 `do` 关键字的歧义。
- 三种语言均在判断条件前先执行一次循环体。

### 用例 ③：非布尔条件 —— 编译期错误

**ArkTS (SS 8.7)**
```typescript
// 编译期错误：条件必须为 boolean 类型
while (1) { }          // FAIL: 数字字面量
do { } while ("abc");  // FAIL: 字符串字面量
```

**Java (JLS 14.12-14.13)**
```java
// 编译期错误：类型不兼容
while (1) { }          // FAIL: int 不能转换为 boolean
do { } while ("abc");  // FAIL: String 不能转换为 boolean
```

**Swift 5.x**
```swift
// 编译期错误：类型不匹配
while 1 { }            // FAIL: Int 不能转换为 Bool
repeat { } while "abc" // FAIL: String 不能转换为 Bool
```

**分析：**
- 三种语言均对循环条件执行严格的布尔类型检查。
- 三种语言均不支持隐式真值判断（C 风格的"零为假"）。
- 错误信息不同，但行为在语义层面完全一致。

### 用例 ④：空循环体

**ArkTS (SS 8.7)**
```typescript
// 以下两种形式均合法
while (false) {}
while (false);
do {} while (false);
do ; while (false);
```

**Java (JLS 14.12-14.13)**
```java
// 以下两种形式均合法
while (false) {}
while (false);
do {} while (false);
do ; while (false);
```

**Swift 5.x**
```swift
// 仅大括号形式合法
while false {}           // OK
// while false;          // 错误：while 条件后缺少 '{'
// repeat {} while false // OK
// repeat ; while false  // 错误：repeat 后缺少 '{'
```

**分析：**
- ArkTS 和 Java 均允许空块 `{}` 和空语句 `;` 作为循环体。
- Swift 要求所有循环体必须使用大括号 `{}`——空语句不是合法的语法形式。

### 用例 ⑤：嵌套 while 与 do-while 循环

**ArkTS (SS 8.7)**
```typescript
let i: int = 0;
let result: int = 0;
while (i < 3) {
    let j: int = 0;
    do {
        result = result + 1;
        j = j + 1;
    } while (j < 2);
    i = i + 1;
}
```

**Java (JLS 14.12-14.13)**
```java
int i = 0;
int result = 0;
while (i < 3) {
    int j = 0;
    do {
        result = result + 1;
        j = j + 1;
    } while (j < 2);
    i = i + 1;
}
```

**Swift 5.x**
```swift
var i = 0
var result = 0
while i < 3 {
    var j = 0
    repeat {
        result += 1
        j += 1
    } while j < 2
    i += 1
}
```

**分析：**
- 三种语言的嵌套模式完全一致。
- Swift 使用 `repeat` 替代 `do`，但语义相同。
- 三种语言均正确管理循环体内声明的变量作用域。

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语法清晰度 | 4/5 | 4/5 | 4/5 |
| 语义正确性 | 5/5 | 5/5 | 5/5 |
| 类型安全（条件） | 5/5 | 5/5 | 5/5 |
| 灵活性（循环体形式） | 5/5 | 5/5 | 3/5 |
| 标签/break/continue | 4/5 | 5/5 | 4/5 |
| **综合** | **4.6/5** | **4.8/5** | **4.2/5** |

## 六、核心结论

1. **ArkTS 与 Java 高度对齐**：`while` 和 `do`-`while` 语句在语法、语义、类型规则以及空循环体灵活性方面完全一致。

2. **Swift 在命名上存在分歧**：后测循环使用 `repeat ... while` 而非 `do ... while`，以避免与 Swift 错误处理中的 `do` 块产生歧义。此外，Swift 强制要求循环体使用大括号，而 ArkTS 和 Java 允许任意单条语句（包括空语句 `;`）。

3. **三种语言均对循环条件执行严格的布尔类型检查**：不存在隐式真值判断——`while (1)`、`while ("abc")` 以及条件位置上的任何非布尔表达式在三种语言中均会产生编译期错误。

4. **未发现语义差异**：while/do-while 结构是一个成熟的流程控制原语，在语义层面三种语言的行为完全一致，仅在命名（Swift 的 `repeat`）和循环体格式（Swift 强制大括号）上存在语法差异。
