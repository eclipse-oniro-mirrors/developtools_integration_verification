# 7.10.1 Accessing Static Fields — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 实例引用访问静态字段

| 字段 | 值 |
|------|-----|
| **差异类型** | 静态检查严格性差异 |
| **合理性** | 符合 ArkTS 静态安全设计 |

**描述**：ArkTS 和 Swift 要求静态字段必须通过类名（typeReference）访问。Java 允许通过实例引用访问静态字段（JLS 6.5.6.1），但会产生 compiler warning。ArkTS 的严格检查更符合类型安全设计。

**跨语言对比**：

| 语言 | 代码 | 行为 |
|------|------|------|
| ArkTS | `s.instanceCount` (s 是实例) | ❌ 编译时错误 |
| Java | `s.instanceCount` | ⚠️ 编译通过（有 warning） |
| Swift | `s.instanceCount` | ❌ 编译时错误 |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-02: readonly/final/let 关键字差异

| 字段 | 值 |
|------|-----|
| **差异类型** | 语法差异 |
| **合理性** | 语言传统差异，语义等价 |

**描述**：ArkTS 使用 `readonly`，Java 使用 `final`，Swift 使用 `let`。语义完全一致：修饰后的静态字段不可修改，只能读取（value 语义）。

**跨语言对比**：

| 语言 | 只读修饰符 |
|------|-----------|
| ArkTS | `readonly` |
| Java | `final` |
| Swift | `let` |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-03: 静态字段类名访问一致性

| 字段 | 值 |
|------|-----|
| **差异类型** | 语义等价 |
| **合理性** | 三种语言均支持 |

**描述**：三语言均要求/支持通过类型名访问静态字段：`ClassName.field`（ArkTS/Java）或 `TypeName.property`（Swift）。

**跨语言对比**：

| 语言 | 静态字段访问语法 |
|------|-----------------|
| ArkTS | `ClassName.field` |
| Java | `ClassName.field` |
| Swift | `TypeName.property` |

**分类**：符合 ArkTS spec 的语言设计差异

## 总体结论

| 指标 | 数值 |
|------|------|
| 总用例数 | 11 |
| 通过率 | 100% |
| Spec 不一致（D类） | 0 |
| 跨语言差异 | 3 个（均为语法/严格性差异） |
