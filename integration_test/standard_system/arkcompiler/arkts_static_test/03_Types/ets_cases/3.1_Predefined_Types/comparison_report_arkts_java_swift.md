# 3.1 Predefined Types - ArkTS vs Java vs Swift 对比报告（v3）

**生成日期：** 2026-06-11（v3 - 仅对比 Java/Swift）
**规范来源：** ArkTS Static Spec §3.1, Java JLS SE21 §4, Swift Language Reference (Types/Basics)
**测试基础：** 49 个用例（18 compile-pass + 16 compile-fail + **15 runtime 真实执行**）

---

## 一、概览：三语言定位

| 语言 | 类型系统定位 | 设计哲学 |
|------|------------|---------|
| **ArkTS** | 静态严格 + null 安全 | 严格类型 + 表达力丰富 |
| **Java** | 经典 OOP 静态强类型 | 类型系统传统，依赖泛型/装箱/Optional 类 |
| **Swift** | 现代静态强类型 + 严格类型检查 | 编译期消除所有隐式风险，Optional 统一处理 null |

---

## 二、章节对应关系

| ArkTS 3.1 类型 | Java JLS §4 | Swift | 备注 |
|---------------|-------------|-------|------|
| byte/short/int/long | §4.2.1 byte/short/int/long | Int8/Int16/Int32/Int64 + Int | Swift Int 平台相关 |
| float/double/number | §4.2.3 float/double | Float/Double | ArkTS 的 number 是 double 别名 |
| boolean | §4.2.5 boolean | Bool | 完全一致 |
| **char**（实验） | §4.2.1 char (整数) | Character (引用类型) | **三者对 char 设计完全不同** |
| string | §4.3.3 String | String | Java/Swift 是引用类型 |
| **bigint** | java.math.BigInteger（类） | **无原生** | ArkTS 唯一原生支持 |
| **Any** | Object（不含 primitive/null） | Any（不含 nil） | ArkTS 的 Any 包含 nullish |
| Object | §4.3.2 Object | AnyObject | 概念对应 |
| null | §4.1 null type | nil + Optional | 三者都有但语义有异 |
| void/undefined | void（仅返回类型） | Void = ()（空元组） | ArkTS 可做变量类型 |
| **never** | **无对应** | Never | ArkTS/Swift 有，Java 无 |
| Array<T>/T[] | T[] | [T]/Array<T> | API 命名各异 |
| **FixedArray** | T[]（本就固定） | **无对应** | ArkTS 独有动态/固定区分 |
| **联合类型 T1\|T2** | **无原生**（sealed 类模拟） | **无原生**（enum 关联值模拟） | ArkTS 唯一原生 |
| **字面量类型 "hello"** | **无对应** | **无对应** | ArkTS 独有 |
| 函数类型 (x:int)=>int | Function<T,R> 接口 | (Int) -> Int | ArkTS/Swift 一等公民 |

---

## 三、关键差异矩阵

### 3.1 数值类型

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 默认整数 | int (32) | int (32) | Int (平台相关, 通常 64) |
| 默认浮点 | double | double | Double |
| 隐式 widening | 支持 (byte→long 等) | 支持 (byte→long 等) | **禁止**（必须 `Int64(x)`） |
| 隐式 narrowing | **禁止** | **禁止** | **禁止** |
| **整数溢出行为** ⭐ | **静默回绕**（实测） | 静默回绕 | **运行时崩溃**（默认），需 `&+` 包装 |
| 字面量溢出 | 编译错误 | 编译错误 | 编译错误 |
| bigint 支持 | **原生 `123n`** | BigInteger 类 + 方法调用 | 需第三方库 |
| **char 类型** ⭐ | 实验特性，独立类型 | 整数类型，可 widening 到 int | 引用类型 Character |
| **char→int widening** ⭐ | **禁止**（与 Java 不同） | ✅ 允许（'a'→97） | N/A（独立类型） |

> ⭐ **关键发现** (TYP_03_01_041 实测)：ArkTS `int max+1` 静默回绕到 `int min`，与 Java 一致但弱于 Swift。

### 3.2 null 安全

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| null 表达 | `T \| null` 联合类型 | null（赋给所有引用） | `T?` (Optional<T>) |
| null 赋给 String | **编译错误** | OK | **编译错误** |
| null 赋给 int | **编译错误** | 编译错误（自动装箱失败） | 编译错误 |
| 解包语法 | 类型收窄 `if (x !== null)` | 显式判 null | `if let x = opt`、`opt!`、`opt?.` |
| null 安全等级 | 强 | 弱 | 极强 |

### 3.3 类型表达力

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 联合类型 | **`T1 \| T2`** | 无（sealed class 部分模拟） | enum 关联值模拟 |
| 字面量类型 | **`"hello"` 可做类型** | 无 | 无 |
| 元组 | `[int, string]` | 无（需 Pair 类） | `(Int, String)` 一等公民 |
| 函数类型 | `(x:int) => int` | `Function<Integer, Integer>` 接口 | `(Int) -> Int` |
| 顶类型 | Any（含 null/undefined） | Object（不含 null/primitive） | Any（不含 nil） |
| 底类型 | never | 无（Void 类不可用） | Never |

### 3.4 嵌套语法支持 ⭐

| 特性 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 嵌套函数 | ❌ | ❌（用 lambda） | ✅ |
| 局部类 | ❌ | ✅ | ✅ |
| 局部 type alias | ❌ | N/A | ✅ |

> ⭐ **关键发现**：ArkTS 在嵌套语法上**比 Java 限制更多**。

### 3.5 关键字冲突 ⭐

| 关键字作变量名 | ArkTS | Java | Swift |
|---------------|-------|------|-------|
| `int` | ❌ | ❌ | ✅（无此关键字） |
| `double` | ❌ | ❌ | ✅（无此关键字） |
| `char` | ❌ | ❌ | ✅（无此关键字） |
| `string` | ❌ | ✅（不是关键字） | ✅（无此关键字） |
| `byte` | ❌ | ❌ | ✅（无此关键字） |

### 3.6 变量声明关键字（**陷阱区**）

| 含义 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 可变变量 | `let` | 无关键字 `int x` | **`var`** |
| 不可变常量 | `const` | `final int x` | **`let`** |

⚠️ **`let` 在 Swift 和 ArkTS 中语义相反**

---

## 四、用例 1:1 对照（含 runtime 实测结果）

### 用例 ①：int 基本运算 (TYP_03_01_001)

```typescript
// ArkTS
let a: int = 0
let b: int = 2147483647
let d: int = a + b
let r: int = a << 1
```

```java
// Java
int a = 0;
int b = 2147483647;
int d = a + b;
int r = a << 1;
```

```swift
// Swift
var a: Int32 = 0
var b: Int32 = 2147483647
let d = a &+ b      // & 表示溢出包装；普通 + 溢出会崩溃
let r = a << 1
```

**结论：** Java/ArkTS 几乎一致；Swift 整数溢出处理最严格

### 用例 ②：整数溢出回绕 (TYP_03_01_041) ⭐

**ArkTS（实测通过）：**
```typescript
function main(): void {
  let max: int = 2147483647
  let overflow: int = max + 1   // ✅ 静默回绕到 -2147483648
  let min: int = -2147483648
  let underflow: int = min - 1  // ✅ 静默回绕到 2147483647
}
```

**Java（行为相同）：**
```java
int max = Integer.MAX_VALUE;
int overflow = max + 1;   // 静默回绕到 Integer.MIN_VALUE
```

**Swift（行为不同）：**
```swift
let max: Int32 = .max
let overflow = max + 1    // ❌ 运行时崩溃: integer overflow
let safe = max &+ 1       // ✅ 显式包装运算才回绕
```

**结论：** ArkTS = Java（不安全）< Swift（安全）

### 用例 ③：Narrowing 编译失败 (TYP_03_01_017)

```typescript
// ArkTS
let l: long = 100
let i: int = l   // ❌ Type 'Long' cannot be assigned to type 'Int'
```

```java
// Java
long l = 100L;
int i = l;       // ❌ incompatible types: possible lossy conversion
```

```swift
// Swift
let l: Int64 = 100
let i: Int32 = l // ❌ Cannot convert 'Int64' to 'Int32'
let b: Int8 = 1
let l2: Int64 = b // ❌ 连 widening 也禁止！必须 Int64(b)
```

**结论：** Swift > ArkTS = Java（Swift 最严格）

### 用例 ④：char 类型对比 (TYP_03_01_035-037, 048) ⭐

**ArkTS（实测）：**
```typescript
let a: char = c'a'                  // ✅ 字面量
let n: int = a                      // ❌ Char cannot assign to Int
let result: boolean = a < c'b'      // ✅ 关系运算

function main(): void {
  let A: char = c'A'
  let lower: char = c'a'
  if (!(A < lower)) {               // ✅ ASCII 序比较
    throw new Error("A < a")
  }
}
```

**Java（widening 允许）：**
```java
char a = 'a';
int n = a;        // ✅ widening: n = 97
boolean b = a < 'b';
```

**Swift（独立 Character 类型）：**
```swift
let a: Character = "a"
let str = String(a)
// 没有 char→int 的概念
```

**结论：** ArkTS 比 Java 严格（禁止 widening），独立于 Swift（Character 是引用类型）

### 用例 ⑤：null 赋值非空类型 (TYP_03_01_024)

```typescript
// ArkTS
let n: int = null    // ❌
let s: string = null // ❌
let opt: int | null = null  // ✅
```

```java
// Java
int n = null;        // ❌ 自动装箱失败
String s = null;     // ✅ Java 允许（运行期 NPE 风险）
```

```swift
// Swift
let n: Int = nil     // ❌
let s: String = nil  // ❌
let opt: Int? = nil  // ✅
```

**结论：** ArkTS = Swift > Java（Java 最宽松）

### 用例 ⑥：Any 类型 (TYP_03_01_006, 031)

```typescript
// ArkTS（runtime 实测通过）
let a: Any = 1
a = "hello"
a = null         // ✅ 接受
a = undefined    // ✅ 接受
a.length         // ❌ Any 无成员

function main(): void {
  let a: Any = 42
  if (!(a instanceof Object)) {  // ✅ 实测通过
    throw new Error()
  }
}
```

```java
// Java
Object a = 1;    // 自动装箱 Integer.valueOf(1)
a = "hello";
a = null;        // ✅
a.length;        // ❌ Object 无 length 字段
```

```swift
// Swift
var a: Any = 1
a = "hello"
a = NSNull()     // ⚠️ 需 NSNull，Any 不能存 nil
(a as? String)?.count  // 必须 as? 类型转换才能访问
```

### 用例 ⑦：bigint (TYP_03_01_012, 033)

```typescript
// ArkTS - 原生支持（runtime 实测通过）
function main(): void {
  let a: bigint = 12345678901234567890n
  let b: bigint = 9876543210987654321n
  let sum: bigint = a + b   // ✅ 22222222112222222211n
  let pow: bigint = 2n ** 32n  // ✅ 4294967296n
}
```

```java
// Java - 类方法调用
BigInteger a = new BigInteger("12345678901234567890");
BigInteger b = a.pow(2);
```

```swift
// Swift - 需第三方库
import BigInt
let a = BigInt("123")!
let b = a.power(2)
```

**结论：** ArkTS 独享原生语法优势

### 用例 ⑧：除零异常 (TYP_03_01_029, 049) ⭐

**ArkTS（runtime 实测通过 + try-catch 验证）：**
```typescript
function main(): void {
  let a: int = 10
  let b: int = 0
  let caught: boolean = false
  try {
    let c: int = a / b      // ✅ 抛 ArithmeticError
  } catch (e) {
    caught = true            // ✅ 可恢复
  }
}
```

**Java（行为一致）：**
```java
try {
    int c = 10 / 0;          // throws ArithmeticException
} catch (ArithmeticException e) {
    // 可捕获
}
```

**Swift（独立行为）：**
```swift
let a = 10
let b = 0
let c = a / b               // 运行时崩溃（fatal error）
// Swift 整数除零无法用 try-catch 捕获
let safe = b != 0 ? a/b : 0 // 必须预先检查
```

**结论：** ArkTS = Java（可捕获），Swift 不可恢复

### 用例 ⑨：嵌套函数 ⭐

**ArkTS（编译失败）：**
```typescript
function outer(): void {
  function inner(): void {}    // ❌ ESY0135
}
```

**Java（也禁止）：**
```java
void outer() {
    // void inner() {}    // ❌
    Runnable inner = () -> {};   // 用 lambda 代替
}
```

**Swift（支持）：**
```swift
func outer() {
    func inner() {}              // ✅
}
```

**结论：** ArkTS = Java（限制）< Swift（支持）

### 用例 ⑩：联合类型 (TYP_03_01_010 - 通过 T|null)

```typescript
// ArkTS - 原生
let u: int | null = null
u = 42
```

```java
// Java - 用 Object，运行期判断
Object u = null;
u = 42;
if (u instanceof Integer i) { /* Java 16+ */ }
```

```swift
// Swift - Optional
var u: Int? = nil
u = 42
if let v = u { /* ... */ }
```

### 用例 ⑪：数组操作 (TYP_03_01_034) ⭐

| 操作 | ArkTS（实测） | Java | Swift |
|------|-------|------|-------|
| 声明 | `int[]` 或 `Array<int>` | `int[]` | `[Int]` 或 `Array<Int>` |
| 长度 | `arr.length` ✅ | `arr.length` | `arr.count` |
| 末尾添加 | `arr.push(4)` ✅ | `Arrays/ArrayList.add(4)` | `arr.append(4)` |
| 末尾删除 | `arr.pop()` 返回 `T\|undefined` ✅ | `ArrayList.remove(last)` | `arr.popLast()` 返回 `T?` |
| 越界行为 | undefined | ArrayIndexOutOfBoundsException | trap/crash |

### 用例 ⑫：FixedArray vs Array ⭐

**ArkTS（实测验证）：**
```typescript
let fa: FixedArray<int> = [1, 2, 3]
fa[0] = 100             // ✅ 元素可改
fa.length === 3         // ✅ 长度固定
let arr: int[] = fa     // ❌ 不能赋值（类型隔离）
```

**Java：** 数组本就固定长度，无 FixedArray 概念。
**Swift：** 数组都是动态，无类似概念。

**结论：** ArkTS 独有的固定/动态二分设计

### 用例 ⑬：字面量类型 (3.2 章节 TYP_03_02_009)

```typescript
// ArkTS - 字面量做类型
type Direction = "up" | "down" | "left" | "right"
let d: Direction = "up"
```

```java
// Java - 用 enum
enum Direction { UP, DOWN, LEFT, RIGHT }
Direction d = Direction.UP;
```

```swift
// Swift - enum 关联原始值
enum Direction: String {
    case up, down, left, right
}
var d: Direction = .up
```

---

## 五、严格度对比

```
最严格                                              最宽松
─────────────────────────────────────────────────────►
Swift              ArkTS              Java
┌─────────┐      ┌─────────┐      ┌─────────┐
│禁止全部隐 │      │禁止隐式  │      │允许隐式  │
│式数值转换 │      │narrowing │      │widening │
│禁止整数溢│      │允许       │      │且 String│
│出       │      │widening  │      │可 null  │
│Optional强│      │null 联合 │      │null 自由 │
│制         │      │类型      │      │引用     │
└─────────┘      └─────────┘      └─────────┘
```

---

## 六、类型表达力对比

```
最丰富                                              最传统
─────────────────────────────────────────────────────►
ArkTS              Swift              Java
┌─────────┐      ┌─────────┐      ┌─────────┐
│联合类型  │      │强大泛型  │      │经典 OOP │
│字面量类型 │      │协议/扩展 │      │依赖装箱  │
│bigint 原 │      │元组一等  │      │Optional │
│生         │      │Optional│      │类      │
│Any 含 null│      │语法糖    │      │sealed   │
│           │      │           │      │class    │
└─────────┘      └─────────┘      └─────────┘
```

---

## 七、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 类型严格性 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 类型表达力 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| null 安全 | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 数值精确 | ⭐⭐⭐⭐⭐ (原生 bigint) | ⭐⭐⭐ (BigInteger) | ⭐⭐ (需第三方) |
| **整数溢出安全** ⭐ | ⭐⭐ (静默回绕) | ⭐⭐ (静默回绕) | ⭐⭐⭐⭐⭐ (默认崩溃) |
| **嵌套语法灵活性** ⭐ | ⭐⭐ (限制多) | ⭐⭐⭐ (有 lambda) | ⭐⭐⭐⭐⭐ (完全支持) |
| 学习曲线 | 中 | 低（最传统） | 高（Optional 等概念） |

---

## 八、运行时行为对比汇总（基于实测）

| 行为 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `int max + 1` | -2147483648（回绕） | -2147483648（回绕） | crash |
| `0.0 / 0.0` | NaN | NaN | nan（同） |
| `1.0 / 0.0` | Infinity | Infinity | inf（同） |
| `NaN == NaN` | false | false | false |
| `10 / 0` (int) | throw ArithmeticError | throw ArithmeticException | crash |
| `&&/\|\|` 短路 | ✅ | ✅ | ✅ |
| `'a' < 'b'` | ✅ | ✅ | ✅ |
| `'a' as int` | ❌（编译失败） | ✅ widening | N/A |

---

## 九、核心结论

| 角度 | 结论 |
|------|------|
| **严格度** | Swift > ArkTS > Java |
| **表达力** | ArkTS ≈ Swift > Java |
| **null 安全** | Swift > ArkTS > Java |
| **数值精度** | ArkTS > Java > Swift |
| **整数溢出安全** | Swift >> ArkTS = Java |
| **嵌套语法** | Swift > Java > ArkTS |
| **测试方法学** | ArkTS 沿用规范测试（compile-pass/fail/runtime 三类），Java/Swift 业界普遍只测运行时 |

### 关键启示

1. **ArkTS 是介于 Swift 严格性与 Java 传统之间的现代静态语言**
2. **bigint 原生支持** 是 ArkTS 相对 Swift/Java 的独特优势
3. **字面量类型 + 联合类型** 是 ArkTS 类型表达力强于两者的核心特性
4. **null 安全** ArkTS 学习了 Swift 的思路，但用联合类型而非 Optional 语法糖
5. **整数溢出** ArkTS 沿用 Java 不安全设计，**未学习 Swift** 的 `&+` 显式包装运算
6. **嵌套语法** ArkTS 比 Java 限制更多（连嵌套函数都禁止）
7. **`let` 关键字陷阱**：ArkTS=可变（同 JS），Swift=不可变。跨语言开发者需特别注意
8. **char 类型** ArkTS 比 Java 严格（禁止 widening），与 Java 设计原则不一致

### ArkTS 设计建议

基于此对比，建议 ArkTS：

1. **借鉴 Swift**：增加溢出运算符 `&+`/`&-`/`&*` 或可配置的溢出检查
2. **借鉴 Java**：放开 char→int 的 widening（提升数值运算便利）
3. **放宽嵌套**：放开嵌套函数/局部类/局部 type alias（提升表达灵活性）
4. **保持现有优势**：bigint 原生、联合类型、字面量类型、严格 null 安全

---

## 十、对应规范文档

| 语言 | 规范来源 |
|------|---------|
| ArkTS | ArkTS Static Language Specification, §3.1 Predefined Types |
| Java | Java Language Specification SE21, §4 Types, Values, and Variables |
| Swift | The Swift Programming Language (Swift 5.x), Types & The Basics 章节 |
