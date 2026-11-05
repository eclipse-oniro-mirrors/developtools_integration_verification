# 8.2 表达式语句 - ArkTS vs Java vs Swift 对比报告

**生成日期：** 2026-06-18
**规范来源：** ArkTS Static Spec §8.2, Java JLS SE21 §14, Swift 5.x Language Guide

---

## 一、概览：三语言定位

ArkTS §8.2 定义了**表达式语句 (Expression Statement)**，其语法为 `expressionStatement: expression ;`，语义为任何表达式均可作为语句使用，表达式计算结果被丢弃，仅保留副作用（赋值、修改、I/O 等）。典型用例包括赋值语句、自增/自减表达式以及函数/方法调用。

| 语言 | 定位 | 设计哲学 |
|------|------|----------|
| ArkTS | 面向 OpenHarmony 的移动端静态类型语言 | 与 Java 语义对齐，安全优先，显式拒绝不安全运算符（如 `delete`） |
| Java | 通用面向对象语言，JLS SE21 严格规范 | 简洁明确，StatementExpression 作为 JLS §14.8 的基石 |
| Swift | Apple 平台的现代安全语言 | 安全与代码清晰性优先，移除歧义运算符（`++`/`--`），引入 `_ =` 显式丢弃机制 |

---

## 二、章节对应关系

| ArkTS 概念 | Java 对应 (JLS SE21) | Swift 对应 (5.x) |
|------------|----------------------|-------------------|
| `expressionStatement: expression ;` | `StatementExpression ;` (JLS §14.8) | 表达式语句，分号可选 |
| 赋值表达式作为语句 | `AssignmentExpression` (JLS §15.26) | 赋值表达式，无分号 |
| 自增/自减运算符 (`++`/`--`) | `PrefixIncrement` / `PostfixDecrement` (JLS §15.14, §15.15) | 不支持（Swift 3+ 已移除，用 `+= 1` / `-= 1` 替代） |
| 函数/方法调用作为语句 | `MethodInvocation` (JLS §15.12) | 函数调用表达式 |
| 复合赋值运算符 (`+=`, `&=`, ...) | `CompoundAssignment` (JLS §15.26.2) | 复合赋值运算符 |
| 表达式结果丢弃语义 | JLS 隐式定义，无警告 | 隐式定义，部分表达式触发 `unused result` 警告；可显式丢弃 `_ = foo()` |
| `new` 表达式作为语句 | `ClassInstanceCreationExpression` (JLS §15.9) | 构造器语法 `Foo()` |
| `delete` 运算符 | 不存在（GC 自动管理） | 不存在（ARC 自动管理） |

---

## 三、关键差异矩阵

### 3.1 表达式语句语法

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 语法规则 | `expression ;` | `StatementExpression ;` | `expression`（换行/分号均可） |
| 赋值作为语句 | ✅ (`x = 10;`) | ✅ (`x = 10;`) | ✅ (`x = 10`) |
| 自增/自减作为语句 | ✅ (`x++`, `++x`) | ✅ (`x++`, `++x`) | ❌ 无自增运算符 |
| 函数调用作为语句 | ✅ (`foo()`) | ✅ (`foo()`) | ✅ (`foo()`) |
| 方法调用作为语句 | ✅ (`obj.method()`) | ✅ (`obj.method()`) | ✅ (`obj.method()`) |
| 复合赋值作为语句 | ✅ (`x += 1`) | ✅ (`x += 1`) | ✅ (`x += 1`) |
| `new` 表达式作为语句 | ✅ (`new Foo()`) | ✅ (`new Foo()`) | ✅ (`Foo()`) |
| `delete` 作为语句 | ❌ 编译错误 | N/A | N/A |

### 3.2 表达式结果丢弃语义

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 表达式结果是否丢弃 | ✅ spec 显式说明 | ✅ JLS 隐式定义 | ✅ Swift 隐式定义 |
| 返回值警告 | 无警告 | 无警告 | ⚠️ 部分表达式有 `unused result` 警告 |
| 显式丢弃语法 | 无 | 无 | ✅ `_ = foo()` |
| 纯表达式（无副作用）| 编译通过 | 编译通过 | ⚠️ 有 warning |

### 3.3 运算符可用性

| 运算符 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| `=` 赋值 | ✅ | ✅ | ✅ |
| `+= -= *= /= %=` | ✅ | ✅ | ✅ |
| `&= \|= ^= <<= >>=` | ✅ | ✅ | ✅ |
| `++x` / `x++` | ✅ | ✅ | ❌ |
| `--x` / `x--` | ✅ | ✅ | ❌ |
| `delete` | ❌ 编译错误 | N/A | N/A |
| `new` | ✅ | ✅ | ❌（用构造器语法） |

---

## 四、用例 1:1 对照

### 用例 ①：赋值表达式作为语句（STMT_08_02_001 / 009）

**ArkTS：**
```typescript
function testSimpleAssignment(): void {
    let x: int = 0;
    x = 10;           // 赋值表达式作为语句，结果丢弃
    x = -20;          // 仅保留 x 被修改的副作用
}

function testChainedAssignment(): void {
    let a: int = 0, b: int = 0, c: int = 0;
    a = b = c = 42;   // 链式赋值，结果 42 被丢弃
}
```

**Java（JLS 14.8 Expression Statements）：**
```java
void testSimpleAssignment() {
    int x = 0;
    x = 10;          // AssignmentExpression 作为 StatementExpression;
    x = -20;
}

void testChainedAssignment() {
    int a = 0, b = 0, c = 0;
    a = b = c = 42;  // 链式赋值
}
```

**Swift 5.x（Expression 作为语句，无分号要求）：**
```swift
func testSimpleAssignment() {
    var x = 0
    x = 10            // 赋值表达式作为语句
    x = -20
}

func testChainedAssignment() {
    var a = 0, b = 0, c = 0
    a = b = c = 42    // 链式赋值
}
```

**分析：** 三语言赋值表达式语句完全一致。均支持链式赋值，结果均被丢弃。

---

### 用例 ②：自增/自减表达式作为语句（STMT_08_02_002 / 010）

**ArkTS：**
```typescript
function testPrefixIncrement(): void {
    let x: int = 0;
    ++x;    // 前缀自增作为语句，x 变为 1
    ++x;    // x 变为 2
}

function testPostfixDecrement(): void {
    let y: int = 10;
    y--;    // 后缀自减作为语句，y 变为 9
}

function testMixedIncrementDecrement(): void {
    let z: int = 5;
    ++z;    // 6
    z++;    // 7
    --z;    // 6
    z--;    // 5
}
```

**Java（JLS 15.14.2 / 15.15.1）：**
```java
void testPrefixIncrement() {
    int x = 0;
    ++x;    // 前缀自增
    ++x;
}

void testPostfixDecrement() {
    int y = 10;
    y--;    // 后缀自减
}
```

**Swift 5.x：**
```swift
// Swift 已移除自增/自减运算符（Swift 3+）
func simulateIncrement() {
    var x = 0
    x += 1   // 替代 x++
    x += 1
}

func simulateDecrement() {
    var y = 10
    y -= 1   // 替代 y--
}
```

**关键差异：** Swift 从 3.0 起移除了 `++` 和 `--` 运算符，认为 `x += 1` 更清晰。ArkTS 保留自增/自减运算符，与 Java 一致。

---

### 用例 ③：函数/方法调用作为语句（STMT_08_02_003 / 011）

**ArkTS：**
```typescript
let globalCounter: int = 0;

function incrementGlobal(): void {
    globalCounter++;
}

function testVoidFunctionCall(): void {
    incrementGlobal();                // void 函数调用
}

function testFunctionWithArgs(): void {
    addAndSet(3, 7);                 // 带参函数调用
}

function testMethodCallOnObject(): void {
    let arr: int[] = [1, 2, 3];
    arr.push(4);                     // 方法调用
    arr.shift();                     // 方法调用
}
```

**Java（JLS 15.12 / 14.8）：**
```java
class Test {
    static int globalCounter = 0;

    static void incrementGlobal() {
        globalCounter++;
    }

    void testCalls() {
        incrementGlobal();           // void 函数调用
        addAndSet(3, 7);             // 带参调用
        List<Integer> arr = new ArrayList<>(Arrays.asList(1, 2, 3));
        arr.add(4);                  // 方法调用
        arr.remove(0);               // 方法调用
    }
}
```

**Swift 5.x：**
```swift
var globalCounter = 0

func incrementGlobal() {
    globalCounter += 1
}

func testCalls() {
    incrementGlobal()              // 函数调用
    addAndSet(a: 3, b: 7)         // 带参调用
    var arr = [1, 2, 3]
    arr.append(4)                 // 方法调用
    arr.removeFirst()             // 方法调用
}
```

**分析：** 三语言函数/方法调用作为语句的行为完全一致。返回值均被丢弃，仅保留副作用。

---

### 用例 ④：复合赋值作为语句（STMT_08_02_004）

**ArkTS：**
```typescript
function testArithmeticCompound(): void {
    let x: int = 10;
    x += 5;    // 15
    x -= 3;    // 12
    x *= 2;    // 24
    x /= 4;    // 6
    x %= 3;    // 0
}

function testBitwiseCompound(): void {
    let x: int = 0xFF;
    x &= 0x0F;   // 0x0F
    x |= 0xF0;   // 0xFF
    x ^= 0xAA;   // 0x55
    x <<= 2;     // 0x154
    x >>= 1;     // 0xAA
}
```

**Java（JLS 15.26.2）：**
```java
void testCompound() {
    int x = 10;
    x += 5;
    x -= 3;
    x *= 2;
    x /= 4;
    x %= 3;
}

void testBitwise() {
    int x = 0xFF;
    x &= 0x0F;
    x |= 0xF0;
    x ^= 0xAA;
    x <<= 2;
    x >>= 1;
}
```

**Swift 5.x：**
```swift
func testCompound() {
    var x = 10
    x += 5
    x -= 3
    x *= 2
    x /= 4
    x %= 3
}
func testBitwise() {
    var x = 0xFF
    x &= 0x0F
    x |= 0xF0
    x ^= 0xAA
    x <<= 2
    x >>= 1
}
```

**分析：** 三语言复合赋值运算符集和作为语句的语义完全一致。

---

### 用例 ⑤：无效运算符拒绝（STMT_08_02_006 FAIL_delete_operator）

**ArkTS（编译错误）：**
```typescript
function testDeleteExpression(): void {
    let obj: Object = { key: "value" };
    delete obj.key;   // 编译错误：delete operator not supported
}
```

**Java（JLS）：**
```java
// Java 语言没有 delete 运算符
// 对象由 GC 自动回收
```

**Swift 5.x：**
```swift
// Swift 没有 delete 关键字
// 对象由 ARC 自动管理
```

**分析：** ArkTS 禁止 `delete` 运算符，与 Java 和 Swift 的设计哲学一致——内存管理不由开发者手动操作。

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 赋值表达式语句 | ✅ | ✅ | ✅ |
| 自增/自减 | ✅ | ✅ | ❌ 不支持（已移除） |
| 函数/方法调用 | ✅ | ✅ | ✅ |
| 复合赋值 | ✅ | ✅ | ✅ |
| 表达式结果丢弃 | ✅ | ✅ | ✅（有 warning） |
| 无效运算符拒绝 | ✅（delete） | N/A | N/A |
| 链式赋值 | ✅ | ✅ | ✅ |

---

## 六、核心结论

| 角度 | 结论 |
|------|------|
| **表达式语句语法** | 三语言基本一致 |
| **赋值表达式语句** | 三语言完全一致 |
| **自增/自减** | ArkTS = Java > Swift（Swift 已移除） |
| **复合赋值** | 三语言完全一致 |
| **函数/方法调用作为语句** | 三语言完全一致 |
| **无效表达式拒绝** | ArkTS 特有（delete 检查） |

### 关键启示

1. ArkTS §8.2 表达式语句与 Java 几乎完全一致，语义清晰。
2. Swift 移除了自增/自减运算符（`++`/`--`），这是 Swift 与 ArkTS/Java 的主要差异。
3. 表达式结果丢弃语义在三语言中一致，但 Swift 有更严格的编译警告机制。
4. `delete` 运算符被禁是 ArkTS 针对安全性的合理设计选择。
5. 复合赋值运算符集三语言完全一致（包括位运算复合赋值）。

### ArkTS 设计建议

1. 保留现有的表达式语句设计（已与 Java 对齐良好）。
2. 考虑是否需要对纯表达式（无副作用）添加编译警告（类似 Swift）。
