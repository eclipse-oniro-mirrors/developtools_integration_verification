# 3.18 Function Types - ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 问题 1：联合类型中函数类型不加括号不报错（spec 要求报错）

- **问题描述**: Spec 3.18 明确规定 "A compile-time error occurs if type is a function type not enclosed in parentheses"（联合类型中的函数类型必须用括号包裹），但 ArkTS 编译器实际允许 `string | (x: int) => int` 不加括号也编译通过。
- **复现用例 ID**: TYP_03_18_012_FAIL_FUNCTION_TYPE_UNION_NO_PARENS
- **实测结果**: 编译通过（期望编译失败）
- **跨语言对比表**:

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `string \| (x: int) => int` | ✅ 编译通过（与 spec 不一致） |
| Java | 无联合类型 | N/A |
| Swift | 无联合类型 | N/A |

- **严重性等级**: LOW
- **改进建议**: 要么修正编译器强制要求括号，要么更新 spec 允许不加括号。建议后者，因为不加括号对开发者更友好。

---

---

## 报告分类口径

| 分类 | 含义 | 处理方式 |
|------|------|----------|
| 符合 ArkTS spec 的语言设计差异 | 行为与 Java/Swift 不同，但符合 ArkTS spec 或当前明确语义 | 不标为缺陷，仅记录差异 |
| Spec 与实现不一致 | 用例与 spec 要求不一致，且当前实现未按 spec 报错/运行 | 保留 FAIL 用例并记录 issue_report |
| 待确认问题 | 需要补充 stdlib/spec/实现依据后才能定性 | 暂不判定为缺陷 |
| 已验证规范一致行为 | 用例验证 ArkTS 行为符合 spec | 记录为通过项 |

## 问题 2：Function 类型允许直接调用（spec 禁止直接调用）

- **问题描述**: Spec 3.18.1 明确说明 "A value of type Function cannot be called directly. A developer must use the unsafeCall method instead."，但 ArkTS 编译器实际允许 `Function` 类型变量直接调用。
- **复现用例 ID**: TYP_03_18_014_FAIL, TYP_03_18_01_003_FAIL
- **实测结果**: 编译通过并运行正常（期望编译失败）
- **跨语言对比表**:

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `let f: Function = foo; f(1)` | ✅ 编译通过并运行 |
| Java | `Function<Integer,Void> f = ...; f.apply(1)` | ✅ 只能通过 apply() |
| Swift | 无通用 Function 超类型 | N/A |

- **严重性等级**: LOW
- **改进建议**: 建议更新 spec 允许 Function 类型直接调用，因为实际行为更友好，且 `unsafeCall` 增加了不必要的复杂性。

---

## 问题 3：函数类型可选参数后的必选参数声明限制

- **问题描述**: 在**函数声明**中（非函数类型），`function bar(p1?: int, p2: int | undefined)` 编译报错 `ESY0219: A required parameter cannot follow an optional parameter`。虽然 `p2` 类型是 `int | undefined`（等价于可选参数类型），但编译器将其视为必选参数。
- **复现用例 ID**: TYP_03_18_004（已修改规避，移除 bar 函数）
- **实测错误信息**: `ESY0219: A required parameter cannot follow an optional parameter`
- **跨语言对比表**:

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `function bar(p1?: int, p2: int \| undefined)` | ❌ 编译错误 |
| Java | 无可选参数概念 | N/A |
| Swift | `func bar(_ p1: Int? = nil, _ p2: Int? = nil)` | ✅ 编译通过 |

- **严重性等级**: MEDIUM
- **改进建议**: 这是 spec 文档中说明的合法语法（spec 3.18 示例代码包含 `function bar(p1?: number, p2: number|undefined)`），编译器应支持此语法。
