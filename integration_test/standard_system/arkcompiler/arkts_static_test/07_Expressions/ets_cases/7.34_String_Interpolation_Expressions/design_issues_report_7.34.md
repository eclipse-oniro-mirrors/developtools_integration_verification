# 7.34 String Interpolation Expressions — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

当前章节共识别 **0 个 D 类问题**（Spec 与实现不一致）和 **2 个跨语言设计差异**。全部 13 个用例通过。

### ID-01: 原生字符串插值语法支持 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_34_001~010 |
| **实测结果** | ArkTS `${expr}` 插值语法、Swift `\(expr)` 插值语法、Java 无原生支持 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：语言是否提供原生字符串插值语法。ArkTS 使用反引号 `` ` `` 界定字符串，用 `${}` 嵌入表达式；Swift 使用双引号/三引号界定字符串，用 `\(expr)` 嵌入表达式；Java 无原生字符串插值语法，需使用 `+` 字符串拼接或 `String.format()` / `MessageFormat`。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `` `...${expr}...` `` | 使用反引号界定字符串，`${}` 嵌入表达式 |
| Java | 无原生语法 | 需使用 `+` 字符串拼接或 `String.format()` / `MessageFormat` |
| Swift | `"...\(expr)..."` | 使用双引号/三引号界定字符串，`\(expr)` 嵌入表达式 |

**分类**：跨语言设计差异

**建议**：保持当前设计，ArkTS 的 `${expr}` 语法与 Swift 功能等价，简洁直观。

---

### ID-02: null/undefined 的隐式字符串转换行为 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_34_005_PASS_BOOLEAN_NULL_INTERPOLATION |
| **实测结果** | ArkTS 中 `undefined` → 输出 "undefined"；`null` → 输出 "null"；Swift 编译错误 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：嵌入表达式为 null 或 undefined 时的插值结果。ArkTS 中 `undefined` 输出 "undefined"、`null` 输出 "null"，与 JS 行为一致；Java 中 `null` 输出 "null"（`String.valueOf(null)` 返回 "null"）；Swift 中 Optional 类型（`Int?`）不满足 `ExpressibleByStringInterpolation` 协议，需显式解包（`\(n ?? 0)`），否则编译错误。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `` `nil = ${n}` ``（n: int\|undefined） | 运行时输出 "nil = undefined" |
| Java | `"nil = " + n`（n=null） | 输出 "nil = null" |
| Swift | `"nil = \(n)"`（n: Int?） | 编译错误：Optional 不满足 StringInterpolationProtocol |

**分类**：跨语言设计差异（ArkTS 隐式转换 vs Swift 严格类型检查）

**建议**：ArkTS 隐式转换为 "undefined"/"null" 字符串的行为与 JavaScript 一致，对开发者友好。建议在 Spec 中明确记录此行为。
