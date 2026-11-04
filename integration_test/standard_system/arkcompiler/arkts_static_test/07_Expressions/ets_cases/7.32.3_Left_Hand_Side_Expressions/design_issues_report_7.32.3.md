# 7.32.3 Left Hand Side Expressions — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 参数可赋值性差异 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_32_03_002_PASS_PARAMETER_LHS |
| **实测结果** | ArkTS/Java 参数可直接赋值，Swift 参数默认为 let 常量 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 和 Java 的函数/方法参数可以直接重新赋值，而 Swift 的参数默认为 `let` 常量，不可重新赋值；需使用 `inout` 参数才可修改。

**跨语言对比**：

| 语言 | `function f(p: int) { p = 99; }` | 行为 |
|------|------|------|
| ArkTS | `function f(p: int) { p = 99; }` | ✅ 编译通过，参数可重新赋值 |
| Java | `static int f(int p) { p = 99; return p; }` | ✅ 编译通过，参数可重新赋值 |
| Swift | `func f(_ p: Int) -> Int { p = 99 }` | ❌ 编译错误：参数为 let 常量 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-02: Record 索引作为左值 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_32_03_005_PASS_RECORD_INDEX_LHS |
| **实测结果** | ArkTS/Swift 原生支持，Java 需 put() 方法调用 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 的 Record 类型和 Swift 的 Dictionary 类型均支持索引表达式作为左值（`rec['a'] = 100`），而 Java 没有类似的 Record 字面量语法，需通过 `HashMap.put(key, value)` 方法调用间接完成赋值。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `rec['a'] = 100` | ✅ 编译通过，记录索引可作为左值 |
| Java | `map.put("a", 100)` | ❌ 无左值赋值语法，需方法调用 |
| Swift | `dict["a"] = 100` | ✅ 编译通过，Dictionary 下标可作为左值 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-03: 可选链 `?.` 不作为左值 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_32_03_011_FAIL_CHAINING_OP_LHS |
| **实测结果** | ArkTS/Swift 均禁止可选链表达式作为左值 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 和 Swift 均禁止包含可选链运算符 `?.` 的表达式出现在赋值左侧（编译错误）。Java 无此运算符，用 `if (obj != null) obj.field = x` 替代。

**跨语言对比**：

| 语言 | `obj?.field = x` | 行为 |
|------|------------------|------|
| ArkTS | `obj?.field = x` | ✅ 编译错误（禁止作为左值）|
| Java | N/A | ❌ 无 `?.` 运算符 |
| Swift | `obj?.field = x` | ✅ 编译错误（禁止作为左值）|

**分类**：符合 ArkTS spec 的语言设计差异
