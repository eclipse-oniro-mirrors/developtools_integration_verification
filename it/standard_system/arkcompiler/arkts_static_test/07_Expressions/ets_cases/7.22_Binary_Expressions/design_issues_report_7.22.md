# 7.22 Binary Expressions — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

**本子章节无 Spec 与实现不一致（D 类）问题。** 所有 27 个测试用例按预期通过。

### 跨语言设计差异

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 隐式类型提升 | ✅ byte/short→int, 最大类型 | ✅ 同 ArkTS | ❌ 禁止隐式提升 |
| 原生 `**` 幂运算符 | ✅ | ❌ Math.pow() | ❌ pow() |
| bigint 原生支持 | ✅ bigint 关键字 | ❌ BigInteger 类 | ❌ 无 |
| `>>>` 无符号右移 | ✅ | ✅ | ❌ |
| boolean `&` `|` 按位 | ✅ | ✅ | ❌ 编译错误 |
| Extended Conditional (&&/||) | ✅ 非 boolean 类型 | ❌ 仅 boolean | ❌ 仅 Bool |
| typeof 类型查询 | ✅ typeof → "int"/"number" 等 | ❌ instanceof | ❌ type(of:) |
| 移位结果类型规则 | ✅ LHS 决定结果类型 | ✅ LHS 决定结果类型 | ✅ 同类型决定 |

### 差异说明

#### 1. 隐式类型提升（设计差异，非缺陷）

ArkTS 的类型提升规则与 Java 几乎完全一致：byte/short 自动提升到 int，运算结果取最大操作数类型。Swift 则要求所有操作数类型完全一致。

**设计依据：** ArkTS 追随 Java 的类型提升模型，降低 Java 开发者的学习成本。这是有意设计，非缺陷。

#### 2. `typeof(double)` 返回 `"number"`

ArkTS 的 `typeof` 对 double 类型值返回 `"number"` 而非 `"double"`。这与 ECMAScript 的 `typeof` 行为一致（JavaScript 中 `typeof 3.5` → `"number"`）。

**建议：** 在 spec 中明确 `typeof` 对 double 返回值的命名。

#### 3. Swift 类型严格性

Swift 不支持 `Float * Double` 等跨类型运算，要求显式类型转换。这与 ArkTS/Java 的隐式类型提升形成鲜明对比，但属于语言设计差异。

### 建议

- 当前二元表达式类型组合表设计完整，覆盖所有运算符组
- typeof 返回值命名（double→"number"）建议在 spec 中明确说明
- 无待确认的编译器实现问题
