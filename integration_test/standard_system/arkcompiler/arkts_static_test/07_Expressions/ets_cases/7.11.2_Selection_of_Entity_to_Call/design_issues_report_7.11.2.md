# 7.11.2 Selection of Entity to Call — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: Union 类型公共方法

| 字段 | 值 |
|------|-----|
| **差异类型** | B 类：ArkTS 设计差异 |
| **合理性** | 符合 ArkTS 的 union 类型安全设计 |

**描述**：ArkTS 支持 union 类型的公共实例方法调用。Java 和 Swift 无 union 类型直接对应（Java 使用接口上界，Swift 使用协议）。

**跨语言对比**：

| 语言 | Union 类型公共方法 |
|------|------------------|
| ArkTS | ✅ 支持 |
| Java | ❌ N/A（无 union 类型） |
| Swift | ❌ N/A（无 union 类型） |

**测试用例**：EXP_07_11_02_004_PASS_UNION_COMMON_METHOD, EXP_07_11_02_008_FAIL_UNION_NO_COMMON_METHOD, EXP_07_11_02_012_RUNTIME_UNION_COMMON_METHOD

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-02: 空集合编译时错误（所有语言一致）

| 字段 | 值 |
|------|-----|
| **差异类型** | 一致性确认 |
| **合理性** | 三语言均一致 |

**描述**：调用不存在的静态方法（typeReference 空集合）或 union 类型中不存在的公共方法，三语言均产生编译时错误。无行为差异。

**跨语言对比**：

| 语言 | 空集合调用 |
|------|-----------|
| ArkTS | ❌ 编译时错误 |
| Java | ❌ 编译时错误 |
| Swift | ❌ 编译时错误 |

**测试用例**：EXP_07_11_02_007_FAIL_TYPEREF_INSTANCE_METHOD, EXP_07_11_02_008_FAIL_UNION_NO_COMMON_METHOD

**分类**：符合 ArkTS spec 的语言设计差异

## 总体结论

| 指标 | 数值 |
|------|------|
| 总用例数 | 12 |
| 通过率 | 100% |
| Spec 不一致（D类） | 0 |
| 跨语言差异 | 1 个设计差异（union 类型特有） |
