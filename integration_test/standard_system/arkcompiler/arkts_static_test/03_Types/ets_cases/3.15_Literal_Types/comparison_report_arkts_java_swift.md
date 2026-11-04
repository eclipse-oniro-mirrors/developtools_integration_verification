# 3.15 Literal Types - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 字面量类型 | 支持 String Literal Types、null、undefined | 不支持（使用常量） | 支持（String 类型） |
| null 类型 | `null` 独立类型 | `null` 是引用类型特殊值 | `nil` 是 Optional 特殊值 |
| undefined 类型 | `undefined` 独立类型 | 无此概念 | 无此概念（用 nil） |
| String Literal | `"hello"` 类型 | 无（只有 String） | 无（只有 String） |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| String Literal Type | `let a: "hello" = "hello"` | N/A（无字面量类型） | N/A（无字面量类型） |
| null 字面量类型 | `let b: null = null` | `String b = null`（引用类型） | `let b: String? = nil`（Optional） |
| undefined 字面量类型 | `let c: undefined = undefined` | N/A | N/A |
| 字面量类型参数 | `f(p: "hello")` | N/A | N/A |
| 字面量类型赋值给超类型 | `let s: string = "hello"`（OK） | N/A | N/A |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **字面量类型支持** | ✅ 支持 | ❌ 不支持 | ❌ 不支持 |
| **null 类型** | 独立类型 `null` | 引用类型特殊值 | Optional 特殊值 |
| **undefined 类型** | 独立类型 `undefined` | 无 | 无 |
| **类型严格性** | 字面量类型是超类型的子类型 | N/A | N/A |
| **编译期检查** | 字面量类型不匹配报错 | N/A | N/A |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 String Literal Type

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | String Literal Type 声明 | ✅ compile-pass | ❌ **N/A** | ❌ **N/A** |

**代码对照：**

ArkTS:
```typescript
let a: "string literal" = "string literal"
```

Java: **N/A**（Java 无字面量类型）

Swift: **N/A**（Swift 无字面量类型）

---

### 4.2 null 字面量类型

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 002 | null 字面量类型声明 | ✅ compile-pass | ✅ `String b = null` | ✅ `String? = nil` |

**代码对照：**

ArkTS:
```typescript
let b: null = null
```

Java:
```java
String b = null;  // 引用类型可 null
```

Swift:
```swift
let b: String? = nil  // Optional
```

---

### 4.3 undefined 字面量类型 ⭐ ArkTS 独有

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 003 | undefined 字面量类型声明 | ✅ compile-pass | ❌ **N/A** | ❌ **N/A** |

**代码对照：**

ArkTS:
```typescript
let c: undefined = undefined
```

Java: **N/A**（Java 无 undefined）

Swift: **N/A**（Swift 无 undefined）

---

### 4.4 字面量类型作为函数参数 ⭐ ArkTS 独有

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 004 | 字面量类型参数 | ✅ compile-pass | ❌ **N/A** | ❌ **N/A** |

**代码对照：**

ArkTS:
```typescript
function printThem(p1: "string literal", p2: null, p3: undefined): void {
  console.log(p1, p2, p3)
}
```

Java: **N/A**

Swift: **N/A**

---

### 4.5 String Literal 赋值给 string

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 005 | String Literal 赋值给 string | ✅ compile-pass | N/A | N/A |

**代码对照：**

ArkTS:
```typescript
let s0: "string literal" = "string literal"
let s1: string = s0  // OK
```

---

### 4.6 String Literal 操作结果为 string

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 006 | String Literal 操作 | ✅ compile-pass | N/A | N/A |

**代码对照：**

ArkTS:
```typescript
let s0: "string literal" = "string literal"
let s1: string = s0 + s0  // 结果为 string 类型
```

---

### 4.7 ⭐ string 不能赋值给 String Literal (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 007 | string 赋值给 String Literal | ✅ **compile-fail** | N/A | N/A |

**代码对照：**

ArkTS (compile-fail):
```typescript
let s: string = "string literal"
let sl: "string literal" = s  // 编译错误
```

---

### 4.8 ⭐ null 不能赋值给非空类型 (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 008 | null 赋值给非空类型 | ✅ **compile-fail** | ⚠️ **compile-pass**（引用类型） | ✅ **compile-fail** |

**代码对照：**

ArkTS (compile-fail):
```typescript
let n: null = null
let s: string = n  // 编译错误
```

Java (⚠️ compile-pass):
```java
String n = null;
String s = n;  // OK - 引用类型可 null
```

Swift (compile-fail):
```swift
let n: String? = nil
let s: String = n  // 编译错误
```

---

### 4.9 ⭐ undefined 不能赋值给非空类型 (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 009 | undefined 赋值给非空类型 | ✅ **compile-fail** | N/A | N/A |

**代码对照：**

ArkTS (compile-fail):
```typescript
let u: undefined = undefined
let s: string = u  // 编译错误
```

Java: **N/A**

Swift: **N/A**

---

### 4.10 Runtime: String Literal Type 运行时

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 011 | String Literal Type 运行时 | ✅ runtime | N/A | N/A |

**代码对照：**

ArkTS:
```typescript
let a: "string literal" = "string literal"
let b: string = a + a  // "string literalstring literal"
```

---

### 4.11 Runtime: null literal 运行时

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 012 | null literal 运行时 | ✅ runtime | ✅ | ✅ |

---

### 4.12 Runtime: undefined literal 运行时

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 013 | undefined literal 运行时 | ✅ runtime | N/A | N/A |

---

### 4.13 Runtime: 字面量类型参数运行时

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 014 | 字面量类型参数 | ✅ runtime | N/A | N/A |

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 字面量类型支持 | ★★★★★ | ★☆☆☆☆ | ★☆☆☆☆ |
| null 安全 | ★★★★★ | ★★☆☆☆ | ★★★★★ |
| undefined 支持 | ★★★★★ | ☆☆☆☆☆ | ☆☆☆☆☆ |
| 类型表达力 | ★★★★★ | ★★☆☆☆ | ★★★☆☆ |
| 语义直观性 | ★★★★☆ | ★★★☆☆ | ★★★★☆ |

## 6. 核心结论

1. **ArkTS 独特的字面量类型设计**：支持 String Literal Types、null、undefined 三种字面量类型，Java 和 Swift 都不支持。

2. **String Literal Type 是超类型的子类型**：`"hello"` 类型可以赋值给 `string` 类型，但反过来不行。

3. **null 和 undefined 是独立类型**：与 Java/Swift 的 null/nil 不同，ArkTS 的 null 和 undefined 是独立的字面量类型。

4. **字面量类型作为函数参数**：可以限制参数只能接受特定的字面量值，提高类型安全性。

5. **Java 和 Swift 都不支持字面量类型**：Java 使用常量，Swift 使用枚举关联值来实现类似功能。

## 7. ArkTS 设计建议

1. **当前设计合理**：字面量类型提高了类型安全性，可以限制变量只能持有特定值。

2. **考虑扩展支持**：未来可以考虑支持数字字面量类型（如 `let n: 42 = 42`）。

3. **文档加强**：明确说明 String Literal Type 与 string 的关系（子类型）。

4. **与 null/undefined 集成**：null 和 undefined 作为字面量类型，与 nullish 体系自然集成。

## 8. 三环境实测结果

> ✅ **实测时间**：2026-06-21
> ✅ **实测环境**：ArkTS static_core / Java SE 21 / Swift 5.10

### ArkTS 实测结果

| 用例 | 结果 |
|------|------|
| 001_PASS_STRING_LITERAL_TYPE | ✅ |
| 002_PASS_NULL_LITERAL_TYPE | ✅ |
| 003_PASS_UNDEFINED_LITERAL_TYPE | ✅ |
| 004_PASS_LITERAL_AS_PARAM | ✅ |
| 005_PASS_STRING_LITERAL_TO_STRING | ✅ |
| 006_PASS_STRING_LITERAL_OPERATION | ✅ |
| 007_FAIL_STRING_TO_STRING_LITERAL | ✅ (compile-fail) |
| 008_FAIL_NULL_TO_NONNULLISH | ✅ (compile-fail) |
| 009_FAIL_UNDEFINED_TO_NONNULLISH | ✅ (compile-fail) |
| 010_FAIL_WRONG_STRING_LITERAL | ✅ (compile-fail) |
| 011-014 runtime | ✅ |

### Java 实测结果

| 用例 | 结果 |
|------|------|
| 常量模拟字面量类型 | ✅ |
| null 赋给引用类型 | ✅ |
| 无 undefined 概念 | N/A |

### Swift 实测结果

| 用例 | 结果 |
|------|------|
| String 类型 | ✅ |
| Optional 处理 null | ✅ |
| 无 undefined 概念 | N/A |
| 枚举关联值 | ✅ |

### 关键发现

- **ArkTS 独特设计**：只有 ArkTS 支持字面量类型
- **Java/Swift 替代方案**：Java 使用常量，Swift 使用枚举
- **null/undefined 是独立类型**：与 Java/Swift 的 null/nil 不同

---

## 9. 测试统计

### 用例统计

| 分类 | 数量 | 通过 | 失败 | 通过率 |
|------|------|------|------|--------|
| compile-pass | 6 | 6 | 0 | 100% |
| compile-fail | 4 | 4 | 0 | 100% |
| runtime | 4 | 4 | 0 | 100% |
| **总计** | **14** | **14** | **0** | **100%** |

### 跨语言验证

| 语言 | 测试文件 | 状态 |
|------|----------|------|
| ArkTS | 14 个用例 | ✅ 全部通过 |
| Java | TYP_03_15_Literal_Types.java | ✅ 通过 |
| Swift | TYP_03_15_Literal_Types.swift | ✅ 通过 |

---

## 10. 文件清单

### ArkTS 测试用例

```
3.15_Literal_Types/
├── compile-pass/
│   ├── TYP_03_15_001_PASS_STRING_LITERAL_TYPE.ets
│   ├── TYP_03_15_002_PASS_NULL_LITERAL_TYPE.ets
│   ├── TYP_03_15_003_PASS_UNDEFINED_LITERAL_TYPE.ets
│   ├── TYP_03_15_004_PASS_LITERAL_AS_PARAM.ets
│   ├── TYP_03_15_005_PASS_STRING_LITERAL_TO_STRING.ets
│   └── TYP_03_15_006_PASS_STRING_LITERAL_OPERATION.ets
├── compile-fail/
│   ├── TYP_03_15_007_FAIL_STRING_TO_STRING_LITERAL.ets
│   ├── TYP_03_15_008_FAIL_NULL_TO_NONNULLISH.ets
│   ├── TYP_03_15_009_FAIL_UNDEFINED_TO_NONNULLISH.ets
│   └── TYP_03_15_010_FAIL_WRONG_STRING_LITERAL.ets
└── runtime/
    ├── TYP_03_15_011_RUNTIME_STRING_LITERAL_TYPE.ets
    ├── TYP_03_15_012_RUNTIME_NULL_LITERAL_TYPE.ets
    ├── TYP_03_15_013_RUNTIME_UNDEFINED_LITERAL_TYPE.ets
    └── TYP_03_15_014_RUNTIME_LITERAL_AS_PARAM.ets
```

### 跨语言验证文件

```
3.15_Literal_Types/cross_lang_verify/
├── TYP_03_15_Literal_Types.java
├── TYP_03_15_Literal_Types.swift
└── run_cross_lang_tests.sh
```

### 报告文件

```
3.15_Literal_Types/
├── test_design_mindmap_3.15.md
├── test_report_3.15.md
├── comparison_report_arkts_java_swift.md
```

---

## 11. 执行命令

### ArkTS 测试
```bash
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types
SECTIONS="3.15_Literal_Types" bash run_types_cases_wsl.sh
```

### 跨语言验证
```bash
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types/ets_cases/3.15_Literal_Types/cross_lang_verify
bash run_cross_lang_tests.sh
```
