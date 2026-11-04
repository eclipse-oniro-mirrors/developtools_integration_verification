# 3.6.2 Integer Types and Operations - ArkTS vs Java vs Swift 对比报告（v2）

**生成日期：** 2026-06-11（v2 - 新增除零完整对比）
**测试基础：** 29 个用例

---

## 一、本节核心概念

### 整数类型范围
- byte: 8 位有符号
- short: 16 位有符号
- int: 32 位有符号
- long: 64 位有符号

### 整数运算符集合
- 比较：`<` `<=` `>` `>=` `==` `!=`
- 算术：`+` `-` `*` `/` `%` `++` `--`
- 移位：`<<` `>>` `>>>`
- 按位：`&` `^` `|` `~`
- 三元：`?:`
- 字符串拼接：`+`（一边为 string 时）
- 幂：`**`（结果 bigint）

### 类型推升规则
- 任一为 long → 结果 long（64 位）
- 否则任一非 int → 推升为 int（32 位）

---

## 二、跨语言对比

### 2.1 整数类型集合

| 类型 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 8 位 | byte | byte | Int8 / UInt8 |
| 16 位 | short | short | Int16 / UInt16 |
| 32 位 | int | int | Int32 / UInt32 |
| 64 位 | long | long | Int64 / UInt64 |
| 任意精度 | bigint | BigInteger（类）| 无 |

### 2.2 运算符支持

| 运算符 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 关系/相等 | ✅ | ✅ | ✅ |
| 算术 + - * / % | ✅ | ✅ | ✅ |
| ++ -- | ✅ | ✅ | ❌ |
| 移位 << >> >>> | ✅ | ✅ | <</>> 但无 >>> |
| 按位 & \| ^ ~ | ✅ | ✅ | ✅ |
| `**` 幂 | ✅ → bigint | ❌ | ❌ |

### 2.3 溢出处理

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `int max + 1` | 静默回绕 | 静默回绕 | **运行时崩溃** |
| 显式溢出包装 | 无 | 无 | `&+` `&-` `&*` |

---

## 三、整数除零完整对比 ⭐ 新增

### 3.1 完整 10 场景对比表

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | `int c = 10 / 0`（字面量）| ❌ ESY0273 | ✅ 通过，运行时抛 | ❌ 编译错误 |
| 2 | `let a = 0; 10/a`（let 变量）| ✅ 通过，运行时抛 | ✅ 通过，运行时抛 | ❌ 编译错误 |
| 3 | `var a = 0; 10/a` | N/A | N/A | ✅ 通过，陷阱 |
| 4 | 函数返回 `10/0` | ❌ 编译错误 | ✅ 通过 | ❌ 编译错误 |
| 5 | 函数内 `const a = 0; 10/a` | ❌ 编译错误 | N/A | ❌ 编译错误 |
| 6 | **模块级 `const a = 0; 10/a`** | ✅ **通过（bug）** | N/A | ❌ 编译错误 |
| 7 | `10 / (1-1)` 常量表达式 | ❌ 编译错误 | ✅ 通过 | ❌ 编译错误 |
| 8 | `10 % 0` 取模 | ❌ 编译错误 | ✅ 通过 | ❌ 编译错误 |
| 9 | `10n / 0n` bigint | ❌ ESY206401 | BigInteger.ArithmeticException | N/A |
| 10 | 运行时除零异常类型 | ArithmeticError（可 catch）| ArithmeticException（可 catch）| **陷阱（不可 catch）** |

### 3.2 编译期检测严格度排序

```
Swift（最严格，所有 let/const）
    > ArkTS（字面量+局部 const，但模块级 const 漏检）
        > Java（完全不检测）
```

### 3.3 关键发现

1. **Java：完全运行时**，编译期不做检测（spec §15.7.2 明确）
2. **Swift：完全编译期**（所有可静态推断的）
3. **ArkTS：混合模式但实现不一致**
   - 字面量、函数内 const、常量表达式 → 编译错误 ✅
   - **模块级 const → 漏检（实现 bug）** ❌

### 3.4 异常类型差异

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 整数除零异常名 | `ArithmeticError` | `ArithmeticException` | fatal error（无异常）|
| 可 try/catch 捕获 | ✅ | ✅ | ❌ |
| 进程终止 | 否 | 否 | 是 |

---

## 四、用例 1:1 对照（关键除零场景）

### 用例 ①：整数 字面量除零 (TYP_03_06_02_022)

**ArkTS：**
```typescript
function main(): void {
  let c: int = 10 / 0   // ❌ ESY0273: Division by zero is not allowed
}
```

**Java：**
```java
int c = 10 / 0;          // ✅ 编译通过
// 运行时：throws ArithmeticException
```

**Swift：**
```swift
let c = 10 / 0           // ❌ error: division by zero
```

### 用例 ②：模块级 const 除零 (TYP_03_06_02_028)

**ArkTS（实测发现的 bug）：**
```typescript
const moduleA: int = 0
function main(): void {
  let c: int = 10 / moduleA   // ⚠️ 编译通过！运行时才抛 ArithmeticError
}
```

**Java（一致行为）：**
```java
static final int MODULE_A = 0;
int c = 10 / MODULE_A;        // ✅ 编译通过，运行时抛
```

**Swift（一致行为，与函数内 const 相同）：**
```swift
let moduleA = 0
let c = 10 / moduleA          // ❌ 编译错误
```

**关键：** Java/Swift 内部一致，ArkTS 内部不一致

### 用例 ③：函数内 const 除零 (TYP_03_06_02_024)

**ArkTS：**
```typescript
function main(): void {
  const a: int = 0
  let c: int = 10 / a   // ❌ ESY0273
}
```

**Java：**
```java
final int a = 0;
int c = 10 / a;         // ✅ 通过（与模块级一致）
```

**Swift：**
```swift
let a = 0
let c = 10 / a          // ❌ 编译错误
```

---

## 四、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | widening byte→short→int→long | ✅ compile-pass + runtime | ✅ 自动 widening | ❌ 必须显式 Int64(x) |
| 002 | widening int→float→double | ✅ compile-pass + runtime | ✅ 自动 widening | ❌ 必须显式转换 |
| 003 | narrowing long→int（compile-fail） | ✅ compile-fail | ✅ compile-fail | ✅ compile-fail |
| 004 | 整数字面量除零 | ✅ compile-fail | ⚠️ compile-pass（运行时抛异常） | ✅ compile-fail |
| 005 | 函数内 const 除零 | ✅ compile-fail | ⚠️ compile-pass（运行时抛异常） | ✅ compile-fail |
| 006 | **模块级 const 除零** ⭐ | ⚠️ **compile-pass（实现 bug）** | ⚠️ compile-pass（运行时抛异常） | ✅ compile-fail |
| 007 | `10 / (1-1)` 常量表达式除零 | ✅ compile-fail | ⚠️ compile-pass | ✅ compile-fail |
| 008 | `10 % 0` 取模 | ✅ compile-fail | ⚠️ compile-pass | ✅ compile-fail |
| 009 | 运行时整数除零异常 | ✅ runtime（ArithmeticError 可 catch） | ✅ runtime（ArithmeticException 可 catch） | ❌ fatalError 不可恢复 |
| 010 | 整数溢出回绕 `max+1` | ✅ runtime（静默回绕） | ✅ runtime（静默回绕） | ❌ runtime（默认崩溃） |
| 011 | 整数溢出回绕 `min-1` | ✅ runtime（静默回绕） | ✅ runtime（静默回绕） | ❌ runtime（默认崩溃） |
| 012 | 位移运算 `<< >> >>>` | ✅ runtime | ✅ runtime | ✅ runtime（`<< >>`，无 `>>>`） |
| 013 | 按位运算 `& \| ^` | ✅ runtime | ✅ runtime | ✅ runtime |
| 014 | `**` 幂运算返回 bigint | ✅ runtime | ❌ 无原生（BigInteger.pow） | ❌ 无原生 |
| 015 | char→int widening（compile-fail）| ✅ compile-fail | ⚠️ compile-pass（Java 允许） | N/A |
| 016 | 整数与浮点混合运算 | ✅ runtime（int→double 隐式） | ✅ runtime（隐式提升） | ❌ 必须显式转换 |
| 017 | `new int()` 构造返回 0 | ✅ runtime | ❌ 不支持 | ✅ runtime（Int()） |
| 018 | char 关系运算 `c < b` | ✅ compile-pass + runtime | ✅ 编译通过 + 运行通过 | ✅ 编译通过 + 运行通过 |
| 019 | 0x7FFF_FFFF（max int 字面量）| ✅ compile-pass | ✅ 编译通过 | ✅ 编译通过 |
| 020 | 数值类型 instanceof 检查 | ✅ runtime | ⚠️ 只有包装类型 | ✅ runtime（type check） |

### 关键差异详解

#### 006: 模块级 const 除零 ⭐ 关键发现

| 语言 | 代码 | 编译 | 运行 |
|------|------|------|------|
| ArkTS | `const MODULE_ZERO: int = 0; let c = 10 / MODULE_ZERO;` | ⚠️ 通过（bug） | ArithmeticError |
| Java | `static final int MODULE_ZERO = 0; int c = 10 / MODULE_ZERO;` | 通过 | ArithmeticException |
| Swift | `let moduleZero = 0; let c = 10 / moduleZero;` | ❌ 编译错误 | — |

#### 009-010: 整数除零与溢出行为 ⭐

| 语言 | 整数除零 | 整数溢出 max+1 | 可恢复性 |
|------|---------|---------------|---------|
| ArkTS | ArithmeticError | 静默回绕 | ✅ try-catch |
| Java | ArithmeticException | 静默回绕 | ✅ try-catch |
| Swift | fatal error | 默认崩溃 | ❌ 不可恢复 |

#### 015: char→int widening ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let n: int = c'a';` | ❌ compile-fail（char 独立类型） |
| Java | `int n = 'a';` | ✅ compile-pass（widening: n = 97） |
| Swift | N/A（Character 是引用类型，不与 Int 互转） | — |

---

## 五、综合评分（v2 含除零完整对比）

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 运算符完整度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 类型推升合理性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐ |
| 溢出安全 | ⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| **除零编译期检测** | ⭐⭐⭐（不一致）| ⭐ | ⭐⭐⭐⭐⭐ |
| **除零运行时安全** | ⭐⭐⭐⭐（可捕获）| ⭐⭐⭐⭐⭐ | ⭐⭐（陷阱）|
| **除零行为内部一致性** | ⭐⭐（const bug）| ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| boolean 隔离 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

---

## 六、核心结论

| 角度 | 结论 |
|------|------|
| **运算符** | ArkTS 含 `**` 和 `>>>`，最完整 |
| **类型推升** | ArkTS = Java，比 Swift 宽松 |
| **整数除零编译检测** | Swift > ArkTS > Java |
| **整数除零运行时** | ArkTS = Java（可 catch）> Swift（陷阱）|
| **内部一致性** | Java = Swift > ArkTS（模块级 const 漏检）|

### ArkTS 设计建议

1. ✅ **保留**：`**` 返回 bigint（避免溢出）
2. ❌ **修复**：模块级 const 除零检测漏洞（与函数内 const 不一致）
3. ⚠️ **完善 spec §15.17.2**：明确"编译期可检测"的范围
4. ⚠️ **考虑借鉴 Swift**：`&+` 溢出运算符

---

## 七、对应规范

| 语言 | 规范 |
|------|------|
| ArkTS | ArkTS Static Spec §3.6.2, §15.17.2 |
| Java | JLS SE21 §4.2.2, §15.17.2, §15.7.2 |
| Swift | The Swift Programming Language: Operators |
