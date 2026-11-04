# 9.5 Access Modifiers - ArkTS与Java/Swift/TS行为差异及规范一致性报告

**报告日期：** 2026-06-22
**测试用例数：** 4（compile-pass: 2, compile-fail: 1, runtime: 1）

---

## 一、与业界静态语言的差异点

**无严重设计问题发现。** 所有 4 个用例行为与 spec 一致。

### 设计观察：Swift无protected

**对比：** Swift 没有 `protected` 修饰符，用 `fileprivate` 和 `open` 替代。ArkTS 和 Java 都有原生 protected，但语义不同（ArkTS 仅类内+子类可见，Java 还含同包可见）。

---

## 二、符合ArkTS spec的语言设计差异

| 行为 | 用例编号 | 状态 |
|------|---------|------|
| 默认public | CLS_09_05_001 | ✅ |
| 三种修饰符组合 | CLS_09_05_002 | ✅ |
| 类外访问private编译拒绝 | CLS_09_05_003 | ✅ |
| public运行时 | CLS_09_05_004 | ✅ |

---

## 三、严重性等级总览

| 严重性 | 数量 | 问题列表 |
|-------|------|---------|
| 设计观察 | 1 | protected语义差异(不含同包) |

---

## 四、跨语言对比

| 维度 | ArkTS | Java | Swift |
|------|-------|------|-------|
| **private** | ✅ | ✅ | ✅ |
| **protected** | ✅(类内+子类) | ✅(类内+子类+同包) | ❌(无) |
| **默认** | public | package-private | internal |

**结论：** 9.5 章节与 spec 完全一致。protected 语义比 Java 更严格（不含同包）。

---

## 五、完整用例索引

| 用例 ID | 分类 | 测试内容 | 结果 |
|---------|------|---------|------|
| CLS_09_05_001 | compile-pass | 默认public | ✅ |
| CLS_09_05_002 | compile-pass | 三种修饰符 | ✅ |
| CLS_09_05_003 | compile-fail | 类外访问private | ✅ |
| CLS_09_05_004 | runtime | public运行时 | ✅ |
