# 7.2.1 Type of Expression — ArkTS 与 Java/Swift/TS 行为差异及规范一致性报告

## 设计问题及差异清单

本节全部 25 个测试用例 100% 通过，未发现 Spec 与实现不一致的问题。

### ID-01: 对象字面量的 standalone 限制 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_02_01_016_FAIL_STANDALONE_OBJLIT |
| **实测结果** | 编译时错误（期望 compile-time error） |
| **错误信息** | 对象字面量缺少 target type |

**描述**：ArkTS 禁止 standalone 对象字面量（无法自推断类型），要求必须有 target type。这是 ArkTS 的显式设计选择，与 Java/Swift 不同。

**跨语言对比**：

| 语言 | `let x = {a: 1, b: 2}` | 说明 |
|------|------------------------|------|
| ArkTS | 编译时错误 | 需要 target type（如 `let x: P = ...`） |
| Java | 匿名类型推断 | `new Object() { int a = 1; int b = 2; }` |
| Swift | 推断为 Dictionary | `["a": 1, "b": 2]` 类型为 `[String: Int]` |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：无，此为 ArkTS 的有意设计。

---

### ID-02: Readonly 数组类型系统 ⭐

| 字段 | 值 |
|------|-----|
| **复现用例** | EXP_07_02_01_010_PASS_WRITABLE_TO_READONLY, EXP_07_02_01_012_PASS_READONLY_TO_READONLY, EXP_07_02_01_017_FAIL_READONLY_TO_WRITABLE, EXP_07_02_01_023_RUNTIME_READONLY_PARAM |
| **实测结果** | 编译通过/运行时正确 |
| **错误信息** | 无 |

**描述**：ArkTS 有完善的 readonly 数组类型系统及兼容性规则（readonly -> writable 报错，反之安全）。Java 无此概念。Swift 通过 `let` 实现类似效果但在类型系统层面不同。

**跨语言对比**：

| 语言 | readonly 数组 | writable 赋值给 readonly | readonly 赋值给 writable |
|------|-------------|--------------------------|--------------------------|
| ArkTS | 语言级支持 | 编译通过 | 编译错误 |
| Java | 不支持 | N/A | N/A |
| Swift | 通过 let 实现 | 通过 let 常量 | let 不可变 |

**分类**：符合 ArkTS spec 的语言设计差异

**建议**：无。

---

### ID-03: 三语言表达式类型推断一致性 ⭐

| 字段 | 值 |
|------|-----|
| **差异类型** | 符合 ArkTS spec 的语言设计差异 |

**描述**：ArkTS、Java 和 Swift 在基础字面量类型推断、函数参数 target type、泛型推断方面行为高度一致，差异主要体现在对象字面量和 readonly 这类 ArkTS 特有的语言特性上。

**跨语言对比**：

| 特征 | ArkTS | Java | Swift |
|------|-------|------|-------|
| 基础字面量类型推断 | 一致 | 一致 | 一致 |
| 函数参数 target type | 一致 | 一致 | 一致 |
| 泛型推断 | 支持 | 有限 | 较强 |
| 对象字面量 standalone | 编译错误 | 匿名类型 | Dictionary |
| readonly 数组 | 语言级支持 | 不支持 | 通过 let |

**分类**：符合 ArkTS spec 的语言设计差异

## 结论

本节未发现 Spec 与实现不一致的问题。ArkTS 的表达式类型推断机制实现完整，与 spec 描述一致。
