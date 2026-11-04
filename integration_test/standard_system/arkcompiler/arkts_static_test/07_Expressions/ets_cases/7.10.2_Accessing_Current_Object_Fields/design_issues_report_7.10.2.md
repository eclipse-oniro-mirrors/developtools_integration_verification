# 7.10.2 Accessing Current Object Fields — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

### ID-01: 字段覆写(Override) vs 字段隐藏(Hide) ⭐⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | B 类：ArkTS 设计差异 |
| **严重性** | ⭐⭐ 中等 |
| **合理性** | 符合 ArkTS 全部 OO 语义一致性 |

**描述**：ArkTS 子类同名字段自动覆写父类字段（Override 语义），通过父类类型引用也访问子类字段值。Java 中字段是隐藏（Hide）语义，通过父类引用访问父类字段值。

**跨语言对比**：

| 语言 | `Base ref -> value` | `Derived ref -> value` |
|------|-------------------|----------------------|
| ArkTS | 20 (Override) | 20 |
| Java | 10 (Hide) | 20 |
| Swift | 20 (Override) | 20 |

**测试用例**：EXP_07_10_02_012_RUNTIME_STATIC_DISPATCH

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：ArkTS 字段覆写语义与类方法的多态分发一致，是合理设计。

---

### ID-02: Accessor getter/setter 语法

| 字段 | 值 |
|------|-----|
| **差异类型** | 语法差异 |
| **合理性** | 语言设计差异 |

**描述**：ArkTS 使用 `get`/`set` 语法定义属性访问器，与 Swift computed property 类似。Java 无内置 getter/setter 语法，使用约定方法名（如 `getX()`/`setX()`）。

**跨语言对比**：

| 语言 | Getter/Setter 语法 |
|------|-------------------|
| ArkTS | `get`/`set` 关键字语法 |
| Java | 方法名约定（`getX()`/`setX()`） |
| Swift | computed `get`/`set` |

**分类**：符合 ArkTS spec 的语言设计差异

---

### ID-03: nullish 安全检查

| 字段 | 值 |
|------|-----|
| **差异类型** | 类型系统差异 |
| **合理性** | ArkTS nullish 安全的体现 |

**描述**：ArkTS 在编译时阻止 `T | undefined` 类型引用访问字段。Java/Swift 非 nullish 安全，需运行时处理 NPE。

**跨语言对比**：

| 语言 | nullish 字段访问 |
|------|-----------------|
| ArkTS | ❌ 编译时错误 |
| Java | ⚠️ 运行时 NPE |
| Swift | ⚠️ 运行时 crash |

**分类**：符合 ArkTS spec 的语言设计差异

## 总体结论

| 指标 | 数值 |
|------|------|
| 总用例数 | 12 |
| 通过率 | 100% |
| Spec 不一致（D类） | 0 |
| 跨语言差异 | 3 个（1 个设计差异 + 2 个语法差异） |
