# 7.35.3 Lambda Expression Type — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 函数类型语法 ⭐⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_35_03_001 ~ 007 |
| **实测结果** | ArkTS 使用 `(int, string) => boolean` 原生函数类型语法；Java 需 `@FunctionalInterface` 接口包装；Swift 使用 `(Int, String) -> Bool` 原生函数类型语法 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：定义函数类型变量的语法。ArkTS 与 Swift 均支持原生函数类型语法，比 Java 的 @FunctionalInterface 接口更简洁直观。

**跨语言对比**：

| 语言 | 语法 |
|------|------|
| ArkTS | `(int, string) => boolean` — 原生函数类型语法 |
| Java | `BiFunction<Integer,String,Boolean>` — 需函数式接口包装 |
| Swift | `(Int, String) -> Bool` — 原生函数类型语法 |

**分类**：跨语言设计差异（ArkTS 与 Swift 相似，都优于 Java）

**建议**：保持现有设计，ArkTS 的函数类型语法与 Swift 高度一致。

---

### ID-02: 无参 lambda 简洁性 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_35_03_005 |
| **实测结果** | ArkTS `(): int => 42`（可简写 `() => 42` 推断类型）；Java `() -> 42` 最简洁；Swift `{ 42 }` 最简洁 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：无参 lambda 表达式写法的简洁性对比。三语言语法风格不同，各有优势。

**跨语言对比**：

| 语言 | 写法 |
|------|------|
| ArkTS | `(): int => 42`，可以简写 `() => 42` 推断类型 |
| Java | `() -> 42`，最简洁 |
| Swift | `{ 42 }` 或 `{ () -> Int in 42 }`，最简洁 |

**分类**：跨语言设计差异（三语言语法风格不同，各有优势）

**建议**：保持现有设计。

---

### ID-03: 参数数量检查灵活性 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_35_03_010 |
| **实测结果** | ArkTS `const f: () => int = (x: int): int => x` → compile-fail；Java 函数式接口参数数量固定自动匹配；Swift `let f: () -> Int = { x in x }` → compile-error |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：函数类型要求 0 参数但提供 1 个参数时的编译时检查行为。三语言行为一致，均能检测到参数数量不匹配。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `const f: () => int = (x: int): int => x` | compile-fail |
| Java | Java 中函数式接口参数数量固定，自动匹配 | compile-error |
| Swift | `let f: () -> Int = { x in x }` | compile-error |

**分类**：跨语言设计差异（三语言行为一致）

**建议**：保持现有设计。

### 结论

| 分类 | 状态 |
|:----:|:------|
| **D 类**（Spec 与实现不一致） | **0** |
| **compile-pass** | **7/7** ✅ |
| **compile-fail** | **3/3** ✅ |
| **runtime** | **1/1** ✅ |
| **Java** | **12/12** ✅ |
| **Swift** | **13/13** ✅ |
