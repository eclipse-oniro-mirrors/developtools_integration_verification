# 8.11 continue 语句 - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-18
**规范来源：** ArkTS Static Spec §8.11, Java JLS SE21 §14.16, Swift 5.x Language Guide

---

## 一、概览：三语言定位

本报告对 ArkTS（第 8.11 节）、Java（JLS SE21 第 14.16 节）与 Swift 5.x 中的 `continue` 语句进行对比。`continue` 语句是一种控制流结构，用于将控制权转移到外层循环的下一次迭代，可选择性地通过标签指定目标循环。

| 语言 | 定位 | 设计哲学 |
|------|------|----------|
| ArkTS | 面向 OpenHarmony 生态的安全型静态语言 | 在保留 TypeScript 开发者熟悉度的前提下，消除运行时陷阱；`continue` 语义与 Java/Swift 完全一致 |
| Java (JLS SE21) | 跨平台的成熟工业级语言 | 经典的 C 系 `continue` 语义：支持无标签和有标签两种形式，标签必须标注在循环语句上 |
| Swift 5.x | 面向 Apple 平台的现代安全型语言 | `continue` 语义与主流语言一致；标签仅允许标注在循环语句上，不允许标注在任意代码块上 |

---

## 二、章节对应关系

| ArkTS 概念 | Java 对应 (JLS SE21) | Swift 对应 (5.x) |
|------------|----------------------|-------------------|
| `continue` 语句 — 无标签形式，跳转到最内层循环的下一次迭代 | 14.16 — The continue Statement，无标签形式，语义完全一致 | Control Flow / Continue — 无标签形式，语义完全一致 |
| `continue identifier` — 带标签形式，跳转到指定标签循环的下一次迭代 | 14.16 — continue Identifier ; 带标签形式，标签必须标注在循环语句上 | continue labelName — 带标签形式，标签必须标注在循环语句上 |
| 编译时错误：`continue` 出现在循环外部 | 14.16 — 编译时错误，与 ArkTS 一致 | 编译时错误，与 ArkTS 一致 |
| 编译时错误：`continue` 的目标标签不在循环语句上 | 14.16 — 编译时错误，标签必须是循环语句的标签 | Swift 不允许在非循环语句上加标签，该场景在语法层面即被排除 |

---

## 三、关键差异矩阵

| 类别 | ArkTS 8.11 | Java JLS SE21 14.16 | Swift 5.x |
|------|------------|---------------------|-----------|
| **语法** | `continue identifier?` | `continue Identifier? ;` | `continue labelName?` |
| **无标签语义** | 跳转到最内层外层循环的下一次迭代 | 跳转到最内层外层循环的下一次迭代 | 跳转到最内层外层循环的下一次迭代 |
| **带标签语义** | 跳转到指定标签循环的下一次迭代 | 跳转到指定标签语句的下一次迭代（标签必须标注在循环上） | 跳转到指定标签循环的下一次迭代 |
| **标签标注在非循环语句上** | 编译时错误 | 编译时错误（14.16：标签必须在循环语句上） | 编译时错误 |
| **出现在循环外部** | 编译时错误 | 编译时错误 | 编译时错误 |
| **标签作用域** | 任意外层循环 | 任意外层带标签且为循环的语句 | 任意外层循环 |
| **是否允许在任意代码块上加标签？** | 是（但 `continue` 指向代码块标签时报错） | 是（但 `continue` 指向代码块标签时报错，14.16） | 否（标签仅允许在循环语句上） |

---

## 四、用例 1:1 对照

### 用例 ①：for 循环中的无标签 continue（跳过当前迭代）

**ArkTS:**
```typescript
let sum: number = 0;
for (let i: number = 0; i < 5; i++) {
    if (i == 3) {
        continue;
    }
    sum += i;
}
// sum = 0 + 1 + 2 + 4 = 7
```

**Java (JLS SE21):**
```java
int sum = 0;
for (int i = 0; i < 5; i++) {
    if (i == 3) {
        continue;
    }
    sum += i;
}
// sum = 0 + 1 + 2 + 4 = 7
```

**Swift 5.x:**
```swift
var sum = 0
for i in 0..<5 {
    if i == 3 {
        continue
    }
    sum += i
}
// sum = 0 + 1 + 2 + 4 = 7
```

**结论**：功能完全一致。仅在语法层面存在差异（Swift 使用区间运算符 `..<` 替代 C 风格 for 循环，但语义相同）。三种语言均跳过第 3 次迭代，结果 sum = 7。

---

### 用例 ②：嵌套 for 循环中的带标签 continue

**ArkTS:**
```typescript
let result: string = "";
outer: for (let i: number = 0; i < 3; i++) {
    for (let j: number = 0; j < 3; j++) {
        if (j == 1) {
            continue outer;
        }
        result = result + i + "," + j + ";";
    }
}
// result = "0,0;1,0;2,0;"
```

**Java (JLS SE21):**
```java
String result = "";
outer: for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
        if (j == 1) {
            continue outer;
        }
        result = result + i + "," + j + ";";
    }
}
// result = "0,0;1,0;2,0;"
```

**Swift 5.x:**
```swift
var result = ""
outer: for i in 0..<3 {
    for j in 0..<3 {
        if j == 1 {
            continue outer
        }
        result += "\(i),\(j);"
    }
}
// result = "0,0;1,0;2,0;"
```

**结论**：功能完全一致。三种语言均通过带标签的 `continue` 跳转到外层循环的下一次迭代。Swift 使用字符串插值 `\(i),\(j)`，而 ArkTS/Java 使用字符串拼接，但行为语义完全相同。

---

### 用例 ③：while 循环中的 continue（跳过偶数）

**ArkTS:**
```typescript
let sum: number = 0;
let i: number = 0;
while (i < 10) {
    i++;
    if (i % 2 == 0) {
        continue;
    }
    sum += i;
}
// sum = 1 + 3 + 5 + 7 + 9 = 25
```

**Java (JLS SE21):**
```java
int sum = 0;
int i = 0;
while (i < 10) {
    i++;
    if (i % 2 == 0) {
        continue;
    }
    sum += i;
}
// sum = 1 + 3 + 5 + 7 + 9 = 25
```

**Swift 5.x:**
```swift
var sum = 0
var i = 0
while i < 10 {
    i += 1
    if i % 2 == 0 {
        continue
    }
    sum += i
}
// sum = 1 + 3 + 5 + 7 + 9 = 25
```

**结论**：功能完全一致。在 `while` 循环上下文中，`continue` 语句在三种语言中的行为完全相同，均跳过偶数、仅累加奇数。

---

### 用例 ④：编译时错误 — continue 出现在循环外部

**ArkTS:**
```typescript
function testContinueOutsideLoop(): void {
    let x: number = 0;
    x++;
    continue; // compile-time error
}
```

**Java (JLS SE21):**
```java
void testContinueOutsideLoop() {
    int x = 0;
    x++;
    continue; // compile-time error (14.16)
}
```

**Swift 5.x:**
```swift
func testContinueOutsideLoop() {
    var x = 0
    x += 1
    continue // compile-time error
}
```

**结论**：功能完全一致。三种语言均强制要求：当 `continue` 出现在任何外层循环语句之外时，产生编译时错误。

---

### 用例 ⑤：编译时错误 — 标签指向非循环代码块

**ArkTS:**
```typescript
blockLabel: {
    for (let i: number = 0; i < 10; i++) {
        if (i == 5) {
            continue blockLabel; // compile-time error: blockLabel is not a loop
        }
    }
}
```

**Java (JLS SE21):**
```java
blockLabel: {
    for (int i = 0; i < 10; i++) {
        if (i == 5) {
            continue blockLabel; // compile-time error: blockLabel is not a loop
        }
    }
}
```

**Swift 5.x:**
```swift
// Swift does not allow labels on arbitrary blocks, only on loops.
// This scenario cannot be expressed in Swift.
```

**结论**：ArkTS 与 Java 行为完全一致：两者均允许在任意语句上加标签，但当 `continue` 的目标标签标注在非循环语句上时，产生编译时错误。Swift 的处理方式不同：它将标签限制为仅可用于循环语句，因此该场景在语法层面就不可能构造出来。这是微小的语言设计差异，而非语义偏差。

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语法兼容性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 无标签语义一致性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 带标签语义一致性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 错误检测覆盖度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 特性完备度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **综合得分** | **5/5** | **5/5** | **5/5** |

| 对比维度 | ArkTS vs Java | ArkTS vs Swift | 备注 |
|----------|--------------|----------------|------|
| 语法兼容性 | 5/5 | 5/5 | 语法几乎一致 |
| 无标签语义 | 5/5 | 5/5 | 行为完全一致 |
| 带标签语义 | 5/5 | 5/5 | 行为完全一致 |
| 错误检测 | 5/5 | 5/5 | 编译时错误条件相同 |
| 特性完备度 | 5/5 | 5/5 | 支持所有循环类型（for、while、do-while） |
| **综合得分** | **5/5** | **5/5** | **完全兼容** |

---

## 六、核心结论

1. **语义完全对齐**：ArkTS 的 `continue` 语句（第 8.11 节）与 Java 的 `continue` 语句（JLS SE21 14.16）以及 Swift 的 `continue` 语句在语义上完全一致。在任何循环上下文中，`continue` 转移控制权的方式均不存在行为差异。

2. **无 ArkTS 专属限制**：与 ArkTS 中某些为安全性而施加更严格类型约束的特性（如移除 `any`、禁止 `null`）不同，`continue` 语句没有任何超出 Java 和 Swift 所强制要求的 ArkTS 专属限制。

3. **微小的语法上下文差异**：Swift 使用字符串插值和区间运算符语法，但 `continue` 关键字及其标签行为完全一致。Swift 不支持在任意代码块语句上加标签，而 ArkTS 和 Java 均支持（不过两者在 `continue` 的目标为代码块标签而非循环标签时都会报错）。

4. **生产就绪**：ArkTS 中的 `continue` 语句实现已成熟且与主流语言完全兼容。本次对比未发现任何缺口、不一致或设计缺陷。

5. **跨语言可移植性**：使用 `continue` 语句（无论无标签还是带标签）的代码，在 ArkTS、Java 和 Swift 之间可以无缝移植，仅需调整语法细节（如类型标注、字符串拼接风格等）。
