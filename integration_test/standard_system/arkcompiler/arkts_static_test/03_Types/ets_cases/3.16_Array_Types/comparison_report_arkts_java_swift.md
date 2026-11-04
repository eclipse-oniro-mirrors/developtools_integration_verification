# 3.16 Array Types - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 数组类型 | `T[]` / `Array<T>` | `T[]` | `[T]` / `Array<T>` |
| 固定大小数组 | `FixedArray<T>`（实验性） | 无 | 无 |
| 可变性 | 可变（Resizable） | 长度固定 | 可变 |
| 类型关系 | Object 子类型 | Object 子类型 | 值类型（struct） |
| 可迭代 | ✅ | ✅ for-each | ✅ for-in |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| 数组声明 | `T[]` / `Array<T>` | `T[]` | `[T]` / `Array<T>` |
| 空数组 | `[]` | `new T[0]` | `[]` |
| 数组长度 | `.length` | `.length` | `.count` |
| 索引访问 | `arr[i]` | `arr[i]` | `arr[i]` |
| 数组可变 | push/pop | 无（长度固定） | append/remove |
| FixedArray | `FixedArray<T>` | N/A | N/A |
| 数组是 Object | ✅ | ✅ | ❌ 值类型 |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **长度可变性** | ✅ 可变 | ❌ 固定 | ✅ 可变 |
| **FixedArray** | ✅ 实验性 | ❌ | ❌ |
| **值/引用类型** | 引用类型 | 引用类型 | 值类型（COW） |
| **方法支持** | push/pop 等 | 无 | append/remove 等 |
| **类型系统** | Object 子类型 | Object 子类型 | 值类型 |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 数组声明

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | 数组声明 | ✅ compile-pass | ✅ | ✅ |

**代码对照：**

ArkTS:
```typescript
let arr1: number[] = [1, 2, 3]
let arr2: Array<number> = [4, 5, 6]
```

Java:
```java
int[] arr1 = {1, 2, 3};
Integer[] arr2 = {4, 5, 6};
```

Swift:
```swift
let arr1: [Int] = [1, 2, 3]
let arr2: Array<Int> = [4, 5, 6]
```

---

### 4.2 空数组

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 002 | 空数组声明 | ✅ compile-pass | ✅ | ✅ |

**代码对照：**

ArkTS:
```typescript
let arr: number[] = []
```

Java:
```java
int[] arr = new int[0];
```

Swift:
```swift
let arr: [Int] = []
```

---

### 4.3 数组是 Object 子类型 ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 003 | 数组赋值给 Object | ✅ compile-pass | ✅ | ❌ **N/A**（值类型） |

**代码对照：**

ArkTS:
```typescript
let arr: number[] = [1, 2, 3]
let o: Object = arr  // OK
```

Java:
```java
int[] arr = {1, 2, 3};
Object o = arr;  // OK
```

Swift:
```swift
let arr = [1, 2, 3]
let o: Any = arr  // OK (Any 接受值类型)
// 但 Array 不是 AnyObject
```

---

### 4.4 数组可迭代

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 004 | for-of 遍历 | ✅ compile-pass | ✅ | ✅ |

**代码对照：**

ArkTS:
```typescript
for (let n of arr) { ... }
```

Java:
```java
for (int n : arr) { ... }
```

Swift:
```swift
for n in arr { ... }
```

---

### 4.5 数组索引访问

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 005 | 索引访问 | ✅ compile-pass | ✅ | ✅ |

---

### 4.6 数组 push/pop ⭐ 关键差异

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 006 | push/pop 方法 | ✅ compile-pass | ❌ **N/A** | ✅ append/remove |

**代码对照：**

ArkTS:
```typescript
arr.push(4)
let last = arr.pop()
```

Java:
```java
// Java 数组长度固定，无 push/pop
// 需要使用 ArrayList
```

Swift:
```swift
arr.append(4)
let last = arr.removeLast()
```

---

### 4.7 FixedArray ⭐ ArkTS 独有

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| N/A | FixedArray | ✅ 实验性 | ❌ | ❌ |

**代码对照：**

ArkTS:
```typescript
let fixed: FixedArray<number> = [1, 2, 3]
```

Java: **N/A**

Swift: **N/A**

---

### 4.8 ⭐ Resizable 和 Fixed-Size 不能互赋值 (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 008 | Resizable 赋给 Fixed | ✅ **compile-fail** | N/A | N/A |

**代码对照：**

ArkTS (compile-fail):
```typescript
let resizable: number[] = [1, 2, 3]
let fixed: FixedArray<number> = resizable  // 编译错误
```

---

### 4.9 ⭐ Fixed 赋给 Resizable (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 009 | Fixed 赋给 Resizable | ✅ **compile-fail** | N/A | N/A |

**代码对照：**

ArkTS (compile-fail):
```typescript
let fixed: FixedArray<number> = [1, 2, 3]
let resizable: number[] = fixed  // 编译错误
```

---

### 4.10 ⭐ 数组元素类型不匹配 (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 010 | 元素类型不匹配 | ✅ **compile-fail** | ✅ **compile-fail** | ✅ **compile-fail** |

**代码对照：**

ArkTS (compile-fail):
```typescript
let arr: number[] = [1, "two", 3]  // 编译错误
```

Java (compile-fail):
```java
int[] arr = {1, "two", 3};  // 编译错误
```

Swift (compile-fail):
```swift
let arr: [Int] = [1, "two", 3]  // 编译错误
```

---

### 4.11 Runtime: 数组创建和访问

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 012 | 数组创建 | ✅ runtime | ✅ | ✅ |

---

### 4.12 Runtime: 数组可迭代

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 013 | 数组遍历 | ✅ runtime | ✅ | ✅ |

---

### 4.13 Runtime: 数组 push/pop

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 014 | push/pop | ✅ runtime | N/A | ✅ |

---

### 4.14 Runtime: 数组 instanceof

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 015 | instanceof | ✅ runtime | ✅ | N/A |

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 数组类型支持 | ★★★★★ | ★★★☆☆ | ★★★★★ |
| 可变性支持 | ★★★★★ | ★★☆☆☆ | ★★★★★ |
| FixedArray 支持 | ★★★★☆ | ☆☆☆☆☆ | ☆☆☆☆☆ |
| 类型严格性 | ★★★★★ | ★★★★☆ | ★★★★★ |
| 与 Object 集成 | ★★★★★ | ★★★★★ | ★★★☆☆ |

## 6. 核心结论

1. **ArkTS 和 Swift 都支持可变数组**：Java 数组长度固定，需要使用 ArrayList。

2. **ArkTS 独特的 FixedArray**：实验性特性，性能更好，但没有方法。

3. **数组是 Object 子类型**：ArkTS 和 Java 的数组都是 Object 子类型，Swift 是值类型。

4. **Resizable 和 Fixed-Size 不能互赋值**：这是 ArkTS 独有的限制。

5. **三语言都支持数组迭代**：ArkTS for-of，Java for-each，Swift for-in。

## 7. ArkTS 设计建议

1. **当前设计合理**：Resizable Array 推荐用于大多数情况，FixedArray 用于性能敏感场景。

2. **FixedArray 限制合理**：没有方法，长度固定，性能更好。

3. **建议文档加强**：明确说明 Resizable 和 Fixed-Size 的使用场景。

## 8. 三环境实测结果

> ✅ **实测时间**：2026-06-21
> ✅ **实测环境**：ArkTS static_core / Java SE 21 / Swift 5.10

### ArkTS 实测结果

| 用例 | 结果 |
|------|------|
| 001-007 compile-pass | ✅ |
| 008-011 compile-fail | ✅ |
| 012-016 runtime | ✅ |

### Java 实测结果

| 用例 | 结果 |
|------|------|
| 数组声明 | ✅ |
| 数组遍历 | ✅ |
| 数组 instanceof | ✅ |

### Swift 实测结果

| 用例 | 结果 |
|------|------|
| 数组声明 | ✅ |
| 数组可变性 | ✅ |
| 数组遍历 | ✅ |

### 关键发现

- **ArkTS 和 Swift 都支持可变数组**：Java 需要 ArrayList
- **ArkTS 独特的 FixedArray**：实验性特性
- **数组是 Object 子类型**：ArkTS 和 Java 一致，Swift 是值类型

---

## 9. 测试统计

### 用例统计

| 分类 | 数量 | 通过 | 失败 | 通过率 |
|------|------|------|------|--------|
| compile-pass | 7 | 7 | 0 | 100% |
| compile-fail | 4 | 4 | 0 | 100% |
| runtime | 5 | 5 | 0 | 100% |
| **总计** | **16** | **16** | **0** | **100%** |

### 跨语言验证

| 语言 | 测试文件 | 状态 |
|------|----------|------|
| ArkTS | 16 个用例 | ✅ 全部通过 |
| Java | TYP_03_16_Array_Types.java | ✅ 通过 |
| Swift | TYP_03_16_Array_Types.swift | ✅ 通过 |

---

## 10. 文件清单

### ArkTS 测试用例

```
3.16_Array_Types/
├── compile-pass/
│   ├── TYP_03_16_001_PASS_RESIZABLE_ARRAY.ets
│   ├── TYP_03_16_002_PASS_EMPTY_ARRAY.ets
│   ├── TYP_03_16_003_PASS_ARRAY_IS_OBJECT.ets
│   ├── TYP_03_16_004_PASS_ARRAY_ITERABLE.ets
│   ├── TYP_03_16_005_PASS_ARRAY_INDEX.ets
│   ├── TYP_03_16_006_PASS_ARRAY_PUSH_POP.ets
│   └── TYP_03_16_007_PASS_OBJECT_ARRAY.ets
├── compile-fail/
│   ├── TYP_03_16_008_FAIL_RESIZABLE_TO_FIXED.ets
│   ├── TYP_03_16_009_FAIL_FIXED_TO_RESIZABLE.ets
│   ├── TYP_03_16_010_FAIL_TYPE_MISMATCH.ets
│   └── TYP_03_16_011_FAIL_STRING_ARRAY_TO_NUMBER.ets
└── runtime/
    ├── TYP_03_16_012_RUNTIME_ARRAY_CREATE.ets
    ├── TYP_03_16_013_RUNTIME_ARRAY_ITERABLE.ets
    ├── TYP_03_16_014_RUNTIME_ARRAY_PUSH_POP.ets
    ├── TYP_03_16_015_RUNTIME_ARRAY_AS_OBJECT.ets
    └── TYP_03_16_016_RUNTIME_EMPTY_ARRAY.ets
```

### 跨语言验证文件

```
3.16_Array_Types/cross_lang_verify/
├── TYP_03_16_Array_Types.java
├── TYP_03_16_Array_Types.swift
└── run_cross_lang_tests.sh
```

### 报告文件

```
3.16_Array_Types/
├── test_design_mindmap_3.16.md
├── test_report_3.16.md
├── comparison_report_arkts_java_swift.md
```

---

## 11. 执行命令

### ArkTS 测试
```bash
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types
SECTIONS="3.16_Array_Types" bash run_types_cases_wsl.sh
```

### 跨语言验证
```bash
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types/ets_cases/3.16_Array_Types/cross_lang_verify
bash run_cross_lang_tests.sh
```
