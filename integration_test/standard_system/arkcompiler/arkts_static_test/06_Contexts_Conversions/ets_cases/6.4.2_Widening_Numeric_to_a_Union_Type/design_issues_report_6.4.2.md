# 6.4.2 Widening Numeric to a Union Type — Design Issues Report

## Issue #1: "恰好一个更大成员"规则过于严格

| Field | Detail |
|-------|--------|
| **描述** | `byte→short|int` 有两个更大成员(short, int)即被拒绝，但 short 是距离 byte 最近的更大类型，理论上应可自动选择 |
| **复现用例** | `let u: short|int = b` (b: byte) |
| **实测错误** | `ESE0255: Ambiguous union type operation` + `ESE0318: Type 'Byte' cannot be assigned to type 'Short|Int'` |
| **跨语言对比** | Java: 无联合类型，直接 `int = byte` 或 `short = byte`（单目标类型，不歧义）<br>Swift: 无联合类型 |
| **严重性** | MEDIUM |
| **改进建议** | 当有多个更大成员时，选择"最近"的一个（即类型层次中最接近的下一个更宽类型），而非报错 |

## Issue #2: 字面量在联合类型中的歧义过于敏感

| Field | Detail |
|-------|--------|
| **描述** | 字面量 `100` 同时兼容 `byte|int` 的两个成员即报错，即使该字面量在 byte 范围内也被拒绝 |
| **复现用例** | `let u: byte|int = 100` / `let u: byte|int = 0` / `let u: byte|int = 255` |
| **实测错误** | `ESE101680: Ambiguous value 100, fits into multiple types` |
| **跨语言对比** | Java: 无联合类型，`int x = 100` 不歧义<br>Swift: 字面量推断优先后者（`Int` 优先于 `Int8`） |
| **严重性** | MEDIUM |
| **改进建议** | 当字面量在值域范围内匹配多个成员时，优先选择默认类型（如 `int`），仅当字面量超出某个成员的范围时才拒绝 |

## Issue #3: 编译器规范比 spec 文本更严格

| Field | Detail |
|-------|--------|
| **描述** | Spec §6.4.2 描述为 "if Ui is a single numeric type in the union that is larger"，但编译器将 "subtyping match" 也计入候选数，导致 `int→byte|int|long`（int相等 + long更大 = 2候选）被拒绝 |
| **复现用例** | `let u: byte|int|long = i` (i: int) |
| **实测错误** | `ESE0255: Ambiguous union type operation` |
| **跨语言对比** | Spec 文本似乎只要求"恰好一个更大的"，但实现将"相等的"也算作候选 |
| **严重性** | LOW |
| **改进建议** | 澄清 spec 与实现的语义：subtyping (相等类型) 是否应算作候选 |
