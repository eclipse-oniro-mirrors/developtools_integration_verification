# 8.14 throw 语句 - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-18
**规范来源：** ArkTS Static Spec §8.14 throw 语句, Java JLS SE21 §14, Swift 5.x Language Guide

---

## 一、概览：三语言定位

| 语言 | 定位 | 异常处理哲学 |
|------|------|-------------|
| ArkTS | 移动端/嵌入式应用开发语言 | 仅允许抛出 `Error` 子类，编译期拒绝 `null`/`undefined`，无需受检异常声明 |
| Java | 通用企业级编程语言 | 允许抛出整个 `Throwable` 层次，具备受检异常（checked exception）机制，方法签名需声明 `throws` |
| Swift | Apple 平台安全导向语言 | 允许任何遵循 `Error` 协议的类型，通过 `throws` 关键字标记抛出函数，无受检异常 |

ArkTS §8.14 定义了 **throw 语句** 的语法和语义：

- **语法：** `throwStatement: 'throw' expression`
- **类型约束：** 表达式类型必须可赋值给 `Error` 类型（否则编译时错误）
- **禁止值：** `null` 和 `undefined` 不能抛出（编译时错误）
- **执行语义：** 可在代码任意位置抛出；若无 `try` 捕获，触发 `UncaughtExceptionError`

---

## 二、章节对应关系

| ArkTS 概念 | Java 对应 (JLS SE21) | Swift 对应 (5.x) |
|-----------|---------------------|-------------------|
| throw 语法、类型约束 | §14.18 throw Statement | Error Handling: throw |
| Error 子类可抛出 | §11.2 Compile-Time Checking of Exceptions | Error 协议遵循 |
| 无受检异常 | throws 关键字 + 受检异常机制 | throws 标记 + do-catch |
| catch 块无类型声明 | catch (SpecificException e) | catch let error as SpecificError |

---

## 三、关键差异矩阵

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 可抛出类型 | `Error` 及其子类 | `Throwable` 及其子类 | 任何遵循 `Error` 协议的类型 |
| 禁止值 | `null`, `undefined`（编译期） | `null`（运行时 NullPointerException） | `nil`（编译期，类型不匹配） |
| throw 语法 | `throw expression` | `throw expression;` | `throw expression` |
| 受检异常 (Checked) | 无 | `throws` 关键字在方法签名中声明 | `throws` 在函数签名中声明 |
| catch 类型 | 仅 catch Error 及子类 | `catch (SpecificException e)` | `catch let error as SpecificError` |
| 是否需要 try | 可选 | 受检异常必须 try 或 throws | 可选（需 `try`/`try!`/`try?`） |
| 空抛出 | 不允许编译 | `throw null` 允许编译（运行抛 NPE） | 类型系统禁止 |
| 运行时无 catch | `UncaughtExceptionError` | `UncaughtExceptionHandler` | 传播到顶层 |

| 差异维度 | ArkTS | Java | Swift | 安全等级 |
|---------|-------|------|-------|---------|
| 编译期 null 拦截 | ✅ 编译期错误 | ❌ 运行时 NPE | ✅ 编译期错误 | ArkTS = Swift > Java |
| 可抛出类型范围 | ⚠️ 仅 Error 子类（窄） | ✅ Throwable 全层次（宽） | ✅ 任意 Error 协议（灵活） | Java 最宽、Swift 最灵活 |
| catch 类型声明 | ✅ 无需显式类型 | ❌ 必须声明异常类型 | ⚠️ 需模式匹配 | ArkTS 最简洁 |
| 受检异常机制 | ❌ 无 | ✅ 有 | ✅ throws 标记 | Java/Swift 更严格 |
| rethrow 支持 | ✅ 支持 | ✅ 支持 | ✅ 支持（隐式 error） | 三语言均支持 |

---

## 四、用例 1:1 对照

### 用例 ①：直接抛出 Error 实例（STMT_08_14_001）

**ArkTS（编译通过）：**
```typescript
function testThrowNewError(): void {
    throw new Error("test error message");
}
```

**Java（同语义 Throwable 层次）：**
```java
void testThrowNewError() {
    throw new RuntimeException("test error message");
    // Java 中必须声明 throws 如果是受检异常（Exception），这里用 RuntimeException 非受检
}
```

**Swift（同语义 Error 协议）：**
```swift
func testThrowNewError() throws {
    throw NSError(domain: "test", code: 1, userInfo: [NSLocalizedDescriptionKey: "test error message"])
    // 或使用遵循 Error 协议的自定义类型
}
```

**分析：** 三语言均支持抛出异常/错误对象。ArkTS 仅允许 `Error` 子类；Java 允许整个 `Throwable` 层次（含 `Throwable`、`Exception`、`RuntimeException`、`Error`）；Swift 允许任何遵循 `Error` 协议的类型（通常为 `enum` 或 `struct`）。

---

### 用例 ②：抛出非 Error 类型被禁止（STMT_08_14_005 _FAIL_throw_string）

**ArkTS（编译失败）：**
```typescript
function testThrowString(): void {
    throw "this is a string, not an error";  // ❌ 编译错误：string 不可赋值给 Error
}
```

**Java（同样编译失败）：**
```java
void testThrowString() {
    throw "this is a string, not an error";  // ❌ 编译错误：String 不是 Throwable
}
```

**Swift（同样编译失败）：**
```swift
func testThrowString() throws {
    throw "this is a string, not an error"  // ❌ 编译错误：String 不遵循 Error 协议
}
```

**分析：** 三语言在类型安全上一致——`throw` 不接受任意类型。但允许的类型层级不同：ArkTS = `Error` 子树、Java = `Throwable` 子树（范围更广）、Swift = `Error` 协议（更灵活）。

---

### 用例 ③：抛出 null / undefined（STMT_08_14_006 / 007）

**ArkTS（编译失败）：**
```typescript
function testThrowNull(): void {
    throw null;       // ❌ 编译错误：null 不能抛出
}

function testThrowUndefined(): void {
    throw undefined;  // ❌ 编译错误：undefined 不能抛出
}
```

**Java（编译通过，运行时异常）：**
```java
void testThrowNull() {
    throw null;       // ✅ 编译通过
                      // ⚠️ 运行时抛出 NullPointerException
}
```

**Swift（编译失败）：**
```swift
func testThrowNil() throws {
    throw nil          // ❌ 编译错误：nil 不能作为 Error 抛出
}
```

**分析：** ArkTS 和 Swift 在编译期就拒绝了 `null`/`nil` 的抛出；Java 允许 `throw null` 通过编译，只有在运行时才会抛出 `NullPointerException`。ArkTS 的设计更为安全。

---

### 用例 ④：try-catch 捕获 throw（STMT_08_14_008 _RUNTIME_throw_caught）

**ArkTS（运行时）：**
```typescript
function main(): void {
    let caught: boolean = false;
    try {
        throw new Error("caught exception");
    } catch (e) {
        caught = true;
    }
    if (!caught) {
        throw new Error("throw_caught: expected exception to be caught");
    }
}
```

**Java（同语义）：**
```java
void main() {
    boolean caught = false;
    try {
        throw new RuntimeException("caught exception");
    } catch (RuntimeException e) {
        caught = true;
    }
    assert caught : "expected exception to be caught";
}
```

**Swift（同语义）：**
```swift
func main() throws {
    var caught = false
    do {
        throw NSError(domain: "test", code: 1)
    } catch {
        caught = true
    }
    assert(caught, "expected exception to be caught")
}
```

**分析：** 三语言在基本的 try-catch 语义上一致。ArkTS 的 `catch (e)` 无需指定类型（等同于 `catch (Error e)`），这是与 Java 需要指定异常类型、Swift 需要模式匹配的重要区别。

---

### 用例 ⑤：catch 块中 rethrow（STMT_08_14_009 _RUNTIME_throw_rethrow）

**ArkTS（运行时）：**
```typescript
function main(): void {
    let caught: boolean = false;
    try {
        try {
            throw new Error("inner error");
        } catch (e) {
            throw e;           // rethrow
        }
    } catch (e) {
        caught = true;         // 外层捕获 rethrown 异常
    }
    if (!caught) {
        throw new Error("throw_rethrow: expected rethrown exception to be caught");
    }
}
```

**Java（同语义）：**
```java
void main() {
    boolean caught = false;
    try {
        try {
            throw new RuntimeException("inner error");
        } catch (RuntimeException e) {
            throw e;           // rethrow
        }
    } catch (RuntimeException e) {
        caught = true;
    }
    assert caught;
}
```

**Swift（同语义）：**
```swift
func main() throws {
    var caught = false
    do {
        do {
            throw NSError(domain: "test", code: 1)
        } catch {
            throw error        // rethrow 使用 error
        }
    } catch {
        caught = true
    }
    assert(caught)
}
```

**分析：** 三语言均支持 rethrow，语法类似。Swift 在 catch 块中通过 `error` 变量（隐式绑定）重新抛出；ArkTS 和 Java 通过 catch 块中声明的变量重新抛出。

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类型安全（编译期 null 拦截） | 良好 | 一般（null 运行时抛） | 良好 |
| throw 类型灵活性 | 中等（仅 Error 子类） | 高（整个 Throwable 层次） | 高（Any Error 协议类型） |
| catch 语法简洁性 | 良好（无需显式类型） | 中等（需声明异常类型） | 良好（需模式匹配） |
| 受检异常机制 | 无 | 有（throws 声明） | 有（throws 标记） |
| 运行时异常传播 | ✅ 与 Java 一致 | ✅ 与 ArkTS 一致 | ✅ 与 ArkTS 一致 |

---

## 六、核心结论

| 角度 | 结论 |
|------|------|
| **基本 throw 语义** | 三语言一致 |
| **类型约束** | ArkTS（Error 子类）= Java（Throwable 子类）> Swift（Error 协议更灵活） |
| **null 防护** | ArkTS = Swift（编译期）> Java（运行时） |
| **catch 机制** | ArkTS 更简洁（无需类型声明） |
| **rethrow 能力** | 三语言均支持 |

### 关键启示

1. **ArkTS §8.14 与 Java/Swift 设计方向一致**：都要求在编译期约束 throw 表达式的类型
2. **null/undefined 编译期拒绝** 是 ArkTS 相比 Java 的安全优势
3. **ArkTS 只允许 Error 子类** 的设计介于 Java（Throwable 层次更宽）和 Swift（协议更灵活）之间，属于合理取舍
4. **受检异常机制**：Java 和 Swift 都有受检/标记异常概念，ArkTS 没有此区分，简化了开发者体验

### ArkTS 设计建议

1. 保留当前 throw 类型约束（明确、安全）
2. 保留 null/undefined 编译期拒绝（优于 Java）
3. catch 块不要求显式类型声明是良好的简化设计

### 对应规范文档

| 语言 | 规范来源 |
|------|---------|
| ArkTS | ArkTS Static Spec §8.14 throw Statements |
| Java | JLS SE21 §14.18 throw Statement, §11.2 Compile-Time Checking of Exceptions |
| Swift | The Swift Programming Language: Error Handling (throw, do-catch, rethrows) |
