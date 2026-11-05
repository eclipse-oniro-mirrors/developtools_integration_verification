# 7.5.1 Array Literal Type Inference from Context — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 数组字面量语法差异 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | 通用语法对比（cross_lang_verify） |
| **实测结果** | ArkTS/Swift 使用 `[1, 2, 3]`，Java 需 `new int[]{1, 2, 3}` |
| **错误信息** | 无（语法级别语言设计差异） |

**描述**：ArkTS 和 Swift 使用 `[1, 2, 3]` 直接创建数组字面量。Java 需要 `new int[]{1, 2, 3}` 语法（或 `{1, 2, 3}` 仅在声明初始化时可用）。

**跨语言对比**：

| 语言 | 语法 | 便捷性 |
|------|------|--------|
| ArkTS | `[1, 2, 3]` | 最高 |
| Java | `new int[]{1, 2, 3}` | 最低（需 new） |
| Swift | `[1, 2, 3]` | 最高 |

**分类**：语言设计哲学差异（非实现缺陷）

**建议**：保持当前设计，与 Swift 一致是好的主流实践。

---

### ID-02: ArkTS 独有数组类型体系 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_05_01_007~EXP_07_05_01_018（cross_lang_verify） |
| **实测结果** | ArkTS 支持 FixedArray、ValueArray、readonly、Union 等类型，Java/Swift 无完全对等物 |
| **错误信息** | 无（语言特性差异） |

**描述**：ArkTS 拥有丰富的数组类型体系，包括 `FixedArray`、`ValueArray`、`readonly T[]`、`Array<T>`、`T[]` 以及 tuple 类型，这些在 Java/Swift 中无完全对等物。

**跨语言对比**：

| 类型 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 可扩容数组 | `Array<T>` / `T[]` | `T[]` / `ArrayList<T>` | `[T]` |
| 固定大小数组 | `FixedArray<T>` | `T[n]` 声明 | `[T](n)` 初始化 |
| 值语义数组 | `ValueArray<T>` | ❌ | ❌ |
| 只读数组 | `readonly T[]` | ❌ | `let [T]` |
| Tuple | `[T, U]` | ❌ | `(T, U)` |

**分类**：语言特性差异（符合 ArkTS 规范的设计差异）

**建议**：保持丰富类型体系，这是 ArkTS 的优势。

---

### ID-03: Java 无法直接推断字面量类型 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | cross_lang_verify（赋值上下文） |
| **实测结果** | `a = [4, 5]` 在 ArkTS 合法，Java 需要 `a = new int[]{4, 5}` |
| **错误信息** | 无（语言设计差异） |

**描述**：Java 不支持没有 `new` 的数组字面量，因此像 ArkTS 中 `a = [4, 5]`（在声明后赋值）必须在 Java 中写成 `a = new int[]{4, 5}`。类型信息无法从数组字面量本身推断。

**跨语言对比**：

| 场景 | ArkTS | Java |
|------|-------|------|
| 声明时初始化 | `int[] a = {1, 2, 3}` | `int[] a = {1, 2, 3}` |
| 赋值时 | `a = [4, 5]` | `a = new int[]{4, 5}` |
| cast 表达式 | `[1, 2] as int[]` | `(int[]) obj` |

**分类**：语言设计差异（符合各自语言设计）

**建议**：ArkTS 设计更便捷，无需改动。

---

### ID-04: Union 类型上下文推断 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_05_01_016_PASS_UNION_CONTEXT_SINGLE、EXP_07_05_01_023_FAIL_UNION_CONTEXT_AMBIGUOUS |
| **实测结果** | Union 唯一匹配时编译通过，歧义时编译错误 |
| **错误信息** | Union 歧义时报告多个成员匹配错误 |

**描述**：ArkTS 支持 Union 类型作为数组字面量的上下文，并会尝试 union 的每个成员，仅当恰好一个匹配时通过。Java 和 Swift 均不支持此特性。

**跨语言对比**：

| 语言 | 特性 | 支持 |
|------|------|------|
| ArkTS | Union 类型上下文推断 | ✅ 唯一匹配通过，歧义报错 |
| Java | Union 类型 | ❌ 不支持 |
| Swift | Union 类型 | ❌ 不支持 |

**分类**：语言特性差异（符合 ArkTS 规范的设计差异）

**建议**：这是 ArkTS 的特殊优势，保持当前设计。

## 编译错误验证

所有 6 个 compile-fail 用例均按 spec 期望报错：
- Tuple 元素类型不匹配 → `Type 'string' is not assignable to type 'number'` (位置 0)
- FixedArray 元素类型不匹配 → int 不可赋值给 string
- ValueArray 元素类型不匹配 → double 不可赋值给 int
- string[] 元素类型不匹配 → int 不可赋值给 string
- Union 歧义 → 多个成员匹配
- 非数组接口上下文 → SomeI 不是 Array 的超接口

## 结论

| 指标 | 数值 |
|------|------|
| 总用例数 | 28 |
| 通过率 | 100% |
| Spec 不一致（D类） | 0 |
| 跨语言差异 | 4 个（均为语言设计哲学差异，非实现缺陷） |
