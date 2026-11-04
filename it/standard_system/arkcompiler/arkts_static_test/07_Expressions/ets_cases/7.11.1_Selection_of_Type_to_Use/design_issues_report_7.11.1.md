# 7.11.1 Selection of Type to Use — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 接口 typeReference ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | B 类：ArkTS 设计差异 |
| **合理性** | 符合 ArkTS 静态安全设计 |

**描述**：ArkTS 禁止接口名作为 typeReference 调用方法。Java 8+ 允许接口静态方法。Swift 也不允许协议名直接调用实例方法。

**跨语言对比**：

| 语言 | 接口 typeReference 调用 |
|------|------------------------|
| ArkTS | ❌ 编译时错误 |
| Java | ✅ 允许（接口静态方法） |
| Swift | ❌ 编译时错误 |

**测试用例**：EXP_07_11_01_007_FAIL_INTERFACE_TYPEREF

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-02: null 表达式方法调用 ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | B 类：ArkTS 设计差异 |
| **合理性** | null 安全检查 |

**描述**：ArkTS 编译时阻止 `null.toString()` 调用。Java 编译通过但运行时 NPE。Swift 同样编译时阻止。

**跨语言对比**：

| 语言 | null 表达式方法调用 |
|------|-------------------|
| ArkTS | ❌ 编译时错误 |
| Java | ⚠️ 编译通过，运行时 NPE |
| Swift | ❌ 编译时错误 |

**测试用例**：EXP_07_11_01_008_FAIL_PRIMITIVE_EXPR_METHOD

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-03: int.toString() 合法性

| 字段 | 值 |
|------|-----|
| **差异类型** | 学习点 |
| **合理性** | int 在 ArkTS 中是类类型 |

**描述**：ArkTS 的 `int` 等数值类型是类类型（不同于 Java 的原始类型），允许调用 `.toString()` 等方法。

**跨语言对比**：

| 语言 | int.toString() |
|------|---------------|
| ArkTS | ✅ 合法 |
| Java | ❌ 原始类型不能调用方法 |
| Swift | ✅ 合法（Int 是结构体） |

**分类**：符合 ArkTS spec 的语言设计差异

## 总体结论

| 指标 | 数值 |
|------|------|
| 总用例数 | 12 |
| 通过率 | 100% |
| Spec 不一致（D类） | 0 |
| 跨语言差异 | 2 个设计差异 |
