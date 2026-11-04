# 8.9 for-of 语句 -- ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-18
**规范来源：** ArkTS Static Spec §8.9, Java JLS SE21 §14.14.2, Swift 5.x Language Guide
**测试用例：** 12 个用例（5 PASS + 4 FAIL + 3 运行时实际执行）

---

## 一、概览：三语言定位

本章节涵盖 ArkTS 中的 **for-of 语句**，该语句提供对可迭代类型元素进行迭代的能力。Java 和 Swift 中的等效特性分别为 Java 的增强 for 循环（JLS SE21 §14.14.2）和 Swift 的 for-in 循环（Swift 5.x，控制流 —— For-In 循环）。

| 语言 | 特性名称 | 规范参考 |
|------|----------|----------|
| ArkTS | for-of 语句 | ArkTS Static Spec §8.9 |
| Java | 增强 for 循环 (for-each) | JLS SE21 §14.14.2 |
| Swift | For-in 循环 | The Swift Programming Language (Swift 5.x) |

---

## 二、章节对应关系

| ArkTS 概念 | Java 对应 (JLS SE21) | Swift 对应 (5.x) |
|-----------|---------------------|-------------------|
| 数组/Iterable 迭代 | §14.14.2 增强 for 循环 | 控制流: For-In 循环 |
| 字符串迭代 | N/A（不支持隐式字符串迭代） | For-In 循环（String 是一个序列） |
| 变量声明 (let/const) | §14.14.2 循环变量 | For-In 循环（隐式 let） |
| 类型推断 | §14.14.2（Java 10+ 支持 var） | 自动推断（Swift 始终推断） |
| 非可迭代对象的编译时错误 | §14.14.2（必须是 Iterable 或数组） | 编译时错误（必须遵循 Sequence 协议） |
| 外部变量 | 明确支持 | 必须手动赋值 | N/A（必须手动赋值） |

---

## 三、关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 循环变量可变性 | `let` = 可变（默认），`const` = 不可变 | 始终可变 | 隐式 `let`（不可变） |
| 变量作用域 | `()` 内部或外部 | `()` 内部或外部（可重新赋值） | 仅限 `()` 内部 |
| 字符串迭代 | ✅ 支持，类型推断为 `string` | ❌ 不支持（必须使用 `toCharArray()`） | ✅ 支持，推断为 `Character` |
| FixedArray 支持 | ✅ 原生支持 | N/A | N/A（使用 Array） |
| 类型推断 | ✅ 支持，按可迭代类型推断 | ✅ 支持（Java 10+ 通过 `var`） | ✅ 始终支持 |
| 解构 | ❌ 不支持 | ❌ 不支持 | ✅ 支持 (`for (k, v) in dict`) |
| While 循环等效形式 | ❌ 不支持 | ❌ 不支持 | ✅ 支持（`.makeIterator()`） |
| 非可迭代对象错误提示 | ✅ 编译时错误 | ✅ 编译时错误 | ✅ 编译时错误 |
| 外部变量直接用于 for 头 | ✅ 支持 `for (elem of arr)` | ❌ 不支持，需手动赋值 | ❌ 不支持，需手动赋值 |
| 模式匹配 | ❌ 不支持 | ❌ 不支持 | ✅ 支持（case 模式、where 子句） |

---

## 四、用例 1:1 对照

### 用例 ①：数组迭代（基础 for-of）

**对应测试用例：** STMT_08_09_001, STMT_08_09_010

**ArkTS（对 Array\<int\> 执行 for-of）：**
```arkts
let arr: Array<int> = [1, 2, 3];
let sum: int = 0;
for (let x of arr) {
    sum += x;
}
// x is inferred as int (element type of Array<int>)
```

**Java（增强 for 循环）：**
```java
int[] arr = {1, 2, 3};
int sum = 0;
for (int x : arr) {
    sum += x;
}
// x is explicitly typed as int
```

**Java（配合 var，Java 10+）：**
```java
int[] arr = {1, 2, 3};
int sum = 0;
for (var x : arr) {
    sum += x;
}
// x is inferred as int
```

**Swift（for-in 循环）：**
```swift
let arr = [1, 2, 3]
var sum = 0
for x in arr {
    sum += x
}
// x is inferred as Int and is immutable (like let)
```

**分析要点：**
- 三种语言均支持以相似的语法对数组进行迭代
- ArkTS 和 Java 允许修改循环变量（ArkTS 中 `let x`，Java 中 `int x`）；Swift 默认将其设为不可变
- ArkTS 从可迭代类型推断元素类型（Array\<int\> -> int），与 Swift 的行为以及 Java 的 `var` 一致
- Java 的增强 for 循环若使用显式类型，则需要手动写出元素类型

### 用例 ②：字符串迭代

**对应测试用例：** STMT_08_09_002, STMT_08_09_011

**ArkTS（string 作为可迭代对象）：**
```arkts
let str: string = "hello";
let result: string = "";
for (let ch of str) {
    result += ch;
}
// ch is inferred as string (character type in ArkTS)
```

**Java（不支持隐式字符串迭代）：**
```java
String str = "hello";
StringBuilder result = new StringBuilder();
for (char ch : str.toCharArray()) {
    result.append(ch);
}
// Must explicitly convert to char[]; ch is char type
```

**Java（使用 codePoints，Java 8+）：**
```java
String str = "hello";
StringBuilder result = new StringBuilder();
for (int cp : str.codePoints().toArray()) {
    result.appendCodePoint(cp);
}
// Handles Unicode supplementary characters
```

**Swift（string 作为序列）：**
```swift
let str = "hello"
var result = ""
for ch in str {
    result.append(ch)
}
// ch is inferred as Character (a Unicode grapheme cluster)
```

**分析要点：**
- ArkTS 和 Swift 均支持直接对字符串进行迭代；Java 需要显式转换
- ArkTS 将元素类型推断为 `string`（单字符）；Swift 推断为 `Character`；Java 使用 `char` 或 `int`（代码点）
- Swift 的字符串迭代具备 Unicode 字形簇感知能力（Character）；ArkTS 的迭代行为取决于具体实现
- Java 的 `toCharArray()` 无法正确处理补充 Unicode 字符；使用 `codePoints()` 更安全

### 用例 ③：循环变量的 const 安全性

**对应测试用例：** STMT_08_09_003, STMT_08_09_008

**ArkTS（let vs const）：**
```arkts
// let -- mutable: allowed
let arr: Array<int> = [1, 2, 3];
for (let x of arr) {
    x = x * 2;  // OK: x is mutable
}

// const -- immutable: compile-time error
for (const x of [1, 2, 3]) {
    x = 42;  // Error: cannot assign to const variable
}
```

**Java（始终可变）：**
```java
int[] arr = {1, 2, 3};
for (int x : arr) {
    x = x * 2;  // OK: x is mutable
}

// No const-equivalent for loop variables
// intelliJ may warn if x is never modified, but it compiles
```

**Swift（隐式不可变 -- 最接近 ArkTS 的 const）：**
```swift
let arr = [1, 2, 3]
for x in arr {
    x = x * 2  // Error: x is a let constant
}

// To mutate, use a local variable:
for x in arr {
    var mutableX = x
    mutableX *= 2
}
```

**分析要点：**
- ArkTS 最为灵活：对循环变量同时提供 `let`（可变）和 `const`（不可变）两种选择
- Swift 默认不可变（类似 ArkTS 的 `const`），没有内置的可变循环变量语法
- Java 始终允许修改，但对循环变量不提供不可变性强制机制
- ArkTS 显式的 `const` 提供了编译时安全保护以防止意外修改 —— 这是一项独特的优势
- ArkTS 中 `let` 作为默认选项，兼顾两者之长：需要时可修改，需要安全时可用 const

### 用例 ④：外部变量模式

**对应测试用例：** STMT_08_09_004, STMT_08_09_007, STMT_08_09_012

**ArkTS（直接外部变量赋值）：**
```arkts
let arr: Array<int> = [1, 2, 3, 4, 5];
let elem: int = 0;
let sum: int = 0;
for (elem of arr) {     // Direct: element assigned to external variable each iteration
    sum += elem;
}
// After loop: elem == 5 (last element)

// Type mismatch: compile-time error
let str: string = "hello";
let num: int = 0;
for (num of str) {      // Error: string element cannot assign to int variable
}
```

**Java（需手动赋值）：**
```java
int[] arr = {1, 2, 3, 4, 5};
int elem = 0;
int sum = 0;
for (int x : arr) {
    elem = x;           // Must manually assign
    sum += elem;
}
// After loop: elem == 5
```

**Swift（需手动赋值）：**
```swift
let arr = [1, 2, 3, 4, 5]
var elem = 0
var sum = 0
for x in arr {
    elem = x            // Must manually assign
    sum += elem
}
// After loop: elem == 5
```

**分析要点：**
- ArkTS 独有地支持将外部声明的变量直接用作 forVariable，无需在循环体内部编写单独的赋值语句
- Java 和 Swift 需要使用中间循环变量并手动赋值
- ArkTS 对外部变量执行编译时类型检查（元素类型必须可赋值给变量类型），提供与 Java/Swift 同等的类型安全性
- 外部变量模式在不牺牲类型安全性的前提下实现了语法简洁
- 在三种语言中，循环结束后外部变量均持有最后一个被迭代元素的值

### 用例 ⑤：FixedArray 迭代

**对应测试用例：** STMT_08_09_005

**ArkTS（FixedArray\<T\> 原生支持）：**
```arkts
let fixedArr: FixedArray<int> = new FixedArray<int>(3);
fixedArr[0] = 10;
fixedArr[1] = 20;
fixedArr[2] = 30;
let sum: int = 0;
for (let x of fixedArr) {
    sum += x;
}
// x is inferred as int (element type of FixedArray<int>)
```

**Java（无 FixedArray 等价类型）：**
```java
// No fixed-length array type exists
int[] arr = {10, 20, 30};
int sum = 0;
for (int x : arr) {
    sum += x;
}
```

**Swift（Array 为值类型，不需要固定大小）：**
```swift
// Swift's Array is a value type; fixed-size semantics not built-in
let arr = [10, 20, 30]
var sum = 0
for x in arr {
    sum += x
}
```

**分析要点：**
- FixedArray\<T\> 是 ArkTS 特有的类型，提供固定长度数组语义
- ArkTS 的 for-of 原生支持 FixedArray\<T\>，并可将类型推断为 T
- Java 和 Swift 使用常规的数组/Array 类型，均为可变长度
- 在 ArkTS 中，对 FixedArray\<T\> 的迭代行为与 Array\<T\> 完全一致

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 数组/Iterable 迭代 | 5/5 | 5/5 | 5/5 |
| 字符串迭代 | 5/5（原生支持） | 3/5（必须转换） | 5/5（原生支持，Unicode 感知） |
| 类型安全性（拒绝非可迭代对象） | 5/5 | 5/5 | 5/5 |
| 变量可变性控制 | 5/5（let vs const） | 3/5（始终可变） | 4/5（隐式 let，无可变替代方案） |
| 外部变量便捷性 | 5/5（直接支持） | 3/5（手动赋值） | 3/5（手动赋值） |
| 类型推断 | 5/5 | 4/5（Java 10 起支持） | 5/5 |
| FixedArray 支持 | 5/5 | N/A | N/A |
| 模式匹配 / 解构 | 2/5 | 2/5 | 5/5 |
| Unicode 字符串处理 | 3/5（取决于实现） | 3/5（通过 codePoints） | 5/5（字形簇） |

---

## 六、核心结论

| 角度 | 结论 |
|------|------|
| **语法** | 三者相似：`for (var of expr)` / `for (var : expr)` / `for var in expr` |
| **可迭代类型** | ArkTS 支持 Array\<T\>、FixedArray\<T\>、string、Iterable\<T\> —— 范围合理 |
| **变量可变性** | ArkTS 最优：显式地同时提供 `let`（可变）和 `const`（不可变）两种选择 |
| **字符串迭代** | ArkTS = Swift > Java（Java 需要显式转换） |
| **外部变量** | ArkTS 独有的便捷特性：可在循环头中直接赋值 |
| **模式匹配** | Swift > ArkTS = Java（Swift 支持解构和 where 子句） |
| **FixedArray** | ArkTS 独有特性，Java 和 Swift 中不存在 |

### 关键洞察

1. **ArkTS 的 for-of 设计良好，紧跟 Swift 的风格**：两者均支持原生字符串迭代、类型推断以及默认不可变（Swift）或可选不可变（ArkTS）。

2. **ArkTS 对循环变量的 `let`/`const` 区分是一项独特优势**：目前尚无其余语言在循环变量声明层面提供显式的可变性控制。

3. **字符串迭代与 Swift 持平**：ArkTS 像 Swift 一样将 string 视为可迭代类型，避免了 Java 笨拙的 `toCharArray()` / `codePoints()` 转换。

4. **外部变量直接赋值是一项便捷特性**：ArkTS 省去了声明中间变量并手动赋值的样板代码。

5. **Java 仍然缺乏字符串迭代和 const 安全性**：Java 的增强 for 循环是最基础的版本 —— 不支持字符串迭代、不支持 const、没有类型推断（除非使用 `var`，Java 10 起）。

### ArkTS 设计建议

1. **保留 `let`/`const` 区分**：这是该语言在迭代上下文中的一项独特优势。
2. **建议明确文档化 Unicode 行为**：如果字符串迭代以代码单元、代码点或字形簇为单位，规范应加以明确说明。
3. **不建议修改**：§8.9 for-of 语句与现代语言实践高度对齐。

---

## 七、规范参考

| 语言 | 规范来源 |
|------|----------|
| ArkTS | ArkTS Static Spec Section 8.9 for-of Statements |
| Java | JLS SE21 Section 14.14.2 The enhanced for statement |
| Swift | The Swift Programming Language: Control Flow -- For-In Loops |
