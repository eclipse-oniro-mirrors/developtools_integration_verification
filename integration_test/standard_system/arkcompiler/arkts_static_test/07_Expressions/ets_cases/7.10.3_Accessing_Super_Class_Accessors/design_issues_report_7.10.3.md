# 7.10.3 Accessing SuperClass Accessors — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: super.field 行为差异 ⭐⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | B 类：ArkTS 设计差异 |
| **严重性** | ⭐⭐ 中等 |
| **合理性** | 符合 ArkTS 封装设计原则 |

**描述**：ArkTS 禁止通过 `super` 访问字段（`super.field` 和 `super.field = val` 均为编译时错误），仅允许访问 getter/setter。Java 和 Swift 均允许通过 `super` 访问所有成员（包括字段）。

**跨语言对比**：

| 语言 | super.field | super.field = val | super.getter() | super.setter() |
|------|------------|-------------------|----------------|----------------|
| ArkTS | ❌ 编译错误 | ❌ 编译错误 | ✅ | ✅ |
| Java | ✅ | ✅ | ✅ | ✅ |
| Swift | ✅ | ✅ | ✅ | ✅ |

**测试用例**：EXP_07_10_03_004_FAIL_SUPER_FIELD_READ, EXP_07_10_03_005_FAIL_SUPER_FIELD_WRITE

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：这是 ArkTS 有意识的设计选择。通过限制 `super` 只能访问 accessor，ArkTS 强制开发者使用封装后的属性访问器，避免直接操作父类字段。

---

### ID-02: 语法差异

| 字段 | 值 |
|------|-----|
| **差异类型** | 语法差异 |
| **合理性** | 语言设计差异 |

**描述**：ArkTS 和 Swift 使用 `get`/`set` 语法声明 accessor。Java 使用方法命名约定（`getX()`/`setX()`）。

**跨语言对比**：

| 语言 | Accessor 语法 |
|------|--------------|
| ArkTS | `get`/`set` 关键字 |
| Java | 方法名约定 |
| Swift | computed `get`/`set` |

**分类**：符合 ArkTS spec 的语言设计差异

## 总体结论

| 指标 | 数值 |
|------|------|
| 总用例数 | 8 |
| 通过率 | 100% |
| Spec 不一致（D类） | 0 |
| 跨语言差异 | 2 个（1 个设计差异 + 1 个语法差异） |
