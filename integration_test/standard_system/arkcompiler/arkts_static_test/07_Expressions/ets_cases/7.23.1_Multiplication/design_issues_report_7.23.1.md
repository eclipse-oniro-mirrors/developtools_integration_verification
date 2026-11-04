# 7.23.1 Multiplication — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

**本子章节无 Spec 与实现不一致（D 类）问题。** 所有 23 个测试用例按预期通过。

---

### ID-01: 隐式类型提升差异（设计差异，非缺陷）

| 字段 | 值 |
|------|-----|
| **复现用例** | 多个类型组合编译通过用例 |
| **实测结果** | byte/short 自动提升到 int，运算结果取最大操作数类型 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 与 Java 一致：byte/short 自动提升到 int，运算结果取最大操作数类型。Swift 要求所有操作数类型一致或显式转换。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `byte * byte` | int（提升） |
| Java | `byte * byte` | int（提升） |
| Swift | `Int8 * Int8` | Int8（无提升） |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：维持当前设计，与 Java 一致

---

### ID-02: Swift 整数溢出处理差异

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_23_01_031_RUNTIME_INT_OVERFLOW |
| **实测结果** | int 静默截断低 32 位 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS 和 Java 的 int 静默截断低 32 位；Swift 默认在溢出时抛出运行时错误（trap），需使用 `&*` 运算符实现 wrapping 行为。

**跨语言对比**：

| 语言 | `2147483647 * 2` | 溢出行为 |
|------|-----------------|---------|
| ArkTS | -2 | 静默截断 |
| Java | -2 | 静默截断 |
| Swift | trap | 需 `&*` 得 -2 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-03: Swift Int 位宽差异

| 字段 | 值 |
|------|-----|
| **描述** | 64 位平台上 Swift 的 `Int` 是 64 位（Int64），而 ArkTS/Java 的 `int` 是 32 位 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-04: typeof(double) 返回 "number"

| 字段 | 值 |
|------|-----|
| **描述** | ArkTS 的 `typeof` 对 double 类型值返回 `"number"`，与 ECMAScript 的 `typeof` 行为一致 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-05: float 字面量初始化差异

| 字段 | 值 |
|------|-----|
| **描述** | ArkTS 要求 `let x: float = Double.toFloat(2.5)`，不能直接用 `2.5`（是 double 字面量）。`as float` 已废弃。 |
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |
