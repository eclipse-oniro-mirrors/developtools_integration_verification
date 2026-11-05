# 3.6.3 Floating-Point Types and Operations - ArkTS vs Java vs Swift（v2）

**生成日期：** 2026-06-11（v2 - 新增浮点除零完整对比）
**测试基础：** 30 个用例（含 10 个浮点除零用例 021~030）

---

## 一、跨语言对比

### 1.1 浮点类型集合

| 类型 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 32 位 | float | float | Float |
| 64 位 | double / number | double | Double |

### 1.2 浮点运算符

| 运算符 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `<` `<=` `>` `>=` `==` `!=` | ✅ | ✅ | ✅ |
| `+` `-` `*` `/` `%` | ✅ | ✅ | ✅（% 用 truncatingRemainder）|
| `**` 幂 | ✅ → double | ❌ | ❌ |
| `++` `--` | ✅ | ✅ | ❌ |
| 三元 `?:` | ✅ | ✅ | ✅ |

### 1.3 IEEE 754 行为

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| NaN != NaN | ✅ | ✅ | ✅ |
| 0/0 = NaN | ✅ | ✅ | ✅ |
| 1/0 = +Inf | ✅ | ✅ | ✅ |
| 浮点除零异常 | ❌ 不抛 | ❌ 不抛 | ❌ 不抛 |
| gradual underflow | ✅ | ✅ | ✅ |

---

## 二、浮点除零完整对比 ⭐ 新增

### 2.1 完整 10 场景对比表

| # | 场景 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 1 | `let c = 5.0 / 0.0` | ✅ `Infinity` | ✅ `Infinity` | ✅ `inf` |
| 2 | `let c = -5.0 / 0.0` | ✅ `-Infinity` | ✅ `-Infinity` | ✅ `-inf` |
| 3 | `let c = 0.0 / 0.0` | ✅ `NaN` | ✅ `NaN` | ✅ `nan` |
| 4 | `let a = 0.0; 5.0/a`（let 变量）| ✅ `Infinity` | ✅ `Infinity` | ✅ `inf` |
| 5 | 函数内 `const a = 0.0; 5.0/a` | ✅ `Infinity` | ✅ `Infinity` | ✅ `inf` |
| 6 | 模块级 `const a = 0.0; 5.0/a` | ✅ `Infinity` | ✅ `Infinity` | ✅ `inf` |
| 7 | `5.0 / (1.0 - 1.0)`（常量表达式）| ✅ `Infinity` | ✅ `Infinity` | ✅ `inf` |
| 8 | `5.0 % 0.0` 取模 | ✅ `NaN` | ✅ `NaN` | ✅ `nan` |
| 9 | `let c: float = 5.0f / 0.0f` | ✅ `Infinity` | ✅ `Infinity` | ✅ `inf` |
| 10 | `let c: double = 10 / 0.0` 混合类型 | ✅ `Infinity` | ✅ `Infinity` | ✅ `inf` |

### 2.2 **三语言完全一致** ⭐

**核心结论：浮点除零在 ArkTS/Java/Swift 三语言中行为完全一致**，全部遵循 IEEE 754：
- 不抛异常
- 不做编译期检测
- 返回 ±Infinity 或 NaN

### 2.3 内部 vs 整数除零对比

| 同语言内部 | 整数除零 | 浮点除零 |
|----------|---------|---------|
| Java | ArithmeticException | IEEE 754 |
| ArkTS | 字面量编译错误 / 运行时 ArithmeticError | IEEE 754 |
| Swift | 编译错误 / 运行时陷阱 | IEEE 754 |

**关键：** 浮点是三语言对外行为唯一完全一致的部分

---

## 三、用例 1:1 对照（浮点除零）

### 用例 ①：浮点字面量除零 (TYP_03_06_03_021)

**ArkTS：**
```typescript
let c: double = 5.0 / 0.0
// ✅ 编译通过，结果 +Infinity
```

**Java：**
```java
double c = 5.0 / 0.0;
// ✅ 编译通过，结果 Infinity
```

**Swift：**
```swift
let c = 5.0 / 0.0
// ✅ 编译通过（可能 warning），结果 inf
```

### 用例 ②：浮点模块级 const 除零 (TYP_03_06_03_026)

**ArkTS：**
```typescript
const moduleZero: double = 0.0
function main(): void {
  let c: double = 5.0 / moduleZero   // ✅ Infinity
}
```

**Java：**
```java
static final double MODULE_ZERO = 0.0;
double c = 5.0 / MODULE_ZERO;   // ✅ Infinity
```

**Swift：**
```swift
let moduleZero = 0.0
let c = 5.0 / moduleZero   // ✅ inf
```

**关键：** 浮点不像整数那样 ArkTS 行为不一致，浮点三语言全部一致

### 用例 ③：浮点取模零 (TYP_03_06_03_028)

**ArkTS：**
```typescript
let c: double = 5.0 % 0.0   // ✅ NaN
```

**Java：**
```java
double c = 5.0 % 0.0;        // ✅ NaN
```

**Swift：**
```swift
let c = 5.0.truncatingRemainder(dividingBy: 0.0)   // ✅ nan
```

---

## 四、整数 vs 浮点除零 同语言对比

### 4.1 ArkTS 内部对比

| 场景 | 整数 | 浮点 |
|------|------|------|
| 字面量 `T / 0` | ❌ 编译错误 | ✅ 通过 → Inf |
| `% 0` | ❌ 编译错误 | ✅ 通过 → NaN |
| 函数内 const = 0 | ❌ 编译错误 | ✅ 通过 → Inf |
| 模块级 const = 0 | ⚠️ 通过（bug） | ✅ 通过 → Inf |
| 运行时除零 | 抛 ArithmeticError | 返回 Inf/NaN |

### 4.2 Java 内部对比

| 场景 | 整数 | 浮点 |
|------|------|------|
| 任意场景字面量 / 0 | ✅ 通过，运行时抛 | ✅ 通过 → Inf/NaN |
| 一致性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

### 4.3 Swift 内部对比

| 场景 | 整数 | 浮点 |
|------|------|------|
| 字面量 / 0 | ❌ 编译错误 | ⚠️ warning |
| 运行时除零 | 陷阱 | 返回 inf/nan |

---

## 四、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | float 字面量赋值 | ✅ compile-pass + runtime | ✅ 编译通过 + 运行通过 | ✅ 编译通过 + 运行通过 |
| 002 | double 字面量赋值 | ✅ compile-pass + runtime | ✅ 编译通过 + 运行通过 | ✅ 编译通过 + 运行通过 |
| 003 | widening int→float | ✅ compile-pass + runtime | ✅ 编译通过 + 运行通过 | ❌ 必须显式 Float(i) |
| 004 | widening int→double | ✅ compile-pass + runtime | ✅ 编译通过 + 运行通过 | ❌ 必须显式 Double(i) |
| 005 | narrowing double→int（显式转换） | ✅ runtime（.toInt()） | ✅ runtime（(int)d） | ✅ runtime（Int(d)） |
| 006 | 浮点正零 `+0.0` | ✅ runtime | ✅ runtime | ✅ runtime |
| 007 | 浮点负零 `-0.0` | ✅ runtime | ✅ runtime | ✅ runtime |
| 008 | `5.0 / 0.0` = Infinity | ✅ runtime | ✅ runtime | ✅ runtime |
| 009 | `-5.0 / 0.0` = -Infinity | ✅ runtime | ✅ runtime | ✅ runtime |
| 010 | `0.0 / 0.0` = NaN | ✅ runtime | ✅ runtime | ✅ runtime |
| 011 | `NaN == NaN` = false | ✅ runtime | ✅ runtime | ✅ runtime |
| 012 | `5.0 % 0.0` = NaN | ✅ runtime | ✅ runtime | ✅ runtime |
| 013 | 浮点除零无编译错误 | ✅ compile-pass | ✅ compile-pass | ⚠️ 可能 warning |
| 014 | 模块级 const 浮点除零 | ✅ runtime（Infinity） | ✅ runtime（Infinity） | ✅ runtime（inf） |
| 015 | `1e10f` float 后缀 | ✅ compile-pass | ✅ `1e10f` | ❌ Swift 无 float 后缀 |
| 016 | `number` 是 `double` 别名 | ✅ compile-pass | N/A | N/A |
| 017 | 浮点比较精度 | ✅ runtime | ✅ runtime | ✅ runtime |
| 018 | `new float()` 构造返回 0.0 | ✅ runtime | ❌ 不支持 | ✅ runtime（Float()） |
| 019 | float 加法精度损失 | ✅ runtime | ✅ runtime | ✅ runtime |
| 020 | double 与 float 混合运算 | ✅ runtime（提升为 double） | ✅ runtime（提升为 double） | ❌ 必须显式转换 |

### 关键差异详解

#### 008-012: 浮点除零行为（三语言完全一致）⭐

| 运算 | ArkTS | Java | Swift |
|------|-------|------|-------|
| `5.0 / 0.0` | Infinity | Infinity | inf |
| `-5.0 / 0.0` | -Infinity | -Infinity | -inf |
| `0.0 / 0.0` | NaN | NaN | nan |
| `5.0 % 0.0` | NaN | NaN | nan |
| `NaN == NaN` | false | false | false |

**关键结论：浮点除零是三语言行为最一致的区域。**

#### 003-004: widening 隐式转换 ⭐

| 语言 | `int → float` | `int → double` |
|------|-------------|--------------|
| ArkTS | ✅ 隐式 | ✅ 隐式 |
| Java | ✅ 隐式 | ✅ 隐式 |
| Swift | ❌ 必须显式 | ❌ 必须显式 |

---

## 五、综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| IEEE 754 合规 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 运算符完整度 | ⭐⭐⭐⭐⭐（含 **） | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| 类型推升合理性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐ |
| **浮点除零设计** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| 与整数除零一致性 | ⭐⭐⭐（差异大）| ⭐⭐⭐⭐（差异适中）| ⭐⭐⭐⭐（差异适中）|

---

## 六、核心结论

| 角度 | 结论 |
|------|------|
| **浮点除零行为** | ArkTS = Java = Swift（完全一致）|
| **与 spec 一致** | ✅ ArkTS spec §15.17.2 明确"永不抛错"|
| **与整数除零差异** | 三语言内部均存在差异（IEEE 754 vs 整数异常）|

### 关键启示

1. **浮点除零是 ArkTS 设计中最稳定的部分**：与 Java/Swift 完全一致
2. **IEEE 754 是真正的"通用语言"**：三语言对外行为完全一致
3. **整数与浮点行为差异**是设计选择，不是 bug
4. **ArkTS 浮点设计无任何问题**

### ArkTS 浮点除零设计建议

✅ **保持现状**，浮点除零设计完美合规。

---

## 七、对应规范

| 语言 | 规范 |
|------|------|
| ArkTS | ArkTS Static Spec §3.6.3, §15.17.2 |
| Java | JLS SE21 §4.2.3, §4.2.4, §15.17.2 |
| Swift | The Swift Programming Language: Floating-Point Types |
