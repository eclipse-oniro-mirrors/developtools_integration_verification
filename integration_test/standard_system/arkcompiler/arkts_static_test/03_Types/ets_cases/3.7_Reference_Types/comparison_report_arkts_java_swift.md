# 3.7 Reference Types - ArkTS vs Java vs Swift

## 一、引用类型集合对比

| 引用类型 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| Class | ✅ | ✅ | ✅ |
| Interface | ✅ | ✅ | ✅（protocol）|
| Array | ✅ | ✅ | ✅ |
| FixedArray | ✅（独有） | T[] 默认固定 | ❌ |
| Tuple | ✅ | ❌ | ✅ |
| Function | ✅ | Function<T,R> | ✅ |
| Union | ✅ | ❌ | ❌ |
| Literal | ✅（仅 string）| ❌ | ❌ |
| Any | ✅ | Object | Any |
| string | ✅（引用类型） | ✅（class） | ❌（struct）|
| bigint | ✅ | BigInteger（class）| ❌ |
| never | ✅ | ❌ | Never |
| null | ✅ | ✅ | nil |
| void/undefined | ✅ | void（仅返回）| Void = ()|
| Type Parameter | ✅ | ✅ | ✅ |

## 二、引用语义对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| Class 引用语义 | ✅ | ✅ | ✅ |
| Array 引用语义 | ✅ | ✅ | ⚠️（值语义但 COW）|
| String 引用 vs 值 | 引用（不可变）| 引用（不可变）| 值（COW）|
| 多变量共享对象 | ✅ | ✅ | ⚠️（Array 复制）|

## 三、关键差异

### Swift Array 是值类型（不共享）
```swift
var a = [1, 2, 3]
var b = a       // 复制（值语义）
b[0] = 100      // a[0] 仍为 1
```

### ArkTS/Java Array 是引用类型（共享）
```typescript
let a: int[] = [1, 2, 3]
let b: int[] = a   // 同一数组
b[0] = 100         // a[0] 变为 100
```

## 四、核心结论

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 引用类型种类 | ⭐⭐⭐⭐⭐（最丰富）| ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 引用 vs 值清晰 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐（Array 反直觉）|
| Tuple/Union 一等 | ⭐⭐⭐⭐⭐ | ❌ | ⭐⭐⭐⭐（仅 Tuple）|

## 五、用例 1:1 对照（三环境实测结果）

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | class 实例引用共享 | ✅ compile-pass + runtime | ✅ 编译通过 + 运行通过 | ✅ class 引用共享 |
| 002 | 数组引用共享（赋值 b=a 修改 b 影响 a） | ✅ runtime（引用共享） | ✅ runtime（引用共享） | ⚠️ runtime（值语义 COW，修改 b 不影响 a） |
| 003 | string 引用赋值 | ✅ compile-pass | ✅ 编译通过 | ⚠️ Swift String 是值类型 |
| 004 | FixedArray 声明与访问 | ✅ compile-pass + runtime | N/A（Java 数组本就固定长度） | N/A（无对应概念） |
| 005 | FixedArray 赋值给 Array（compile-fail） | ✅ compile-fail | N/A | N/A |
| 006 | tuple 创建与索引 | ✅ compile-pass + runtime | ❌ 无原生 tuple | ✅ runtime（tuple 一等公民） |
| 007 | union 类型变量赋值 | ✅ compile-pass | ❌ 无原生 union（需 sealed class） | ❌ 无原生 union（需 enum） |
| 008 | string 作为引用类型赋值给 Object | ✅ compile-pass + runtime | ✅ 编译通过 + 运行通过 | ⚠️ Swift String 不是 AnyObject |
| 009 | bigint 作为引用类型赋值给 Object | ✅ compile-pass + runtime | ⚠️ BigInteger 赋给 Object | ❌ 无原生 bigint |
| 010 | 多变量共享同一对象修改 | ✅ runtime（引用修改可见） | ✅ runtime（引用修改可见） | ⚠️ class 引用修改可见，struct 不可见 |

### 关键差异详解

#### 002: 数组引用共享 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let b: int[] = a; b[0] = 100;` | a[0] 变为 100（引用共享） |
| Java | `int[] b = a; b[0] = 100;` | a[0] 变为 100（引用共享） |
| Swift | `var b = a; b[0] = 100;` | a[0] 不变（值语义 COW） |

#### 005: FixedArray 与 Array 互赋 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let fa: FixedArray<int> = [1,2]; let arr: int[] = fa;` | ❌ compile-fail |
| Java | N/A（Java 数组本就固定长度，无 FixedArray 概念） | — |
| Swift | N/A（Swift 数组都是动态，无对应概念） | — |

#### 007: union 类型 ⭐

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let u: int \| string = 42; u = "hello";` | ✅ 原生支持 |
| Java | `Object u = 42; u = "hello";`（仅 Object 多态） | ⚠️ 类型信息丢失 |
| Swift | `var u: Any = 42; u = "hello";`（仅 Any 多态） | ⚠️ 类型信息丢失 |

## 六、对应规范

| 语言 | 规范 |
|------|------|
| ArkTS | §3.7 Reference Types |
| Java | JLS §4.3 |
| Swift | TSPL: Classes, Structures |
