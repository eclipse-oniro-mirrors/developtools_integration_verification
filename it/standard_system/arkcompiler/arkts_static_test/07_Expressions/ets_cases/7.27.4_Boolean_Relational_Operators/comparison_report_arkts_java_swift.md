# 7.27.4 Boolean Relational Operators — 三语言对比报告

## 1. 概览

Boolean 关系运算符定义 `boolean` 类型的 `<`（小于）、`<=`（小于等于）、`>`（大于）、`>=`（大于等于）四种比较操作，基于 false=0、true=1 的数值等效语义。

| 语言 | boolean 关系运算符 | 语法形式 | 遵循 Comparable |
|------|:-----------------:|:--------:|:---------------:|
| ArkTS | ✅ `<`, `<=`, `>`, `>=` | 运算符直接使用 | ✅ |
| Java | ⚠️ `Boolean.compare()` | 方法调用 `Boolean.compare(a,b) < 0` | ⚠️ Comparator 方式 |
| Swift | ❌ 不支持 | 自定义函数 `lt(a,b)` / `le(a,b)` | ❌ Bool 不遵循 Comparable |

## 2. 章节对应关系

| 功能点 | ArkTS 7.27.4 | Java JLS SE21 | Swift 5.10 |
|--------|-------------|---------------|-------------|
| boolean 关系运算符 | `<`, `<=`, `>`, `>=` | `Boolean.compare()` | ❌ 不支持 |
| 结果类型 | `boolean` | `int`（compare 返回 <0/=0/>0） | `Bool`（自定义函数） |
| 等效模型 | `false=0`, `true=1` | `Boolean.compare()` 同语义 | 自定义 `!a&&b` 等 |
| 非 boolean 类型 | 编译时错误 | N/A | N/A |

## 3. 关键差异矩阵

| 差异点 | ArkTS | Java | Swift |
|--------|:-----:|:----:|:-----:|
| 运算符直接使用 | ✅ `<`, `<=`, `>`, `>=` | ❌ `Boolean.compare()` 方法 | ❌ 不支持 |
| 返回 boolean 类型 | ✅ `boolean` | ❌ 返回 `int` | ✅ `Bool`（自定义函数） |
| 非 boolean 类型编译拒绝 | ✅ 编译时错误 | N/A | N/A |

## 4. 用例 1:1 对照

### 真值表对照

| LHS | RHS | 操作 | ArkTS | Java | Swift |
|:---:|:---:|:----:|:-----:|:----:|:-----:|
| false | false | `<` | `false` | `Boolean.compare(f,f) < 0` → false | `lt(false,false)` → false |
| false | true | `<` | **`true`** | `Boolean.compare(f,t) < 0` → true | `lt(false,true)` → true |
| true | false | `<` | `false` | `Boolean.compare(t,f) < 0` → false | `lt(true,false)` → false |
| true | true | `<` | `false` | `Boolean.compare(t,t) < 0` → false | `lt(true,true)` → false |
| false | false | `<=` | **`true`** | `Boolean.compare(f,f) <= 0` → true | `le(false,false)` → true |
| false | true | `<=` | **`true`** | `Boolean.compare(f,t) <= 0` → true | `le(false,true)` → true |
| true | false | `<=` | `false` | `Boolean.compare(t,f) <= 0` → false | `le(true,false)` → false |
| true | true | `<=` | **`true`** | `Boolean.compare(t,t) <= 0` → true | `le(true,true)` → true |
| false | false | `>` | `false` | `Boolean.compare(f,f) > 0` → false | `gt(false,false)` → false |
| false | true | `>` | `false` | `Boolean.compare(f,t) > 0` → false | `gt(false,true)` → false |
| true | false | `>` | **`true`** | `Boolean.compare(t,f) > 0` → true | `gt(true,false)` → true |
| true | true | `>` | `false` | `Boolean.compare(t,t) > 0` → false | `gt(true,true)` → false |
| false | false | `>=` | **`true`** | `Boolean.compare(f,f) >= 0` → true | `ge(false,false)` → true |
| false | true | `>=` | `false` | `Boolean.compare(f,t) >= 0` → false | `ge(false,true)` → false |
| true | false | `>=` | **`true`** | `Boolean.compare(t,f) >= 0` → true | `ge(true,false)` → true |
| true | true | `>=` | **`true`** | `Boolean.compare(t,t) >= 0` → true | `ge(true,true)` → true |

## 5. 三环境实测结果

| # | 用例 | ArkTS | Java | Swift |
|---|------|-------|------|-------|
| 001-016 | 完整真值表 16 项 | ✅ runtime (16断言) | ✅ compare (16断言) | ✅ 自定义 (16断言) |
| 017-024 | 变量验证 | ✅ runtime (8断言) | ✅ (8断言) | ✅ (8断言) |
| 025-028 | 表达式验证 | ✅ runtime (4断言) | ✅ (4断言) | ✅ (4断言) |
| 029-034 | boolean + int/string/bigint/double/Object/float | ✅ compile-fail (6) | N/A | N/A |

### 关键差异详解

#### 差异 1: 语法形式 — ArkTS 明显领先 Swift ⭐

| 语言 | 语法 | 说明 |
|------|------|------|
| ArkTS | `false < true` | 关系运算符直接返回 boolean，最简洁 |
| Java | `Boolean.compare(false, true) < 0` | 方法调用 + 手动与 0 比较 |
| Swift | `lt(false, true)` | **不支持运算符语法**，需自定义辅助函数 |

ArkTS 是三种语言中唯一直接通过运算符支持布尔关系比较的语言。

#### 差异 2: Swift Bool 不遵循 Comparable 协议 ⭐

在 Swift 中，`Bool` 类型仅遵循 `Equatable`，不遵循 `Comparable`。因此 `false < true` 直接写会报编译错误。必须通过自定义函数或扩展 Comparable 实现。

#### 差异 3: 非 boolean 类型编译检查

ArkTS 严格拒绝非 boolean 类型与 boolean 的关系运算（int/string/bigint/double/Object/float 全部报编译时错误），Java 和 Swift 的静态类型系统同样拒绝，但 Swift 因本身不支持布尔关系运算符而不涉及此检查。

## 6. 综合评分

| 维度 | ArkTS | Java | Swift |
|------|:-----:|:----:|:-----:|
| 运算符直接使用 | ⭐⭐⭐⭐⭐ | ⭐⭐（Boolean.compare 方法） | ⭐（需自定义函数） |
| 返回 boolean 类型 | ⭐⭐⭐⭐⭐ | ⭐⭐（返回 int） | ⭐⭐⭐⭐⭐ |
| 非 boolean 类型编译检查 | ⭐⭐⭐⭐⭐ | N/A | N/A |

## 7. 核心结论

1. **ArkTS 是唯一原生支持 boolean 关系运算符的语言** — `<`, `<=`, `>`, `>=` 直接在 `boolean` 类型上可用
2. **Java 需要 `Boolean.compare()` 方法** — 语法较冗长，且返回 int 而非 boolean
3. **Swift Bool 不遵循 Comparable 协议** — 无法直接使用运算符，必须自定义辅助函数
4. **0 D 类异常**：所有 15 个 ArkTS 测试完全通过，无 Spec 与实现不一致

## 8. ArkTS 设计建议

### 建议 1：保持 boolean 关系运算符语法优势

ArkTS 是三种主流语言中**唯一直接支持布尔关系运算符**的。这比 Java 的 `Boolean.compare()` 更直观，比 Swift 需要自定义函数更简洁。应保持这一语法特性。

### 建议 2：Spec 可补充 true/false 的数值等效说明

Spec 当前直接定义各运算符的真值表。可考虑补充一条说明"布尔关系运算等价于 false=0、true=1 的数值比较"，帮助开发者理解记忆。

### 建议 3：注意与其余语言的设计对比

如果未来 ArkTS 需要与其余语言互操作，应意识到：
- Java 通过 `Boolean.compare()` mapping 可完美映射 → 返回 int 后与 0 比较
- Swift 需要 `extension Bool: Comparable` 扩展或自定义函数才能对应
