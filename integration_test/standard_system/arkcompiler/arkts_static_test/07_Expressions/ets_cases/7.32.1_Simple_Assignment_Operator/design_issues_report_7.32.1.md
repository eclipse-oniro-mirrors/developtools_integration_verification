# 7.32.1 Simple Assignment Operator — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: readonly array 赋值保护未实现 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_32_01_008_FAIL_READONLY_ARRAY |
| **实测结果** | 编译通过（期望编译时错误） |
| **错误信息** | 无错误 |

**描述**：根据 ArkTS spec 要求，readonly array 不能被赋值为 non-readonly array。但 ArkTS 编译器实际允许 `readonly int[] = int[]` 的赋值通过。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `readonly int[] a = [1,2,3]; let b: int[] = [4,5,6]; a = b;` | ✅ 编译通过（期望错误） |
| Java | `final int[] a = {1,2,3}; int[] b = {4,5,6}; a = b;` | ❌ 编译错误（final 数组引用不可变） |
| Swift | `let a = [1,2,3]; var b = [4,5,6]; a = b` | ❌ 编译错误（let 常量不可赋值） |

**分类**：D 类 — Spec 与实现不一致

**建议**：ArkTS 编译器应按照 spec 要求，在 readonly array 被赋值为 non-readonly array 时报编译时错误。

---

### ID-02: readonly tuple 赋值保护未实现 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_32_01_009_FAIL_READONLY_TUPLE |
| **实测结果** | 编译通过（期望编译时错误） |
| **错误信息** | 无错误 |

**描述**：根据 ArkTS spec 要求，readonly tuple 不能被赋值为 non-readonly tuple。但 ArkTS 编译器实际允许该赋值通过。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `readonly [int, string] t = [1, "a"]; let p: [int, string] = [2, "b"]; t = p;` | ✅ 编译通过（期望错误） |
| Java | 无原生元组类型 | N/A |
| Swift | `let t: (Int, String) = (1, "a"); var p: (Int, String) = (2, "b"); t = p` | ❌ 编译错误（let 常量不可赋值） |

**分类**：D 类 — Spec 与实现不一致

**建议**：ArkTS 编译器应按照 spec 要求，在 readonly tuple 被赋值为 non-readonly tuple 时报编译时错误。

---

### ID-03: Swift 不支持链式赋值

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_32_01_010_RUNTIME_SEMANTICS（链式赋值部分） |
| **实测结果** | ArkTS/Java 支持 `a = b = c`，Swift 编译错误 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：Swift 的 `=` 运算符返回 Void，因此不支持 `a = b = c` 链式赋值语法。ArkTS 和 Java 均支持该语法（右结合）。

**跨语言对比**：

| 语言 | `x = y = z = 77` 结果 |
|------|----------------------|
| ArkTS | ✅ x=77, y=77, z=77 |
| Java | ✅ x=77, y=77, z=77 |
| Swift | ❌ 编译错误（= 返回 Void） |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-04: 越界异常类型差异

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_32_01_011_RUNTIME_RANGEERROR_NEGATIVE, EXP_07_32_01_012_RUNTIME_RANGEERROR_TOO_LARGE |
| **实测结果** | 三种语言越界异常类型不同 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：数组越界时，三种语言抛出不同的异常类型，可捕获性也不同。

**跨语言对比**：

| 语言 | 越界异常 | 可捕获性 |
|------|---------|---------|
| ArkTS | RangeError | 可捕获（try-catch） |
| Java | ArrayIndexOutOfBoundsException | 可捕获 |
| Swift | fatalError | 不可捕获，程序终止 |

**分类**：符合 ArkTS spec 的语言设计差异
