# 3.15.1 String Literal Types - 跨语言对比报告（ArkTS / Java / Swift）

## 1. 概览

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| String Literal Type | ✅ 支持 | ❌ 不支持 | ❌ 不支持 |
| 操作结果类型 | 超类型 string | String | String |
| 类型关系 | 子类型 → 超类型 | N/A | N/A |
| 编译期检查 | ✅ 字面量值匹配 | N/A | N/A |

## 2. 章节对应关系

| 测试点 | ArkTS | Java | Swift |
|--------|-------|------|-------|
| String Literal Type 声明 | `let s: "hello" = "hello"` | `String s = "hello"` | `let s: String = "hello"` |
| 赋值给 string | `let s: string = sl` | N/A | N/A |
| + 运算结果 | string 类型 | String 类型 | String 类型 |
| 作为函数参数 | `f(p: "hello")` | `f(String p)` | `f(_ p: String)` |
| 相等比较 | `===` / `==` | `.equals()` | `==` |
| 关系比较 | `<` / `>` | `.compareTo()` | `<` / `>` |

## 3. 关键差异矩阵

| 差异维度 | ArkTS | Java | Swift |
|---------|-------|------|-------|
| **String Literal Type** | ✅ 支持 | ❌ 不支持 | ❌ 不支持 |
| **类型严格性** | 字面量值必须匹配 | N/A | N/A |
| **子类型关系** | literal → string | N/A | N/A |
| **操作结果类型** | 超类型 string | String | String |

## 4. 用例 1:1 对照（三环境实测结果）

### 4.1 String Literal Type 声明

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001 | String Literal Type 声明 | ✅ compile-pass | ❌ **N/A** | ❌ **N/A** |

**代码对照：**

ArkTS:
```typescript
let s0: "string literal" = "string literal"
```

Java: **N/A**（Java 无 string literal type）

Swift: **N/A**（Swift 无 string literal type）

---

### 4.2 赋值给 string

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 002 | 赋值给 string | ✅ compile-pass | N/A | N/A |

**代码对照：**

ArkTS:
```typescript
let s0: "string literal" = "string literal"
let s1: string = s0  // OK
```

---

### 4.3 + 运算结果为 string ⭐ 关键特性

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 003 | + 运算结果为 string | ✅ compile-pass | ✅ String | ✅ String |

**代码对照：**

ArkTS:
```typescript
let s0: "string literal" = "string literal"
let s1: string = s0 + s0  // 结果是 string 类型
```

Java:
```java
String s0 = "string literal";
String s1 = s0 + s0;  // 结果是 String 类型
```

Swift:
```swift
let s0: String = "string literal"
let s1: String = s0 + s0  // 结果是 String 类型
```

---

### 4.4 与 string 运算

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 004 | 与 string 运算 | ✅ compile-pass | ✅ | ✅ |

**代码对照：**

ArkTS:
```typescript
let s0: "hello" = "hello"
let s1: string = " world"
let s2: string = s0 + s1  // 结果是 string
```

---

### 4.5 作为函数参数

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 005 | 作为函数参数 | ✅ compile-pass | N/A | N/A |

**代码对照：**

ArkTS:
```typescript
function greet(name: "World"): string {
  return "Hello, " + name
}
```

---

### 4.6 相等比较

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 006 | 相等比较 | ✅ compile-pass | ✅ | ✅ |

**代码对照：**

ArkTS:
```typescript
let s0: "hello" = "hello"
let s1: "hello" = "hello"
if (s0 === s1) { ... }
```

Java:
```java
String s0 = "hello";
String s1 = "hello";
if (s0.equals(s1)) { ... }
```

Swift:
```swift
let s0: String = "hello"
let s1: String = "hello"
if s0 == s1 { ... }
```

---

### 4.7 关系比较

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 007 | 关系比较 | ✅ compile-pass | ✅ | ✅ |

---

### 4.8 ⭐ string 不能赋给 String Literal Type (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 008 | string 赋给 literal | ✅ **compile-fail** | N/A | N/A |

**代码对照：**

ArkTS (compile-fail):
```typescript
let s: string = "hello"
let sl: "hello" = s  // 编译错误
```

---

### 4.9 ⭐ 不同 String Literal Type 不能互赋 (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 009 | 不同 literal 互赋 | ✅ **compile-fail** | N/A | N/A |

**代码对照：**

ArkTS (compile-fail):
```typescript
let s0: "hello" = "hello"
let s1: "world" = s0  // 编译错误
```

---

### 4.10 ⭐ 字面量值不匹配 (compile-fail)

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 010 | 字面量值不匹配 | ✅ **compile-fail** | N/A | N/A |

**代码对照：**

ArkTS (compile-fail):
```typescript
let s: "hello" = "world"  // 编译错误
```

---

### 4.11 Runtime: + 运算结果验证

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 011 | + 运算结果 | ✅ runtime | ✅ | ✅ |

---

### 4.12 Runtime: 函数参数验证

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 012 | 函数参数 | ✅ runtime | ✅ | ✅ |

---

### 4.13 Runtime: 比较运算验证

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 013 | 比较运算 | ✅ runtime | ✅ | ✅ |

---

## 5. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| String Literal Type 支持 | ★★★★★ | ☆☆☆☆☆ | ☆☆☆☆☆ |
| 类型严格性 | ★★★★★ | ★★★☆☆ | ★★★★★ |
| 操作一致性 | ★★★★★ | ★★★★★ | ★★★★★ |
| 编译期检查 | ★★★★★ | ☆☆☆☆☆ | ☆☆☆☆☆ |

## 6. 核心结论

1. **ArkTS 独特设计**：只有 ArkTS 支持 String Literal Type，Java 和 Swift 都不支持。

2. **操作结果为超类型**：`s0 + s0` 的结果是 `string` 类型，不是 `"string literalstring literal"`。

3. **子类型关系**：String Literal Type 是 string 的子类型，可赋值给 string，但反过来不行。

4. **编译期检查**：字面量值必须匹配，不同 literal type 不能互赋。

5. **Java/Swift 替代方案**：都使用 String 类型，没有字面量类型的概念。

## 7. ArkTS 设计建议

1. **当前设计合理**：String Literal Type 提高了类型安全性，可以限制变量只能持有特定值。

2. **操作结果为超类型**：避免了类型过于严格，保持了操作的一致性。

3. **考虑扩展**：未来可以考虑支持数字字面量类型。

## 8. 三环境实测结果

> ✅ **实测时间**：2026-06-21
> ✅ **实测环境**：ArkTS static_core / Java SE 21 / Swift 5.10

### ArkTS 实测结果

| 用例 | 结果 |
|------|------|
| 001-007 compile-pass | ✅ |
| 008-010 compile-fail | ✅ |
| 011-013 runtime | ✅ |

### Java 实测结果

| 用例 | 结果 |
|------|------|
| 常量模拟 | ✅ |
| String 操作 | ✅ |

### Swift 实测结果

| 用例 | 结果 |
|------|------|
| String 类型 | ✅ |
| String 操作 | ✅ |

### 关键发现

- **ArkTS 独特设计**：只有 ArkTS 支持 String Literal Type
- **操作结果为超类型**：三语言一致，+ 运算结果都是 String 类型
- **编译期检查**：ArkTS 的字面量值匹配检查是独特的

---

## 9. 测试统计

### 用例统计

| 分类 | 数量 | 通过 | 失败 | 通过率 |
|------|------|------|------|--------|
| compile-pass | 7 | 7 | 0 | 100% |
| compile-fail | 3 | 3 | 0 | 100% |
| runtime | 3 | 3 | 0 | 100% |
| **总计** | **13** | **13** | **0** | **100%** |

### 跨语言验证

| 语言 | 测试文件 | 状态 |
|------|----------|------|
| ArkTS | 13 个用例 | ✅ 全部通过 |
| Java | TYP_03_15_01_String_Literal_Types.java | ✅ 通过 |
| Swift | TYP_03_15_01_String_Literal_Types.swift | ✅ 通过 |

---

## 10. 文件清单

### ArkTS 测试用例

```
3.15.1_String_Literal_Types/
├── compile-pass/
│   ├── TYP_03_15_01_001_PASS_STRING_LITERAL_DECLARE.ets
│   ├── TYP_03_15_01_002_PASS_ASSIGN_TO_STRING.ets
│   ├── TYP_03_15_01_003_PASS_PLUS_RESULT_STRING.ets
│   ├── TYP_03_15_01_004_PASS_PLUS_WITH_STRING.ets
│   ├── TYP_03_15_01_005_PASS_AS_PARAM.ets
│   ├── TYP_03_15_01_006_PASS_EQUALITY.ets
│   └── TYP_03_15_01_007_PASS_RELATIONAL.ets
├── compile-fail/
│   ├── TYP_03_15_01_008_FAIL_STRING_TO_LITERAL.ets
│   ├── TYP_03_15_01_009_FAIL_DIFFERENT_LITERALS.ets
│   └── TYP_03_15_01_010_FAIL_WRONG_VALUE.ets
└── runtime/
    ├── TYP_03_15_01_011_RUNTIME_PLUS_RESULT.ets
    ├── TYP_03_15_01_012_RUNTIME_AS_PARAM.ets
    └── TYP_03_15_01_013_RUNTIME_COMPARISON.ets
```

### 跨语言验证文件

```
3.15.1_String_Literal_Types/cross_lang_verify/
├── TYP_03_15_01_String_Literal_Types.java
├── TYP_03_15_01_String_Literal_Types.swift
└── run_cross_lang_tests.sh
```

### 报告文件

```
3.15.1_String_Literal_Types/
├── test_design_mindmap_3.15.1.md
├── test_report_3.15.1.md
├── comparison_report_arkts_java_swift.md
```

---

## 11. 执行命令

### ArkTS 测试
```bash
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types
SECTIONS="3.15.1_String_Literal_Types" bash run_types_cases_wsl.sh
```

### 跨语言验证
```bash
cd /mnt/d/git/ARKTS_STATIC_TEST/03_Types/ets_cases/3.15.1_String_Literal_Types/cross_lang_verify
bash run_cross_lang_tests.sh
```
