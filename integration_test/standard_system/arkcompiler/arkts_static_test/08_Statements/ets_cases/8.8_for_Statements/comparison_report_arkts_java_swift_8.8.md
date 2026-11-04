# 8.8 for 语句 - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-18
**规范来源：** ArkTS Static Spec §8.8 for Statements, Java JLS SE21 §14, Swift 5.x Language Guide
**测试基础：** 9 个用例（5 PASS + 2 FAIL + 2 runtime 真实执行）

---

## 一、概览：三语言定位

ArkTS §8.8 定义了 **for 语句 (for Statement)** 的语法和语义，采用标准 C 风格三部分循环结构：

```
forStatement: 'for' '(' forInit? ';' forContinue? ';' forUpdate? ')' statement
```

| 语言 | 定位 | 设计哲学 |
|------|------|---------|
| ArkTS | 移动端系统编程语言，OpenHarmony 生态核心 | 保留 C 风格 for 循环，与 Java 生态保持高度一致 |
| Java | 通用企业级编程语言，Android 生态基石 | C 风格 for 循环作为基础控制流结构保留至今 |
| Swift | Apple 生态现代编程语言 | Swift 2.0+ 已移除 C 风格 for 循环，推荐 for-in / while |

**核心规则：**
- forInit 可省略（空语句），可在其中声明新变量或使用表达式
- forContinue 表达式类型必须为 boolean（或 Extended Conditional Expressions），否则编译时错误
- forContinue 可省略（相当于 true，无限循环）
- forUpdate 可省略
- 在 forInit 中声明的变量具有循环作用域（loop scope），循环外不可访问
- 可以使用已存在的变量作为循环索引

---

## 二、章节对应关系

| ArkTS 概念 | Java 对应 (JLS SE21) | Swift 对应 (5.x) |
|------------|---------------------|-------------------|
| `for (init; continue; update)` | `for (init; continue; update)` (JLS §14.14.1) | ❌ 已移除（Swift 2.0+），使用 `for-in` / `while` 替代 |
| forInit 声明变量 `let i: int = 0` | `int i = 0` | N/A（无 C 风格 for） |
| forInit 使用已有变量 `for (; i < n; i++)` | `for (; i < n; i++)` | N/A |
| forContinue 类型必须为 boolean | 一致（非 boolean → 编译错误） | N/A（while 条件同样要求 Bool） |
| forContinue 为空（隐式 true） | 一致（无限循环） | N/A |
| 循环作用域（loop scope） | 一致（forInit 变量仅在循环体内可见） | N/A |

---

## 三、关键差异矩阵

### 3.1 语法结构

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| C 风格 for 循环 | ✅ `for (init; continue; update)` | ✅ `for (init; continue; update)` | ❌（Swift 2.0 移除） |
| for-in 循环 | ✅ `for x of expr` | ✅ `for (T x : iterable)` | ✅ `for x in sequence` |
| forInit 声明变量 | ✅ `let i: int = 0` / `let i = 0` | ✅ `int i = 0` | N/A |
| forInit 使用已有变量 | ✅ `for (; i < n; i++)` | ✅ `for (; i < n; i++)` | N/A |
| forContinue 为空 | ✅ 隐式 `true` | ✅ 隐式 `true` | N/A |
| forUpdate 为空 | ✅ 允许 | ✅ 允许 | N/A |

**关键差异：** Swift 从 2.0 起移除了 C 风格 for 循环，推荐使用 `for-in` 或 `while`。ArkTS 和 Java 保留了该结构。

### 3.2 条件表达式类型检查

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| forContinue 类型必须为 boolean | ✅ OK | ✅ OK | N/A |
| 隐式类型转换 | ❌ 不允许 | ❌ 不允许 | N/A |
| 编译时错误 | ✅ 非 boolean → error | ✅ 非 boolean → error | N/A |

**说明：** Swift 无 C 风格 for 循环，无此比对项。但类似场景 `while i { }` 同样编译错误。Java 与 ArkTS 行为完全一致。

### 3.3 变量作用域

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| forInit 变量作用域 | ✅ 循环体内 | ✅ 循环体内 | N/A（无 C 风格 for） |
| 循环外访问 | ❌ 编译错误 | ❌ 编译错误 | N/A |
| 已有变量修改 | ✅ 允许（forInit 为空） | ✅ 允许（forInit 为空） | N/A |

---

## 四、用例 1:1 对照

### 用例 ①：基础 for 循环（STMT_08_08_001 / 008）

**ArkTS：**
```typescript
let sum: int = 0
for (let i: int = 0; i < 5; i++) {
    sum = sum + i
}
// sum == 10
```

**Java：**
```java
int sum = 0;
for (int i = 0; i < 5; i++) {
    sum = sum + i;
}
// sum == 10
```

**Swift（使用 while 模拟，因 Swift 无 C 风格 for）：**
```swift
var sum = 0
var i = 0
while i < 5 {
    sum += i
    i += 1
}
// sum == 10
```

**结论：** ArkTS 与 Java 语法几乎完全一致。Swift 开发者需使用 `while` 或 `for-in`。

---

### 用例 ②：类型推导（STMT_08_08_002）

**ArkTS：**
```typescript
let sum: int = 0
for (let i = 0; i < 5; i++) {  // i 自动推导为 int
    sum = sum + i
}
```

**Java：**
```java
int sum = 0;
for (var i = 0; i < 5; i++) {  // var 推导（Java 10+）
    sum = sum + i;
}
```

**Swift（使用 stride，更 Swift 风格的替代）：**
```swift
var sum = 0
for i in 0..<5 {    // 类型自动推导为 Int
    sum += i
}
```

**结论：** 三者均支持类型推导。ArkTS `let i = 0` 等价于 Java `var i = 0`（Java 10+）。Swift 使用 `for-in` 加 range 实现同样效果。

---

### 用例 ③：已存在变量作循环索引（STMT_08_08_003 / 009）

**ArkTS：**
```typescript
let idx: int = 0
let sum: int = 0
for (; idx < 5; idx++) {
    sum = sum + idx
}
// idx == 5, sum == 10
```

**Java：**
```java
int idx = 0;
int sum = 0;
for (; idx < 5; idx++) {
    sum = sum + idx;
}
// idx == 5, sum == 10
```

**Swift（while 等价）：**
```swift
var idx = 0
var sum = 0
while idx < 5 {
    sum += idx
    idx += 1
}
// idx == 5, sum == 10
```

**结论：** ArkTS 与 Java 完全一致——forInit 留空，使用外部变量。Swift 需用 `while`。

---

### 用例 ④：非 boolean 条件编译错误（STMT_08_08_006）

**ArkTS（编译错误）：**
```typescript
for (let i = 0; i; i++) {   // ❌ i 为 int，非 boolean
    sum = sum + i
}
```

**Java（编译错误）：**
```java
for (int i = 0; i; i++) {   // ❌ Type mismatch: cannot convert from int to boolean
    sum = sum + i;
}
```

**Swift：** 无 C 风格 for 循环，但类似场景 `while i { }` 同样编译错误。

**结论：** 三者一致严格执行 boolean 条件检查，无隐式转换。

---

### 用例 ⑤：forInit 变量作用域（STMT_08_08_007）

**ArkTS（编译错误）：**
```typescript
for (let loopIdx: int = 0; loopIdx < 5; loopIdx++) { }
let after: int = loopIdx   // ❌ loopIdx 不在作用域内
```

**Java（编译错误）：**
```java
for (int loopIdx = 0; loopIdx < 5; loopIdx++) { }
int after = loopIdx;   // ❌ loopIdx cannot be resolved to a variable
```

**结论：** ArkTS 与 Java 完全一致，forInit 声明的变量严格限定在循环体内。

---

### 用例 ⑥：forContinue 为空（STMT_08_08_005）

**ArkTS：**
```typescript
let sum: int = 0
for (let i = 0; ; i++) {
    if (i >= 5) { break }
    sum = sum + i
}
```

**Java：**
```java
int sum = 0;
for (int i = 0; ; i++) {
    if (i >= 5) break;
    sum = sum + i;
}
```

**结论：** 空 forContinue 在 ArkTS 和 Java 中均视为 `true`（无限循环），需内部 break 退出。语义完全一致。

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| C 风格 for 循环支持 | ⭐ OK | ⭐ OK | ❌（已移除） |
| 非 boolean 条件拒绝 | ⭐ OK | ⭐ OK | N/A |
| 循环作用域 | ⭐ OK | ⭐ OK | N/A |
| 类型推导 | ⭐ OK (let) | ⭐ OK (var, Java 10+) | ⭐ OK（for-in 天然推导） |
| 已有变量作为索引 | ⭐ OK | ⭐ OK | N/A |
| 空 forInit/forContinue/forUpdate | ⭐ OK | ⭐ OK | N/A |

---

## 六、核心结论

| 角度 | 结论 |
|------|------|
| **语法一致性** | ArkTS for 循环与 Java 几乎完全一致 |
| **Swift 差异** | Swift 2.0+ 已移除 C 风格 for 循环，使用 for-in/while 替代 |
| **类型安全性** | 三者（含 Swift while）均严格执行 boolean 条件 |
| **作用域规则** | ArkTS 与 Java 完全一致 |

### 关键启示

1. **ArkTS §8.8 设计与 Java JLS §14.14.1 基本一致**——语法、语义、作用域规则高度吻合
2. **Swift 已移除 C 风格 for 循环**——从 Swift 迁移到 ArkTS 的开发者需要注意此差异
3. **非 boolean 条件编译拒绝**是三者一致的严格类型安全设计
4. **空 forContinue 相当于 true**是标准行为，与 C/Java 一致
5. **循环作用域**规则与 Java 完全一致，forInit 变量在循环结束后不可访问

### ArkTS 设计建议

1. 保留 C 风格 for 循环（与 Java 生态保持一致，ArkTS 目标是替代 Java 在移动端的应用）
2. 保留类型推导（`let i = 0` 等价于 Java `var i = 0`）
3. 保留非 boolean 条件的严格编译拒绝（类型安全）

---

## 对应规范文档

| 语言 | 规范来源 |
|------|---------|
| ArkTS | ArkTS Static Spec §8.8 for Statements |
| Java | JLS SE21 §14.14.1 The basic for Statement |
| Swift | The Swift Programming Language: Control Flow (Swift 2.0+ removed C-style for-loops) |
